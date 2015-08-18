class RemoveStartDateFromBooks < ActiveRecord::Migration
  def change
    remove_column :books, :start_date, :date
  end
end
