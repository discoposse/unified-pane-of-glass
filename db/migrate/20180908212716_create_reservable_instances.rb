class CreateReservableInstances < ActiveRecord::Migration[5.1]
  def change
    create_table :reservable_instances do |t|
      t.string :name
      t.string :vm

      t.timestamps
    end
  end
end
