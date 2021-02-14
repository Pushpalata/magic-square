class MagicSquare
  @magic_arr = []
  
  def initialize(magic_number = 3)
    @magic_number = magic_number
    @magic_arr = Array.new(@magic_number, 0) { Array.new(@magic_number, 0) }
    @row = @magic_number/2
    @col = @magic_number-1
    @num = 1
    @magic_constant = ((@magic_number*((@magic_number*@magic_number)+1))/2).to_s
    generate_magic_square
  end

  def generate_magic_square
    while @num <= (@magic_number*@magic_number) do
      if @row == -1 && @col == @magic_number 
        @row = 0
        @col = @magic_number - 2
      else
        @col = 0 if @col == @magic_number 
        @row = @magic_number - 1 if  @row < 0  
      end
      unless @magic_arr[@row][@col] == 0
        @col -= 2
        @row += 1
        next
      else
        @magic_arr[@row][@col] = @num.to_s.rjust(@magic_constant.length, "0")
        @num += 1
      end
      @row -= 1
      @col += 1
    end
  end

  def display_magic_square
    puts "Magic Constant : " + @magic_constant
    @magic_arr.each do |magic_row|
      puts " | " + magic_row.join(" | ") + " | "
    end
    ""
  end
end

class UserInput
  def get_inputs
    puts "\nGenerate Odd Magic Square of size: \t"
    @square_size = gets.chomp
    if valid_input
      MagicSquare.new(@square_size).display_magic_square
    end
  end

  def valid_input
    @square_size = @square_size.to_i
    if @square_size <= 0
      puts "\nPlease enter valid odd natural number."
      false
    elsif (@square_size%2) == 0
      puts "\nPlease enter odd number."
      false
    else
      true
    end
  end
end

puts UserInput.new.get_inputs