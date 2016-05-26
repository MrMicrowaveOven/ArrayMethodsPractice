class Array
  def my_flatten
    output = []
    self.each do |el|
      if el.is_a?(Array)
        el.my_flatten.each do |inel|
          output << inel
        end
      else
        output << el
      end
    end
    output
  end

  def my_zip(*arrays)
    return self if arrays.length == 0
    output = []
    self.each_with_index do |el, index|
      output[index] = [el]
      arrays.each do |array|
        output[index] << array[index]
      end
    end
    output
  end

  def my_rotate(num = 1)
    num = num % length
    output = self
    num.times do
      output << output.shift
    end
    output
  end

  def my_join(seperator = "")
    output = ""
    self[0...-1].each do |el|
      output += el.to_s
      output += seperator.to_s
    end
    output + self[-1].to_s
  end

  def my_reverse
    output = []
    self.each do |el|
      output.unshift(el)
    end
    output
  end
end
