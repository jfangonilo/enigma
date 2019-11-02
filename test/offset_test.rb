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

  def test_it_can_get_year
    @offset.stubs(:get_year_string).returns("19")
    assert_equal "19", @offset.get_year_string
  end

  def test_it_can_get_month
    @offset.stubs(:get_month_string).returns("11")
    assert_equal "11", @offset.get_month_string
  end

  def test_it_can_get_day
    @offset.stubs(:get_day_string).returns("01")
    assert_equal "01", @offset.get_day_string
  end
end
