class Class
	def attr_accessor_with_history(attr_name)

		attr_name = attr_name.to_s
		:attr_reader attr_name
		:attr_reader attr_name+"_history"

		class_eval { 
			def method_missing(name,)
	end
end