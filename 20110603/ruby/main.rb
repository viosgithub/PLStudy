def qsort(seq)
    if seq.length < 1:
        return seq
    end
    pivot = seq[0]
    left = []
    right = []
    for x in 1..seq.length-1
        if seq[x] <= pivot 
            left.push(seq[x])#in python(push->append)
        else
            right.push(seq[x])
        end
    end
    left = qsort(left)
    right = qsort(right)
    foo = [pivot]
    return left + foo + right
end

list = [5,7,8,9,6,3,4,2,1]
print qsort(list)
