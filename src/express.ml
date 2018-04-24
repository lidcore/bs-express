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

external status : response -> int -> response = "" [@@bs.send]
external json : response -> 'a Js.t -> response = "" [@@bs.send]
external end_ : response -> unit = "end" [@@bs.send]

type handler = request -> response -> unit

module type Routes_t = sig
  type router
  val get  : router -> string -> handler -> unit
  val post : router -> string -> handler -> unit
  val put  : router -> string -> handler -> unit
end

module type RoutesConfig_t = sig
  type router
end

module Routes(Config:RoutesConfig_t) = struct
  type router = Config.router
  external get  : router -> string -> handler -> unit = "" [@@bs.send]
  external post : router -> string -> handler -> unit = "" [@@bs.send]
  external put  : router -> string -> handler -> unit = "" [@@bs.send]
end

include Routes(struct
  type router = t
end)

module Router = struct
  include Routes(struct
    type router
  end)
  external init : t -> router = "Router" [@@bs.send]
end
