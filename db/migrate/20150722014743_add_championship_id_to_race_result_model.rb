class AddChampionshipIdToRaceResultModel < ActiveRecord::Migration[5.1]
  def change
    add_column :race_results, :championship_id, :integer
    add_column :race_results, :category_id, :integer
    add_column :race_results, :pilot_id, :integer
  end
end
