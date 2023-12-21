% a. Transform a list in a set, in the order of the last occurrences of elements. 
% Eg.: [1,2,3,1,2] is transformed in [3,1,2].
% b. Define a predicate to determine the greatest common divisor of all numbers in a list


%a
nrap([],_,0).
nrap([H|T],E,R):-
    H=:=E,
    nrap(T,E,R1),
    R is R1+1.
nrap([H|T],E,R):-
    H=\=E,
    nrap(T,E,R).

sterge([],[]).
sterge([H|T],[H|R]):-
    nrap([H|T],H,N),
    N=:=1,
    sterge(T,R).
sterge([H|T],R):-
    nrap([H|T],H,N),
    N=\=1,
    sterge(T,R).

%b

cmmdc(0,B,B):-!.
cmmdc(A,0,A):-!.
cmmdc(A,B,R):-
    A>=B,
    A1 is A mod B,
    cmmdc(A1,B,R),!.
cmmdc(A,B,R):-
    A<B,
    B1 is B mod A,
    cmmdc(A,B1,R),!.

maincmmdc([],0).
maincmmdc([H],H).
maincmmdc([H|T],R):-
    maincmmdc(T,R1),
    cmmdc(H,R1,R).
