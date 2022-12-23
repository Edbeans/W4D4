def bad_two_sum?(arr, target_sum)
    arr.each_with_index do |num1, idx1|
        arr.each_with_index do |num2, idx2| 
            if idx2 > idx1 && num1 + num2 == target_sum 
                return true 
            end
        end
    end
    return false 
end

# arr = [0, 1, 5, 7]
# bad_two_sum?(arr, 6) # => should be true
# bad_two_sum?(arr, 10) # => should be false

#time O(n^2) because we are utilizing nested loops and checking more or less pairs doesnt impact this

# O(nlogn)
def okay_two_sum?(arr, target) 
    sorted_array = arr.sort #[4, 10, 18, 83, 123], target = 28 
    i = 0 # element at the beginning of the array 
    j = sorted_array.length - 1 # element at end of the array 
    while i < j 
        case (sorted_array[i] + sorted_array[j]) <=> target  
        when 0 
            return true 
        when -1 
            i += 1
        when 1 
            j -= 1  
        end
    end
end

#O(n) 
def two_sum?(arr, target) 
    hash = Hash.new { |h, k| h[k] = [] }
    arr.each do |ele|
        complement = target - ele # number we need to look for inside the hash 
end

