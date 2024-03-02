class CreatePhotos < ActiveRecord::Migration[7.1]
  def change
    create_table :photos do |t|
      t.belongs_to :destination
      t.float :latitude
      t.float :longitude
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
