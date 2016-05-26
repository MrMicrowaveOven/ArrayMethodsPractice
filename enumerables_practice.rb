class Array

  def my_each(&prc)
    self.length.times do |i|
      prc.call(self[i])
    end
  end

  def my_select(&prc)
    output = []
    self.my_each do |el|
      output << el if prc.call(el)
    end
    output
  end

  def my_reject(&prc)
    self - self.my_select(&prc)
  end
end
