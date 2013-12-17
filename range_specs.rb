require 'spec_helper'


class Range

  def initialize(range_string)
    @range = range_string
  end

  def to_set()
    start, last = split_range()
    create_set(start,last)
  end

  private
  
  def split_range()
    _,start_sign,start_value,last_value,last_sign = */(\(|\[)(-?\d+),(-?\d+)(\)|\])/.match(@range)
    start_value = start_value.to_i
    start_value += 1 if start_sign == "("
    last_value = last_value.to_i
    last_value -= 1 if last_sign == ")"
    [start_value,last_value]
  end
  
  def create_set(start_value,last_value)
    build_string = (start_value..last_value).to_a.join(',')
    "{#{build_string}}"
  end

end

describe 'Range' do
  
  it 'should return empty set when input is "(0,0)"' do
    expected = "{}"
    range = Range.new("(0,0)")
    actual = range.to_set()
    actual.should eq(expected)
  end
  
  it 'should return empty set when input is "(0,1)"' do
    expected = "{}"
    range = Range.new("(0,1)")
    actual = range.to_set()
    actual.should eq(expected)
  end
  
  it 'should return {1} set when input is "(0,1]"' do
    expected = "{1}"
    range = Range.new("(0,1]")
    actual = range.to_set()
    actual.should eq(expected)
  end

  it 'should return {1,2} set when input is "(0,2]"' do
    expected = "{1,2}"
    range = Range.new("(0,2]")
    actual = range.to_set()
    actual.should eq(expected)
  end

  it 'should return {0,1,2} set when input is "[0,2]"' do
    expected = "{0,1,2}"
    range = Range.new("[0,2]")
    actual = range.to_set()
    actual.should eq(expected)
  end

  it 'should return {1,2,3,4,5,6,7,8} set when input is "(0,9)"' do
    expected = "{1,2,3,4,5,6,7,8}"
    range = Range.new("(0,9)")
    actual = range.to_set()
    actual.should eq(expected)
  end

  it 'should return {1,2,3,4,5,6,7,8,9} set when input is "(0,10)"' do
    expected = "{1,2,3,4,5,6,7,8,9}"
    range = Range.new("(0,10)")
    actual = range.to_set()
    actual.should eq(expected)
  end

  it 'should return {1,2,3,4,5,6,7,8,9,10} set when input is "(0,10]"' do
    expected = "{1,2,3,4,5,6,7,8,9,10}"
    range = Range.new("(0,10]")
    actual = range.to_set()
    actual.should eq(expected)
  end

  it 'should return {-4,-3,-2,-1,0,1,2,3,4,5} set when input is "(-5,5]"' do
    expected = "{-4,-3,-2,-1,0,1,2,3,4,5}"
    range = Range.new("(-5,5]")
    actual = range.to_set()
    actual.should eq(expected)
  end

  it 'should return {10000,10001,10002} set when input is "(9999,10002]"' do
    expected = "{10000,10001,10002}"
    range = Range.new("(9999,10002]")
    actual = range.to_set()
    actual.should eq(expected)
  end

  it 'should return {-4,-3,-2} set when input is "(-5,-1)"' do
    expected = "{-4,-3,-2}"
    range = Range.new("(-5,-1)")
    actual = range.to_set()
    actual.should eq(expected)
  end

  it 'should return {-100,-99} set when input is "[-100,-99]"' do
    expected = "{-100,-99}"
    range = Range.new("[-100,-99]")
    actual = range.to_set()
    actual.should eq(expected)
  end

end
