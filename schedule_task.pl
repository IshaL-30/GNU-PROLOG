% Store tasks and resources
:- dynamic(task/4).
%Store resource avability
:- dynamic(resource/2). 

% Tasks
task(work, 4, 3, monday).
task(meeting, 2, 2, tuesday).
task(presentation, 3, 1, wednesday).
task(project, 5, 4, thursday).
task(lunch, 1, 1, friday).

%Resources
resource(monday, 5).
resource(tuesday, 4).
resource(wednesday, 3).
resource(thursday, 6).
resource(friday, 2).

% Schedule a task considering resource availability
schedule_task(Task, Day) :-
	task(Task, Duration, RequiredResources, Day),
	resource(Day, AvailableResources),
	AvailableResources >= RequiredResources,
	update_resource(Day, AvailableResources, RequiredResources),
	format('Scheduled ~w on ~w with duration ~w~n', [Task, Day, Duration]).

% Update resource availability after scheduling a task
update_resource(Day, AvailableResources, RequiredResources) :-
	NewAvailable is AvailableResources - RequiredResources,
	retract(resource(Day, AvailableResources)),
	assertz(resource(Day, NewAvailable)).

% Add a new task to the database
add_task(Name, Duration, RequiredResources, Day) :-
	assertz(task(Name, Duration, RequiredResources, Day)).

main:-
	write('Queries: schedule_task(work, monday).').
	write('Queries: add_task(assignment, 2, 2, tuesday).').
	   
