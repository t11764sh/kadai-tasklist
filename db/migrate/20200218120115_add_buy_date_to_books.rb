class AddBuyDateToBooks < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :buy_date, :string
  end
end
