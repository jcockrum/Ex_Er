class Exercise < ActiveRecord::Base
  attr_accessible :name, :extype, :set, :repetition, :target_time, :user_id
  belongs_to :user
  belongs_to :events
  
  EXTYPE = ["Flexibility", "Aerobic", "Anaerobic"]
  
  
  validates_presence_of :name, :extype
  validates :extype, :exclusion => { :in => %w["Flexibility", "Aerobic", "Anaerobic"]}
  
end
