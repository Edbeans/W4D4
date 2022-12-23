# #Learning Goals
# Be able to determine the time and space complexity of a method
# Be able to compare the time complexity of one method to another
# Be able to recognize when time or space complexity can be improved

#O(n^2) - polynomial / quadratic 
def my_min(list)
    list.each_with_index do |num1, i|
        min = true 
        list.each_with_index do |num2, j| 
            if i == j
                next
            end
            if num2 < num1 
                min = false
            end
        end
        return num1 if min == true 
    end
end

#O(n) - linear  
def my_min(list)
    min = list[0] 
    list.each do |num| 
        if num < min 
            min = num
        end
    end
    min 
end

list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
my_min(list)  # =>  -5
 
# O(n^2) * n = n^3 
# Time complexity = O(n^3) polynomial 
def largest_contiguous_subsum(list)
    sub_arrays = [] 
    
    list.each_with_index do |num1, i|
        list.each_with_index do |num2, j| #n^2 
            sub_arrays << list[i..j] if list[i..j].length >= 1 # when we slice, it's another iteration for every n^2 iteration so n^2 * n   
        end
    end 

    largest_sum = sub_arrays[0].sum 
    sub_arrays.each do |sub_array|
        if sub_array.sum > largest_sum 
            largest_sum = sub_array.sum 
        end
    end
    return largest_sum 
end

list = [5, 3, -7]
largest_contiguous_subsum(list) # => 8

def largest_contiguous_subsum(list)
    
    largest_sum = list[0] #2
    current_sum = 0 #0
    # [2, 3, -6, 7, -6, 7] 
    # largest_sum = 5 
    # current_sum = 0
    i = 0
    while i < list.length 
        if current_sum < 0 
            current_sum = 0
        end
        current_sum += list[i] 
        if current_sum > largest_sum
            largest_sum = current_sum 
        end
        i += 1
    end
    largest_sum 
end