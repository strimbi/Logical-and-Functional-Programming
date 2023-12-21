% a. Substitute all occurrences of an element of a list with all the elements of another list.
% Eg. subst([1,2,1,3,1,4],1,[10,11],X) produces X=[10,11,2,10,11,3,10,11,4].
% b. For a heterogeneous list, formed from integer numbers and list of numbers, 
% replace in every sublist all occurrences of the first element from sublist it a new given list.
% Eg.: [1, [4, 1, 4], 3, 6, [7, 10, 1, 3, 9], 5, [1, 1, 1], 7] si [11, 11] =>
% [1, [11, 11, 1, 11, 11], 3, 6, [11, 11, 10, 1, 3, 9], 5, [11 11 11 11 11 11], 7]

%a
insert([],L,L).
insert([H|B],L,[H|R]):-
    insert(B,L,R).

inloc([],_,_,[]).
inloc([H|T],E,B,[H|R]):-
    H=\=E,
    inloc(T,E,B,R).
inloc([H|T],E,B,R):-
    H=:=E,
    insert(B,T,R1),
    inloc(R1,E,B,R).

%b

schimb([],_,[]).
schimb([H|L],B,R):-
    inloc([H|L],H,B,R).

subl([],_,[]).
subl([H|T],B,[R1|R]):-
    is_list(H),!,
    schimb(H,B,R1),
    subl(T,B,R).
subl([H|T],B,[H|R]):-
    subl(T,B,R).
