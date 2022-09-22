begin
  puts 'Nhập số phần tử mảng n = (n<99 nhé ). Nhập -1 để dừng chương trình'
  while n = Integer(gets.chomp)#n chỉ được nhận giá trị thuộc đối tượng Interger(kiểu số) , còn kiểu chữ hay kí tự đặc biệt sẽ ko nhận
    case n
    when -1
      puts "Chương trình bị dừng"
      break
    end
    if (n < 100 && n > 0)
      break
    end
    puts 'Vui long nhap so nguyen <=99'
  end
rescue
  puts 'Vui long nhap so nguyen <=99'
  retry#đặt retry vào trong rescue block sẽ giúp cho chương trình chạy lại đoạn code  "begin" đến "rescue"
end


puts "Nhập các phần tử của mảng"
arr=Array.new(n)#khai báo mới 1 mảng arr có n phần tử 


#duyệt mảng và in ra các phẩn tử của mảng
for i in (0..n-1)#vì mảng có n phần tử nên độ ô nhớ cuối cùng sẽ là n-1
  begin
  puts "nhap phan tu thu #{[i]} cua mang"
  while arr[i]=Integer(gets.chomp)#mảng chỉ nhận được số tự nhiên (theo yêu cầu đề bài)
    if (arr[i] >= 0)
          break
        end
        puts 'Vui lòng nhập số tự nhiên '
      end
    rescue
      puts 'Vui lòng nhập số tự nhiên'
      retry
  end
end

puts "cac phan tu cua mang la #{arr}"

#TÌM GIÁ TRỊ NHỎ NHẤT CỦA MẢNG

#cách1
minimum = arr[0] #khai báo 1 biến min bằng phần tử đầu tiên trong mảng
for i in (0...n-1) do  #duyệt mảng từ 0 đến độ dài của mảng
    if minimum >= arr[i] # nếu min > giá trị thứ i trong mảng thì sẽ cho min = arr[i]
        minimum = arr[i] #duyệt đến hết mảng và tìm dc min
end
end
puts "c1: gia tri nho nhat cua mang la #{minimum}"

#cách2
##sử dụng phương thức tìm min có sẵn của Array
puts "c2 : gia tri nho nhat cua mang la #{arr.min}"


#cách 3 : tạo mảng mới bằng cách sort mảng cũ theo thứ tự nhỏ đến lớn
arr1 = arr.sort # mảng mới sau khi được sắp xếp
puts "mảng sau khi được sắp xếp là #{arr1}"
#xuất ra giá trị nhỏ nhất là phần tử đầu tiên của mảng 
puts "c3 : giá trị nhỏ nhất của mảng là #{arr1[0]}"
puts arr.length