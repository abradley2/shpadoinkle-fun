{-# LANGUAGE OverloadedStrings #-}


module Main where


import           Shpadoinkle as S
import           Shpadoinkle.Backend.ParDiff
import           Shpadoinkle.Html as H
import           Data.Text



increment a value =
    value + 1

myString :: String
myString =
  "one" ++ "two"

view :: Int -> Html Int
view model =
  H.div
    []
    [ H.button 
      [ onClick 1
      ]
      [ S.text "One"
      ]
    , H.button
      [ onClick 0
      ]
      [ S.text "Zero"
      ]
    , H.h3
      []
      [ S.text $ pack . show $ model
      ]
    ]


main :: IO ()
main = runJSorWarp 8080 $
  simple runParDiff 10 (constly' . view) getBody
