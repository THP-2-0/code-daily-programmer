class	ArrayTransformation

	def initialize
		prompt_series_of_numbers
		check_input_against_regexp
		make_array_of_numbers
		display_input
	end

	# Prompts user for a series of at least 2 numbers
	def prompt_series_of_numbers
		puts "Enter a series of at least 2 numbers seperated by commas"
		@input_numbers = gets.chomp.split(",")
		puts "\n\n"
	end

	# Returns an array where each element contains only digits
	def check_input_against_regexp
		@input_numbers.each do |input_value|
			@input_numbers = @input_numbers - [input_value] if !(input_value =~ /\D/).nil? || input_value.strip.empty?
		end
		return @input_numbers
	end

	# Makes an array from the series of number
	def make_array_of_numbers
		@input_array = @input_numbers.map { |value| value.to_i }
	end

	def display_input
		puts "Input array :"
		print @input_array
		puts "\n\n"
	end	

	def valid_conditions
		test_array = []
		# Does @input_array belong to the class Array ?
		test_array << @input_array.class == Array
		# Do all elements in @input_array belong to the class Integer ?
		@input_array.each do |value|
			test_array << value.class == Integer
		end
		# Is the size of @input_array superior or equal to 2 ?
		test_array << (@input_array.size >= 2)

		# returns true if all tests pass
		!test_array.include?(false)
	end

	##########################################
	# METHOD 1
	# Nested loops
	##########################################
	def transform_with_nested_loops
		@output_array = []

		@input_array.size.times do |j|
			k = 1
			@input_array.each_with_index do |a, i|
				k = k * a unless i == j
			end
			@output_array << k
		end
	end

	##########################################
	# METHOD 2
	# Inject method
	##########################################
	def transform_with_inject_method
		@output_array = []
		@input_array.each do |a|
			array = @input_array - [a]
			new_value = array.inject { |total, array_value| total * array_value }
			@output_array << new_value
		end
	end

	def display_output
		puts "Output array :"
		print @output_array
		puts "\n\n"	
	end

	def perform
		if valid_conditions
			transform_with_nested_loops
			# transform_with_inject_method
		else
			puts "The input : #{@input_numbers} is invalid"
		end
		display_output
	end
end

d = ArrayTransformation.new
d.perform
