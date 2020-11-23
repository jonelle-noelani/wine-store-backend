class CreateWines < ActiveRecord::Migration[6.0]
  def change
    create_table :wines do |t|
      t.string :name
      t.string :wine_type
      t.string :region
      t.decimal :price, precision: 5, scale:2
      t.string :description
      t.string :image

      t.timestamps
    end
  end
end
