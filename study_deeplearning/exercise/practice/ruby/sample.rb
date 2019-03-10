
require "date"

$s = nil
class TimeChecker


  def intialize()
    """ コンストラクタ """
      puts "==initial settings=="
      @ts = Time.now.strftime '%Y/%m/%d %H:%M:%S'
      $s = Time.now
  end

end
t = TimeChecker.new()
p $s

puts "==global=="
p global_variables()

a = "123.457"
puts a.to_i
puts a.to_f
puts a.to_c
puts a.to_r
puts a.to_f.to_s


puts "aaa\nbbb"
p "aaa\nbbb"
print("aaa\nbbb")
puts "#{$LOAD_PATH}"
p "s\n"
# begin time
if defined?(ts)
  p "$B8=:_$N;~9o(B"
  p ts
end
p defined?($KCODE)
  p $KCODE

puts "==initial settings=="

class TextAnalizer
    @@items = 0 # static $B$J%W%m%Q%F%#$O(B@@$BFs$D!)(B
    def initialize(keyword)
        setParam(keyword)
        # $B@8@.$7$?%$%s%9%?%s%9$N?t$rA}$d$9!#(B
        @@items += 1
    end

    def setParam(param)
        @param = param
    end

    def getParam()
        return @param
    end

    #  $B%/%i%9%a%=%C%I$O(Bself$B%-!<%o!<%I$r!#(B
    def self.howMany()
        return @@items
    end
end

t = TextAnalizer.new('test')
p t.getParam()

t2 = TextAnalizer.new('test2')
p t2.getParam()

p TextAnalizer.howMany()
p t2.getParam()
p t.getParam()

t3 = TextAnalizer.new('$B%F%9%H(B3')
latest_cnt =  TextAnalizer.howMany()
p latest_cnt
if  latest_cnt == 2
    p "it is 2."
else
    p "it is other of 2"
end
