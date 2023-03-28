module Function.Handler

import Data.Hashmap as Hashmap
import Dinwiddy.Array as Array
import Data.Array (!)

value : Array.Array
value = x : [[1, 2, 3]]

export
handler : String -> String
handler key =
  let hm = Hashmap.insert "key" (value ! 0) Hashmap.empty
  case Hashmap.lookup key hm of
    Nothing => "Key not found"
    Just v => "Value for key: " ++ show v
