% a. Determine the product of a number represented as digits in a list to a given digit.
% Eg.: [1 9 3 5 9 9] * 2 => [3 8 7 1 9 8]
% b. For a heterogeneous list, formed from integer numbers and list of numbers, 
% write a predicate to replace every sublist with the position of the maximum element from that sublist.
% [1, [2, 3], [4, 1, 4], 3, 6, [7, 10, 1, 3, 9], 5, [1, 1, 1], 7] =>
% [1, [2], [1, 3], 3, 6, [2], 5, [1, 2, 3], 7]

%a
trs([H],P,R):-
    R is H*P.
trs([H|T],P,R):-
    P1 is P*10,
    trs(T,P1,R1),
    R is H*P+R1.

inv(N,P,R):-
    N<10,
    R is N*P.
inv(N,P,R):-
    N>=10,
    P1 is P*10,
    N1 is N mod 10,
    N2 is (N-N1)/10,
    inv(N2,P1,R1),
    R is N1*P+R1.
