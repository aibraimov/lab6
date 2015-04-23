class CalculatorServer

  def initialize(ch)
    @ch = ch
  end

  def start(queue_name)
    @q = @ch.queue(queue_name)
    @x = @ch.default_exchange

    @q.subscribe(:block => true) do |delivery_info, properties, payload|
#      n = payload.to_i

      my_arr = payload.split('+')
      type = my_arr[0]
      value = my_arr[1]
      if type == "factorization"
        r = self.class.factorization(value)
      elsif type == "is_prime"
        r = self.class.is_prime(value)
      elsif type == "factorial"
        r = self.class.factorial(value)
      elsif type == "exponentiation"
        r = self.class.exponentiation(value)
      end   
#      r = self.class.fib(n)
      @x.publish(r.to_s, :routing_key => properties.reply_to, :correlation_id => properties.correlation_id)
    end
  end

  def self.factorization(value)
    require 'prime'
    @pd = (value.to_i).prime_division
    return "factorization of "+value.to_s+": "+@pd.to_s
  end

  def self.is_prime(value)
    require 'prime'
    if (value.to_i).prime?
      return value.to_s+" is prime"
    else
      return value.to_s+" is not prime"
    end
  end

  def self.factorial(value)
      f = 1; for i in 1..value.to_i; f *= i; end; f
      return "factorial of "+value.to_s+": "+f.to_s
  end

  def self.exponentiation(value)
    my_arr = value.split(' ')
    val1 = my_arr[0].to_i
    val2 = my_arr[1].to_i

    return "exponentiation of "+val1.to_s+" to degree "+val2.to_s+" is equal to "+(val1**val2).to_s
  end

  def self.fib(n)
    case n
    when 0 then 0
    when 1 then 1
    else
      fib(n - 1) + fib(n - 2)
    end
  end
end
