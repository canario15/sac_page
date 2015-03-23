class PilotStep < ActiveRecord::Base
  belongs_to :pilot_race
  belongs_to :step

  default_scope order('position ASC')
end
