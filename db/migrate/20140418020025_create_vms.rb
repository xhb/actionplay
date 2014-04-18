class CreateVms < ActiveRecord::Migration
  def change
    create_table :vms do |t|
      t.references :host
      t.references :storage

      t.string     "name" 
      t.string     "vmtype"
      t.string     "workrunid"
      t.string     "vmstatus"

      t.timestamps
    end
    add_index("vms", "host_id")
    add_index("vms", "storage_id")
  end
end
