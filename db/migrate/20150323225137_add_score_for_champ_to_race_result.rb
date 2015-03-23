class AddScoreForChampToRaceResult < ActiveRecord::Migration
  def change
    add_column :race_results, :score_for_champ, :integer
  end
end
