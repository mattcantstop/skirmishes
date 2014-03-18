class War < ActiveRecord::Base

  validates_presence_of :owner_id
  belongs_to :owner, :class_name => 'Api::V1::User', :foreign_key => 'owner_id'
  has_many :battles
  has_and_belongs_to_many :users

  def calculate_participants_scores(users)
    scores_hash = {}
    users.each do |user|
      scores_hash[:user] = Battles.find(:winner_id => user.id)
    end
    return scores_hash
  end

end
