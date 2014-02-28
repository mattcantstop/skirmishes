class War < ActiveRecord::Base

  belongs_to :owner, :class_name => 'Api::V1::User', :foreign_key => 'owner_id'

end
