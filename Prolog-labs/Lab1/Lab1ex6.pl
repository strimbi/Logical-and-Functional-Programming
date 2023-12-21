% a. Define a predicate to remove from a list all repetitive elements.
% Eg.: l=[1,2,1,4,1,3,4] => l=[2,3])
% b. Remove all occurrence of a maximum value from a list on integer numbers.

%a
nrap([],_,0).
nrap([H|T],E,R):-
    H=:=E,
    nrap(T,E,R1),
    R is R1+1.
nrap([H|T],E,R):-
    H=\=E,
    nrap(T,E,R).

del([],_,[]).
del([H|T],E,[H|R]):-
    H=\=E,
    del(T,E,R).
del([H|T],E,R):-
    H=:=E,
    del(T,E,R).


modif([],[]).
modif([H|T],[H|R]):-
    nrap([H|T],H,N),
    N=:=1,
    modif(T,R).
modif([H|T],R):-
    nrap([H|T],H,N),
    N=\=1,
    del([H|T],H,R1),
    modif(R1,R).


% b

maxnr(A,B,A):-A>=B.
maxnr(A,B,B):-B>A.

maxlist([],0).
maxlist([H],H).
maxlist([H|T],R):-
    maxlist(T,R1),
    maxnr(R1,H,R).

stergmax([],[]).
stergmax(T,R):-
    maxlist(T,E),
    del(T,E,R).
