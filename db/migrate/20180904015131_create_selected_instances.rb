class CreateSelectedInstances < ActiveRecord::Migration[5.1]
  def change
    create_table :selected_instances do |t|

      t.timestamps
    end
  end
end
