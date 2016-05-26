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

  def my_all?(&prc)
    self.my_each do |el|
      return false if prc.call(el) == false
    end
    true
  end

  def my_any?(&prc)
    self.my_each do |el|
      return true if prc.call(el) == true
    end
    false
  end
end
