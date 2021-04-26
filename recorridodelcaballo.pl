dxy(2,1).
dxy(2,-1).
dxy(-2,1).
dxy(-2,-1).
dxy(1,2).
dxy(1,-2).
dxy(-1,2).
dxy(-1,-2).


%para determinar los proximos movimientos
%a dar dado una posicion en especifico del
nexmove(N,X1/Y1,X2/Y2):-
    dxy(Dx,Dy),
    X2 is X1 + Dx,
    1 =< X2,
    X2 =< N,
    Y2 is Y1 + Dy,
    1 =< Y2,
    Y2 =<N.

%para determinar el recorrido R es el recorrido de
%un caballo en el tablero de dimension N*N sin que se
%pasen dos veces por la misma casilla
recorrido(N,P1,P2,R):-
    recorridoauxiliar(N,P1,[P2],R).

recorridoauxiliar(_,P,[P|R],[P|R]):-!.
recorridoauxiliar(N,P1,[P2|R1],R):-
    nexmove(N,P2,P3),
    not(member(P3,[P2|R1])),
    recorridoauxiliar(N,P1,[P3,P2|R1],R).

%predicado para determinar el recorrido R completo
%del caballo en el tablero sin pasar dos veces por
%la misma casilla
recorridocaballo(N,X/Y,R):-
    M is N*N,
    length(R1,M),
    recorrido(N,_,X/Y,R1),
    reverse(R1,R).

