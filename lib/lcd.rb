class Lcd

  @@digits = [
      [:horizontal, :both_vertical, :none, :both_vertical, :horizontal],
      [:none, :right_vertical, :none, :right_vertical, :none],
      [:horizontal, :right_vertical, :horizontal, :left_vertical, :horizontal],
      [:horizontal, :right_vertical, :horizontal, :right_vertical, :horizontal],
      [:none, :both_vertical, :horizontal, :right_vertical, :none],
      [:horizontal, :left_vertical, :horizontal, :right_vertical, :horizontal],
      [:horizontal, :left_vertical, :horizontal, :both_vertical, :horizontal],
      [:horizontal, :right_vertical, :none, :right_vertical, :none],
      [:horizontal, :both_vertical, :horizontal, :both_vertical, :horizontal],
      [:horizontal, :both_vertical, :horizontal, :right_vertical, :horizontal]
  ]

  def create_line_output(size)
    {
        :horizontal => ' ' + '-' * size + ' ',
        :left_vertical => '|' + ' ' * size + ' ',
        :right_vertical => ' ' + ' ' * size + '|',
        :both_vertical => '|' + ' ' * size + '|',
        :none => ' ' + ' ' * size + ' '
    }
  end

  def print_line(index, line_output, lines, num)
    if (index == 0)
      return line_output[@@digits[num][0]] + " "
    end
    if (index > 0 && index < (lines / 2))
      return line_output[@@digits[num][1]] + " "
    end
    if (index == (lines / 2))
      return line_output[@@digits[num][2]] + " "
    end
    if (index > (lines / 2) && index < (lines - 1))
      return line_output[@@digits[num][3]] + " "
    end
    line_output[@@digits[num][4]] + " "
  end

  def print(number, size = 1)
    numbers = number.to_s.chars.collect { |c| c.to_i }
    line_output = create_line_output(size)
    lines = size * 2 + 3

    result=""
    lines.times do |index|
      result << numbers.inject("") { |line_result, num|
        line_result << print_line(index, line_output, lines, num)
      }
      result << "\n"
    end

    puts result
    result
  end
end