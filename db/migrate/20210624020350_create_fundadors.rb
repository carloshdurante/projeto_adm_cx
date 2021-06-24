class CreateFundadors < ActiveRecord::Migration[6.1]
  def change
    create_table :fundadors do |t|
      t.string :nome
      t.string :sobrenome
      t.integer :idade, limit: 2

      t.timestamps
    end
  end
end
