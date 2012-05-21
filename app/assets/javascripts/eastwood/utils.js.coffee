( @Eastwood ||= { } ).Utils =

  reduce : ( array, initial, iterator ) ->
    memo = initial
    memo = iterator memo, item for item in array
    memo

  keypath : ( path, object ) ->
    @reduce path.split( '.' ), object, ( memo, key ) -> memo[ key ]
