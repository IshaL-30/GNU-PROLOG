%Finding all possible arrangements

%Base Case
permutation([], []).

permutation(List, [H|P]) :-
    select(H, List, Tail),
    permutation(Tail, P).


%Storing all the permutes
%Base Case
store([], []).  

store([List|Rest], [Perm|PermRest]) :-
    permutation(List, Perm),
    store(Rest, PermRest).


%Display Permutations

%Base Case
print_Permutes([]).  

print_Permutes([Perm|Rest]) :-
    write(Perm), 
    nl,             
    print_Permutes(Rest). 

main :-
    write('Enter the List to Permute: '),
    read(List),
    findall(Perm, permutation(List, Perm), AllPermutes),
    write('Permutations:'), 
    nl,  
    print_Permutes(AllPermutes),  
    length(AllPermutes, Count),
    write('Total Number of Arrangements: '),
    write(Count).