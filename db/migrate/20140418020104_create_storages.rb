class CreateStorages < ActiveRecord::Migration
  def change
    create_table :storages do |t|
      t.string "name"
      t.string "vmpid"
      t.string "vmptype"
      t.string "totalsize"
      t.string "usedsize"
      
      t.timestamps
    end
  end
end
