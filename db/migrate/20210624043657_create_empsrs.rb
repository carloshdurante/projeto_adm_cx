class CreateEmpsrs < ActiveRecord::Migration[6.1]
  def change
    create_table :empsrs do |t|
      t.string :nome
      t.string :sobrenome
      t.integer :idade, limit: 2
      t.boolean :emexperiencia
      t.float :salario
      t.references :coordenador, null: false, foreign_key: true
      t.references :company, null: false, foreign_key: true

      t.timestamps
    end
  end
end
