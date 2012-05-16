require "digits"

class Lcd

  def display(number, size = 1, rotate = 0)
    @numbers = number.to_s.chars.collect { |c| c.to_i }
    @line_code = create_line_code(size, rotate)
    @lines = size * 2 + 3

    arrays=[]
    @lines.times do |index|
      arrays << generate_one_line(index)
    end

    arrays = rotate(arrays, rotate)

    output = print_arrays(arrays)

    puts output
    output
  end

  private

  def create_line_code(size, rotate = 0)
    space = ' '
    horizontal_dash = rotate % 2 == 0 ? '-' : '|'
    vertical_dash = rotate % 2 == 0 ? '|' : '-'
    {
        :horizontal => ([horizontal_dash] * size).unshift(space).push(space),
        :left_vertical => ([space] * size).unshift(vertical_dash).push(space),
        :right_vertical => ([space] * size).unshift(space).push(vertical_dash),
        :both_vertical => ([space] * size).unshift(vertical_dash).push(vertical_dash),
        :none => [space] * (size+2)
    }
  end

  def generate_one_line(index)
    @numbers.inject([]) { |line_result, num|
      line_result += generate_line_for_one_number(index, num)
      line_result
    }
  end

  def rotate(arrays, rotate)
    (rotate % 4).times { arrays = arrays.reverse.transpose }
    arrays
  end

  def print_arrays(arrays)
    arrays.inject('') { |result, inner| result += (inner.join('') + "\n"); result }
  end

  def generate_line_for_one_number(line_number,num)
    if (is_head(line_number))
      return @line_code[Digits::CODE[num][0]].clone << ' '
    end
    if (is_upper_body(line_number))
      return @line_code[Digits::CODE[num][1]].clone << ' '
    end
    if (is_middle_body(line_number))
      return @line_code[Digits::CODE[num][2]].clone << ' '
    end
    if (is_lower_body(line_number))
      return @line_code[Digits::CODE[num][3]].clone << ' '
    end
    @line_code[Digits::CODE[num][4]].clone << ' '
  end

  def is_head(line_number)
    line_number == 0
  end

  def is_upper_body(line_number)
    line_number > 0 && line_number < (@lines / 2)
  end

  def is_middle_body(line_number)
    line_number == (@lines / 2)
  end

  def is_lower_body(line_number)
    line_number > (@lines / 2) && line_number < (@lines - 1)
  end
end