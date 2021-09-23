class AddPhotoCoverImageFullNameToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :full_name, :string
    add_column :users, :photo, :text
    add_column :users, :cover_image, :text
  end
end
