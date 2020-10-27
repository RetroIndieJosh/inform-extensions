Memory by Joshua McLean begins here.

"Implements REMEMBER and RECALL commands to help the player remember game world information."

Include General by Joshua McLean.

Section 1 - Setup

The auto memory is some text that varies.
The custom memory is some text that varies.

Section 2 - Remembering Things

A thing can be remembered. A thing is usually not remembered. 
A thing has a room called the remembered location.
A thing can be known locked, known unlocked, or unknown lock state. A thing is usually unknown lock state.
A thing can be known open, known closed, or unknown open state. A thing is usually unknown open state.

Remembering it is an action applying to one visible thing. Understand "remember [something]" as remembering it.
Check remembering it:
	if the noun is carried by the player, say "You're already holding [the noun]! No need to remember it." instead;
Carry out remembering it:
	if the noun is remembered, say "You examine [the noun] and see what's changed.";
	otherwise say "You will remember [the noun].";
	remember the noun.
	
To remember (item - a thing):
	now item is remembered;
	now the remembered location of item is the location of item;
	if item is openable:
		if item is open, now item is known open;
		otherwise now item is known closed;
	if item is lockable:
		if item is locked, now item is known locked;
		otherwise now item is known unlocked;
	if item is a container:
		repeat with inner-item running through things in item:
			remember inner-item;
	if item is a supporter:
		repeat with inner-item running through things on item:
			remember inner-item.

Section 3 Remembering Text

Remembering is an action applying to one topic. Understand "remember [text]" as remembering.
Carry out remembering: add custom memory the topic understood.
Report remembering: say "You will remember [the topic understood]."
To add custom memory (addend - text):
	let current-text be the custom memory;
	now the custom memory is "[current-text][br] - [addend]".

Section 4 - Recalling

The block thinking rule is not listed in any rulebook.
Carry out thinking: try recalling.

Recalling is an action applying to nothing. Understand "recall" and "ponder" and "think" and "consider" as recalling.
Report recalling: 
	if the auto memory is not "", say "[auto memory][/p]";
	if the custom memory is not "", sayn "You recall: [custom memory]";
	let count be 0;
	repeat with target running through remembered things:
		if the target is on a remembered supporter or the target is in a remembered container, next;
		say "([count + 1]) [the target] - [the remembered location of the target]";
		if the target is known locked:
			say " (locked)";
		otherwise if the target is known unlocked:
			say " (unlocked)";
		if the target is known open:
			say " (open)";
		otherwise if the target is known closed:
			say " (closed)";
		if the target is a container:
			if the target is not openable or the target is open:
				say " (containing [the list of remembered things in the target])";
		if the target is a supporter:
			if the target is not openable or the target is open:
				say " (supporting [the list of remembered things on the target])";
		increment count;
		say "[br]";
	if the auto memory is "" and the custom memory is "" and count is 0:
		say "You don't remember anything in particular."

Section 5 - Forgetting Text

Forgetting is an action applying to nothing. Understand "forget" as forgetting.
Carry out forgetting: 
	now the custom memory is "".
Report forgetting: say "You have forgotten all your textual memories."

Section 6 Continuous Memory

Before taking a thing which is remembered (this is the forget things you take rule):
	forget the noun;
	continue the action.

Before dropping a thing which is not remembered (this is the remember things you drop rule):
	remember the noun;
	continue the action.

After dropping a remembered thing (this is the update remembered things you drop rule):
	remember the noun;
	continue the action.
	
After putting a not remembered thing on a supporter:
	remember the noun;
	remember the second noun;
	continue the action.

Section 7 Forgetting Things

Forgetting it wrongly is an action applying to one topic. Understand "forget [text]" as forgetting it wrongly. Carry out forgetting it wrongly: say "You must provide a number from the RECALL list to forget a thing."

Forgetting it is an action applying to one number. Understand "forget [number]" as forgetting it.
Check forgetting it:
	if the number understood is greater than the number of remembered things, say "That's not a thing you can forget." instead.
Carry out forgetting it:
	let count be 0;
	let forgot be 0;
	repeat with item running through the list of remembered things:
		if item is in a remembered container or item is on a remembered supporter, next;
		increment count;
		if count is the number understood:
			say "You forget [the item].";
			forget item;
			now forgot is 1;
	if forgot is 0:
		say "That's not a thing you can forget."

To forget (item - a thing):
	now item is not remembered;
	now item is unknown lock state;
	now item is unknown open state.
	
To forget everything:
	repeat with target running through remembered things:
		forget the target.

