General by Joshua McLean begins here.

[

[syntax]
Include Alternatives by Eric Eve.
Include Epistemology by Eric Eve.

[new features]
Include Bulk Limiter by Eric Eve.
Include Postures by Emily Short.
Include Skeleton Keys by Emily Short.
Include Locksmith by Emily Short.
Include Response Assistant by Aaron Reed.
Include Simple Followers by Emily Short.
Include Variable Time Control by Eric Eve.

[player help]
Include Approaches by Emily Short.
Include Exit Lister by Eric Eve.

]

Use American dialect, [brief room descriptions, ]scoring, and the serial comma.

Section 1 - Release Extensions - For release only

[Extensions with automatic game changes to make it easier to play. Don't compile for debug so we can compile faster.]

[

Include Commonly Unimplemented by Aaron Reed.
Include Reversed Persuasion Correction by Juhana Leinonen.
Include Small Kindnesses by Aaron Reed.
Include Smarter Parser by Aaron Reed.
Include Title Page by Jon Ingold.

]

Section 2 - Testing (Debug) - Not for release

An object can be without description.

light-meter is without description. [not sure where this comes from but this keeps it out of our list]

When play begins (this is the check for missing descriptions when play begins rule): 
	repeat with item running through things:
		if description of the item is "" and the item is not without description:
			say "- thing '[item]' has no description[br]";
	repeat with place running through rooms:
		if description of the place is "" and the place is not without description: 
			say "- room '[place]' has no description[br]"
			
Section 3 - Subjects Have No Description (for use with Conversation Framework by Eric Eve)

A subject is usually without description.

Section 4 - Testing (Release) - For release only

After reading a command (this is the ignore beta-comments rule): 
	if the player's command matches the regular expression "^\p": 
		say "(Noted.)"; 
		reject the player's command. 

Section 5 - Default Responses

A thing can be examined. A thing is usually not examined. After examining something (called the target): now the target is examined.

Instead of taking some scenery, say "That's not the sort of thing you can carry around."

Section 6 - Bulk (for use with Bulk Limiter by Eric Eve)

The bulk of a thing is usually 5. The bulk capacity of the player is 20.

Section 7 - Vulgarity

Being vulgar is an action applying to nothing. Understand "shit", "fuck", "damn", "ass", "motherfuck", "motherfucker", "bullshit", "dammit", "damnit", "goddamn", and "bitch" as being vulgar.
Report being vulgar:
	say "We'll have none of that!"
Being vulgar to is an action applying to one topic. Understand "shit [text]", "fuck [text]", "damn [text]", "[text]shit", "[text]damn", and "[text]fuck" as being vulgar to.
Carry out being vulgar to:
	try being vulgar.

Section 8 - Text Handling

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
	let nplus be n + 1;
	say "[str lines 1 to n][str lines nplus to number of lines in str]".

To say insert (str - some text) into (target - some text) after line (n - a number):
	let nplus be n + 1;
	let end be the number of lines in target;
	say "[target lines 1 to n][str][br][target lines nplus to end]".
	
To say replace (target - some text) line (n - a number) with (str - some text):
	let nminus be n - 1;
	let nplus be n + 1;
	say "[target lines 1 to nminus][str][br][target lines nplus to number of lines in target]".

Section 9 - Saving

[count saves]
The number of saves is a number which varies.
Check saving the game: increment the number of saves; continue the action.

Section 10 - Pulling

The report pulling rule is not listed in the report pulling rulebook.
A thing can be pullable. A thing is usually not pullable. Definition: a thing is unpullable if it is not pullable.
Check pulling:
	if the noun is not pullable, say "You can't pull that." instead.
		
Section 11 - Default Scenery

A door is usually scenery.

General ends here.

---- DOCUMENTATION ----

When included, this extension will check at the beginning of play for anything without a description and report it (but not on release). To remove this check for any object, say e.g.

	The pencil is a thing. The pencil is undescribed.
	
To ignore these checks entirely and allow undescribed objects, say

	The check for missing descriptions when play begins rule is not listed in any rulebook.

Example: * Foobar - Shebang bin bash.

	*: "The Upper Floor"
	
	Include General by Joshua McLean.
	
	When play begins:
		let the number list be "1[br]2[br]3[br]4[br]5";
		say "This is just a standard say statement.";
		sayn "This is a sayn statement. It should end in a newline.";
		sayn "The [i]number list[/i] is:[/p][the number list]";
		sayn "[b]Prime numbers[/b] are:[/p][the number list without line 4]";
		let the new number be "4.5";
		sayn "If we put [b]4.5[/b] where it belongs we have:[/p][insert the new number into the number list after line 4]";
		[sayn "If we replace 3 with 4.5 we get:[/p][replace the number list line 3 with the new number]".]
	
	The Somewhere is a room. "A place, somewhere." A thing called the foobar is here. It is without description.