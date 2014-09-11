import Data.List
import Data.Maybe
import Data.Char

{- 1a Parte: Esqueletos de Arbol -}

{- 
   Definimos lo que sera el esqueleto de un arbol, 
 es decir, un arbol sin etiquetas en los nodos, un arbol binario puro,
 considerando solo su estructura.

   Un esqueleto se define como un esqueleto vacio o como un punto (nodo)
 del que salen dos esqueletos de arbol.
-}
data EsqArbol = EsqVacio
              | Punto (EsqArbol) (EsqArbol)
                deriving (Show, Eq)


{-
   Definimos una funcion recursiva trivial para contar nodos de un esqueleto.
 Creamos una funcion que crea todos los posibles esqueletos de n nodos. Para ello,
 en el caso inductivo, crea, para todo i en el rango [0,...,n-1] todos los posibles 
 arboles con i nodos a la izquierda y todos los posibles con n-1-i nodos a la derecha.
 -}
nodos :: EsqArbol -> Int 
nodos EsqVacio = 0
nodos (Punto a b) = 1 + (nodos a) + (nodos b)

arbolesNodos :: Int -> [EsqArbol]
arbolesNodos 0 = [EsqVacio]
arbolesNodos 1 = [(Punto EsqVacio EsqVacio)]
arbolesNodos n = concat [[Punto x y | y <- arbolesNodos (n-1-i), x <- arbolesNodos (i)] | i <- [0..n-1]]

{- Como curiosidad, podemos notar que hay C_n arboles de n nodos, donde C_n es el 
 enesimo numero de Catalan. La longitud de la lista creada por "arbolesNodos n" es C_n -}


{- 
   Ahora vamos a codificar un esqueleto binario. Para ello, asignamos a cada arbol
 su posicion en la lista de arboles generados, y escribimos el numero como palabra binaria.

   Para pasar a binario, intentamos aprovechar al maximo el espacio, para ello usamos todas
 las palabras binarias posibles. Es decir, transformamos:
    0 -> _
    1 -> 0
    2 -> 1
    3 -> 00
    4 -> 01
   Adjuntamos ademas otra funcion para pasarlo a una cadena legible de texto
 -}
aBinario :: Int -> [Int]
aBinario 0 = []
aBinario n = r : aBinario q
  where (q,r) = divMod (n-1) 2

binarioLegible :: Int -> String
binarioLegible x = map intToDigit $ reverse $ aBinario x

codifica :: EsqArbol -> Int
codifica x = fromJust $ elemIndex x (arbolesNodos len)
  where len = nodos x

codificaLegible :: EsqArbol -> String
codificaLegible x = binarioLegible $ codifica x


{- 
   Por ultimo, implementamos la decodificacion. 
 Notese que aqui debe conocerse el numero de nodos.
-}
aNatural :: [Int] -> Int
aNatural [] = 0
aNatural (x:xs) = 2*(aNatural xs) + x + 1

decodifica :: Int -> Int -> EsqArbol
decodifica x nodos = (arbolesNodos nodos) !! x 

decodificaBinario :: [Int] -> Int -> EsqArbol
decodificaBinario xs nodos = decodifica (aNatural xs) nodos  

decodificaLegible :: String -> Int -> EsqArbol
decodificaLegible s nodos = decodificaBinario (reverse (map digitToInt $ s)) nodos

  


{- 2a Parte: Arboles de verdad. -}

{-
  Para ver la aplicacion real del algoritmo, vamos a escribir arboles
 de verdad y a codificarlos. Definimos un arbol de manera parecida al esqueleto.
 Como diferencia, ahora permitimos que la etiqueta contenga un dato de tipo a.
-}
data Arbol a = ArbolVacio 
            | Nodo a (Arbol a) (Arbol a)
            deriving (Show, Eq)


