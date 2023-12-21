% a) Write a predicate to substitute an element from a list with another element in the list.
% b) Write a predicate to create the sublist (lm, …, ln) from the list (l1,…, lk).


%a
inserare([],L,L).
inserare([H|T],L,[H|R]):-
    inserare(T,L,R).

sub([],_,_,[]).
sub([H|A],B,E,[H|R]):-
    H=\=E,
    sub(A,B,E,R).
sub([H|A],B,E,R):-
    H=:=E,
    inserare(A,B,R1),
    sub(R1,B,E,R).

%b

delpoz([],_,_,[]).
delpoz([H|T],P,K,[H|R]):-
    P=\=K,
    P1 is P+1,
    delpoz(T,P1,K,R).
delpoz([_|T],P,K,R):-
    P=:=K,
    P1 is P+1,
    delpoz(T,P1,K,R).

maindelpoz([],_,[]).
maindelpoz(T,K,R):-
    delpoz(T,0,K,R).
