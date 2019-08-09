require 'matrix' # this lib was used only for generate test cases

def final?(m,pos)
  index_size = m.size - 1
  ( pos[0] == index_size && pos[1] == index_size ) ? true : false
end

def canMove?(m,pos,direction)
  index_size = m.size - 1
  can_move = false
  if direction == 'r' # move right (move colum)
   pos[1] + 1 <= index_size && m[pos[0]][pos[1] + 1 ] < 1 ?  can_move = true :  ''
  end
  if direction == 'd' # move down (move row)
    pos[0] + 1 <= index_size && m[pos[0] + 1][pos[1] ] < 1 ?  can_move = true :  ''
  end
  if direction == 'l' # move left (move column)
    pos[0] - 1 >= 0 && m[pos[0] - 1][pos[1] ] < 1 ?  can_move = true : ''
  end
  if direction == 'u' # move up (move row)
    pos[1] - 1 >= 0 && m[pos[0]][pos[1] - 1 ] < 1 ?  can_move = true :  '' 
  end
  can_move
end


def canArrive?(m,pos)
  puts "  "
  puts "current_state of matrix :  "
  puts " #{print_matrix(m)} "   
  if final?(m,pos)
    return true
  elsif m[0][0] == 1  # case first cell is '1'
    return false
  end 

  if canMove?(m,pos, 'r') || final?(m,pos)
    m[pos[0]][pos[1]] = 2 # mark with 2 to mark the path
    pos[1] += 1
    return canArrive?(m,pos)
  end
  if canMove?(m,pos, 'd') || final?(m,pos)
    m[pos[0]][pos[1]] = 2 # mark with 2 to mark the path
    pos[0] += 1
    return canArrive?(m,pos)
  end
  if canMove?(m,pos, 'l') || final?(m,pos)
    m[pos[0]][pos[1]] = 2 # mark with 2 to mark the path
    pos[1] -= 1
    return canArrive?(m,pos)
  end
  if canMove?(m,pos, 'u') || final?(m,pos)
    m[pos[0]][pos[1]] = 2 # mark with 2 to mark the path
    pos[0] -= 1
    return canArrive?(m,pos)
  else 
    return false
  end
end

def copy_matrix(m) # copy matrix to work with array multidimensional
  matrix = []
  i = 0
  while(i < m.column_count)
    matrix << m.row(i).to_a
    i += 1
  end 
  matrix
end

def print_matrix(m)
  m.each do |x|
    puts " #{x} "  
  end
  nil
end

i = 1
size = 0
while size == 0
  size = rand(10) + 1
end
puts " test case #{i}  random matrix #{size}x#{size}"  
m = Matrix.build(size, size){ |row, col| rand(2) } 
m = copy_matrix(m)
puts "Result : #{canArrive?(m,[0,0])}"

i += 1
puts " "
puts " "
size = 0
while size == 0
  size = rand(10) + 1
end
puts " test case #{i}  random matrix #{size}x#{size}"  
m = Matrix.build(size, size){ |row, col| rand(2) } 
m = copy_matrix(m)
puts "Result : #{canArrive?(m,[0,0])}"

i += 1
size = 0
while size == 0
  size = rand(10) + 1 
end
puts " "
puts " "
puts " test case #{i}  random matrix #{size}x#{size}"  
m = Matrix.build(size, size){ |row, col| rand(2) } 
m = copy_matrix(m)
puts "Result : #{canArrive?(m,[0,0])}"
i += 1
puts " "
puts " "
size = 0
while size == 0
  size = rand(10) +  1
end
puts " test case #{i}  random matrix #{size}x#{size}"  
m = Matrix.build(size, size){ |row, col| rand(2) } 
m = copy_matrix(m)
puts "Result : #{canArrive?(m,[0,0])}"
m = [ [1,1,1,1],
      [0,0,1,1],
      [1,0,1,1],
      [1,0,0,0]
]
i += 1
size = m.size
puts ""
puts "test case #{i}  matrix #{size}x#{size}"  
puts " "
puts " "
puts "Result : #{canArrive?(m,[0,0])}"
m = [ [0,1,1,1],
      [0,0,1,1],
      [1,0,1,1],
      [1,0,0,0]
]
i += 1
size = m.size
puts ""
puts "test case #{i}  matrix #{size}x#{size}"  
puts " "
puts " "
puts "Result : #{canArrive?(m,[0,0])}"
m = [ [0,0,0,1],
      [0,0,0,1],
      [1,0,0,0],
      [1,0,0,0]
]
i += 1
size = m.size
puts ""
puts "test case #{i}  matrix #{size}x#{size}"  
puts " "
puts " "
puts "Result : #{canArrive?(m,[0,0])}"
m = [ [0,0,0,1,0],
      [0,0,0,1,0],
      [1,0,0,0,0],
      [1,0,0,0,0],
      [1,0,0,0,0]
]
i += 1
size = m.size
puts ""
puts "test case #{i}  matrix #{size}x#{size}"  
puts " "
puts " "
puts "Result : #{canArrive?(m,[0,0])}"
i += 1
puts " "
puts " "
size = 0
while size == 0
  size = rand(90) + 1
end
puts ""
puts "test case #{i}  matrix #{size}x#{size}"  
m = Matrix.build(size, size){ |row, col| rand(2) } 
m = copy_matrix(m)
puts "Result : #{canArrive?(m,[0,0])}"
m = [ [0,0,0,0,0,0,1,0],
      [0,0,0,1,0,0,1,0],
      [1,0,0,0,0,0,1,0],
      [1,0,0,0,0,0,0,0],
      [1,0,0,0,0,0,1,0],
      [1,0,0,0,0,0,1,0],
      [1,0,0,0,0,0,1,0],
      [1,0,0,0,0,0,1,0]
]
i += 1
size = m.size
puts ""
puts "test case #{i}  matrix #{size}x#{size}"  
puts " "
puts " "
puts "Result : #{canArrive?(m,[0,0])}"
