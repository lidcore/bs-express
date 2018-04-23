type t

type request = private {
  body:    string Js.Dict.t;
  headers: string Js.Dict.t;
  params:  string Js.Dict.t;
  query:   string Js.Dict.t
} [@@bs.deriving abstract]

type response

val status : response -> int -> response
val end_   : response -> unit

type handler = request -> response -> unit

val init : ?useCors:bool -> unit -> t
val get  : t -> string -> handler -> unit
val post : t -> string -> handler -> unit
val put  : t -> string -> handler -> unit
