class Pilot < ActiveRecord::Base

	has_and_belongs_to_many :categories
  has_many :race_results
  has_many :pilot_races

	has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/assets/default_profile.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  has_attached_file :car_pic, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/assets/Gol-G1-Default.png"
  validates_attachment_content_type :car_pic, :content_type => /\Aimage\/.*\Z/

  has_attached_file :helmet_pic, :styles => { :medium => "40x40>", :thumb => "10x10>" }, :default_url => "/assets/default-helmet.png"
  validates_attachment_content_type :helmet_pic, :content_type => /\Aimage\/.*\Z/

  has_attached_file :complete_pic, :styles => { :medium => "40x40>", :thumb => "10x10>" }, :default_url => "/assets/default-pilot-complete.png"
  validates_attachment_content_type :complete_pic, :content_type => /\Aimage\/.*\Z/

  before_save :set_full_name

  def to_s
  	full_name
  end

  def set_full_name
    self.full_name = first_name + " " + last_name
  end

  def number
   data = PilotRace.where(pilot_id: self.id)
   unless data.blank?
    data.last.number
   else
    "#"
   end
  end

  def age
    begin
      now = Time.now.utc.to_date
      now.year - birth_date.year - (birth_date.to_date.change(:year => now.year) > now ? 1 : 0)
    rescue Exception => e
      "-"
    end
  end

  def self.win_races(championship_id, pilot_id)
    races_win =  RaceResult.where(championship_id: championship_id, score_for_champ: 15, pilot_id: pilot_id ).count
  end

  def count_races(category_id)
    pilot_races.where(category_id: category_id).count
  end

  def all_win_races(category_id)
    race_results.where(position: 1, category_id: category_id ).count
  end

  def podios(category_id)
    race_results.where(position: [1,2,3], category_id: category_id ).count
  end

  def count_champion(category_id)
    Championship.where(one_id: id, category_id: category_id).count
  end

  def poles(category_id)
    PilotRace.joins(:pilot_steps).where("pilot_races.pilot_id = #{id} AND pilot_steps.score = 1 AND pilot_races.category_id = #{category_id}").count
  end

  def first_race(category_id)
    PilotRace.joins(:race).where(pilot_id: id, category_id: category_id).select("races.*").order("races.date ASC").first
  end

end
