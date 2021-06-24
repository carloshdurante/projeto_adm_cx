class CreateCoordenadors < ActiveRecord::Migration[6.1]
  def change
    create_table :coordenadors do |t|
      t.string :nome
      t.string :sobrenome
      t.integer :idade, limit: 2
      t.date :contratadoem
      t.references :lider, null: false, foreign_key: true
      t.references :company, null: false, foreign_key: true

      t.timestamps
    end
  end
end
