class AddNumPagesToBooks < ActiveRecord::Migration
  def change
    add_column :books, :num_pages, :integer
  end
end
