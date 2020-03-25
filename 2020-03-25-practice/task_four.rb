def input_data
    [3,4,1,9]
end

# 3 * x^3 + 4 * x^2 + 1 * x^1 + 9 * x^0
#x = 1 , res = 3+ 4 + 1 + 9 = 17
#x = 2, res = 24 + 16 + 2 + 9 = 51

def methodCycles(array,number)
    res = 0
    index = 0
    while(array.size != index)
        res += array[index] * (number**(array.size-index-1))
    index += 1
    end
    puts "value = #{res}"
end

def methodIterator(array,number)
    res = 0
    array.each_with_index do |data,index|
        res += data * (number**(array.size-index-1))
    end
    puts "value 2 = #{res}"

end

def main
    array=input_data
    print "Введите значение точки Х "
    x = gets
    x = x.to_i
    methodCycles(array,x)
    methodIterator(array,x)
end

if __FILE__==$0
    main
end
