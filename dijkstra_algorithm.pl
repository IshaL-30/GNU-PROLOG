:- dynamic(edge/3).

edge(a, b, 2).
edge(a, c, 1).
edge(b, d, 3).
edge(c, d, 2).
edge(d, e, 1).

% Add Edge
add(Start, End, Cost) :-
	assertz(edge(Start, End, Cost)),
	assertz(edge(End, Start, Cost)).

% Remove Edge
remove(Start, End) :-
	retract(edge(Start, End, _)),
	retract(edge(End, Start, _)).

% List Edges
list :-
	edge(Start, End, Cost),
	format('Edge: ~w - ~w (Cost: ~w)~n', [Start, End, Cost]),
	fail. 

% Update Edge
update(Start, End, NewCost) :-
	retract(edge(Start, End, _)),
	retract(edge(End, Start, _)),
	assert(edge(Start, End, NewCost)),
	assert(edge(End, Start, NewCost)).

% Dijkstra's algorithm
shortest_path(Start, End, Path, Cost) :-
	dijkstra(Start, End, [], Path, Cost).

% Base case: Destination Node
dijkstra(End, End, _, [End], 0).

% Recursive case
dijkstra(Start, End, Visited, [Start|Path], Cost) :-
	edge(Start, Inter, EdgeCost),
	\+ member(Inter, Visited),
	dijkstra(Inter, End, [Inter|Visited], Path, RemainingCost),
	Cost is EdgeCost + RemainingCost.

% Find the minimum cost and its associated path
minimum_cost(Store, MinCost, MinPath) :-
	minimum(Store, _, 9999, MinCost, MinPath).

% Base case
minimum([], MinPath, MinCost, MinCost, MinPath) :-
	true.

% Recursive case
minimum([Path-Cost|Rest], CurrentMinPath, CurrentMinCost, MinCost, MinPath) :-
	(   CurrentMinCost =< Cost ->
		minimum(Rest, CurrentMinPath, CurrentMinCost, MinCost, MinPath) ;   
        	minimum(Rest, Path, Cost, MinCost, MinPath)
    	).

% Find all paths and their costs
all_paths(Start, End, Store) :-
	findall(Path-Cost, shortest_path(Start, End, Path, Cost), Store).

% Print all paths
print_path([]).
print_path([Path-Cost|Rest]) :-
    format('Path: ~w~nCost: ~w~n~n', [Path,Cost]),
    print_path(Rest).

main :-
	write('Enter the Source: '),
	read(Start),
	write('Enter the Destination: '),
	read(End), nl,
	all_paths(Start, End, Store),
	write('All paths and their costs:'), nl, nl,
        print_path(Store),
        nl,
        minimum_cost(Store, MinCost, MinPath),
	write('Shortest Path: '),
        write(MinPath), nl,
        write('Cost: '),
        write(MinCost), nl.
        

% Call main predicate
main.
