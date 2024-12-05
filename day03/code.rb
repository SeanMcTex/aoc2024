# Part 1

# Preprocess
lines = File.read("day03/data.txt").lines

# Part 1
tally = 0

for line in lines
    for match in line.scan(/mul\((\d{1,3}),(\d{1,3})\)/) 
        tally += match[0].to_i * match[1].to_i
    end
end

print "Part 1: #{tally}\n"

# Part 2
tally = 0
enabled = true

for line in lines
    for match in line.scan(/mul\((\d{1,3}),(\d{1,3})\)|(do)\(\)|(don\'t)\(\)/) 
        if match[0] && match[1] && enabled
            tally += match[0].to_i * match[1].to_i
        elsif match[2]
            enabled = true
        elsif match[3]
            enabled = false
        end
    end
end
print "Part 2: #{tally}"
