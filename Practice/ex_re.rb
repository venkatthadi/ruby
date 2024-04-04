date = "12/25/01"

date =~ %r{(\d+)(/|:)(\d+)(/|:)(\d+)}
print [$1,$2,$3,$4,$5], "\n"

date =~ %r{(\d+)(?:/|:)(\d+)(?:/|:)(\d+)}
print [$1,$2,$3], "\n"

str = "red, white, and blue"
print str.scan(/[a-z]+(?=,)/), "\n"

require "benchmark"
include Benchmark
str = "a" + ("b" * 5000)
bm(8) do |test|
  test.report("Normal:") { str =~ /a.*b.*a/ }
  test.report("Nested:") { str =~ /a(?>.*b).*a/ }
end