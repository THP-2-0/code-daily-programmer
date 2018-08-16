class	StringDifference

	def initialize_arrays_from_strings
		puts "Enter a first series of characters and hit 'enter'"
		@first_array = gets.chomp.split("").map { |value| (value =~ /[A-Za-z0-9]/) ? value : nil }.compact
	
		puts "Enter a second series of characters and hit 'enter'"
		@second_array = gets.chomp.split("").map { |value| (value =~ /[A-Za-z0-9]/) ? value : nil }.compact
	end

	def make_same_length_array
		if @first_array.count!= @second_array.count
			length_difference = (@second_array.count - @first_array.count).abs
			@first_array.count < @second_array.count ? complete_with_nil(@first_array, length_difference) : complete_with_nil(@second_array, length_difference)
		end
	end		

	def complete_with_nil(array, number_of_characters_to_add)
		number_of_characters_to_add.times { array << nil }
	end

	def array_comparison
		counter = 0
			@first_array.each_with_index do |value, i|
				counter += 1 if value != @second_array[i] 
			end
    puts "Distance is : #{counter}"
	end

	def perform
		initialize_arrays_from_strings
		make_same_length_array
		array_comparison
	end
end

s = StringDifference.new
s.perform
