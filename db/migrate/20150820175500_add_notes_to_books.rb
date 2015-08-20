class AddNotesToBooks < ActiveRecord::Migration
  def change
    add_column :books, :notes, :text
  end
end
