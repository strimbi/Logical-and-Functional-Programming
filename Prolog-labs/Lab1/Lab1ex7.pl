del([],_,[]).
del([H|T],E,R):-
    H=:=E,
    del(T,E,R).
del([H|T],E,[H|R]):-
    H=\=E,
    del(T,E,R).

reun([],[],[]).
reun([H|T],L,[H|R]):-
    del([H|T],H,R1),
    del(L,H,R2),
    reun(R1,R2,R).
reun([],L,R):-
    reun(L,[],R).


%!  %

adel(_,[],[]).
adel(E,[H|T],[[E,H]|R]):-
    adel(E,T,R).

mainadel([],[]).
mainadel([H|T],[R1|R]):-
    adel(H,T,R1),
    mainadel(T,R).

%!  b

findset(_,0,[]):-!.
findset([H|T],K,[H|R]):-
    K1 is K-1,
    findset(T,K1,R).
findset([_|T],K,R):-
    findset(T,K,R).

mainfindset([],[]).
mainfindset(L,R):-
    findall(R1,findset(L,2,R1),R).
