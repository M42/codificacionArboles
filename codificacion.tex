\documentclass{article}
\usepackage[spanish,activeacute]{babel}
\usepackage{changepage}
\usepackage[utf8]{inputenc}
\usepackage{graphicx}
\usepackage{color}
\usepackage[dvipsnames]{xcolor}
\usepackage[labelformat=empty]{caption}
\newenvironment{allintypewriter}{\ttfamily}{\par}


%% Datos del documento
\title{Reto 4.}
\author{Mario Román}


%% Cuerpo del documento
\begin{document}

\maketitle

\section {Codificación de un árbol binario.}
\subsection {Consideraciones previas}

Vamos a intentar codificar un árbol binario con la menor cantidad de información posible, esto es,
con el menor número de bits que podamos. La condición que debe tener una codificación es que sea unívoca,
y nos permita recuperar el árbol de manera única una vez codificado.

Queremos codificar un árbol binario genérico, que puede contener como datos cualesquiera etiquetas. La codificación
de estos datos, que podrían tener diversa naturaleza (las etiquetas podrían ser enteros, cadenas, o incluso listas de colas de pilas de árboles de booleanos),
se debería considerar aparte. Dado un árbol, tomaremos su preorden y lo almacenaremos en un vector. Este vector contiene la información de las etiquetas del árbol e, 
implícitamente, el número de nodos que tiene.

\begin{figure}[ht!]
\centering
\includegraphics[width=50mm]{ejemplo.jpeg}
\caption{Árbol de ejemplo.}
\label{overflow}
\end{figure}

En el ejemplo, de $5$ nodos, codificaríamos:
\begin{adjustwidth}{2cm}{}
 $[5,2,-4,3,18]$
\end{adjustwidth}
 
Es decir, que nuestro problema se centra en codificar la estructura, el esqueleto de un árbol binario.
Consideramos que las etiquetas se codifican aparte.

Intentaremos conseguir la mejor codificación posible de la estructura de un árbol de $n$ nodos creando una
función biyectiva entre árboles binarios y números naturales; y codificando el número natural que nos dé la biyección.


\subsection {Orden total entre árboles.}

La herramienta que usaremos para hacer esto posible es la definición de un orden total entre esqueletos de árboles.
Abusaremos del lenguaje llamándolos árboles, pero nótese que no tendrán etiquetas.

Definimos un esqueleto de árbol binario con la forma $A = (A_i,A_d)$, es decir, constando sólo de un
un subesqueleto izquierdo, y un subesqueleto derecho; o como un esqueleto vacío $A = nulo$. Nótese que la definición
es igual a la de los árboles binarios pero sin etiqueta.\\

Ahora definimos la relación de orden como sigue:
\begin{adjustwidth}{2cm}{}
 $\qquad A = (A_i,A_d) \leq B = (B_i,B_d)$ 
\end{adjustwidth}
 Si se cumple: 
 \begin{adjustwidth}{2cm}{}
 $\qquad nodos totales(A) <  nodos totales(B)$ 
 \end{adjustwidth}
 O si tienen el mismo número de nodos pero: 
 \begin{adjustwidth}{2cm}{}
 $\qquad A_d < B_d$ 
 \end{adjustwidth}
 O si tienen el mismo subárbol derecho pero: 
 \begin{adjustwidth}{2cm}{}
 $\qquad A_i \leq B_i$ 
\end{adjustwidth}
Es decir, primero comparamos el número de nodos, luego el subárbol derecho, y como último criterio, comparamos el subárbol izquierdo.\\

Claramente es una relación de orden. Es antisimétrica porque dos árboles con mismos nodos y subárboles deben ser iguales.
Es transitiva por ser composición de varias relaciones de orden. Y es trivialmente reflexiva. \\

Pero además, es una relación de orden total. Trivialmente lo es para árboles de un nodo. Y, por inducción sobre el número de nodos lo demostramos para árboles de $n$ nodos: \\
\indent Que sea relación de orden total para árboles de menos $n$ nodos fuerza a que deba darse $A_i \leq B_i$ o $A_i \leq B_i$, ya que el subárbol izquierdo 
tiene menos de $n$ nodos, y por tanto, al menos la tercera condición debe cumplirse en alguno de los dos sentidos.


