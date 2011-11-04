class CreateTwitters < ActiveRecord::Migration
  def change
    create_table :twitters do |t|
      t.string :screen_name
      t.string :name
      t.string :profile_image_url
      t.string :profile_background_image_url

      t.timestamps
    end
  end
end
