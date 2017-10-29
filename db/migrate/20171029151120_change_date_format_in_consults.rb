class ChangeDateFormatInConsults < ActiveRecord::Migration[5.1]
  def change
    change_column :consults, :date, :datetime
  end
end
