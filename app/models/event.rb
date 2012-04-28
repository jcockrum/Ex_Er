class Event < ActiveRecord::Base
  attr_accessible :name, :start_at, :end_at, :all_day ,:user_id, :exercise_id
  has_event_calendar
  belongs_to :users
  has_many :exercises
 
  validates_presence_of :name, :start_at, :end_at, :exercise_id
      
  
    # custom options for this calendar

  
end
