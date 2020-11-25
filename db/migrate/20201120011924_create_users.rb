class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :dob
      t.string :email
      t.string :password_digest
      t.string :line
      t.string :city
      t.string :state
      t.integer :postal_code

      t.timestamps
    end
  end
end
