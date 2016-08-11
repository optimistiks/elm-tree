module Tree exposing ( Model, Msg, init, update )

type alias Model a =
    {
        root: Node a
    }

type alias Node a =
    {
        data : a,
        parent : Maybe (NodeParent a),
        children: NodeChildren a
    }

type NodeParent a = NodeParent (Node a)
type NodeChildren a = NodeChildren (List (Node a))

init : a -> Model a
init data =
    {
        root = Node data Nothing (NodeChildren [])
    }

-- update

type Msg a =
    Add (Node a) (Node a) | Remove (Node a)

update : Msg a -> Model a -> Model a
update msg model =
    case msg of
        Add newNode parentNode -> model
        Remove node -> model
