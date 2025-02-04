class Calc
  def initialize
    print "\t\t\t\t CALCULATOR DEMO\n"
  end
 
  def method_missing(m, **args, &block)
    if args.size == 3
      # Handling for binary operators
      ans = args[:a].send(args[:o], args[:b])
      print "Function passed : #{m.to_s}\n"
      print "#{args[:a]} #{args[:o]} #{args[:b]} : #{ans}\n"
    else
      print "No method error\n"
    end
  end
 
  operators = {
    "add": "+",
    "subtract": "-",
    "multiply": "*",
    "divide": "/",
    "modulo": "%",
    "power": "**"
  }
    operators.each do |operation, operator|
      define_method "calculate_#{operation}" do |a,b|
        a.send(operator, b)
      end
    end
end
 
c = Calc.new
c.calculate_greater_equal(a: 2, b: 4, o: ">=")
# puts c.calculate_log(1)
#   puts c.calculate_add(1, 2)       # Output: 3
# puts c.calculate_subtract(3, 6)  # Output: 2
# puts c.calculate_multiply(4, 2)  # Output: 8
# puts c.calculate_divide(10, 2)   # Output: 5.0
# puts c.calculate_modulo(10, 3)   # Output: 1
# puts c.calculate_power(2, 3)     # Output: 8
