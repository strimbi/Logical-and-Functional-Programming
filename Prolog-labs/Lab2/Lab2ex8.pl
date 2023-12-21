% a. Determine the successor of a number represented as digits in a list.
% Eg.: [1 9 3 5 9 9] --> [1 9 3 6 0 0]
% b. For a heterogeneous list, formed from integer numbers and list of numbers, 
% determine the successor of a sublist considered as a number.
% [1, [2, 3], 4, 5, [6, 7, 9], 10, 11, [1, 2, 0], 6] =>
% [1, [2, 4], 4, 5, [6, 8, 0], 10, 11, [1, 2, 1], 6]

%a
lungime([],0).
lungime([_|T],R):-
    lungime(T,R1),
    R is R1+1.

putere(1,10).
putere(N,R):-
    N1 is N-1,
    putere(N1,R1),
    R is R1*10.

numar([H],_,H).
numar([H|T],P,R):-
    P1 is P/10,
    numar(T,P1,R1),
    R is R1+H*P.

creare(N,[L|[]]):-
    N<10,
    L is N,
    !.
creare(N,R):-
    N1 is N // 10,
    creare(N1,R1),
    END is (N mod 10),
    append(R1,[END],R).


mainpr([],[]).
mainpr(L,R):-
    lungime(L,N),
    N1 is N-1,
    putere(N1,P),
    numar(L,P,R1),
    R2 is R1+1,
    creare(R2,R).

%b

et([],[]).
et([H|T],[H1|R]):-
    is_list(H),!,
    mainpr(H,H1),
    et(T,R).
et([H|T],[H|R]):-
    et(T,R).
