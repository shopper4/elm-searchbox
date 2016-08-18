module Rest exposing (..)

import Types exposing (..)
import Json.Decode exposing (Decoder, int, string, object3, list, (:=))
import Http
import Task
import String

url = "http://localhost:3000/features?q="

search term =
  if String.length term > 0
    then Task.perform Fail Success (Http.get (list featureDecoder) (url ++ term))
    else Cmd.none

featureDecoder =
  object3 Feature
    ("id" := int)
    ("title" := string)
    ("description" := string)
