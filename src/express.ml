type t
type middleware
external express : unit -> t = "express" [@@bs.module]
external use : t -> middleware -> unit = "" [@@bs.send]
external cors : unit -> middleware = "cors" [@@bs.module]

let init ?(useCors=true) () =
  let app = express () in
  if useCors then
    use app (cors());
  app

external listen : t -> int -> unit = "" [@@bs.send]

module Request = struct
  type t = {
    body:        string Js.Dict.t;
    headers:     string Js.Dict.t;
    params:      string Js.Dict.t;
    query:       string Js.Dict.t;
    originalUrl: string
  } [@@bs.deriving abstract]
end

module Response = struct
  type t
  external status : t -> int -> t = "" [@@bs.send]
  external json : t -> 'a Js.t -> t  = "" [@@bs.send]
  external writeHead : t -> int -> string Js.Dict.t Js.null_undefined -> unit = "" [@@bs.send]
  external pipe : LidcoreBsNode.Stream.readable -> t -> unit = "" [@@bs.send]
  let pipe i o =
    pipe i o;
    o
  external send : t -> string -> t = "" [@@bs.send]
  external end_ : t -> unit = "end" [@@bs.send]
  external location : t -> string -> t = "" [@@bs.send]
  external get : t -> string -> string = "" [@@bs.send]
  external set : t -> string -> string -> t = "" [@@bs.send]
  external headers : t -> string Js.Dict.t -> t = "set" [@@bs.send]
  let writeHead resp ?headers code =
    writeHead resp code (Js.Null_undefined.fromOption headers)
end

type handler = Request.t -> Response.t -> unit

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
