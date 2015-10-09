-- solution using list comprehension

sum [x | x <- [0..1000], x < 1000, mod x 3 == 0 || mod x 5 == 0]
