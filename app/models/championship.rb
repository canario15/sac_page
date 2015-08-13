class Championship < ActiveRecord::Base

	belongs_to :category

	has_many :races

	belongs_to :one,   :class_name => "Pilot"
	belongs_to :two, 	 :class_name => "Pilot"
	belongs_to :three, :class_name => "Pilot"

	accepts_nested_attributes_for :races, :allow_destroy => true

	default_scope order('year DESC')

  def championship_data
    Championship.find_by_sql("select rr.pilot_id, p.first_name, p.last_name, p.city, p.team,  p.car, SUM (rr.score_for_champ) as score
            from race_results rr, races r, pilots p, pilot_races pr
           where r.championship_id = #{self.id}
             and rr.race_id = r.id
             and p.id = rr.pilot_id
             and pr.id = rr.pilot_race_id
             and rr.score_for_champ is not null
        group by rr.pilot_id, p.first_name, p.last_name, p.team, p.city, p.car
        order by SUM (rr.score_for_champ) DESC")
  end

  def race_done
    RaceResult.unscoped.where(championship_id: self.id).select(:race_id).distinct.count
  end

  def self.actual_championship(category_id)
    Championship.where(category_id: category_id).order(:year).first
  end


  def data_of_pilot_in_championship(pilot_id)
    data = { score: "0", pos: "0", best_place: "", assists: "" }
    championship_data.each_with_index do |result, i|
      if result.pilot_id == pilot_id
        data[:score] = result.score
        data[:pos]   = i + 1
      end
    end
    races = Championship.first.races.map {|r| r.id}
    data[:assists] = PilotRace.where(pilot_id: pilot_id, race_id: races, category_id: category_id).count
    best_result = RaceResult.where(category_id: category_id, championship_id: self.id, pilot_id: pilot_id).order(:position).first
    data[:best_place] = !best_result.nil? ? best_result.position : "0"
    return data
  end

  def next_race
    races.where(done: nil).order(:date).first
  end

end

