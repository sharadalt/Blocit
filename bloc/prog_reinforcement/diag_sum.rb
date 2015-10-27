def diagonalSum(matrix)
    sum = 0
    matrix.each_with_index do |row, i|
      row.each_with_index do |cell, j|
	 if i == j
           sum += matrix[i][j]
         end
      end
    end
    puts sum
    sum
end

matrix = [
	   [1, 2, 3],
           [4, 5, 6],
           [7, 8, 9],
]

diagonalSum(matrix)
