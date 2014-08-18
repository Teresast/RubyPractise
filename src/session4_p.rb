module Attrs
 
	 def my_attr_reader(attr_name)
	  	define_method(attr_name) do 
	   		instance_variable_get("@"+attr_name.to_s)
	  	end
	 end

	 def my_attr_writer(attr_name)
	  	define_method("#{attr_name}=") do |value|
	   		instance_variable_set("@"+attr_name.to_s, value)
	  	end
	 end

	 def my_attr_accessor(attr_name)
	 	define_method(attr_name) do 
	   		instance_variable_get("@"+attr_name.to_s)
	  	end
	  	define_method("#{attr_name}=") do |value|
	   		instance_variable_set("@"+attr_name.to_s, value)
	  	end
	 end
end


class Cat
 	extend Attrs

 	my_attr_reader :gender
 	my_attr_writer :age
 	my_attr_accessor :name

 	def initialize(gender)
  		@gender = gender
 	end
end

cat = Cat.new("f")
p cat.gender
cat.age = "3"
p cat.name = "Kathy"


