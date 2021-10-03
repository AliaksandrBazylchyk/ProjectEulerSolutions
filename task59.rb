def find_key(text)
  key = ''
  (0...3).each do |p|
    symb = {}
    (90..120).each do |k|
      z = 0
      (p...text.size).step(3) do |i|
        z += 1 if ((text[i]) ^ k) == 32
      end
      l = { z => k.chr }
      symb.update(l)
    end
    a = symb.max
    key += a[1]
  end
  key
end

def encrypt(text, key)
  encrypter = key * 485
  s = ''
  i = 0
  text.size.times do
    s += (text[i] ^ (encrypter[i].ord)).chr
    i += 1
  end
  s
end

text = File.read('task59.txt').split(',').map(&:to_i)
key = find_key text
p encrypt(text, key).split('').map(&:ord).sum
