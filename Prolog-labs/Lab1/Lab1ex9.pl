% a. Write a predicate to compute the intersection of two sets.
% b. Write a predicate to create a list (m, ..., n) of all integer numbers from the interval [m, n].

%a
check([H|_],H):-!.
check([_|T],E):-
    check(T,E).

intersectie([],_,[]).
intersectie(_,[],[]).
intersectie([H|A],B,[H|R]):-
    check(B,H),
    intersectie(A,B,R),!.
intersectie([_|A],B,R):-
    intersectie(A,B,R).


%b

constr(M,M,[M]).
constr(M,N,[M|R]):-
    M1 is M+1,
    constr(M1,N,R).
