class CreateHosts < ActiveRecord::Migration
  def change
    create_table :hosts do |t|
      t.string "name"
      t.string "vmpid"
      t.string "vmpip"
      
      t.string "totalcpu"
      t.string "usedcpu"
      
      t.string "totalmem"
      t.string "usedmem"

      t.timestamps
    end
  end
end
