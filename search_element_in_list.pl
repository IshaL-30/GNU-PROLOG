found_element(X, Li):-
    found_element(X, Li,0).  
    
found_element(X, [X|_],C) :-
    !, 
    write(X), write(' found in the list at '), write(C), write(' Position').

found_element(X, [_|Y],C) :-
    Count is C+1,
    found_element(X, Y,Count).