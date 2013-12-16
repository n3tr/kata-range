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
		start_value = start[1].to_i

		if start_sign == '(' then
			start_value += 1
		end
		start_value
	end

	def get_last_bound(last)
		last_sign = last[1]
		last_value = last[0].to_i

		
		if last_sign == ')' then
			last_value -= 1
		end
		last_value
	end

	def create_set(start_value,last_value)
		result = "{"

		for i in start_value..last_value
			if i != start_value then
				result += ","
			end

			result += i.to_s
		end

		result += "}"

		result
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
	
	it 'should return empty set when input is "(0,1]"' do
		expected = "{1}"
		range = Range.new("(0,1]")
		actual = range.to_set()
		actual.should eq(expected)
	end

	it 'should return empty set when input is "(0,2]"' do
		expected = "{1,2}"
		range = Range.new("(0,2]")
		actual = range.to_set()
		actual.should eq(expected)
	end

end
