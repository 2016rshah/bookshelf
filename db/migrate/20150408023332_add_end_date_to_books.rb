class AddEndDateToBooks < ActiveRecord::Migration
  def change
    add_column :books, :end_date, :date
  end
end
