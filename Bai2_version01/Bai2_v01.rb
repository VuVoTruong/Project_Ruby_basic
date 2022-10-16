require 'csv'
require 'benchmark'
require 'faker'
require 'date'
require 'csv'
require 'rubocop-faker' 
require 'active_record'
require 'securerandom'
require 'pg'

#hàm tính bộ nhớ sử dụng lúc tạo file
def print_memory_usage
  memory_before = "ps -o rss= -p #{Process.pid}".to_i
  yield
  memory_after = "ps -o rss= -p #{Process.pid}".to_i

  puts "Memory: #{((memory_after - memory_before) / 1024.0).round(2)} MB"
end

#hàm tính thời gian lúc tạo file
def print_time_spent
  time = Benchmark.realtime do
    yield
  end

  puts "Time to create file: #{time.round(2)}"
end


headers = ['Name',"Email","Phone","Address","Date_of_birth","Profile"] #khai báo header của file csv là các thuộc tính name email ......
print_memory_usage do
  print_time_spent do
    CSV.open('data.csv', 'w', write_headers: true, headers: headers) do |csv|
      500000.times do |i| #lặp 500000 lần tạo 500000 line file csv
        arr=['Ho Chi Minh city','Ha Noi city','Da Nang city']
          address = arr.to_a.sample
          phone = SecureRandom.random_number(0...999999999)
          year=SecureRandom.random_number(1950..2020)
          month=SecureRandom.random_number(1..12)
          day=SecureRandom.random_number(1..30) 
        csv << ["Nguyen Van A #{i}","nguyenvana#{i}@gmail.com","0#{phone}","#{address}","#{day}/#{month}/#{year}",'Like TV 100", Some special charactor: \ / '  ]
      end
    end
  end
end


#hàm tính thời gian lúc tạo file
def print_time_spent_to_read
  time = Benchmark.realtime do
    yield
  end

  puts "Time to read file: #{time.round(2)}"
end

#đọc file csv
print_time_spent_to_read do
s = File.read('data.csv')
#puts s 
  end

# hàm tính thời gian import
def print_time_spent_to_import
  time = Benchmark.realtime do
    yield
  end

  puts "Time to import: #{time.round(2)}"
end


#khai báo conn sử dụng PG để config kết nối với postgres
conn = PG.connect(
  dbname: "importdb",
  port: 5432,
  user: "postgres",
  password: "phibui"
)

#Tải một hàng mỗi câu lệnh chèn với các tham số
#Tải dữ liệu từng hàng một bằng cách sử dụng các truy vấn được tham số hóa của pg gem.(cách này khá lâu và không tối ưu để làm việc với các file data lớn) 

print_time_spent_to_import do
CSV.foreach('data.csv', headers: true) do |row|
  data = {#khai báo từng field tương ứng với từng row 
    name: row[0],
    email: row[1],
    phone: row[2],
    address: row[3],
    date_of_birth: row[4],
    profile: row[5]
          } 

#mở connect và thực hiện truy vấn
conn.exec_params(
    "insert into users(name, email, phone, address, date_of_birth, profile)
    VALUES ('#{row[0]}', '#{row[1]}', '#{row[2]}', '#{row[3]}', '#{row[4]}', '#{row[5]}');"
)
end
end
puts "kết thúc chương trình #{Time.now}"

#sau khi chạy thì thời gian tạo file là 4.67s , thời gian đọc file là 0.07s và thời gian import là 89.14s 

# A thấy bài tập e đã làm đúng yêu cầu. A thì có vài góp ý
# 1. Tất cả các hàm thực thi e đang viết chung trong 1 file -> có thể gây khó khăn khi e mở rộng chương trình.
# VD: file kết nối postgres, file để import data, file để đọc file,... như vậy sau này e dễ dàng chỉnh sửa hơn
# 2. Khi viết raw sql e cần nhất quán, vd: insert into users e đang viết thường nhưng chữ VALUES e viết hoa
# 3. A thấy e đang đọc từng dòng và insert từng dòng vào db -> điều này dẫn tới sẽ có tới 500k câu insert được thực hiện
# -> sẽ nhanh hơn nếu e build câu query đó thành 1 câu insert duy nhất và theo sau là values của nó
# 4. Với lượng data lớn, e nên chia batch ra để xử lý, vd: xử lý batch 10k 1 lần, tránh trường hợp fetch lên trên RAM để xử lý, nếu data lớn và nhiều 
# có thể die luôn cái máy
# 5. 500000 e có thể khai báo là hằng số và có format cho dễ đọc 500_000 -> để có thay đổi e chỉ cần thay đổi hằng số là xong, kg cần scan code để sửa đổi
