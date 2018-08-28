class CreateVirtualMachines < ActiveRecord::Migration[5.1]
  def change
    create_table :virtual_machines do |t|

      t.timestamps
    end
  end
end
