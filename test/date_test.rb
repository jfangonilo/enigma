require_relative 'test_helper'
require './lib/date'

class EncodeDateTest < MiniTest::Test
  def setup
    @day = EncodeDate.new
  end

  def test_it_exists
    assert_instance_of EncodeDate, @day
  end

  def test_it_has_date_as_string_of_6_digits
    assert EncodeDate.date.count("0123456789") == 6
  end
end
