class War < ActiveRecord::Base
  
  validates_presence_of :owner_id
  belongs_to :owner, :class_name => 'Api::V1::User', :foreign_key => 'owner_id'

end
