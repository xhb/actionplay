class Host < ActiveRecord::Base
  # attr_accessible :title, :body
  has_many :vms
  has_and_belongs_to_many :storages
  
end
