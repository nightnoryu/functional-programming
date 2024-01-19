main :: IO ()
main =  do
  print(snd $ fst a)
  where a = (( 1, 'a'), "abc")
