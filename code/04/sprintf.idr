data Format = Number Format
            | Str Format
            | Lit String Format
            | End

SPrintfType : Format -> Type
SPrintfType (Number fmt) = 
               Int -> SPrintfType fmt
SPrintfType (Str fmt) = 
               String -> SPrintfType fmt
SPrintfType (Lit str fmt) = 
               SPrintfType fmt
SPrintfType End = String


toFormat : (xs : List Char) -> Format
toFormat [] = End
toFormat ('%' :: 'd' :: chars) = 
              Number (toFormat chars)
toFormat ('%' :: 's' :: chars) = 
              Str (toFormat chars)
toFormat ('%' :: chars) = 
              Lit "%" (toFormat chars)
toFormat (c :: chars) = 
  case toFormat chars of
    Lit lit chars' => Lit (strCons c lit) chars'
    fmt => Lit (cast c) fmt

sprintfFmt : (fmt : Format) -> (acc : String) 
                            -> SPrintfType fmt
sprintfFmt (Number fmt) acc = 
           \i => sprintfFmt fmt (acc ++ show i)
sprintfFmt (Str fmt) acc = 
           \str => sprintfFmt fmt (acc ++ str)
sprintfFmt (Lit lit fmt) acc = 
           sprintfFmt fmt (acc ++ lit)
sprintfFmt End acc = acc


sprintf : (fmt : String) -> 
          SPrintfType (toFormat (unpack fmt))
sprintf fmt = sprintfFmt _ ""

main : IO ()
main = do
  s <- getLine
  putStrLn (sprintf "%s = %d" s 42)
