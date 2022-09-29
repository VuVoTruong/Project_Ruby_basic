# 12. Khởi tạo một mảng gồm n (n≤ 99) số tự nhiên sau đó
# hiển thị các dãy con tăng trong mảng.

begin
  puts 'Nhap so phan tu mang (so nguyen <=99) n = '
  while n = Integer(gets.chomp)
    if (n < 100 && n > 0)
      break
    end
    puts 'Vui lòng nhập số nguyên bé hơn 99 '
  end
rescue
  puts 'Vui lòng nhập số nguyên bé hơn 99 '
  retry #đặt retry vào trong rescue block sẽ giúp cho chương trình chạy lại đoạn code  "begin" đến "rescue"
end

arr1 = Array.new(n) {rand(1...9)}  # khai báo 1 mảng mới và random các phần tử trong mảng từ 1 đến 9 

arr2 = Array.new # mảng 2 sẽ lưu các biến index là chỉ số bắt đầu của các mảng con tăng liên tiếp trong mảng chính arr1
arr3 = Array.new # mảng 3 sẽ lưu các số lượng phần tử của từng dãy con tăng liên tiếp

puts "Mảng được khởi tạo ngẫu nhiên là #{arr1}"
#hoặc có thể in mảng bằng mothod each_with_index
#arr1.each_with_index {|val, index| puts "[#{index}] = #{val}"}
#Method each_with_index cho phép truy cập vào từng phần tử trong mảng + cung cấp chỉ mục của phần tử hiện tại.


# Duyet mang input, luu index cua cac day con vao mang startIndexArr
# tuong ung luu so luong phan tu cac day con vao mang amountArr

index = 1#biến index :  chỉ số bắt đầu của dãy con liên tiếp 
arr2.push(0)#method push thêm chỉ số 0 vào mảng arr2( mảng arr2 sẽ có phần tử đầu tiên là 0 vì index đầu tiên mảng arr1 là a[0])
loop do
  count = 1 #biến count đếm số lượng phần tử tăng liên tiếp của dãy hiện tại , nó lớn hơn kỉ lục thì dãy con =1 , 
  
  while (arr1[index].to_i >= arr1[index - 1].to_i) #nếu giá trị vị trí A[i] lớn hơn giá trị A[i-1]
    count += 1 #thõa điều kiện thì biến count sẽ tự động tăng thêm 1
    if (index.to_i >= arr1.length.to_i) #nếu giá trị của vị trí index duyệt đến lúc lớn hơn độ dài mảng 1 thì dừng lặp
      break
    else
      index += 1
    end
    
  end
  
  if (index.to_i < arr1.length.to_i)
    arr2.push(index)#thêm giá trị vị trí index là chỉ số bắt đầu của mảng mới vào mảng arr2
  end
  
  arr3.push(count)
  index += 1
  if (index > arr1.length)
    break
  end
  
end
puts "mảng thứ 2 chứa các giá trị index đầu tiên của mảng con tăng là : #{arr2}"
puts "mảng thứ 3 chứa số lượng phần tử của mảng con tăng là :  #{arr3}"

arr3.each_with_index do |val, index| 
  printIndex = arr2[index]
  puts "+ MẢNG CON THỨ  #{index + 1 } : "
  (0..val-1).each do 
    puts arr1[printIndex]
    printIndex += 1
    end
end
puts 'Kết thúc chương trình'