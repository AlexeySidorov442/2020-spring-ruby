def input_data
    [0,2,0,0,0,3,0,5,0,2,7,0,13]
end

def main
    array= input_data
    with_cycles(array)
    with_iterator(array)
end

def with_cycles(array)
    index = 0
    while ( array.size != index)
        if array[index] == 0
            array.delete_at(index)
            index -= 1
        end
        index += 1
    end
    puts "#{array}"
end

def with_iterator(array)
    array.delete_if {|number| number == 0}
    print "#{array}"
end

if __FILE__==$0
    main
end