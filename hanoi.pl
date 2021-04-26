%predicado para mover mas de una cierta cantidad de
%elementos n (este es el predicado general para dar
%solucion al problema de hanoi)
hanoi(N):-move(N,'A','C','B').

%caso base (cuando ya no quedan movimientos por hacer)
move(0,_,_,_):-!.

%caso backtrak , para para hacer un movimiento y proceder
%a analizar el caso en el que hay n-1 discos por mover
move(N,Left,Right,Center):-
            M is N-1,
            move(M,Left,Center,Right),
            printmove(Left,Right),
            move(M,Center,Right,Left).

%para imprimir un movimiento
printmove(X,Y):-
            writelist([move, a, disk, from, X, to, Y]),
            nl.

% para imprimir una lista
writelist([]).
writelist([H|T]):-write(H),
        write(' '),
        writelist(T).
