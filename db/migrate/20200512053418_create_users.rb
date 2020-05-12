class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :age
      t.string :phone_number
      t.string :username
      t.string :suburb
      t.string :state

      t.timestamps
    end
  end
end
