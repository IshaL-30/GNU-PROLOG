% Base case: 
insert_element(Element, List, Position, [Element|List]) :-
    Position =:= 1.

% Recursive case: 
insert_element(Element, [Head|Tail], Position, [Head|Result]) :-
    NewPosition is Position - 1,
    insert_element(Element, Tail, NewPosition, Result).