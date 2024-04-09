def showRE(a,re)
  if a =~ re
	"#{$`}<<#{$&}>>#{$'}"
  else
	"no match"
  end
end
print showRE('very interesting', /t/)
puts
print showRE('he said "hello"', /(["']).*?\1/)

a = 'the quick brown fox'

puts
print a.gsub(/[aeiou]/) { $&.upcase }

re = /(\d+):(\d+)/
md = re.match("Time: 12:34pm")

puts
print $'