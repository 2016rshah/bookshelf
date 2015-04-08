class AddStartDateToBooks < ActiveRecord::Migration
  def change
    add_column :books, :start_date, :date
  end
end
