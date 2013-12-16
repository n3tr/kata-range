require 'spec_helper'


class Range

	def initialize(range_string)
		@range = range_string
	end

	# def to_set()
	# 	if @range == "(0,1]" then
	# 		"{1}"
	# 	elsif @range == "(0,2]" then
	# 		"{1,2}"
	# 	else 
	# 		"{}"
	# 	end
	# end

	def to_set()
		
		data = @range.split(',')

		start = data[0]
		last = data[data.size-1]

		start_sign = start[0]
		start_value = start[1].to_i

		last_sign = last[1]
		last_value = last[0].to_i

		# puts start_value + "-" + start_sign
		# puts last_value + "-" + last_sign

		if start_sign == '(' then
			start_value += 1
		end

		puts "#{last_value}"

		if last_sign == ')' then
			last_value -= 1
		end

		result = "{"

		for i in start_value..last_value
			if i != start_value then
				result += ","
			end

			result += i.to_s

			# puts "#{i}"
		end

		result += "}"

		# puts result

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
