#!/usr/bin/env ruby
require "minitest/autorun"

def calc data
  sum = 0
  reached = {0 => 1}
  done = false
  until done do
    data.each do |d|
      sum += d
      reached[sum] ||= 0
      reached[sum] += 1
      done = reached[sum] > 1
      break if done
    end
  end
  sum
end

class Test < Minitest::Test
  def test_sth
    assert_equal 0, calc([+1, -1])
    assert_equal 10, calc([+3, +3, +4, -2, -4])
    assert_equal 5, calc([-6, +3, +8, +5, -6])
    assert_equal 14, calc([+7, +7, -2, -7, -4])
  end

  def teardown
    puts "OUTPUT #{calc(File.read('input').split("\n").map(&:to_i))}"
  end
end
