% 14. Write a program to generate the list of all subsets of sum S with the 
%elements of a list (S - given).
% Eg: [1,2,3,4,5,6,10] si S=10 => [[1,2,3,4], [1,4,5], [2,3,5], [4,6], [10]] 
%(not necessary in this order)

%subset(l1..ln)=
% [],n=0
% l1+ subset(l2..ln), n>0
% subset(l2..ln), n>0
% subset(T:list, R:list)
% (i,o)-nedeter.

subset([],[]).
subset([H|T],[H|R]):-
    subset(T,R).
subset([_|T],R):-
    subset(T,R).

%suma(l1..ln,s)=
% s, n=0
% suma(l2..ln, s+l1), n>0
% suma(T:list, S:nr, R:nr)
% (i,i,o)-deter.

suma([],S,S).
suma([H|T],S,R):-
    S1 is S+H,
    suma(T,S1,R).

%sol(L:list,S:nr, R:list)
%math model:
% sol(l1..ln,s)=
% suma(subset(l1..ln),0)
%(i,i,o)

sol(L,S,R):-
    subset(L,R),
    suma(R,0,S).

%main(L:list, S:nr, R:list)
%main(l1..ln,s)=
% U sol(l1..ln,s)
%(i,i,o)
main(L,S,R):-
    findall(R1, sol(L,S,R1),R).
