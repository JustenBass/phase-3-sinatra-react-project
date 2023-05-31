class CreateErrands < ActiveRecord::Migration[6.1]
  def change
    create_table :errands do |t|
      t.string :errand
      t.date :date
      t.time :time
      t.string :location
      t.string :address
      t.time :commute
      t.integer :person_id
     end
  end
end
