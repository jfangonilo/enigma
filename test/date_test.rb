require_relative 'test_helper'
require './lib/date'

class DateTest < MiniTest::Test
  def test_it_has_date_as_string_of_6_digits
    assert Date.string.count("0123456789") == 6
  end
end