{-
   Codifica un arbol binario.
  Para ello, toma sus elementos y los guarda, por otro lado, lo transforma en esqueleto. 
  La codificacion son sus elementos, implicita su longitud, y la codificacion binaria del esqueleto.
-}
transformaEsqueleto :: Arbol a -> EsqArbol
transformaEsqueleto ArbolVacio = EsqVacio
transformaEsqueleto (Nodo _ a b) = (Punto (transformaEsqueleto a) (transformaEsqueleto b))

preorden :: Arbol a -> [a]
preorden ArbolVacio = []
preorden (Nodo x a b) = x : ((preorden a) ++ (preorden b))

codificaArbol :: Arbol a -> ([a], String)
codificaArbol x = (preorden x, codificaLegible.transformaEsqueleto $ x)


{-
   Decodifica un arbol binario.
 Para ello, decodifica el esqueleto del arbol 
 y rellena el esqueleto con los elementos del preorden.
-}

rellenaEsqueleto :: EsqArbol -> [a] -> Arbol a
rellenaEsqueleto EsqVacio _ = ArbolVacio
rellenaEsqueleto _ [] = ArbolVacio
rellenaEsqueleto (Punto u v) (x:xs) = (Nodo x subIzquierdo subDerecho)
  where (parteIzquierda, parteDerecha) = splitAt (nodos u) xs
        subIzquierdo = rellenaEsqueleto u parteIzquierda
        subDerecho   = rellenaEsqueleto v parteDerecha

decodificaArbol :: ([a], String) -> Arbol a
decodificaArbol (datos, codificado) = rellenaEsqueleto (decodificaLegible codificado nodos) datos
  where nodos = length datos
        


{- 3a Parte: Funciones auxiliares. -}
{-
  Para poder aprovechar la codificacion creada, se presentan funciones auxiliares que
 faciliten ejemplos de uso.
-}

insercionEnArbol :: (Ord a) => a -> Arbol a -> Arbol a
insercionEnArbol x ArbolVacio = (Nodo x ArbolVacio ArbolVacio)
insercionEnArbol x (Nodo a izq der)
  | x <= a  = Nodo a (insercionEnArbol x izq) der
  | x > a  = Nodo a izq (insercionEnArbol x der)

crearArbol :: (Ord a) => [a] -> Arbol a
crearArbol = foldr insercionEnArbol ArbolVacio . reverse


{- Definimos el orden total entre esqueletos de arbol. -}
esqCompara :: EsqArbol -> EsqArbol -> Ordering
esqCompara EsqVacio EsqVacio = EQ
esqCompara EsqVacio _ = LT
esqCompara _ EsqVacio = GT
esqCompara a b 
  | (nodos a) < (nodos b) = LT
  | (nodos a) > (nodos b) = GT
  | (esqCompara ad bd) == LT = LT
  | (esqCompara ad bd) == GT = GT
  | otherwise = (esqCompara ai bi)
    where (Punto ai ad) = a
          (Punto bi bd) = b

{- Ejemplo de uso -}
{-
  Para comprobar el correcto funcionamiento de la codificacion expuesta, probamos a codificar un arbol sencillo.
El resultado de la ejecucion de una sesion interactiva de ghci, compilando este codigo, se muestra a continuacion.

-- Creamos un arbol binario desde la lista [2,5,3,4,6,5]

*> let p = crearArbol [2,5,3,4,6,5]
*> p
Nodo 2 ArbolVacio (Nodo 5 (Nodo 3 ArbolVacio (Nodo 4 ArbolVacio (Nodo 5 ArbolVacio ArbolVacio))) (Nodo 6 ArbolVacio ArbolVacio))


-- Codificamos el arbol

*> let cod = codificaArbol p
*> cod
([2,5,3,4,5,6],"1000")


-- Decodificamos y comprobamos que equivale al original.

*> decodificaArbol cod
Nodo 2 ArbolVacio (Nodo 5 (Nodo 3 ArbolVacio (Nodo 4 ArbolVacio (Nodo 5 ArbolVacio ArbolVacio))) (Nodo 6 ArbolVacio ArbolVacio))
-}
