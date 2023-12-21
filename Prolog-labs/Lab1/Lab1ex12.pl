% a. Write a predicate to substitute an element from a list with another element in the list.
% b. Write a predicate to create the sublist (lm, …, ln) from the list (l1,…, lk).

%a
inloc([],_,_,[]).
inloc([H|T],E,N,[H|R]):-
    H=\=E,
    inloc(T,E,N,R).
inloc([H|T],E,N,[N|R]):-
    H=:=E,
    inloc(T,E,N,R).

%b

subl([],_,_,_,[]).
subl([H|T],I,F,P,[H|R]):-
    I=<P,
    P=<F,
    P1 is P+1,
    subl(T,I,F,P1,R),!.
subl([_|T],I,F,P,R):-
    P1 is P+1,
    subl(T,I,F,P1,R).

mainsubl([],_,_,[]).
mainsubl(T,I,F,R):-
    subl(T,I,F,1,R).

