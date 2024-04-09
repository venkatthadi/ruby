class TaxCalculator
	def initialize(name, &block)
		@name, @block = name, block
	end

	def getTax(amount)
		"#{@name} on #{amount} is #{@block.call(amount)}."
	end
end

tc = TaxCalculator.new("VAT") { |amount| amount * 0.2 }

puts tc.getTax(100)

# # dynamic blocks
# print "(t)imes or (p)lus: "
# times = gets
# print "number: "
# number = gets.to_i
# if times =~ /^t/
# 	calc = proc { |n| n*number }
# else
# 	calc = proc { |n| n+number }
# end
# puts ((1..10).collect(&calc).join(", "))

# # proc implementation
# numbers = [1, 2, 3, 4, 5]
# is_even = proc { |n| n.even? }
# even_numbers = numbers.select(&is_even)
# print even_numbers.inspect, "\n"

