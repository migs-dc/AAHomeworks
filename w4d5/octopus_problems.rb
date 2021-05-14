#BIG O

# O(n^2)
def sluggish_octopus(fishes)
  n = fishes.length
  (0...n).each do |i1|
    (0...n).each do |i2|
      if fishes[i1].length < fishes[i2].length
        fishes[i1], fishes[i2] = fishes[i2], fishes[i1] 
      end
    end 
  end
  fishes
end
# O(nlogn)
def dominant_octopus(fishes)
  return fishes if fishes.length <= 1
  left = fishes.take( fishes.length/2 )
  right = fishes.drop( fishes.length/2 )
  merge(dominant_octopus(left), dominant_octopus(right) )
end

def merge(left, right)
  sorted = []
  until left.empty? || right.empty?
    if left[0].length < right[0].length
      sorted << left.shift
    else
      sorted << right.shift
    end
  end
  sorted + left + right
end

fishes = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']
p sluggish_octopus(fishes).last
p dominant_octopus(fishes).last
# => "fiiiissshhhhhh"


#-----Dancing Octopus-----#

#O(n)
def slow_dance(direction, tiles_array)
  tiles_array.each_with_index do |leg, i|
    return i if leg == direction
  end
end

#initially did a case when for the O(1) one,
#looked horrible tho haha so i switched when i saw the solution

tentacles = {
  "up" => 0,
  "right-up" => 1, 
  "right" => 2, 
  "right-down" => 3, 
  "down" => 4, 
  "left-down" => 5, 
  "left" => 6,  
  "left-up" => 7
}

def fast_dance(direction, tentacles)
  tentacles[direction]
end

tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]
p slow_dance("up", tiles_array) # > 0
p slow_dance("right-down", tiles_array) # > 3

p fast_dance("up", tentacles) # > 0
p fast_dance("right-down", tentacles) # > 3
