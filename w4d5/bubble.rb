

n = 50000000
nums = (1..n).to_a.shuffle
# print nums

starting = Time.now

# sorted = false
# until sorted
#   sorted = true
#   i = 0
#   (0...n-1).each do |i|
#     if nums[i] > nums[i+1]
#       nums[i], nums[i+1] = nums[i+1], nums[i]
#       sorted = false
#     end
#   end
# end

nums.sort!

ending = Time.now
elapsed = ending - starting

print nums[-10..-1]
puts
puts "#{elapsed} seconds"