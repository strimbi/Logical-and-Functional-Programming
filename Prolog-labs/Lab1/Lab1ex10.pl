% a. Insert an element on the position n in a list.
% b. Define a predicate to determine the greatest common divisor of all numbers from a list


%a
interca([],_,_,_,[]).
interca([H|T],E,P,P,[E,H|R]):-
    P1 is P+1,
    interca(T,E,P1,P,R).
interca([H|T],E,P,N,[H|R]):-
    P=\=N,
    P1 is P+1,
    interca(T,E,P1,N,R).

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


maincmm([],0).
maincmm([H],H).
maincmm([H|T],R):-
    maincmm(T,R1),
    cmmdc(H,R1,R).