Memory ends here.

---- DOCUMENTATION ----

This extension adds commands REMEMBER and RECALL (with synonyms CONSIDER, THINK, and PONDER).

The author may add special hint-like memories by setting the global variable auto memory.

	The auto memory is now "You're late for your doctor's appointment. Get to it!"

The player may REMEMBER any text to add it in a note-like memory list accessible with RECALL.

The player may also REMEMBER any visible thing, adding a note to their RECALL about its last remembered location.

If the player picks something up that they remember, they will automatically forget it. If they drop it, they automatically remember where it was dropped. To remove this automation say

	The remember things you drop rule is not listed in any rulebook.
	The forget things you take rule is not listed in any rulebook.

Even without this rule, if the player drops a remembered thing, the memory will be updated when they drop it.

Example: * Auto memory hints - Create memories for the player to ponder.

	*: "Auto memory hints"

	Include Memory by Joshua McLean.

	When play begins: now the auto memory is "You know you had to do something, but you can't remember what it was."
	
	The Kitchen is a room. "A standard kitchen. The dining room is south."
	
	The Dining Room is south of the kitchen. "The center of this intimate dining area is a large six-seat table."
	
	A scenery supporter called the table is here. "The table is empty."
	
	After examining the table:
		say "The table triggers a memory.";
		now the auto memory is "Ah! You've remembered. You need to set the table."

	Test me with "recall / s / x table / recall".
	
Example: * Text memory - Remember any idea, such as notes.

	*: "Text memory"
	
	Include Memory by Joshua McLean.
	Include Keypad by Joshua McLean
	
	At the Security Door is a room. "You stand before a massive security door with a keypad next to it."
	
	A closed locked door called the security door is north of at the security door. The description is "A solid steel door which you imagine is many inches thick." 
	Instead of closing the security door when the security door is open: say "Why would you close it? You worked so hard to open it."
	
	A keypad called the security keypad is in at the security door. The description is "A standard keypad. [run paragraph on]". The code is "1422". The locked target is the security door.
	
	The Vault is north of the security door. "A small vault with solid steel walls, floor, and ceiling." 
	The treasure is here. The description is "A pile of gold and silver with various expensive-looking jewelry." 
	After taking the treasure: end the story saying "You got the treasure! You'll be rich.".
	
	The North Hall is south of at the security door. "A hall leading north and south."
	
	The Middle Hall is south of the north hall.  "A hall leading north and south."
	
	The South Hall is south of the middle hall.  "A hall leading north and south."
	
	The Clue Room is south of the south hall. "The only thing of interest here is a whiteboard, and an exit north." A scenery thing called the whiteboard is here. "A giant number is scrawled on it in multicolored ink: 1422."
	
	Test me with "s / s / s / s / x whiteboard / remember the code is 1422 / n / n / n / n / recall / push one / push four / push two / push two / forget / recall / north / get treasure".

Example: * Remembering objects - Remember details about items seen.

	*: "Remembering objects"
	
	Include Household Items by Joshua McLean.
	Include Memory by Joshua McLean.
	
	The check for missing descriptions when play begins rule is not listed in any rulebook.
	
	The player carries the bathroom key.
	
	The Bedroom is a room. "Nothing but a bed and an exit south." A scenery bed called the small bed is here. A pillow, a sheet, and a book are on it. Yourself is seated. Yourself is on the small bed.
	
	The Hall is south of the bedroom. "Nothing interesting here - just leads to the bathroom west and the bedroom north."
	
	A closed locked door called the bathroom door is west of the hall. The bathroom key unlocks it.

	A room called the Bathroom is west of the bathroom door. "The countertop here is super clean. East lies the hallway."
	A scenery supporter called the countertop is here. Understand "counter top" and "counter" as the countertop. On the countertop are a toothbrush and a comb. 
	A container called the bathtub is here. The bulk capacity of the bathtub is 100. A fixed in place thing called water is in the bathtub. A fixed in place thing called the drain is in the bathtub.
	
	The block sleeping rule is not listed in any rulebook.
	After sleeping when the player is on the small bed and the player is reclining:
		say "You fall asleep and forget the world.";
		forget everything;
		say "You wake feeling refreshed."

	Test me with "remember pillow / recall / get pillow / remember pillow / get sheet / get book / recall / s / remember door / recall / unlock door / open door / recall / remember door / recall / w / remember comb / put sheet in bathtub / remember bathtub / drop pillow / put book on counter / e / n / recall / forget 10 / forget 4 / recall / forget 1 / recall / lie on bed / sleep / recall".