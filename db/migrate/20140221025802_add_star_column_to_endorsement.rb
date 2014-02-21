class AddStarColumnToEndorsement < ActiveRecord::Migration
  def up
  	add_column :endorsements, :stars, :integer, :limit => 1
  end

  def down
  	drop_column :endorsements, :stars
  end
end
