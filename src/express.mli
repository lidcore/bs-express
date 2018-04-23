type t

type request

val body    : request -> string Js.Dict.t
val headers : request -> string Js.Dict.t
val params  : request -> string Js.Dict.t
val query   : request -> string Js.Dict.t

type response

val status : response -> int -> response
val end_   : response -> unit

type handler = request -> response -> unit

val init : ?useCors:bool -> unit -> t
val get  : t -> string -> handler -> unit
val post : t -> string -> handler -> unit
val put  : t -> string -> handler -> unit
