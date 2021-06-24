class CreateLiders < ActiveRecord::Migration[6.1]
  def change
    create_table :liders do |t|
      t.string :nome
      t.string :sobrenome
      t.integer :idade, limit: 2
      t.string :area
      t.references :company, null: false, foreign_key: true

      t.timestamps
    end
  end
end
