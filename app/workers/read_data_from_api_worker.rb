class ReadDataFromApiWorker
  include Sidekiq::Worker

  def perform(*args)
    #p "Hello World!"
    response = Excon.get(
      "https://increase-transactions.herokuapp.com/file.txt",
        headers: {
          'Authorization' => ENV['INCREASE_AUTH']
        }
      )
    return nil if response.status != 200
      
    p response.headers
      #render json: to_json(response.body)
    p jid
  end
end
