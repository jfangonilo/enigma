require_relative './test_helper'
require './lib/key'

class KeyTest < MiniTest::Test
  def setup
    @key = Key.new
  end

  def test_it_exists
    assert_instance_of Key, @key
  end

end
