
module Calculator
  def self.sum(a, b)
    a.to_f + b.to_f
  end

  def self.subtr(a, b)
    a.to_f - b.to_f
  end

  def self.div(a, b)
    a.to_f / b.to_f
  end

  def self.sqr(a)
    Math.sqrt(a.to_f)
  end

  def self.sin(a)
    Math.sin(a.to_f)
  end

  def self.cos(a)
    Math.cos(a.to_f)
  end
end