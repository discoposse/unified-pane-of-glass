class CreateReservationOwners < ActiveRecord::Migration[5.1]
  def change
    create_table :reservation_owners do |t|
      t.string :firstname
      t.string :lastname
      t.string :email

      t.timestamps
    end
  end
end
