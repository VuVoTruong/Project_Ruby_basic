arr=[3,5,-4,8,11,1,-1,6]
sum=10
n=arr.length()
puts "độ dài mảng là #{n}"
puts "cac phan tu cua mang la #{arr}"


def chkPair(arr, n, sum)
    for i in 0..n-1 
        for j in i+1..n-1 
          sum1= arr[i]+arr[j]
            if (sum1 == sum)
              puts "2 giá trị cộng lại bằng  #{sum} là (#{arr[i]},#{arr[j]})"
                return true
            end
         end
    end
    #nếu duyệt hết 2 vòng lặp mà vẫn ko tìm thấy giá trị nào thõa thì trả về false
     return false
end

if chkPair(arr, n, sum)
#        puts "Valid pair exists"
    else
        puts "Không có giá trị nào thõa mãn"
end

