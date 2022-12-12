# frozen_string_literal: true

# hepler
module ServHelper
  def set_params
    @str = params[:str_arr]
    @length = params[:length].to_i
    @arr = @str.split.map!(&:to_i)
    @res_arr = []
  end

  def power_of_5?(num)
    tmp = 0
    return false if num.zero?

    while tmp.zero?
      tmp = num % 5
      num /= 5
    end
    if tmp.eql?(1) && num.zero? then true
    else
      false
    end
  end

  def segments_of_powers
    buf = []
    @arr.each do |elem|
      if power_of_5?(elem) then buf << elem
      elsif !buf.length.zero?
        @res_arr << buf
        buf = []
      end
    end
    @res_arr << buf unless buf.length.zero?
    @res_arr
  end

  def largest_segment
    unless @res_arr.length.zero?
      @max_subarr = @res_arr[0]
      @res_arr.each do |elem|
        @max_subarr = elem if @max_subarr.length < elem.length
      end
    end
  end
end
