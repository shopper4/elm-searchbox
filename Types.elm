module Types exposing (..)

import Http

type Msg
  = SearchText String
  | Success (List Feature)
  | Fail Http.Error
  | Select Int

type alias Model =
  { searchText : String
  , searchResults : Maybe (List Feature)
  , selectedIds : List Int
  }

type alias Feature =
  { id : Int
  , title : String
  , description : String
  }
