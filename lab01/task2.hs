main :: IO ()
main =  do
print(head $ tail a)
print(head $ tail $ head b)
print(head $ tail $ head $ tail c)
print(head $ head $ tail $ d)
where a = ['a', 'b', 'c']
      b = [['a', 'b'], ['c','d']]
      c = [['a', 'c', 'd'], ['a','b']]
      d = [['a','d'], ['b', 'c']]
