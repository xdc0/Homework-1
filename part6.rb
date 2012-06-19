class CartesianProduct
	include Enumerable

	def initialize(first,second)
		@product = []

		first.each do |val1|
			second.each do |val2|
				@product << [val1,val2]
			end
		end
	end

	def each
		@product.each { |e| yield e }
	end
end