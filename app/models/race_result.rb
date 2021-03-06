class RaceResult < ActiveRecord::Base

  belongs_to :pilot_race
  belongs_to :race
  belongs_to :pilot
  belongs_to :championship

  default_scope { order(score_for_champ: :desc, score: :desc, position: :asc) }

  before_save :set_championship_and_category

  def set_championship_and_category
    race = Race.find(race_id)
    self.championship_id = race.championship_id
    self.category_id = race.championship.category_id
    pilot_race = PilotRace.find(pilot_race_id)
    self.pilot_id = pilot_race.pilot_id
  end

end

