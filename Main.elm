module Main exposing (..)

import Html.App exposing (program)
import State exposing (init, update, subscriptions)
import View exposing (view)

main =
  program
   { init = init
   , update = update
   , view = view
   , subscriptions = subscriptions
   }
