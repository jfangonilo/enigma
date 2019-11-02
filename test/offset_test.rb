require_relative 'test_helper'
require './lib/offset'

class OffsetTest < MiniTest::Test
  def setup
    @offset = Offset.new
  end

  def test_it_exists
    assert_instance_of Offset, @offset
  end

  def test_it_can_get_date
    assert_instance_of Time, @offset.date
  end

  def test_get_date_string
    assert_instance_of String, @offset.get_date_string
  end

end
