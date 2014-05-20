object @war
attributes :id, :name, :has_end, :ending_score, :booty, :is_private, :open_registration, :is_complete, :winner_id, :owner_id
node(:scores) { |m| @war.battles.count }
child(@user) { attribute :name }
