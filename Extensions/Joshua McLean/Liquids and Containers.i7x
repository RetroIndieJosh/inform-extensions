Liquids and Containers by Joshua McLean begins here.

Chapter 1 - Emptying

Emptying is an action applying to one thing. Understand "empty [something]" and "pour [something] out" and "dump [something]" and "dump out [something]" as emptying.
Check emptying something:
	if the noun is not a container and the noun is not a liquid container, say "You can't empty that." instead.
Carry out emptying something when the noun is not a liquid container:
	say "You empty [the noun] onto the floor, dumping [list of things in the noun].";
	repeat with item running through things in the noun:
		move item to the location.

Chapter 2 - Liquids

A liquid is a kind of thing. Understand "liquid" as a liquid.
water is a liquid.

Chapter 3 - Liquid Containers

A liquid container is a kind of thing. 
Every liquid container has a liquid called the contained liquid. The contained liquid is usually water. 
A liquid container can be full or empty. A liquid container is usually empty.
A liquid container can be bottomless. A liquid container is usually not bottomless.

After examining a liquid container:
	if the noun is empty:
		say "[The noun] is empty.";
	otherwise:
		say "Inside [the noun] is [the contained liquid of the noun].";
	continue the action.

Carry out emptying a liquid container:
	if the noun is empty:
		say "[The actor] [turn] [the noun] upside down but nothing comes out. It's already empty." instead;
	otherwise if the noun is bottomless:
		say "Something about [the noun] [look] too important to empty.";
	otherwise:
		say "[The actor] dump [the contained liquid of the noun] from [the noun] onto the ground, where it [are] quickly absorbed.";
		now the noun is empty.

Chapter 4 - Drinking

The block drinking rule is not listed in any rulebook.

A liquid can be drinkable. Definition: A liquid is undrinkable if it is not drinkable. A liquid is usually not drinkable.

To drink (he drinks, they drink, he drank, it is drunk, he is drinking) is a verb.

Check drinking something:
	if the noun is not a liquid container, say "You can't drink that." instead;
	if the noun is empty, say "[The noun] is empty. Nothing to drink in there." instead;
	if the contained liquid of the noun is undrinkable, say "That [don't] look too palatable." instead.

Carry out drinking something:
	if the contained liquid of the noun is not bottomless, now the noun is empty.
	
Report drinking something:
	say "[The actor] [drink] [the contained liquid of the noun] from [the noun]."

Chapter 5 - Combinations

Table of Liquid Combinations
liquid 1		liquid 2		result
water		water		water

Chapter 6 - Pouring

To pour (he pours, they pour, he poured, it is poured, he is pouring) is a verb.

Pouring it into is an action applying to two visible things and requiring light. Understand "pour [something] into [something]" and "pour [something] in [something]" and "pour [something] onto [something]" and "pour [something] on [something]" and "add [something] to [something]" and "combine [something] with [something]" as pouring it into.
Check pouring it into:
	if the noun is not a liquid container, say "[The actor] [can] only pour from liquid containers." instead;
	if the noun is scenery or the noun is fixed in place or the noun is a backdrop, say "[The actor] [can't], as [the noun] is fixed in place.";
	if the noun is empty, say "[The noun] [are] empty, so pouring would do nothing." instead.
Carry out pouring it into when the second noun is a liquid container:
	if the second noun is empty:
		now the contained liquid of the second noun is the contained liquid of the noun;
	otherwise if the contained liquid of the noun is not the contained liquid of the second noun:
		let found a match be false;
		let f be the contained liquid of the noun;
		let s be the contained liquid of the second noun;
		repeat with N running from 1 to the number of rows in the Table of Liquid Combinations:
			let tf be liquid 1 in row N of the Table of Liquid Combinations;
			let ts be liquid 2 in row N of the Table of Liquid Combinations;
			let tr be the result in row N of the Table of Liquid Combinations;
			if f is tf and s is ts:
				now the contained liquid of the second noun is tr;
				now found a match is true;
			otherwise if f is ts and s is tf:
				now the contained liquid of the second noun is tr;
				now found a match is true;
		if found a match is false:
			say "Best not do that.";
			stop the action;
	if the noun is not bottomless, now the noun is empty;
	now the second noun is full;
	say "[The actor] [pour] some [the contained liquid of the noun] from [the noun] into [the second noun] which now contains some [the contained liquid of the second noun]."
