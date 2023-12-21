% a. For a list of integer number, write a predicate to add in list after 
% 1-st, 3-rd, 7-th, 15-th element a given value e.
% b. For a heterogeneous list, formed from integer numbers and list of numbers; 
% add in every sublist after 1-st, 3-rd, 7-th, 15-th 
% element the value found before the sublist in the heterogenous list. 
% The list has the particularity that starts with a number and there aren’t two consecutive elements lists.
% Eg.: [1, [2, 3], 7, [4, 1, 4], 3, 6, [7, 5, 1, 3, 9, 8, 2, 7], 5] =>
% [1, [2, 1, 3], 7, [4, 7, 1, 4, 7], 3, 6, [7, 6, 5, 1, 6, 3, 9, 8, 2, 6, 7], 5]

%a
interadd([],_,_,_,[]).
interadd([H|T],P,P,E,[E,H|R]):-
    P1 is P+1,
    interadd(T,P1,P,E,R).
interadd([H|T],P,N,E,[H|R]):-
    P=\=N,
    P1 is P+1,
    interadd(T,P1,N,E,R).


schimb([],_,_,_,COPIE,COPIE).
schimb([_|T],PAS,POZ,E,COPIE,R):-
    PAS=\=POZ,
    POZ1 is POZ+1,
    schimb(T,PAS,POZ1,E,COPIE,R).
schimb([_|T],PAS,POZ,E,COPIE,R):-
    PAS=:=POZ,
    interadd(COPIE,1,PAS,E,COPIE1),
    PAS1 is PAS*2+1,
    POZ1 is POZ+1,
    schimb(T,PAS1,POZ1,E,COPIE1,R).
