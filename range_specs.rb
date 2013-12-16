require 'spec_helper'


class Range

	def initialize(range_string)
		@range = range_string
	end

	def to_set()
		
		data = @range.split(',')

		start = get_start_bound(data[0]) 
		last = get_last_bound(data[data.size-1])

		create_set(start,last)
	end

	def get_start_bound(start)
		start_sign = start[0]
		start_value = start[1,start.size-1].to_i
		start_value += 1 if start_sign == '('
		start_value
	end

	def get_last_bound(last)
		last_sign = last[last.size-1]
		last_value = last[0,last.size-1].to_i
		last_value -= 1 if last_sign == ')'
		last_value
	end

	def create_set(start_value,last_value)
		# build_string = ""

		# (start_value..last_value).each { |i| 
		# 	build_string += "," if i != start_value
		# 	build_string += i.to_s
		# }

		# "{#{build_string}}"

		range_array = Array.new
		
		(start_value..last_value).each { |i| range_array.push(i) }
		build_string = range_array.join(',')
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

end
