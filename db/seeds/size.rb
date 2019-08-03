clothes_child_array = ['XXS以下', 'XS(SS)', 'S', 'M', 'L', 'XL(LL)', '2XL(3L)', '3XL(4L)', '4XL(5L以上)', 'FREE SIZE']

parent = Size.create(size: 'clothes_size')
clothes_child_array.each_with_index do |child, i|
  child = parent.children.create(size: child)
end

ladies_shoes_array = ['20cm以下', '20.5cm', '21cm', '21.5cm', '22cm', '22.5cm', '23cm', '23.5cm', '24cm', '24.5cm', '25cm', '25.5cm', '26cm', '26.5cm', '27cm', '27.5cm以上']

parent = Size.create(size: 'ladies_shoes')
ladies_shoes_array.each_with_index do |child, i|
  child = parent.children.create(size: child)
end

mens_shoes_array = ['23.5cm以下', '24cm', '24.5cm', '25cm', '25.5cm', '26cm', '26.5cm', '27cm', '27.5cm', '28cm', '28.5cm', '29cm', '29.5cm', '30cm', '30.5cm', '31cm以上']

parent = Size.create(size: 'mens_shoes')
mens_shoes_array.each_with_index do |child, i|
  child = parent.children.create(size: child)
end