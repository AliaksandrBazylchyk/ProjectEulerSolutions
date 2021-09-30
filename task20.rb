st = (1..100).inject(1, :*).to_s
p st.each_char.map(&:to_i).sum
