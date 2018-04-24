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
