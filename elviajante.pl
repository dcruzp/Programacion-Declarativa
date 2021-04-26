%grafo representado por (nodo,nodo,pesodelaarista)
arista(a, b, 3).
arista(a, c, 4).
arista(a, d, 2).
arista(a, e, 7).
arista(b, c, 4).
arista(b, d, 6).
arista(b, e, 3).
arista(c, d, 5).
arista(c, e, 8).
arista(d, e, 6).
arista(b, a, 3).
arista(c, a, 4).
arista(d, a, 2).
arista(e, a, 7).
arista(c, b, 4).
arista(d, b, 6).
arista(e, b, 3).
arista(d, c, 5).
arista(e, c, 8).
arista(e, d, 6).
arista(a, h, 2).
arista(h, d, 1).

%determina la longitud de una lista , mientras que hay elementos en la
%lista este incrementa N
%cuando la lista no tiene elementos este retorna.

longitud([], 0).
longitud([H|T], N):-
    longitud(T, X),
    N is X+1.

mejorrecorrido(Visitado, Total):-
    recorrido(a, a, Visitado, Total).


% extendemos el recorrido para tomar la distancia hasta ahora y los
% nodos visitados.

recorrido(Comienzo, Fin, Visitado, Total) :-
    recorrido(Comienzo, Fin, [Comienzo], Visitado, 0, Total).

% Esto agrega el actual a la lista de visitados, agrega la distancia y
% luego llama recursiva
%hasta la siguiente unificacion para anadirlo al recorrido

recorrido(Comienzo, Fin, ActualL, Visitado, Coston, Total) :-
    arista(Comienzo, Final, Distancia),
    NuevoCosto is Coston + Distancia,
    \+ member(Final, ActualL),
    recorrido(Final, Fin, [Final|ActualL], Visitado, NuevoCosto, Total).

%Aqui cuando se encuentra un camino de regreso hasta el inicio y
%Asegúra de que el recorrido abarque  todos los nodos del grafo


recorrido(Comienzo, Fin, ActualL, Visitado, Coston, Total) :-
    arista(Comienzo, Fin, Distancia),
    reverse([Fin|ActualL], Visitado),
    longitud(Visitado, Q),
    (Q\=7 -> Total is 100000; Total is Coston + Distancia).

%esto es para encontrar el camino mas corto, toma todos los caminos.
%de todo los de menor costo se queda con el de menor costo

recorridoViajante(Recorrido):-
    setof(Costo-Recorrido,mejorrecorrido(Recorrido,Costo), CPropio),
    Tomar(CPropio,Recorrido).

%Esta campara dos distancias , si el costo es menor que el menor costo,
%entoces no necesita seguir y corta aqui.*/

mejor(Costo-CPropio,MCosto-_,Costo-CPropio):- Costo<MCosto,!.
mejor(_,X,X).

%Toma los recorridos y la distancia y lo llama de manera recursiva.

Tomar([Costo-CPropio|R],X):-
    Tomar(R,MCosto-BPropio),
    mejor(Costo-CPropio,MCosto-BPropio,X),
    !.
Tomar([X],X).

