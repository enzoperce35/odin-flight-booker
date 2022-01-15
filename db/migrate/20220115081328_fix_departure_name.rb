class FixDepartureName < ActiveRecord::Migration[6.1]
  def change
    rename_column :flights, :daparture_date, :departure_date
  end
end
