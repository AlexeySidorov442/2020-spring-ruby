#Напечатать те элементы массива, индексы которых являются
#степенями двойки.

def degTwo?(value)
    checkedTwo = 1
    while checkedTwo < value
        checkedTwo *= 2
    end

    if checkedTwo == value
        true
    else false
    end
end

def with_cycles(array)
    degTwoArray=[]
    for number in array
        if degTwo?(number) 
            degTwoArray.push(number)
        end
    end 
    puts "Элементы массива равные степени 2 : #{degTwoArray}"
end

def with_iterator(array)
    degTwoArray=[]
    array.each do |number|
        if degTwo?(number) 
            degTwoArray.push(number)
        end
    end
    puts "Элементы массива равные степени 2 : #{degTwoArray}"
end

def input_data
    [1,2,3,4,5,6,8,16,32,100,52,-1,0,13,2]
end




def main
    array = input_data
    with_cycles(array)
    with_iterator(array)
end

if __FILE__==$0
    main
end