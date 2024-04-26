:- dynamic(student/2).

% Add a student to the database
add_student(Name, Age) :-
    assertz(student(Name, Age)).

% Remove a student from the database
remove_student(Name) :-
    retract(student(Name, _)).

% Find all students
list_students :-
    student(Name, Age),
    write(Name), write(' , '), write(Age), nl,
    fail.
list_students. % To stop the iteration

% Find a student by name
find_student(Name) :-
    student(Name, Age),
    write('Found student: '), write(Name), write(' , '), write(Age), nl.
find_student(Name) :-
    \+ student(Name, _),
    write('Student not found: '), write(Name), nl.
