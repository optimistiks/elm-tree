module Main exposing (..)
import Tree
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Html.App as App

type alias Model =
    {
        tree : Tree.Model String
    }

init : String -> Model
init data =
    {
        tree = Tree.init data
    }

type alias Msg = Tree.Msg String

update : Msg -> Model -> Model
update msg model = { model | tree = Tree.update msg model.tree }

view : Model -> Html Msg
view model =
  div
    []
    [
        p [] [ text (toString model.tree) ]
    ]

main : Program Never
main = App.beginnerProgram
    {
        model = init "first line",
        view = view,
        update = update
    }
