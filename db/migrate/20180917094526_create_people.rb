class CreatePeople < ActiveRecord::Migration[5.2]
  def change
    create_table :people do |t|
      t.string :name
      t.string :image_url
      t.string :country_code

      t.timestamps
    end
  end
end
