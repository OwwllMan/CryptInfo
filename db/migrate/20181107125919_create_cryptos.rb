class CreateCryptos < ActiveRecord::Migration[5.2]
  def change
    create_table :cryptos do |t|
      t.string :cryptoname
      t.string :cryptovalue
      t.string :cryptochange1h
      t.string :cryptochange24h
      t.timestamps
    end
  end
end
