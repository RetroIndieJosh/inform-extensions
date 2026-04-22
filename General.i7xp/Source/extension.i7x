Version 1 of General by Joshua McLean begins here.

"Adds general features and improvements that don't fit in categorized files."

Use American dialect, scoring, and the serial comma.

Chapter 1 - Testing (Debug) - Not for release

An object can be without description.

light-meter is without description. [not sure where this comes from but this keeps it out of our list]

When play begins (this is the check for missing descriptions when play begins rule): 
	repeat with item running through things:
		if description of the item is "" and the item is not without description:
			say "- thing '[item]' has no description (if this was intended, write '[item] is without description.' in the source)[br]";
	repeat with place running through rooms:
		if description of the place is "" and the place is not without description: 
			say "- room '[place]' has no description (if this was intended, write '[place] is without description.' in the source)[br]"
			
Section 1 - Subjects Have No Description (for use with Conversation Framework by Eric Eve)

A subject is usually without description.

Chapter 2 - Noting Beta Comments

After reading a command (this is the ignore beta-comments rule): 
	if the player's command matches the regular expression "^\*.*": 
		say "(Noted.)"; 
		reject the player's command. 

Chapter 3 - Default Responses

Instead of taking some scenery, say "That's not the sort of thing you can carry around."

Chapter 4 - Examined

A thing can be examined. A thing is usually not examined. After examining something (called the target): now the target is examined.

Chapter 5 - Vulgarity

Being vulgar is an action applying to nothing. Understand "shit", "fuck", "fucker", "damn", "ass", "motherfuck", "motherfucker", "bullshit", "dammit", "damnit", "goddamn", and "bitch" as being vulgar.
Report being vulgar:
	say "We'll have none of that!"
Being vulgar to is an action applying to one topic. Understand "shit [text]", "fuck [text]", "damn [text]", "[text]shit", "[text]damn", and "[text]fuck" as being vulgar to.
Carry out being vulgar to:
	try being vulgar.

Chapter 6 - Text Handling

To say i -- beginning say_i -- running on: (- style underline; -). 
To say /i -- ending say_i -- running on: (- style roman; -). 
To say b -- beginning say_b -- running on: (- style bold; -). 
To say /b -- ending say_b -- running on: (- style roman; -). 
To say /p: say paragraph break.
To say br: say line break.

To sayn (str - text):
	say "[str][/p]".
	
To say (str - some text) lines (n - a number) to (n2 - a number):
	if n >= n2:
		say "";
	let result be "";
	repeat with curline running from n to n2:
		let line be line number curline in str;
		now result is "[result][line][br]";
	say result.

To say (str - some text) without line (n - a number):
	let result be "";
	let nminus be n - 1;
	let nplus be n + 1;
	say "[str lines 1 to nminus][str lines nplus to number of lines in str]".

To say insert (str - some text) into (target - some text) after line (n - a number):
	let nplus be n + 1;
	let end be the number of lines in target;
	say "[target lines 1 to n][str][br][target lines nplus to end]".
	
To say replace (target - some text) line (n - a number) with (str - some text):
	let nminus be n - 1;
	let nplus be n + 1;
	say "[target lines 1 to nminus][str][br][target lines nplus to number of lines in target]".
	
To say a/an for (T - text):
	let N be T in lower case;
	if character number 1 in N is "a" or character number 1 in N is "e" or character number 1 in N is "i" or character number 1 in N is "o" or character number 1 in N is "u":
		say "an";
	otherwise:
		say "a".

Chapter 7 - Saving

[count saves]
The number of saves is a number which varies.
Check saving the game: increment the number of saves; continue the action.

Chapter 8 - Default Scenery

A door is usually scenery.

Chapter 9 - Light and Darkness

Rule for printing a refusal to act in the dark:
	if we are examining something, say "It's too dark for you to look at anything closely." instead.

A thing can be flammable. A thing is usually not flammable.
A lighter is a kind of thing. A lighter is never flammable.

Does the player mean lighting a lighter with something: it is very unlikely.
Does the player mean lighting something with something flammable: it is very unlikely.
Does the player mean lighting something flammable with a lighter: it is very unlikely.

Understand nothing as burning.

