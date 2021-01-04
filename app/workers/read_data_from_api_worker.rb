class ReadDataFromApiWorker
  include Sidekiq::Worker
  @@old_payment_id = ""

  def perform(*args)
    
    response = Excon.get(
      "https://increase-transactions.herokuapp.com/file.txt",
        headers: {
          'Authorization' => ENV['INCREASE_AUTH']
        }
      )
    return nil if response.status != 200
    
    if @@old_payment_id != response.body.slice(1..32)
      dataset = to_json(response.body)
        dataset.each_with_index do |data, index|
          client_response = Excon.get(
            "https://increase-transactions.herokuapp.com/clients/#{data[:footer][:client_api_id]}",
              headers: {
                'Authorization' => ENV['INCREASE_AUTH']
              }
            )
          return nil if client_response.status != 200
          client =  JSON.parse(client_response.body)
          Client.create(
            client_api_id: client['id'],
            email: client['email'],
            first_name: client['first_name'],
            last_name: client['last_name'],
            job: client['job'],
            country: client['country'],
            address: client['address'],
            zip_code: client['zip_code'],
            phone: client['phone']
          )
          Payment.create(
            payment_api_id: data[:header][:payment_api_id],
            client_id: Client.last.id,
            currency_id: data[:header][:currency_api_id],
            date: data[:footer][:date]
          )
          data[:transaction].each do |tr|
            Transaction.create(
              transaction_api_id: tr[:transaction_api_id],
              payment_id: Payment.last.id,
              transaction_type_id: tr[:transaction_type_api_id],
              amount: tr[:amount].to_i
            )
          end
          data[:discount].each do |ds|
            Discount.create(
              discount_api_id: ds[:discount_api_id],
              payment_id: Payment.last.id,
              discount_type_id: ds[:discount_type_api_id],
              amount: ds[:amount].to_i
            )
          end
        end
      @@old_payment_id = response.body.slice(1..32)
    end
    
  end

  private

  def to_json(string)
    transaction_collection = []
    discount_collection = []
    res_hash = {}
    res_array = []
    
    f = string.split("\n")
    f.each do |line|
      transaction = []
      if line.start_with?("1")
        lines = line.scan(/\w+/)
        payment_api_id = lines[0].slice(1..32)
        currency_api_id = lines[1].slice(0..2)
        
        res_hash[:header] = {}
        res_hash[:header][:payment_api_id] = payment_api_id
        res_hash[:header][:currency_api_id] = currency_api_id
    
      elsif line.start_with?("2")
        tr_hash = {}
        lines = line.scan(/\w+/)
        transaction_api_id = lines[0].slice(1..32)
        amount = lines[0].slice(33..45)
        transaction_type_api_id = lines[1].slice(0)
    
        tr_hash[:transaction_api_id] = transaction_api_id
        tr_hash[:amount] = amount
        tr_hash[:transaction_type_api_id] = transaction_type_api_id
        transaction_collection << tr_hash
        res_hash[:transaction] = transaction_collection
    
      elsif line.start_with?("3")
        discount_hash = {}
        lines = line.scan(/\w+/)
        discount_api_id = lines[0].slice(1..32)
        amount = lines[0].slice(33..45)
        discount_type_api_id = lines[1].slice(0)
    
        discount_hash[:discount_api_id] = discount_api_id
        discount_hash[:amount] = amount
        discount_hash[:discount_type_api_id] = discount_type_api_id
        discount_collection << discount_hash
        res_hash[:discount] = discount_collection
    
      else
        footer_hash = {}
        lines = line.scan(/\w+/)
        date = lines[1].slice(0..7)
        client_api_id = lines[1].slice(8..39)
    
        footer_hash[:date] = date
        footer_hash[:client_api_id] = client_api_id
        res_hash[:footer] = footer_hash

        transaction_collection = []
        discount_collection = []

        res_array << res_hash
        res_hash = {}
      end
    end
    res_array
  end
end
