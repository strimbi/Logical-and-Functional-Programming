% a. Write a predicate to determine if a list has even numbers of elements 
% without counting the elements from the list.
% b. Write a predicate to delete first occurrence of the minimum number from a list.

%a
fct([]).
fct([_,_|T]):-
    fct(T).

%a
minr(A,B,A):- A=<B.
minr(A,B,B):- A>B.


minlist([H],H).
minlist([H|T],R):-
    minlist(T,R1),
    minr(H,R1,R).

stergeprim([H|T],H,T):-!.
stergeprim([H|T],M,[H|R]):-
    stergeprim(T,M,R).

main([],[]).
main(L,R):-
    minlist(L,M),
    stergeprim(L,M,R).

