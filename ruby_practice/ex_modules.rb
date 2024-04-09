module Trig
    PI = 3.14159265358979323846
    def Trig.sin(x)
        puts "sin(#{x}) = #{Math.sin(x)}"
    end
    def Trig.cos(x)
        puts "cos(#{x}) = #{Math.cos(x)}"
    end
end

module Action
    VERY_BAD = 0
    GOOD = 1
    def Action.sin(badness)
        if badness == VERY_BAD
            puts "bad"
        else
            puts "good"
        end
    end
end

y = Trig.sin(Trig::PI/2)
karma = Action.sin(Action::GOOD)