%Base Case
reverse_list([], []). 

reverse_list([Head|Tail], Reversed) :-
    reverse_list(Tail, ReversedTail),
    append(ReversedTail, [Head], Reversed).

main:- 
    write('Enter the list to be Reversed: '),
    read(List),
    nl,
    reverse_list(List, Reversed),
    write('Reversed List: '),
    write(Reversed).