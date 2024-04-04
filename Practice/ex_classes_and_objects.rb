# # object specific class
# a = "hello"
# b = a.dup

# class << a
#     def to_s
#         "The value is #{self}"
#     end
# end

# puts a.to_s
# puts b.to_s

# def a.to_s
#     "the value is #{self}"
# end

# puts a.to_s

# # mixing modules
# module Mod
#     def hello
#         "hello"
#     end
# end

# class Dummy
#     include Mod
# end

# obj = Dummy.new
# puts obj.hello

# # extending objects 
# module Humor
#   def tickle
#     "hee, hee!"
#   end
# end
# a = "Grouchy"
# a.extend Humor
# puts a.tickle

# class Test
#   def Test.sayHello
#     puts "Hello from #{name}"
#   end

#   sayHello # prints "Hello from Test"
# end
