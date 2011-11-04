class AddUrlToTwitter < ActiveRecord::Migration
  def change
    add_column :twitters, :url, :string
  end
end
