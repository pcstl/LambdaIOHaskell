module LambdaIOOptional where

-- tipos de dados são declarados usando "data"
data Optional a = Empty | Full a

-- podemos casar padrões em tipos de dados customizados
hasValue :: Optional a -> Bool
hasValue Empty    = False
hasValue (Full a) = True

-- desafio: fazer uma função que pega o valor dentro de um opcional
-- getValue :: ?
-- getValue = ?

-- podemos operar sobre um opcional sem abrir ele
over :: (a -> b) -> Optional a -> Optional b
over _ Empty    = Empty
over f (Full x) = Full (f x)

-- os construtores de um tipo podem ser usados como funções
makeOptional :: a -> Optional a
makeOptional = Full

-- podemos aplicar uma função dentro de um opcional a um valor
applyOptional :: Optional (a -> b) -> Optional a -> Optional b

applyOptional (Full f) (Full x) = Full (f x)
applyOptional _        _        = Empty

-- podemos passar o valor de um opcional para uma função que retorna
-- um opcional
-- bindOptional :: (a -> Optional b) -> Optional a -> Optional b
-- bindOptional = ?
