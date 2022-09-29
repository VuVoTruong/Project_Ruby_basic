arr1 = [ 5, 6, 22, 26, 1, -1,8,10 ]
arr2 = [ 1, 6,-1,10 ]
  
m=arr1.length() 
n=arr2.length()

def isSubset(arr1, arr2, m, n)
  i=0
  j=0
  if (m < n)
              return false
  end
  #Ý tưởng là sắp xếp hai mảng và sau đó lặp lại trên mảng thứ hai để tìm kiếm các giá trị giống nhau trên mảng đầu tiên bằng cách sử dụng hai con trỏ.
  #Bất cứ khi nào chúng ta gặp các giá trị giống nhau
  #chúng ta sẽ tăng cả con trỏ và nếu chúng ta gặp bất kỳ giá trị nào nhỏ hơn giá trị của mảng thứ hai
  #chúng ta sẽ tăng giá trị của con trỏ trỏ đến mảng đầu tiên.
  #Nếu giá trị lớn hơn giá trị của mảng thứ hai, chúng ta biết mảng thứ hai không phải là tập con của mảng thứ nhất
  arr1=arr1.sort  ##sắp xếp lại mảng 1
  arr2=arr2.sort  ##sắp xếp lại mảng 2
  
       while (i < n && j < m)
         #Đặt hai con trỏ j và i hoặc arr1 [] và arr2 [] tương ứng.
  if (arr1[j] < arr2[i])
                    j+=1
elsif (arr1[j] == arr2[i])
  i+=1
  j+=1
elsif (arr1[j] > arr2[i])
  return false
  end
       end
    if (i < n)
            return false
        else
            return true
    end
  end
if (isSubset(arr1, arr2, m, n))
  puts "mảng #{arr2} là mảng con của #{arr1}"
else
  puts "mảng #{arr2} KHÔNG phải là mảng con của #{arr1}"
  
end