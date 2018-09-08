class CreateObjectOwners < ActiveRecord::Migration[5.1]
  def change
    create_table :object_owners do |t|
      t.string :firstname
      t.string :lastname
      t.string :email

      t.timestamps
    end
  end
end
