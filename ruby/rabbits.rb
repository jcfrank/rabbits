#!/usr/bin/ruby -w

def count_rabbits_2(months)
  new_rabbits = 2
  m1_rabbits = 0
  m2_rabbits = 0
  adult_rabbits = 0

  months.times do |month|
    adult_rabbits += m2_rabbits
    m2_rabbits = m1_rabbits
    m1_rabbits = new_rabbits
    new_rabbits = adult_rabbits
  end

  total = adult_rabbits + m2_rabbits + m1_rabbits + new_rabbits
  total
end

# Main
if ARGV.length < 1
  puts "Please give number of months."
  exit
end
months = Integer(ARGV[0])
puts "Rabbits count: " + count_rabbits_2(months).to_s
