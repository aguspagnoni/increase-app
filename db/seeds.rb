#Populate tables with static data

DiscountType.create([
  {discount_type_api_id: "1", name: "IVA"},
  {discount_type_api_id: "2", name: "Retenciones"},
  {discount_type_api_id: "3", name: "Comisiones"},
  {discount_type_api_id: "4", name: "Costos extra"},
  {discount_type_api_id: "5", name: "Ingresos brutos"}
  ])

Currency.create([
  {currency_api_id: "000", name: "ARS"},
  {currency_api_id: "001", name: "USD"}
  ])

TransactionType.create([
  {transaction_type_api_id: "1", name: "Aprobado"},
  {transaction_type_api_id: "2", name: "Rechazado"}
  ])
