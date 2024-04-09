# (a.*b).+c <==> (a + b) * c

# # Commands
# print `date`


# # Assignment
# class BrokenAmplifier
#   attr_accessor :leftChannel, :rightChannel
#   def volume=(vol)
#     self.leftChannel = self.rightChannel = vol
#   end
# end

# amp = BrokenAmplifier.new
# amp.leftChannel = amp.rightChannel = 10
# amp.volume = 5
# print amp.leftChannel, "\n"
# print amp.rightChannel, "\n"

# Conditional expressions
puts 1 == 1.0
puts 1 === 1.0
puts 1.eql?(1.0)

a = 5
if a > 0 then puts "positive"
elsif a == 0 then puts "zero"
else puts "negative"
end

list = ["first", "second", "third", "fourth"]
list.each { |l| if l =~ /d$/ then print l, "\n" end}