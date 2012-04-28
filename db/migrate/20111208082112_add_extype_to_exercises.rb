class AddExtypeToExercises < ActiveRecord::Migration
  def self.up
    add_column :exercises, :extype, :string
    remove_column :exercises, :type
  end

  def self.down
    remove_column :exercises, :extype
  end
end
