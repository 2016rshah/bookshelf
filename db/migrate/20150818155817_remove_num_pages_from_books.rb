class RemoveNumPagesFromBooks < ActiveRecord::Migration
  def change
    remove_column :books, :num_pages, :integer
  end
end
