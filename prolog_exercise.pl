%%CS424-2014-Jan Q3

/**
Define a predicate noah which takes elements from a list two-by-two.
E.g.,
noah([a,b,c,d,e,f,g,h], [[a,b],[c,d],[e,f],[g,h]]).
**/

noah([A,B | Tail], [[A,B] | X]) :-
    noah(Tail, X).
noah([],[]).

%%CS424-2015-Aut Q3

noah([],[],[]).
noah([H|T],[H2|T2],[H,H2|Tail]) :-
	noah(T,T2,Tail).
	
%%CS424-2015-Jan Q4
%there's definitely a more elegant solution than this but it works:

doublemember(X,Ys) :-
	member(X,Ys),
	del(X,Ys,N),
	member(X,N).
	
del(X,[X|Tail],Tail).
del(X,[Y|Tail],[Y|Tail1]):- del(X,Tail,Tail1).
