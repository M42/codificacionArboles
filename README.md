Codificación de Árboles
===================

## Objetivo

Buscamos codificar un árbol binario con la menor cantidad de información posible.
Es decir, con el mínimo número de bits que podamos. La única condición es que la
codificación sea unívoca para permitir recuperar el árbol codificado.  
Nos centraremos en codificar la estructura del árbol.


## Procedimiento

Se empezará definiendo una *relación total de orden* entre los árboles binarios, lo
que nos llevará a probar la existencia de una función creciente de árboles a naturales.
Esta será nuestra *función de codificación*.  
Se calculará el tamaño del árbol codificado a medida que crece el número de nodos y se
demostrará que es asintóticamente óptimo.  
Finalmente se exponen implementaciones en **Haskell** de las funciones de codificación y descodificación.