\subsection {Convertir árboles en números.}

Ahora usaremos que existen $\frac{1}{n+1} {2n \choose n}$ árboles binarios de $n$ nodos. Llamamos $A_n$ al conjunto de esqueletos de árboles binarios
de $n$ nodos, y sabemos que:
\begin{adjustwidth}{2cm}{}
$\#A_n = \frac{1}{n+1} {2n \choose n} = C_n$ \\
\end{adjustwidth}

Definimos la siguiente función:
\begin{adjustwidth}{2cm}{}
 $f : A_n \longrightarrow \{1,2,\dots,C_n\}$ 
\end{adjustwidth}
Como la única biyección estrictamente creciente entre los dos conjuntos. Es decir, la única que cumple:
\begin{adjustwidth}{2cm}{}
 $\displaystyle \forall X,Y \in A_n : X \leq Y \Longleftrightarrow f(X) \leq f(Y)$
\end{adjustwidth}
Es resultado conocido que entre dos conjuntos con el mismo cardinal y con dos relaciones totales de orden,
existe una única aplicación biyectiva creciente. \\

Una forma práctica de hallar la imagen de un árbol por $f$ es generar la lista ordenada de posibles estructuras de árboles de $n$ y
realizar una búsqueda binaria sobre ella (aprovechando que hemos definido una relación de orden) hasta encontrar el índice
de un árbol que coincida con el árbol buscado. Esa es su codificación. 
 Lo que estamos haciendo, expuesto de otra forma, es contar todos los posibles árboles, ordenarlos e irles asignando su número según el orden.
 En la implementación se concretan estos detalles.\\

Otra forma, que no se desarrolla aquí, mucho más
eficiente, es la de relacionar el valor de $f$ para un árbol de $n$ nodos, con los valores de $f(A_i)$ y $f(A_d)$, que pueden buscarse inductivamente.



\subsection {Palabras binarias y codificación.}
La codificación de un árbol binario $A$ se define entonces como un vector con sus elementos en preorden, que nos da el número de nodos
del árbol, y el número $f(A)$ escrito como una palabra binaria. Es decir, los números pueden escribirse con los mínimos bits posibles siguiendo este patrón.
\begin{adjustwidth}{2cm}{}
 $0 \rightarrow ""$\\
 $1 \rightarrow "0"$ \\
 $2 \rightarrow "1"$ \\
 $3 \rightarrow "00"$ \\
 $4 \rightarrow "10"$ \\
 $5 \rightarrow "01"$ \\
 $6 \rightarrow "11"$ \\
 $7 \rightarrow "000"$ \\
 $8 \rightarrow "100"$ \\
 $\dots$ \\
\end{adjustwidth}

Es decir, guardamos por un lado los nodos, y por otro escribimos el número que determina unívocamente el árbol por la función $f$.

Por ejemplo, vamos a escribir los árboles de tres nodos ordenados: \\
\begin{figure}[ht!]
\centering
\includegraphics[width=20mm]{0.png}
\includegraphics[width=20mm]{1.png}
\includegraphics[width=20mm]{2.png}
\includegraphics[width=20mm]{3.png}
\includegraphics[width=20mm]{4.png}
\caption{""}
\label{overflow}
\end{figure}


Donde las estructuras de los árboles tendrán, respectivamente, las codificaciones siguientes:
%\begin{adjustwidth}{2cm}{}
 $"", "0", "1", "00", "10"$
%\end{adjustwidth}
\newpage

Un ejemplo con el árbol inicial, un árbol con nodos significativos y no sólo estructura, es el siguiente:
\begin{figure}[htbp]
\centering
\includegraphics[width=50mm]{ejemplo.jpeg}
\caption{Árbol de ejemplo, de nuevo.}
\label{overflow}
\end{figure}

Su codificación será: $([5,2,-4,3,18],"1010")$.
Ya que es el número $25$ entre los posibles árboles de $5$ nodos, y la codificación de $25$ es $"1010"$.
La otra parte de la codificación es el inorden de los nodos.



\subsection {Tamaño de la codificación.}

Ahora vamos a medir cuánto ocupa la codificación de un árbol de $n$ nodos.
Es claro que las etiquetas, si son de tipo $Type$, ocuparán en disco:
\begin{adjustwidth}{2cm}{}
 $n * sizeof(Type)$
