class Number
  CHARS = ('0'..'9').to_a + ('a'..'f').to_a

  def Number.bin2dec(binary)
    binary.reverse.split('').each_with_index.map{|c,i| (c.to_i) * (2**i)}.reduce(:+)
  end

  def Number.dec2bin(number, padding = 4)
    binary = []

    Math.log2(number).ceil.times do
      quotient = number / 2
      binary.unshift (number % 2).to_s
      number = quotient
    end

    Number.padding(binary, padding).join
  end

  def Number.bin2hex(binary)
    hexes = []
    binary = binary.split('')
    (binary.count / 4.0).ceil.times{hexes.unshift CHARS[Number.bin2dec(binary.pop(4).join)]}
    hexes.join
  end

  def Number.hex2bin(hexadecimal)
    hexadecimal.each_char.map{|c| Number.dec2bin(CHARS.index(c))}.join
  end

  def Number.padding(array, padding)
    if (array.count % padding) != 0
      missing = padding - (array.count % padding)
      missing.times { array.unshift('0') }
    end

    array
  end
end
