module Calculator

  def self.fix_int(a)
    (a % 1)== 0 ? a.to_i : a
  end

  def self.get_operator(a)
    case a
      when 'sum'
        '+'
      when 'subtr'
        '-'
      when 'div'
        '/'
      else
        a
    end
  end

  def self.sum(a, b)
    fix_int(a.to_f + b.to_f)
  end

  def self.subtr(a, b)
    fix_int(a.to_f - b.to_f)
  end

  def self.div(a, b)
    fix_int(a.to_f / b.to_f)
  end

  def self.sqrt(a)
    fix_int(Math.sqrt(a.to_f))
  end

  def self.sin(a)
    fix_int(Math.sin(a.to_f))
  end

  def self.cos(a)
    fix_int(Math.cos(a.to_f))
  end
  
end