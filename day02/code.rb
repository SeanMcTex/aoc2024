# Part 1

# Preprocess
lines = File.read("day02/data.txt").lines
lines.map! { |line| line.split(" ").map { |i| i.to_i}}

# Part 1
safeTally = 0

for line in lines do
    isAscending = line[0] < line[-1]

    lastItem = line[0]
    isSafe = true
    for item in line.drop(1) do
        difference = isAscending ? item - lastItem : lastItem - item
        isSafe = false if (difference < 1 || difference > 3)
        lastItem = item
    end
    safeTally += 1 if isSafe
end

print "Part 1: #{safeTally}\n"

# Part 2
safeTally = 0

for line in lines do

    indexRange = (-1...line.length).to_a
    for index in indexRange do
        if index == -1
            modifiedLine = line
        else
            modifiedLine = line.reject.with_index{|v, i| i == index} # goofy array API
        end

        isSafe = true
        isAscending = modifiedLine[0] < modifiedLine[-1]
        lastItem = modifiedLine[0]

        for item in modifiedLine.drop(1) do
            difference = isAscending ? item - lastItem : lastItem - item
            isSafe = false if (difference < 1 || difference > 3)
            lastItem = item
        end

        if isSafe 
            safeTally += 1 
            break
        end
    end
end

print "Part 2: #{safeTally}"