Lighting it with is an action applying to two visible things. Understand "light [something] with [something]" as lighting it with.
Check lighting it with:
	if the noun is not flammable, say "[The second noun] isn't flammable." instead;
	if the second noun is not a lighter, say "You can't light anything with [the second noun]." instead;
	if the second noun is not carried:
		try silently taking the second noun;
		if the second noun is not carried, say "You need to take [the second noun] first." instead;
		say "(first taking [the second noun])";
	continue the action.
Carry out lighting it with:
	now the noun is lit.
Report lighting it with:
	say "You light [the noun] with [the second noun]."

General ends here.

---- DOCUMENTATION ----

Chapter - Description Checking

When debugging (not a release build), the game will start by printing warnings for all objects (things and rooms) which have not had their description specified. If you want to suppress this warning, say:
	
	The foobar is a thing. The foobar is without description.
	
To ignore the checks entirely, say:

	The check for missing descriptions when play begins rule is not listed in any rulebook.
	
For some reason, there's an object called "light-meter" that Inform generates, so we have flagged this as without description to avoid a false positive.

Chapter - Tester Comments

Ignores any command starting with an asterisk * so it can be placed in the transcript without affecting the game or delivering a strange response from the parser.

Chapter - Default Responses

Updated messages to avoid bland built-in responses.

Chapter - Examined

Things by default are not examined, and when the player examines them for the first time, they become examined. You can use this examined status to change the printed name or description of things to expand on interaction from examination.

Chapter - Vulgarity

Catch a number of vulgar phrases and scold the player for using them.

Chapter - Text Handling

Simplified tags for styling text.

Chapter - Saving

Automatically counts the number of times the player saves the game and stores it into a value called "the number of saves."

Chapter - Default Scenery

Make certain types of objects scenery by default. Currently, the only one is "door."

Chapter - Light and Darkness

Replaces the default "burn X" verb with "light X with Y" and introduces the "lighter" type which can light "flammable" things. After lighting a flammable thing, it becomes lit.

Example: * Examined - Changes based on whether an item has been examined

	*: "Examined"
	
	Include General by Joshua McLean.
	
	The Deck is a room. "This wooden deck jutting out the back of your house is a wonderful place for barbecues and watching the kids play from afar."
	
	An animal called a spider is here. The printed name is "[if the spider is examined]spider[otherwise]tiny black ball". Understand "tiny black ball" and "black ball" and "ball" as the spider. The description is "[if the spider is examined]The black spider zips away from you whenever you get close. Good riddance.[otherwise]A strange marble-sized black ball catches your attention. You move to pick it up, and the legs expand, revealing a massive spider! Lucky for you, it's as scared as you are and immediately flees."
	
	Test me with "x ball / look / x spider".
	
Example: * Text Manipulation - Various ways to manipulate text.

	*: "Text Manipulation"
	
	Include General by Joshua McLean.
	
	When play begins:
		let the number list be "1[br]2[br]3[br]4[br]5";
		say "This is just a standard say statement.";
		sayn "This is a sayn statement. It should have an extra newline.";
		sayn "The [i]number list[/i] is:[/p][the number list]";
		sayn "[b]Prime numbers[/b] are:[/p][the number list without line 4]"; [TODO this doesn't work!]
		let the new number be "4.5";
		sayn "If we put [b]4.5[/b] where it belongs we have:[/p][insert the new number into the number list after line 4]";
		sayn "If we replace 3 with 4.5 we get:[/p][replace the number list line 3 with the new number]".
	
	The Format Room is a room. "Cool formatting, done."
	
	Test me with "look".

Example: * Light and Darkness - Using a lighter to light a flammable object and illuminate a dark room.

	*: "Light and Darkness"
	
	Include General by Joshua McLean.
	
	A lighter called the butane lighter is carried by the player. The description is "One flick and you get a nice little flame."
	
	Living Room is a room. "A standard living room. The only interesting thing is the old-school wooden torch on the floor. Stairs lead down to the basement."
	
	A flammable thing called the torch is here. The description is "A stick with flammable cloth wrapped around the top. Makes you feel like a proper adventurer."
	
	A dark room called The Basement is down from Living Room. "An empty, concrete basement. Guess it wasn't worth bringing light, after all."
	
	Test me with "light torch / get torch / d".