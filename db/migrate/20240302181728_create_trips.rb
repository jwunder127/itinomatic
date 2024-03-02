class CreateTrips < ActiveRecord::Migration[7.1]
  def change
    create_table :trips do |t|
      t.belongs_to :user
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
