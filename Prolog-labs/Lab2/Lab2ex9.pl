% a. Given a linear numerical list write a predicate to remove all sequences of consecutive values.
% Eg.: remove([1, 2, 4, 6, 7, 8, 10], L) will produce L=[4, 10].
% b. For a heterogeneous list, formed from integer numbers and list of numbers; 
% write a predicate to delete from every sublist all sequences of consecutive values.
% Eg.: [1, [2, 3, 5], 9, [1, 2, 4, 3, 4, 5, 7, 9], 11, [5, 8, 2], 7] =>
% [1, [5], 9, [4, 7, 9], 11, [5, 8, 2], 7] 


%a
decon([],[]).
decon([H],[H]).
decon([H1,H2],[]):-
    H2=:=H1+1.
decon([H1,H2],[H1,H2]):-
    H2=\=H1+1.
decon([H1,H2,H3|L],R):-
    H2=:=H1+1,
    H3=:=H2+1,
    decon([H2,H3|L],R).
decon([H1,H2,H3|L],R):-
    H2=:=H1+1,
    H3=\=H2+1,
    decon([H3|L],R).
decon([H1,H2,H3|L],[H1|R]):-
    H2=\=H1+1,
    decon([H2,H3|L],R).

%  b

subl([],[]).
subl([H|T],[R1|R]):-
    is_list(H),!,
    decon(H,R1),
    subl(T,R).
subl([H|T],[H|R]):-
    subl(T,R).
