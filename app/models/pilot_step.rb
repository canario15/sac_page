class PilotStep < ActiveRecord::Base
  belongs_to :pilot
  belongs_to :step
end
