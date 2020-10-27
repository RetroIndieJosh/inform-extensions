Books by Joshua McLean begins here.

Section 1 - Readability

A thing can be read. A thing is usually not read. Definition: a thing is unread if it is not read.
A thing has some text called the reading description. The reading description is usually "".

Section 2 - Reading

To read (he reads, they read, he read, it is read, he is reading) is a verb.

Reading it is an action applying to one visible thing and requiring light. Understand "read [something]" as reading it.
Check reading it:
	if the actor is the player:
		if the reading description is "", say "You can't read that." instead;
	otherwise:
		if the reading description is "", say "[The actor] [are] unable to read [the noun]." instead;
	rule succeeds.
Carry out reading it:
	if the actor is the player:
		now the noun is read.
Report reading it:
	if the actor is the player:
		say "You read [the noun]. It says: '[the reading description of the noun]'.";
	otherwise:
		say "[The actor] [read] [the noun]."

Books ends here.
