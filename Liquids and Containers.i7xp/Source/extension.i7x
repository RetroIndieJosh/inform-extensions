Liquids and Containers by Joshua McLean begins here.

A liquid container is a kind of thing. A liquid container can be empty or full. Every liquid container has some text called the liquid.

After examining a liquid container:
	if the noun is full:
		say "Inside [the noun] is [the liquid of the noun].";
	otherwise:
		say "[The noun] is empty.";
	continue the action.
	
Carry out emptying a liquid container:
	if the noun is empty:
		say "You turn [the noun] upside down but nothing comes out. It's already empty.";
	otherwise:
		say "You dump [the liquid of the noun] from [the noun] onto the ground, where it's quickly absorbed.";
		now the noun is empty.
		
The block drinking rule is not listed in any rulebook.

Check drinking something:
	if the noun is not a liquid container, say "You can't drink that." instead;
	if the noun is empty, say "[The noun] is empty. Nothing to drink in there." instead.
		
Carry out drinking something:
	now the noun is empty.
	
Report drinking something:
	say "You drink [the liquid of the noun] from [the noun]. Tasty![90 sec]".
	
Chapter - Emptying

Emptying is an action applying to one thing. Understand "empty [something]" and "pour [something] out" as emptying.
Check emptying something:
	if the noun is not a container, say "You can't empty that."
Carry out emptying something when the noun is not a liquid container:
	say "You empty [the noun] onto the floor, dumping [list of things in the noun].";
	repeat with item running through things in the noun:
		move item to the location.


Liquids and Containers ends here.
