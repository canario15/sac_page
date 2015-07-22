class Championship < ActiveRecord::Base

	belongs_to :category

	has_many :races

	belongs_to :one,   :class_name => "Pilot"
	belongs_to :two, 	 :class_name => "Pilot"
	belongs_to :three, :class_name => "Pilot"

	accepts_nested_attributes_for :races, :allow_destroy => true

	default_scope order('year DESC')


  def championship_data
    Championship.find_by_sql("select rr.pilot_id, pr.number, p.first_name, p.last_name, p.city, p.team,  p.car, SUM (rr.score_for_champ) as score
            from race_results rr, races r, pilots p, pilot_races pr
           where r.championship_id = #{self.id}
             and rr.race_id = r.id
             and p.id = rr.pilot_id
             and pr.id = rr.pilot_race_id
             and rr.score_for_champ is not null
        group by rr.pilot_id, p.first_name, p.last_name, pr.number, p.team, p.city, p.car
        order by SUM (rr.score_for_champ) DESC")
  end

  def race_done
    RaceResult.unscoped.where(championship_id: self.id).select(:race_id).distinct.count
  end
end

