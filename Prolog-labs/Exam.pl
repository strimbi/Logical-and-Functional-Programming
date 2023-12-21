%Given a list, replace all elements with the sum of all numbers that are before
%the current element, that are greater than a given value

%Mathematical model:
%sum(l1..ln,poz,n,v)=
%  0, n=0
%  l1+sum(l2..ln,poz+1,n,v), poz=n and l1>v and l1 mod 2 = 0
%  sum(l2..ln, poz+1, n,v), otherwise
%  sum(L:list, P:int, N:int, V:int, S:int)
%  L-our list
%  P-position counter
%  N-position where we stop adding
%  V-nr min
%  S-result sum
%  (i,i,i,i,o)

sum([],_,_,_,0).
sum([H|T],P,N,V,S):-
    P=<N,
    H>V,
    H mod 2 =:= 0,
    P1 is P+1,
    sum(T,P1,N,V,S1),
    S is S1+H,!.
sum([_|T],P,N,V,S):-
    P1 is P+1,
    sum(T,P1,N,V,S).


%Mathematical model:
%  listasum(l1..ln,l1..ln,poz,v)=
%  [], n=0
%  sum(l1..ln,l1..ln,1,poz,v) + listsum(l2..ln,l1..ln,poz+1,v), n>0
%  listsum(L:list,C:list,P:int,V:int,R:list)
%
%  L-initial list, P-position
%  C-copy list to keep the initial elements
%  V-minim val, R-result list
%  (i,i,i,i,o)

listsum([],_,_,_,[]).
listsum([_|T],C,P,V,[H1|R]):-
    sum(C,1,P,V,H1),
    P1 is P+1,
    listsum(T,C,P1,V,R).

%Mathematical model:
% main(l1..ln,v)=
% [], n=0
% listsum(l1..ln,l1..ln,1,v)
%
% main(L:lista,V:int,R:lista),
% (i,i,o)

main([],_,[]).
main(T,V,R):-
    listsum(T,T,1,V,R).
