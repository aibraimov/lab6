class RecentCalcs
  def self.push(raw_post)
  	my_arr = raw_post.split('+')
  	type = my_arr[0]
  	value = my_arr[1]
  	if type == "factorization"
	  	puts factorization(value)
  	elsif type == "is_prime"
  		puts is_prime(value)
    elsif type == "factorial"
      puts factorial(value)
  	elsif type == "exponentiation"
  		puts exponentiation(value)
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

end
