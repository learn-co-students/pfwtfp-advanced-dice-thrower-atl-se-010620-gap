 require 'spec_helper'

describe 'roll_prompt' do
  it 'has a roll_prompt method' do
    expect { roll_prompt(10) }.not_to raise_error
  end

  it 'it returns a message if the number of sides is not 3 up to 100' do
    expect(roll_prompt(1)).to match('Oops! This die does not exist. Please enter a number between 3 and 100')
    expect(roll_prompt(2)).to match('Oops! This die does not exist. Please enter a number between 3 and 100')
    expect(roll_prompt(101)).to match('Oops! This die does not exist. Please enter a number between 3 and 100')
  end

  it 'only accepts values of 3 up to 100' do
    expect(roll_prompt(100)).to be_between(3, 100)
  end

  it 'prints a message when rolling a die with 3 to 100 sides' do
    expect{ roll_prompt(3) }.to output("We're rolling a 3 sided die!").to_stdout
    expect{ roll_prompt(100) }.to output("We're rolling a 100 sided die!").to_stdout
  end
end

describe 'throw_variable_die' do
  it 'has a throw_variable_die method' do
    expect { throw_variable_die(10) }.not_to raise_error
  end

  it 'returns a value that is between 1 and the number of sides' do
    expect(throw_variable_die(3)).to be_between(1, 3)
    expect(throw_variable_die(10)).to be_between(1, 10)
  end
end

describe 'generate_hash_set' do
  it 'has a generate_hash_set method' do
    expect { generate_hash_set(5) }.not_to raise_error
  end

  it 'returns a hash' do
    expect(generate_hash_set(5)).to be_kind_of(Hash)
  end

  it 'returns a hash where the key is the index and the value is the result rolled by the die' do
    expect(generate_hash_set(5)).to have_key(1)
    expect(generate_hash_set(5)).to have_key(2)
    expect(generate_hash_set(5)).to have_key(3)
    expect(generate_hash_set(5)).to have_key(4)
    expect(generate_hash_set(5)).to have_key(5)
  end
end

describe 'lucky_number_seven' do
  before(:all) do
    @unlucky_hash = { 1 => [4], 2 => [5], 3 => [8]}
    @lucky_hash   = { 1 => [4], 2 => [7], 3 => [5]}
    @luckier_hash = { 1 => [4], 2 => [7], 3 => [7]}
  end

  it 'has a lucky_number_seven method' do
    expect { lucky_number_seven({}) }.not_to raise_error
  end

  it 'returns a hash regardless of the outcome' do
    expect(lucky_number_seven(@unlucky_hash)).to be_kind_of(Hash)
    expect(lucky_number_seven(@lucky_hash)).to be_kind_of(Hash)
    expect(lucky_number_seven(@luckier_hash)).to be_kind_of(Hash)
  end

  it 'prints "You\'re pretty lucky!" when a sum of 7 is rolled' do
    expect{ lucky_number_seven(@lucky_hash) }.to output("You're pretty lucky!").to_stdout
  end

  it 'prints "Wow, you\'re on a roll!" when the number 7 is rolled 2 or more times' do
    expect{ lucky_number_seven(@luckier_hash) }.to output("Wow, you're on a roll!").to_stdout
  end

  it 'prints "No such luck this time!" when a 7 is not rolled' do
    expect{ lucky_number_seven(@unlucky_hash) }.to output("No such luck this time!").to_stdout
  end
end
