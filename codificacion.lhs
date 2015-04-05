---
title: Reto 4
author: Mario Román
---

# Codificación de un árbol binario

## Consideraciones previas

Vamos a intentar codificar un árbol binario con la menor cantidad de información
posible, esto es, con el menor número de bits que podamos. La condición que debe
tener una codificación es que sea unívoca, y nos permita recuperar el árbol de
manera única una vez codificado. 

Queremos codificar un árbol binario genérico, que puede contener como datos cualesquiera etiquetas. La codificación
de estos datos, que podrían tener diversa naturaleza (las etiquetas podrían ser enteros, cadenas, o incluso listas de colas de pilas de árboles de booleanos),
se debería considerar aparte. Dado un árbol, tomaremos su preorden y lo almacenaremos en un vector. Este vector contiene la información de las etiquetas del árbol e, 
implícitamente, el número de nodos que tiene.

![Árbol de ejemplo](ejemplo.jpeg)

En el ejemplo, de $5$ nodos, codificaríamos: `[5,2,-4,3,18]`

Es decir, que nuestro problema se centra en codificar la estructura, el
esqueleto de un árbol binario. Consideramos que las etiquetas se codifican aparte.

Intentaremos conseguir la mejor codificación posible de la estructura de un árbol de $n$ nodos creando una
función biyectiva entre árboles binarios y números naturales; y codificando el
número natural que nos dé la biyección.

## Orden total entre árboles
