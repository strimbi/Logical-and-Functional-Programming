% a. Define a predicate to test if a list of an integer elements has a "valley" aspect (a set has a "valley" aspect if
% elements decreases up to a certain point, and then increases.
% eg: 10 8 6 9 11 13 – has a “valley” aspect
% b. Calculate the alternate sum of list’s elements (l1 - l2 + l3 ...).

%a
vale([_],0).
vale([H1,H2|T],_):-
    H1<H2,
    vale([H2|T],0),!.
vale([H1,H2|T],1):-
    H1>H2,
    vale([H2|T],1),!.
%b

suma([],0).
suma([H],H).
suma([H1,H2|T],R):-
    suma(T,R1),
    R is H1-H2+R1.

