class CreateInstanceReservations < ActiveRecord::Migration[5.1]
  def change
    create_table :instance_reservations do |t|
      t.references :reservation_owner, foreign_key: true
      t.references :reservable_instance, foreign_key: true

      t.timestamps
    end
  end
end
