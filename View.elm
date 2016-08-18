module View exposing (..)

import Types exposing (..)
import Html exposing (..)
import Html.Events exposing (onInput, onCheck)
import Html.Attributes exposing (..)
import String

view model =
  let
    listItems =
      List.map (\x -> result model.selectedIds x) (Maybe.withDefault [] model.searchResults)
  in
    div []
      [ input
          [ type' "text"
          , onInput SearchText
          , style
              [ ("width", "450px")
              , ("height", "30px")
              , ("fontSize", "20px")
              , ("marginLeft", "20px")
              , ("marginTop", "20px")
              ]
          ]
          []
      , ul
          [ style
              [ ("width", "450px")
              , ("border", "solid 1px rgb(200, 200, 200)")
              , ("paddingLeft", "0px")
              , ("marginLeft", "20px")
              , ("marginTop", "0px")
              ]
          ]
          listItems
      , p []
          [ text <| toString model.selectedIds
          ]
      ]


result selectedIds feature =
  let
    isChecked =
      (List.filter (\x -> x == feature.id) selectedIds |> List.length) > 0

    desc =
      if String.length feature.description > 25
        then (String.left 25 feature.description) ++ "..."
        else feature.description
  in
    li
      [ style
          [ ("listStyle", "none")
          ]
      ]
      [ label
          [ style
              [ ("fontSize", "20px")
              , ("color", "rgb(83, 83, 83)")
              ]
          ]
          [ input
              [ type' "checkbox"
              , onCheck (\_ -> Select feature.id)
              , checked isChecked
              ]
              []
          , span [] [ text <| feature.title ++ ": " ++ desc ]
          ]
      ]
