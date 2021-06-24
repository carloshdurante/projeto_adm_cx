class CreateCompanies < ActiveRecord::Migration[6.1]
  def change
    create_table :companies do |t|
      t.string :nome
      t.integer :cnpj, limit: 14
      t.string :fundacao
      t.references :fundador, null: false, foreign_key: true

      t.timestamps
    end
  end
end
