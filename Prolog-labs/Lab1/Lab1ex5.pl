% a) Write a predicate to remove all occurrences of a certain atom from a list.
% b) Define a predicate to produce a list of pairs (atom n) from an initial list of atoms.
% In this initial list atom has n occurrences.
% Eg.: numberatom([1, 2, 1, 2, 1, 3, 1], X) => X = [[1, 4], [2, 2], [3, 1]].

%a
del([],_,[]).
del([H|T],E,[H|R]):-
    H=\=E,
    del(T,E,R).
del([H|T],E,R):-
    H=:=E,
    del(T,E,R).


%b

nrap([],_,0).
nrap([H|T],E,R1):-
    H=:=E,
    nrap(T,E,R),
    R1 is R+1.
nrap([H|T],E,R):-
    H=\=E,
    nrap(T,E,R).


main([],[]).
main([H|T],[[H,NR]|X]):-
    nrap([H|T],H,NR),
    del(T,H,T1),
    main(T1,X).
