type t
type express_module
external express : unit -> t = "express" [@@bs.module]
external use : t -> express_module -> unit = "" [@@bs.send]
external cors : unit -> express_module = "cors" [@@bs.module]

let init ?(useCors=true) () =
  let app = express () in
  if useCors then
    use app (cors());
  app

type request = private {
  body:    string Js.Dict.t;
  headers: string Js.Dict.t;
  params:  string Js.Dict.t;
  query:   string Js.Dict.t
} [@@bs.deriving abstract]

type response
type handler = request -> response -> unit

external get  : t -> string -> handler -> unit = "" [@@bs.send]
external post : t -> string -> handler -> unit = "" [@@bs.send]
external put  : t -> string -> handler -> unit = "" [@@bs.send]
external status : response -> int -> response = "" [@@bs.send]
external end_ : response -> unit = "end" [@@bs.send]