Carry out pouring it into when the second noun is not a liquid container:
	if the noun is not bottomless, now the noun is empty;
	say "[The actor] [pour] [the contained liquid of the noun] from [the noun] onto [the second noun]."
	
Chapter 7 - Dipping

[TODO move to general]
To make (he makes, they make, he made, it is made, he is making) is a verb.

To dip (he dips, they dip, he dipped, it is dipped, he is dipping) is a verb.
Dipping it into is an action applying to two things. Understand "dip [something] in [something]" and "dip [something] into [something]" as dipping it into.
Check dipping it into:
	if the second noun is not a liquid container, say "That [make] no sense with [the second noun]." instead;
	if the noun is a liquid container:
		if the second noun is empty, say "That would accomplish nothing, as [the noun] [are] empty." instead;
		if the noun is full, say "Try pouring [the noun] into [the second noun] instead." instead.
Carry out dipping it into:
	let V be "coating";
	if the noun is a liquid container:
		now the contained liquid of the noun is the contained liquid of the second noun;
		now the noun is full;
		now V is "filling";
	say "[The actor] [dip] [the noun] into [the second noun], [V] it with [the contained liquid of the second noun]."

	
Section 1 - Bulk Limiting (for use with Bulk Limiter by Eric Eve)

A liquid container has a number called the dipping bulk limit. The dipping bulk limit is usually 5.

A check dipping it into rule:
	if the bulk of the noun is greater than the dipping bulk limit of the second noun, say "[The noun] [won't] fit in [the second noun]." instead.

Liquids and Containers ends here.


---- DOCUMENTATION ----

A liquid container contains a liquid with a string name. Liquids can be combined to match anything on the Table of Liquid Combinations. Note that combinations are two way, so you need only put one entry. That is, if you say A + B = C, then automatically B + A = C. You also need not add reflexive combinations; A + A = A always.

To add one row to the Table of Liquid Combinations:
	
	choose a blank row in the Table of Liquid Combinations;
	now liquid 1 entry is first liquid name;
	now liquid 2 entry is second liquid name;
	now result entry is resulting liquid name.

To extend the Table of Liquid Combinations:
	
	Table of Liquid Combinations (continued)
	liquid 1		liquid 2		result
	first liquid name	second liquid name	resulting liquid name
	
You can EMPTY any container (not just a liquid container) to dump its contents on the floor. Liquids evaporate, while for other containers, the contents simply appear in the room.
	
Example: * Liquids - Manipulating and combining liquids in containers

	*: "Liquids"
	
	Include Bulk Limiter by Eric Eve.
	
	Include Liquids and Containers by Joshua McLean.
	
	oil is a liquid. soda is a drinkable liquid. milk is a liquid. oiled water is a liquid.
	
	Table of Liquid Combinations (continued)
	liquid 1	liquid 2	result
	oil		water		oiled water
	
	Your hand is part of the player.
	
	The Kitchen is a room. A liquid container called the glass is here. A liquid container called the pot is here.
	
	A liquid container called the soda can is here. The contained liquid is soda. The can is full.
	
	A bottomless liquid container called the oil vial is here. The contained liquid is oil. The vial is full. The dipping bulk limit of the vial is 0.
	
	A liquid container called the water bottle is here. The contained liquid is water. The bottle is full. The dipping bulk limit of the bottle is 0.
	
	A liquid container called the milk jug is here. The contained liquid is milk. The jug is full.
	
	After dipping your hand into the pot, say "Your hand is now wet and oily."

	After pouring the pot into your hand:
		If the contained liquid of the pot is oiled water, say "Your hand is even more wet and oily now."

	Test me with "drink soda / dump milk / dip hand in bottle / dip hand in oil / pour water in pot / pour oil in pot / x pot / dip hand in pot / pour pot on hand".