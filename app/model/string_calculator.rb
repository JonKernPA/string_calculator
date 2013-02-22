class StringCalculator

  def self.add numbers
    delims = [" ", ",", "\r?\n"]
    delim = parse_delimiter numbers
    if delim
      delims << delim 
      numbers = numbers[3..(numbers.size-1)]
    end
    
    # Split on whatever... and save only numeric text
    num_array = numbers.split(/(#{delims.join('|')})/).select {|x| x =~ /\d+/}
    
    # Convert to integers
    num_array = num_array.map {|x| x.to_i}

    # Get pissy about negative numbers
    neg_nums = num_array.select {|x| x < 0}
    if neg_nums.size > 0
      raise NegativeNumbersNotAllowed, "Numbers must be between 0 and 1000. The following are rejected: #{neg_nums}"
    end

    # Criminy, I can't add numbers this large!
    big_nums = num_array.select {|x| x > 1000}
    if big_nums.size > 0
      raise LargeNumbersNotAllowed, "Numbers must be between 0 and 1000. The following are rejected: #{big_nums}"
    end
    
    # puts "/(#{delims.join('|')})/".inspect
    # puts "#{delims.inspect}; '#{numbers}' ==> #{num_array.inspect}"
    
    # Finally, do the darn addition!
    num_array.inject(0) {|sum,n| sum + n.to_i}    
  end

  def self.parse_delimiter string
    delimiter = nil
    if string.index('//')
      delimiter = string[2]
    end
    delimiter
  end
end

# A thing of beauty
class NegativeNumbersNotAllowed < ArgumentError; end
class LargeNumbersNotAllowed < ArgumentError; end
