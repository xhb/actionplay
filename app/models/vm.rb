class Vm < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :host
  belongs_to :storage
  
end
