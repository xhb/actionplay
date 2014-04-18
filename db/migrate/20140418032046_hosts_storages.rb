class HostsStorages < ActiveRecord::Migration
  def self.up
    create_table :hosts_storages, :id=>false do |t|
      t.references :storage
      t.references :host
    end
    add_index(:hosts_storages, ["storage_id", "host_id"])
  end

  def self.down
    drop_table :hosts_storages
  end
end