\end{adjustwidth}
Quizá algo más si contamos un caracter terminador o uno que indique cuántos elementos hay.\\

La parte más interesante para medir será cuánto ocupa la codificación de la estructura.
Tenemos que una palabra binaria de, como máximo, $m$ bits puede codificar:
\begin{adjustwidth}{2cm}{}
 $\displaystyle \sum_{k=0}^{m} 2^{k} = 2^{m+1} - 1$
\end{adjustwidth}
Donde cada sumando representa las $2^b$ cadenas posibles con $b$ bits.\\

Pero tenemos por otro lado que hay $\frac{1}{n+1} {2n \choose n}$ posibles árboles, si queremos saber
cuánto espacio necesitaremos para codificarlos, resolvemos:
\begin{adjustwidth}{2cm}{}
 $\displaystyle 2^{m_n+1} - 1 = \frac{1}{n+1} {2n \choose n};$ \\
 $\displaystyle m_n = \left\lceil log_2 \left( \frac{1}{n+1} {2n \choose n} + 1 \right) - 1 \right\rceil;$ \\
\end{adjustwidth}

Este será el espacio que usemos. Asintóticamente, sabemos que la función de los números de Catalan crece como:
\begin{adjustwidth}{2cm}{}
 $\displaystyle C_n \sim \frac{4^n}{n^{3/2}\sqrt\pi}$
\end{adjustwidth}
Por lo que la función en conjunto se aproximará a:
\begin{adjustwidth}{2cm}{}
 $\displaystyle m_n \sim \left\lceil log_2 \left( \frac{4^n}{n^{3/2}\sqrt\pi} + 1 \right) - 1 \right\rceil \sim 2n - log_2\left(n^{3/2}\sqrt\pi\right) \sim 2n - \frac{3}{2}log_2(n)$
\end{adjustwidth}
Que aunque siga siendo $O(n)$, es menor que la que use invariablemente $2n$, a pesar de que se aproxime asintóticamente a ella.

\subsection {Mejor codificación.}

Toda codificación de los esqueletos de árboles binarios como palabras binarias debe ser inyectiva, para permitir que pueda recuperarse de ella el árbol binario original de manera unívoca, y
sin dar lugar a pérdida de información. Por tanto, será una biyección con su conjunto imagen. El cardinal de la imagen de una biyección debe tener al menos el mismo número de elementos
que el cardinal del conjunto de definición, en este caso, para $n$ nodos, $C_n$ elementos.

La función aquí presentada alcanza el mínimo especificado en esa cota, así que cualquier otra codificación debe usar los mismos o más elementos que ella. Es decir, cualquier otra
codificación llevará árboles en palabras binarias que como poco, alcanzarán las $C_n$ palabras distintas, y necesitará usar, como poco, tantos bits como en este caso.\\

Podríamos obtener mejoras en la codificación de las etiquetas, o si tenemos una restricción sobre ellas, o si nos preocupamos en codificar mejor los árboles más comunes para mejorar el caso medio;
pero en las condiciones que hemos fijado, tenemos la mínima codificación posible.


\subsection {Implementación.}

Se presenta una implementación de la codificación en lenguaje de programación Haskell. Usamos por comodidad este lenguaje porque nos permite hacer definiciones más
concisas de los árboles y las funciones sobre ellos que C++, a pesar de que perdemos mucha eficiencia. Nótese que no se ha hecho referencia a la eficiencia del algoritmo en
ningún momento. Sólo nos interesa obtener la minima codificación, y los algoritmos usados para comprimir y descomprimir serán muy ineficientes.\\

Al final de la implementación se da un ejemplo de uso.\\

\input{cod.tex}


% \newpage
% \section{Inorden no recursivo.}
% 
% Diseñamos un procedimiento de inorden no recursivo similar al preorden. En este caso, distinguimos entre si se puede seguir avanzando a la derecha,
% en cuyo caso lo hacemos, o si llegamos a un nodo sin hijos a la izquierda, que entonces se imprime y pasa a su parte derecha.\\
% 
% Terminamos en cuanto no podamos seguir avanzndo ni queden nodos por visitar en la pila.\\
% 
% 
% \input{inord.tex}
% 

\end{document}