require 'test_helper'

class WorkoutsTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Workouts.new.valid?
  end
end
