module State exposing (..)

import Types exposing (..)
import Rest
import Array
import String

init =
  (Model "" Nothing []) ! []


update msg model =
  case msg of
    SearchText text ->
      let
        results' =
          if String.length text > 0
            then model.searchResults
            else Just []
      in
        { model
          | searchText = text
          , searchResults = results'
        } ! [Rest.search text]

    Success features ->
      { model | searchResults = Just features } ! []

    Fail err ->
      (Debug.log (toString err) model) ! []

    Select id ->
      let
        -- Horribly inefficient but just to get it working quick
        selectedIds' =
          if List.length (List.filter (\x -> x == id) model.selectedIds) > 0
            then List.filter (\x -> x /= id) model.selectedIds
            else id :: model.selectedIds
      in
        { model | selectedIds = selectedIds' } ! []


subscriptions model =
  Sub.none
