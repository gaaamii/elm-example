module Main exposing (..)

import Html exposing (Html, button, div, h1, img, p, text)
import Html.Attributes exposing (src, type_)
import Html.Events exposing (onClick)


---- MODEL ----


type alias Model =
    { visible : Bool
    , body : String
    }


init : ( Model, Cmd Msg )
init =
    ( { visible = False, body = "Hello" }, Cmd.none )



---- UPDATE ----


type Msg
    = NoOp
    | DisplayMessage


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )

        DisplayMessage ->
            ( { model | visible = True }, Cmd.none )



---- VIEW ----


messagePartial model =
    if model.visible then
        p [] [ text model.body ]
    else
        p [] [ text "" ]


view : Model -> Html Msg
view model =
    div []
        [ img [ src "/logo.svg" ] []
        , h1 [] [ text "Your Elm App is working!" ]
        , button [ type_ "button", onClick DisplayMessage ] [ text "button" ]
        , messagePartial model
        ]



---- PROGRAM ----


main : Program Never Model Msg
main =
    Html.program
        { view = view
        , init = init
        , update = update
        , subscriptions = always Sub.none
        }
