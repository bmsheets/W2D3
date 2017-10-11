def my_uniq(arr)
  uniq_hash = {}
  arr.each { |el| uniq_hash[el] = true }
  uniq_hash.keys
end

def two_sum(arr)
  result = []
  arr.length.times do |i|
    (i+1...arr.length).each do |j|
      result << [i, j] if arr[i] + arr[j] == 0
    end
  end
  result.sort
end

def transpose(matrix)
  result = Array.new(matrix.length) { Array.new(matrix.length) }
  matrix.length.times do |i|
    matrix.length.times do |j|
      result[i][j] = matrix[j][i]
    end
  end
  result
end

def pick_stocks(stocks)
  raise "Need more data" if stocks.length < 2
  max_difference = stocks.last - stocks.first
  result = [0, stocks.length - 1]
  stocks.length.times do |i|
    (i + 1...stocks.length).each do |j|
      difference = stocks[j] - stocks[i]
      if difference > max_difference
        max_difference = difference
        result = [i, j]
      end
    end
  end
  result
end
