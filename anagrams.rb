# Our goal today is to write a method that determines if two given words are anagrams. This means that the letters in one word can be rearranged to form the other word. For example:
# anagram?("gizmo", "sally")    #=> false
# anagram?("elvis", "lives")    #=> true

#What happens if we increase the size of the strings? Slower, because it's linear 

def first_anagram?(str1, str2)
    
    result = []
    (0...str1.length).each do |i|
        (0...str1.length).each do |j|
            result << str1[i..j] if str1[i..j].length >= 1 
        end
    end
    final_result = result.join('').chars.sort
    
    result2 = [] 
    (0...str2.length).each do |i|
        (0...str2.length).each do |j|
            result2 << str2[i..j] if str2[i..j].length >= 1
        end
    end
    final_result2 = result2.join('').chars.sort

    if final_result == final_result2 
        return true 
    else
        return false 
    end 
end 

#n * n *n => O(n^3) - polynomial?  
def second_anagram?(str1, str2)
    string_1 = str1.split('') # ['e', 'l', 'v', 'i', 's']
    string_2 = str2.split('') # ['l', 'i', 'v', 'e', 's']

    string_1.each_with_index do |char, i|
        if string_2.include?(char) 
            string_2.delete(string_2[string_2.find_index(char)]) #-> string_2[3] 
        end
    end
    string_2.empty? ? true : false 
    # if string_2.empty?
    #     return true
    # else
    #     return false
    # end
end

# The first anagram is much faster in terms of complexity O(n), and the second anagram has a longer time complexity O(n^3) 


# Write a method #third_anagram? that solves the problem by sorting both strings alphabetically. The strings are then anagrams if and only if the sorted versions are identical.
def third_anagram?(str1, str2) 
    # O(n^3) ? or O(n) or O(1) 
    sorted_str1 = str1.chars.sort.join # 'elvis' -> [e, l ,v, i, s] -> [e, i ,l, s, v] -> eilsv
    sorted_str2 = str2.chars.sort.join # 'levis' -> [l, e, v, i, s] -> [e, i, l, s, v] -> eilsv 
    
    if sorted_str1 == sorted_str2 
        return true 
    else
        return false 
    end 
    
    # n * n * n => O(n^3) 
    # alpha = ("a".."z")
    # str1_revised = ""
    # str2_revised = ""
    
    # alpha.each do |char|
    #     if str1.include?(char)
    #         str1_revised += char
    #     end
    #     if str2.include?(char)
    #            str2_revised += char
    #     end
    # end
    #     if str1_revised == str2_revised
    #       return true
    #     else
    #       return false
    #     end
    
end


#n + n + n = 3n => n -> O(n) - linear 
def fourth_anagram?(str1, str2)
    first = Hash.new(0)  

    str1.each_char do |char| #{e=>1, l=>0, v=>1, i=>1, s=>1}
        first[char] += 1 
    end

    str2.each_char do |char| #{e=>0, l=>0, v=>0, i=>0, s=>0}
        first[char] -= 1
    end

    first.all? { |_, v| v == 0 }
end