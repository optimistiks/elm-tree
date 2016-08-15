module Tree exposing ( Model, Msg (..), init, update )

type alias Model a =
    {
        root: Node a
    }

type alias Node a =
    {
        data : a,
        children: NodeChildren a
    }

type NodeChildren a = NodeChildren (List (Node a))

init : a -> Model a
init data =
    {
        root = Node data (NodeChildren [])
    }

-- update

type Msg a =
    Add a a | Remove a

unwrapChildren : NodeChildren a -> List (Node a)
unwrapChildren (NodeChildren children) = children

update : Msg a -> Model a -> Model a
update msg model =
    case msg of
        Add newData parentData -> { model | root = add newData parentData model.root }
        Remove data -> model

add : a -> a -> Node a -> Node a
add newData parentData node =
    if node.data == parentData
    then { node | children = NodeChildren (Node newData (NodeChildren []) :: unwrapChildren node.children) }
    else { node | children = NodeChildren (List.map (add newData parentData) (unwrapChildren node.children)) }
