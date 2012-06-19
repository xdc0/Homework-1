class Class
	def attr_accessor_with_history(attr_name)

		attr_name = attr_name.to_s
		attr_reader attr_name
		attr_reader attr_name+"_history"

		class_eval %Q{

			def #{attr_name}=(value)
				@#{attr_name} = value
				begin
					@#{attr_name}_history << value
				rescue
					@#{attr_name}_history = [nil,value]
				end
			end

			}
	end
end

class Numeric
	@@currencies = {'yen' => 0.013, 'euro' => 1.292, 'rupee' => 0.019, 'dollar' => 1}

	def method_missing(method_id)
		singular_currency = method_id.to_s.gsub(/s$/,'')
		if @@currencies.has_key?(singular_currency)
			self * @@currencies[singular_currency]
		else
			super
		end
	end

	def in(method_id)
		singular_currency = method_id.to_s.gsub(/s$/,'')
		if @@currencies.has_key?(singular_currency)
			self / 1 * @@currencies[singular_currency]
		else
			super
		end
	end
end

puts 5.rupees.in(:yen)

class String
	def palindrome?
		word = self.split(/[^[:alpha:]]+/).join
		if(word.downcase == word.downcase.reverse)
			return true
		else
			return false
		end
	end
end

module Enumerable
	def palindrome?
		begin
			self == self.reverse
		rescue
			false
		end
	end
end