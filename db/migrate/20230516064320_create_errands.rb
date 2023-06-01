class CreateErrands < ActiveRecord::Migration[6.1]
  def change
    create_table :errands do |t|
      t.string :errand
      t.string :date
      t.integer :time
      t.string :daynight
      t.string :location
      t.string :address
      t.integer :commute
      t.integer :person_id
     end
  end
end
