def qsort(a,left,right):
    if(left<right):
        i=left
        j=right
        x=a[(left+right)/2]
        while i<=j:
            while a[i]<x:
                i+=1
            while a[j]>x:
                j-=1
            if i<=j:
                if i<j:
                    w=a[i]
                    a[i]=a[j]
                    a[j]=w
                i+=1
                j-=1
        if left<j:
            qsort(a,left,j)
        if i<right:
            qsort(a,i,right)

b=[5,2,6,7,8,9,4,2,4,9]
qsort(b,0,9)
print b
raw_input()
