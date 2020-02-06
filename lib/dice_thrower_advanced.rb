
def roll_prompt(number_of_sides)
  if number_of_sides >= 3 && number_of_sides <= 100
    print "We're rolling a #{number_of_sides} sided die!"
    throw_variable_die(number_of_sides)
  else
    return "Oops! This die does not exist. Please enter a number between 3 and 100"
  end
end

def throw_variable_die(number_of_sides)
  rand(number_of_sides) + 1
 end

def throw_die
  rand(6)+1
end

def generate_set(number)
  Array.new(number) { throw_die }
end

def generate_set2(number)
  Array.new(number) { throw_die }
end

def generate_hash_set(number)
  set_array = generate_set(number).zip(generate_set2(number))
  set_hash = Hash[(1..generate_set(number).size).zip set_array]
end

def lucky_number_seven(hash)
  count_array = []
  hash.each_value do |v|
    count_array << v.sum if v.sum == 7
    count_array
  end
    if !count_array.include?(7)
      print "No such luck this time!"
    elsif count_array.join(', ').match(/7, 7/)
        print "Wow, you're on a roll!"
    else
      print "You're pretty lucky!"
    end
    return hash
end