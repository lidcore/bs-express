type t

module Request : sig
  type t
  val body        : t -> string Js.Dict.t
  val headers     : t -> string Js.Dict.t
  val params      : t -> string Js.Dict.t
  val query       : t -> string Js.Dict.t
  val originalUrl : t -> string
end

module Response : sig
  type t
  val end_      : t -> unit
  val get       : t -> string -> string
  val json      : t -> 'a Js.t -> t
  val location  : t -> string -> t
  val pipe      : LidcoreBsNode.Stream.readable -> t -> t
  val send      : t -> string -> t
  val set       : t -> string -> string -> t
  val headers   : t -> string Js.Dict.t -> t
  val status    : t -> int -> t
  val writeHead : t -> ?headers:(string Js.Dict.t) -> int -> unit
end

type handler = Request.t -> Response.t -> unit

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
