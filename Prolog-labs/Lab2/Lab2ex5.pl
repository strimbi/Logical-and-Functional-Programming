% a. Determine the position of the maximal element of a linear list.
% Eg.: maxpos([10,14,12,13,14], L) produces L = [2,5].
% b. For a heterogeneous list, formed from integer numbers and list of numbers, 
% replace every sublist with the position of the maximum element from that sublist.
% [1, [2, 3], [4, 1, 4], 3, 6, [7, 10, 1, 3, 9], 5, [1, 1, 1], 7] =>
% [1, [2], [1, 3], 3, 6, [2], 5, [1, 2, 3], 7]

%max(a,b)
%Mathematical module:
%  a, a>=b
%  b, b>a
%  max(A:nr,B:nr,R:nr)
% (i,i,o)

max(A,B,A):-A>=B.
max(A,B,B):-B>A.

%maxLista(l1..ln)
%Model m:
% l1, n=1
% max(l1, maxLista(l2..ln))
% maxList(L:list, R:nr)
%(i,o)

maxList([E],E).
maxList([E|L],R):-
    maxList(L,R1),
    max(E,R1,R).


%Model m:
%cautatPoz(l1..ln,max,poz) =
% 0, n=0
% poz + cautatPoz(l2..ln,max,poz+1), l1==m
% cautatPoz(l2..ln,max,poz+1), l1\=m
% cautatPoz(L:list,M:nr,Poz:nr, R:list)
% (i,i,i,o)
%
cautatPoz([],_,_,[]).
cautatPoz([X|L],M,Poz,[Poz|R]):- X==M,
    Poz1 is Poz+1,
    cautatPoz(L,M,Poz1,R).
cautatPoz([X|L],M,Poz,R):- X\=M,
    Poz1 is Poz+1,
    cautatPoz(L,M,Poz1,R).

%mainMaxPoz(l1..ln)
%mainMaxPoz(L:list, R:list)
%(i,o)

mainMaxPoz([],[]).
mainMaxPoz(L,R):-
    maxList(L,M),
    cautatPoz(L,M,1,R).

% b

%sublista(l1..l2)=
% 0, n=0
% mainMaxPoz(l1..l2) + sublista(l2..ln), islist(l1)=True
% l1 + sublista(l2..ln), islist(l1) =False
%sublista(L,R)
%(i,o)

sublista([],[]).
sublista([E|L],[M|R]):-
    is_list(E),
    !,
    mainMaxPoz(E,M),
    sublista(L,R).
sublista([E|L],[E|R]):-
    sublista(L,R).
