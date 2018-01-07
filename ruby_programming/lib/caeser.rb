class String

  def shift_char(n)
    return (self.ord - 97 + n) % 26 + 97 if (('a'..'z').include?(self))
    return (self.ord - 65 + n) % 26 + 65 if (('A'..'Z').include?(self))
    self
  end

end

def caeser(string, n)
  return string.split('').map {|c| c.shift_char(n) }.map(&:chr).join('')
end

caeser('hello', 1)        # ifmmp
caeser('world', 1)        # xpsme
caeser('hello world', 1)  # ifmmp xpsme
