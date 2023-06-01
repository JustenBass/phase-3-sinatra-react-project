class AddColumnToErrandsTable < ActiveRecord::Migration[6.1]
  def change
    add_column :errands, :am_pm, :string
  end
end
