require 'pry'

def throw_die
  rand(6)+1
end

def generate_set(numbers)
  Array.new(numbers) {throw_die}
end 

def generate_hash_set(numbers)
  hash = Hash.new
  number.times do |roll|
    hash[roll + 1] = generate_set(2)
  end 

 lucky_number_seven(hash)
  hash
end 

def lucky_number_seven(src)
  totals = src.reduce({}) do |memo, i|
    memo[e[0]] = e[1].reduce(&:+)
    memo
end 

  if !totals.values.include?(7)
    return "No such luck this time!"
  else 
  if total.values.join(' ').match(/77/)
    return "Wow, you're on a roll!"
  else 
    return "You're pretty lucky!"
  end 
end 
return src
end 

end 


def generate_set(number)
  Array.new(number) { throw_die }
end

def roll_prompt(number)
  if number.between?(3, 100)
    return "We're rolling a #{number} sided die!"
    throw_variable_die
  else 
    return "Oops! This die does not exist. Please enter a number between 3 and 100"
  end 
end 

def  throw_variable_die(number)
  rand(number) + 1
end 