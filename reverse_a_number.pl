%Reverse a number
reverse_number(Num, Rev) :-
    reverse_func(Num, 0, Rev).

%Base Case
reverse_func(0, Rev, Rev).

%Recursive function
reverse_func(Num, Reve, Rev) :-
    Num > 0,
    A is Num mod 10,
    NewRev is Reve * 10 + A,
    N is Num // 10,
    reverse_func(N, NewRev, Rev).

main :-
  write('Enter the number to be reversed: '),
  read(Num),
  reverse_number(Num, Rev),
  write('Reversed number: '),
  write(Rev),
  nl.