class AddInSeasonToItems < ActiveRecord::Migration[5.0]
  def change
    add_column :items, :in_season, :boolean, :default => false
  end
end
