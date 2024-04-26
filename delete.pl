%Delete items


delete_items(X,[X|L1],L1).

delete_items(X,[H|L2],[H|L1]):- delete_items(X,L2,L1).







