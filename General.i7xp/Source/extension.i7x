General by Joshua McLean begins here.

[Commented-out extensions are ones I considered using but decided against. They remain here so I know the sizes in case I want to reintroduce them.]
[Standard Rules + English Language = 389,856 / 134,432 free]

Include Locksmith by Emily Short. [13,080]
Include Postures by Emily Short. [12,264]
Include Exit Lister by Eric Eve. [7,608]
[Include Simple Followers by Emily Short. [7,544]]
Include Epistemology by Eric Eve. [2,616]
Include Bulk Limiter by Eric Eve. [2,272]
Include Variable Time Control by Eric Eve. [1,760]
Include Skeleton Keys by Emily Short. [240]
Include Alternatives by Eric Eve. [96]

Use American dialect, [brief room descriptions, ]scoring, and the serial comma.

[Chapter - Release Extensions - For release only]

[Use memory economy.]

[Extensions with automatic game changes to make it easier to play. Don't compile for debug so we can compile faster.]

[Include Smarter Parser by Aaron Reed. [33,928]]
[Include Title Page by Jon Ingold. [8,096]]

[todo go through these]
[Include Small Kindnesses by Aaron Reed. [7,360]
Include Commonly Unimplemented by Aaron Reed. [4,952]
Include Numbered Disambiguation Choices by Aaron Reed. [2,600]
Include Reversed Persuasion Correction by Juhana Leinonen. [1,568]
Include Response Assistant by Aaron Reed. [1,368]]
[~?k free to successfully compile]

Section 1 - Testing (Debug) - Not for release

An object can be without description. A subject is usually without description.

light-meter is without description. [not sure where this comes from but this keeps it out of our list]

When play begins (this is the check for missing descriptions when play begins rule): 
	repeat with item running through things:
		if description of the item is "" and the item is not without description:
			say "- thing '[item]' has no description[br]";
	repeat with place running through rooms:
		if description of the place is "" and the place is not without description: 
			say "- room '[place]' has no description[br]"

Section 2 - Testing (Release)

After reading a command (this is the ignore beta-comments rule): 
	if the player's command matches the regular expression "^\p": 
		say "(Noted.)"; 
		reject the player's command. 

Section 3 - Default Responses

A thing can be examined. A thing is usually not examined. After examining something (called the target): now the target is examined.

Instead of taking some scenery, say "That's not the sort of thing you can carry around."

Section 4 - Bulk

The bulk of a thing is usually 5. The bulk capacity of the player is 20.

Section 5 - Vulgarity

Being vulgar is an action applying to nothing. Understand "shit", "fuck", "damn", "ass", "motherfuck", "motherfucker", "bullshit", "dammit", "damnit", "goddamn", and "bitch" as being vulgar.
Report being vulgar:
	say "We'll have none of that!"
Being vulgar to is an action applying to one topic. Understand "shit [text]", "fuck [text]", "damn [text]", "[text]shit", "[text]damn", and "[text]fuck" as being vulgar to.
Carry out being vulgar to:
	try being vulgar.

Section 6 - Text Handling

To say i -- beginning say_i -- running on: (- style underline; -). 
To say /i -- ending say_i -- running on: (- style roman; -). 
To say b -- beginning say_b -- running on: (- style bold; -). 
To say /b -- ending say_b -- running on: (- style roman; -). 
To say /p: say paragraph break.
To say br: say line break.

To sayn (str - text):
	say "[str][/p]".

To say (str - some text) without line (n - a number):
	let result be "";
	repeat with curline running from 1 to the number of lines in str:
		if curline is not n:
			let line be line number curline in str;
			now result is "[result][line][br]";
	say result.

[When play begins:
	let t be "This is the first line[br]and the second line[br]but now this should be the second line.";
	now t is "[t without line 2]";
	say "[t]".]

Section 7 - Saving

[count saves]
The number of saves is a number which varies.
Check saving the game: increment the number of saves; continue the action.

Section 8 - Pulling

The report pulling rule is not listed in the report pulling rulebook.
A thing can be pullable. A thing is usually not pullable. Definition: a thing is unpullable if it is not pullable.
Check pulling:
	if the noun is not pullable, say "You can't pull that." instead.
		
Section 9 - Default Scenery

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
	
	The Office is a room. ["A small office room with a desk, an accompanying chair, and a second, more comfortable chair in the corner." A scenery chair called the desk chair is here. A scenery chair called the comfortable chair is here. A scenery bed called the desk is here.
	
	The Bedroom is west of the office. A scenery bed called the king size bed is here.]
