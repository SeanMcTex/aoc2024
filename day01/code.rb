# Part 1

# Preprocess
lines = File.read("day01/data.txt").lines
list1 = []
list2 = []


for line in lines do
    elements = line.split(/\W+/)
    list1.append(elements[0].to_i)
    list2.append(elements[1].to_i)
end

list1.sort!
list2.sort!

# Part 1
combined = list1.zip(list2)

totalDistance = 0

for pair in combined do
    distance = (pair[0] - pair[1]).abs
    totalDistance += distance
end

print "Part 1: #{totalDistance}\n"

# Part 2
similarity = 0
tallies = list2.tally

for item in list1 do
    similarity += item * tallies.fetch(item, 0)
end

print "Part 2: #{similarity}"