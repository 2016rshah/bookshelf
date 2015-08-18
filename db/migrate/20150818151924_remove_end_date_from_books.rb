class RemoveEndDateFromBooks < ActiveRecord::Migration
  def change
    remove_column :books, :end_date, :date
  end
end
