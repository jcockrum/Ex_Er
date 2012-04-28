class CreateExercises < ActiveRecord::Migration
  def self.up
    create_table :exercises do |t|
      t.string :name
      t.string :type
      t.integer :set
      t.integer :set
      t.integer :repetition
      t.time :target_time
      t.integer :user_id
      t.timestamps
    end
  end

  def self.down
    drop_table :exercises
  end
end
