class CreateDestinations < ActiveRecord::Migration[7.1]
  def change
    create_table :destinations do |t|
      t.belongs_to :trip
      t.integer :type
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
