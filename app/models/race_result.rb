class RaceResult < ActiveRecord::Base

  belongs_to :pilot_race
  belongs_to :race

  default_scope order('score DESC')

end

