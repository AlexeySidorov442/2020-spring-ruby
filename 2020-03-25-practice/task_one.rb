def sign?(value)
    if value > 0 
        true 
    elsif value < 0
        false
    end
end

def input_data
    [1,2,-2,-3]
end

def with_cycles(array)

    changesSignArray=[]
    changesIndex=0
    equalsSign = sign?(array[0])

    for number in array 
        if (sign?(number) != equalsSign)
            equalsSign=sign?(number)
            changesSignArray.push(changesIndex)
        end
        changesIndex += 1
    end

    puts "Позиции смены знака #{changesSignArray}"
    puts "Количесвто смен знака #{changesSignArray.size}"
end

def with_iterator(array)
    changesSignArray=[]
    equalsSign = sign?(array[0])

    array.each_with_index do |number,index|
        if(sign?(number) != equalsSign)
            equalsSign = sign?(number)
            changesSignArray.push(index)
        end
    end
    
    puts "Позиции смены знака #{changesSignArray}"
    puts "Количество смен знака #{changesSignArray.size}"
end


def main
array = input_data
with_cycles(array)
with_iterator(array)
end

if __FILE__==$0
    main
end
