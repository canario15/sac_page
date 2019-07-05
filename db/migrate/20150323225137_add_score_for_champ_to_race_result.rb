class AddScoreForChampToRaceResult < ActiveRecord::Migration[5.1]
  def change
    add_column :race_results, :score_for_champ, :integer
  end
end
