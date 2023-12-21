% a. Write a predicate to test if a list is a set.
% b. Write a predicate to remove the first three occurrences of an element in a list. 
% If the element occurs less than three times, all occurrences will be removed.

%a
nroc([],_,0).
nroc([H|T],E,R):-
    H=:=E,
    nroc(T,E,R1),
    R is R1+1.
nroc([H|T],E,R):-
    H=\=E,
    nroc(T,E,R).

multime([H]).
multime([H|T]):-
    nroc([H|T],H,N),
    N=:=1,
    multime(T),!.

% b

remove([],_,_,[]).
remove(L,_,0,L).
remove([H|L],E,K,R):-
    H=:=E,
    K1 is K-1,
    remove(L,E,K1,R).
remove([H|L],E,K,[H|R]):-
    H=\=E,
    remove(L,E,K,R).
