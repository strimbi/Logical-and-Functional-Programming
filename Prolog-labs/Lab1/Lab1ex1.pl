% a) Write a predicate to calculate the difference of two sets
% b) Write a predicate to add value 1 after every even element of the list

%a
dif(A,[],A).
dif([],B,[]).
dif([],[],[]).
dif([H|A],[E|B],[H|R]):-
    H=\=E,
    dif(A,B,R).
dif([H|A],[E|B],R):-
    H=:=E,
    dif(A,B,R).

%b
add([],[]).
add([H|T],[H,1|R]):-
    H mod 2=:=0,
    add(T,R).
add([H|T],[H|R]):-
    H mod 2=\=0,
    add(T,R).
