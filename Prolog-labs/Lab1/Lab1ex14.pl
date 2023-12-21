% a. Write a predicate to test equality of two sets without using the set difference.
% b. Write a predicate to select the n-th element of a given list.


%a
elin([H|_],H):-!.
elin([_|L],E):-
    elin(L,E).


verif([],_).
verif([H|A],B):-
    elin(B,H),
    verif(A,B).

%b

%select(L,P,M)

select([],_,_,-1).
select([H|_],P,M,H):-
    P=:=M,!.
select([_|T],P,M,R):-
    P1 is P+1,
    select(T,P1,M,R).

%main(L,Poz,Rez)

mains([],_,-1).
mains(L,P,R):-
    select(L,0,P,R).
