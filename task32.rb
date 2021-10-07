products_arr = []
arr = (1..9).to_a


(1..9999).each do |multiplicand|
  (1..9999).each do |multiplier|
    arr_m=[]
    product = multiplicand * multiplier

    arr_m << multiplicand.digits
    arr_m << multiplier.digits
    arr_m << product.digits
    arr_m.flatten! # двумерка в одномерку

    break if (arr_m.size > 10)
    products_arr << product if (arr_m.uniq.sort == arr && arr_m.uniq.size == arr_m.size)
  end
end

p products_arr.uniq.sum # uniq для уникальности элементов, перемножающихся дважды
