type t

type request

val body        : request -> string Js.Dict.t
val headers     : request -> string Js.Dict.t
val params      : request -> string Js.Dict.t
val query       : request -> string Js.Dict.t
val originalUrl : request -> string

type response

val end_      : response -> unit
val json      : response -> 'a Js.t -> unit
val location  : response -> string -> response
val pipe      : LidcoreBsNode.Stream.readable -> response -> unit
val send      : response -> string -> response
val status    : response -> int -> response
val writeHead : response -> ?headers:(string Js.Dict.t) -> int -> unit

type handler = request -> response -> unit

val init : ?useCors:bool -> unit -> t
val listen : t -> int -> unit

type middleware

val use : t -> middleware -> unit

module type Routes_t = sig
  type router
  val get  : router -> string -> handler -> unit
  val post : router -> string -> handler -> unit
  val put  : router -> string -> handler -> unit
end

include Routes_t with type router := t

module Router : sig
  include Routes_t
  val init : t -> router
end
