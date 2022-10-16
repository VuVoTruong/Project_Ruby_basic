arr=[3,5,-4,8,11,1,-1,6]
sum=10
n=arr.length()
puts "độ dài mảng là #{n}"
puts "cac phan tu cua mang la #{arr}"


hash = {} #tạo 1 hash rỗng
  #convert mảng arr thành hash
arr.each do |i|
hash[i] = i+10 ##chuyển các phần tử trong mảng thành các key trong hash
end
puts "mảng sau khi chuyển đổi thành hash là #{hash}"

#(hàm checksum sẽ có 4 đối số truyền vào gồm mảng arr , số phần tử n, tổng sum cho trước và hash được convert từ mảng)
def checksum(arr, n, sum,hash)
   for i in 0..n-1  #1 vòng lặp duyệt mảng
    temp = sum - arr[i]   #hiểu là a1+a2=sum =>a1=sum-a2 , a2 là các giá trị khi duyệt mảng còn a1 ta sẽ đưa vào hash thành giá trị cố định và kiểm tra 
    if temp==arr[i] then   #này sẽ check điều kiện nếu lỡ  a = 10 -a ( nhưng trong mảng chỉ có 1 phần tử a ) thì next
      next   
    end   
       if (hash.has_key?(temp)) #hàm kiểm tra xem trong hash có key nào = giá trị temp không 
       puts "gia tri la[ #{temp} , #{arr[i]}] " 
       return true    
       end
   end
   return false #chạy đến hết vòng lặp duyệt xong mảng mà nó không tìm được cái giá trị index trong arr nào thõa mãn thì nó trả về false
    
end

#gọi lại hàm checksum
  if checksum(arr, n, sum,hash) ##trả về true
  #puts "Sẽ có 2 giá trị thõa"
  else
          ##trả về false 
  puts "Không có giá trị nào thõa mãn cho tổng cho trước"
  end

  # Chương trình của e đúng yêu cầu chỉ sd 1 vòng lặp là ok rồi ah. A cũng có vài góp ý:
  # 1. hash = {} #tạo 1 hash rỗng -> mình chỉ nên ghi những comment cho những logic hoặc dụng ý khác khi khai báo, kg nên comment cho những dòng code 
  # mà ng khác đọc vào có thể hiểu liền
  # 2. arr là 1 mảng chứa nhiều phần tử nên là số nhiều
  # 3. if temp==arr[i] then -> dùng if else end chứ kg có then nhé e, và thường có dấu cách nhé (tem==arr[1])
  # 4. n=arr.length() -> biến chưa rõ nghĩa
