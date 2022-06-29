People by Joshua McLean begins here.

"People handling, including anonymous characters and introductions, zero-bulk worn items, sleeping/waking, seeing a character's inventory, and improvements built over Eric Eve's Conversation Framework."

[Include General by Joshua McLean.

Include Conversation Framework by Eric Eve. [18,872]
Include Bulk Limiter by Eric Eve. [2,272]]

Section 1 - Life

A person can be alive or dead. A person is usually alive.

Section 2 - Giving, Taking, and Knowing

The block giving rule is not listed in the check giving it to rulebook.

Knowing relates one person to various things. The verb to know means the knowing relation.

Section 3 - Unknown People and Introductions

Understand "person" as a visible person. Understand "man" as a visible man. Understand "woman" as a visible woman.

A person can be introduced. A person is usually not introduced. 
An animal has some text called the animal type. The animal type is usually "animal".
To introduce (target - person): 
	now the target is introduced;
	if the target is a man:
		now the printed name of the target is "man called [real name of the target]";
	otherwise if the target is a woman:
		now the printed name of the target is "woman called [real name of the target]";
	otherwise if the target is an animal:
		now the printed name of the target is "[animal type of the target] called [real name of the target]".

When play begins: introduce the player.

A person has text called the real name. The real name is usually "Anonymous".

Section 4 - Worn Objects Have Zero Bulk

To decide what number is the free capacity of (targetperson - a person): 
	let sum be the total bulk of the things carried by targetperson which are not worn; 
	now sum is the bulk capacity of the targetperson minus sum;  
	decide on the sum.

Section 5 - Sleep

A person can be awake or asleep. A person is usually awake.

The block waking up rule is not listed in any rulebook.
Check waking up:
	if the player is awake, say "Unfortunately, this is no dream." instead.
Carry out waking:
	now the player is awake.
Report waking:
	say "With a stretch and a yawn you enter the waking world."

The block waking rule is not listed in the check waking rulebook.
Check waking:
	if the noun is awake, say "[The noun] is already awake." instead.
Carry out waking:
	now the noun is awake.
Report waking:
	say "[The noun] awakens."

Section 6 - Show Person's Inventory

After examining a person (called the target) (this is the show carried and worn items rule):
	let the carry description be "";
	let the wear description be "";
	if the noun wears something:
		now the wear description is "[wear] [a list of things worn by the noun]";
	if the noun carries something:
		now the carry description is "[regarding the target][They] [carry] [a list of things carried by the noun]";
		if the noun wears something:
			say "[regarding the target][the carry description], and [they] [the wear description].";
		otherwise:
			say "[regarding the target][the carry description].";
	otherwise if the noun wears something:
		say "[regarding the target][They] [the wear description].";
	continue the action.

Section 7 - Conversation and Subjects (For use with Conversation Framework by Eric Eve)

Instead of requesting a person (called the actor) for something (called the target):
	say "[The actor] doesn't seem interested in giving you [the target]."

Understand "hello [someone]" and "hi [someone]" and "hey [someone]"as saying hello to.

Understand "goodbye [someone]" and "bye [someone]" as saying goodbye to.

Responding is an action applying to one topic. Understand "respond [text]" as responding. Report responding: say "Try the format [b]ANSWER (response) TO (person)[/b] or [b](person), (response)[/b] instead."

Their name is a subject.

After quizzing someone about their name:
	if the noun is an animal:
		say "[regarding the noun]You ask [the animal type] but get no response.";
	otherwise:
		say "'My name is [real name],' [they] [say]. 'Nice to meet you.'";
		introduce the noun.
		
Section 8 - Wandering

Going randomly is an action applying to nothing.

Carry out someone going randomly:
	let space be the holder of the person asked;
	let place be a random room which is adjacent to the space;
	let way be the best route from the space to the place;
	try the person asked going way.

A person can be wandering. A person is usually not wandering.
A person has a number called the wander turns. The wander turns is usually 1.
A person has a number called the wander countdown. The wander countdown is usually 1.

When play begins:
	Repeat with actor running through wandering people:
		now the wander countdown of the actor is the wander turns of the actor.

Every turn:
	Repeat with actor running through wandering people:
		if the wander countdown of the actor is 0:
			try actor going randomly;
			now the wander countdown of the actor is the wander turns of the actor;
		otherwise:
			decrement the wander countdown of the actor.
			
Section  - Stop Followers Wandering (for use with Simple Followers by Emily Short)

Check someone going randomly:
	if the person asked is shadowing someone, stop.

People ends here.

---- DOCUMENTATION ----

Various miscellany for handling people: showing inventory, handling conversation, and life simulation (life, death, sleep, etc.).

Section - Introductions

People are initially unintroduced and will go by whatever descriptor you use for their character. For unintroduced characters, you must include a 'real name' with their proper name and use an 'understand' statement so the player can use the real name after learning it. You usually want an indefinite article (a/an) for the character's internal name to get the correct articles (indefinite in listings, definite when referring to that specific person).

A typical unintroduced character creation goes as follows. To make the name known, use the 'introduce' verb:

	A man called a brown-eyed man is here. Understand "Joshua" as the man. The real name is "Joshua".
	
	After giving the chocolate to a brown-eyed man:
		say "'Oh, chocolate!' he says. 'I love it. Thanks. I'm Joshua, by the way.'";
		introduce a brown-eyed man.
		
After this point, the 'brown-eyed man' will be called Joshua. Note that the player may refer to the character by name at any point even if they are not introduced.

Section - Animals

Animals are given an 'animal type' to be used in the necessary context.

	Rufus is an animal. The animal type is 'dog'.
	
	After petting an animal:
		say "You pet [the animal type of the noun]."

Example: * Introductions - Get names from several people, and a dog!

	*: "Introductions"
	
	Include Conversation Framework by Eric Eve.
	
	Include General by Joshua McLean.
	Include People by Joshua McLean.
	
	The check for missing descriptions when play begins rule is not listed in any rulebook.
	
	The Party Room is a room. 
	A man called a balding man is here. Understand "John" as the balding man. The real name is "John".
	A woman called a dark-haired woman is here. Understand "Susan" as the dark-haired woman. The real name is "Susan". Susan carries a thing called garlic.
	A man called a bearded man is here. Understand "Pete" as a bearded man. The real name is "Pete". He wears a cowboy hat and cowboy boots. He carries a revolver.
	A woman called a pale woman is here. Understand "Darla" as the pale woman. The real name is "Darla".
	An animal called a brown dog is here. Understand "Rufus" as a brown dog. The real name is "Rufus". The animal type is "dog".

	Instead of quizzing someone about a brown dog:
		say "[regarding the noun]'I think it belongs to Darla,' [they] [say]."
	Instead of quizzing a pale woman about a brown dog:
		say "'Oh, Rufus! He's mine.' She smiles at the mutt.";
		introduce a brown dog.
	
	Test me with "ask bearded man about name / look / ask dark-haired woman about name / look / ask balding man about name / look / ask pale woman about name / look / hi dog / look / ask John about dog / ask Darla about dog / look".
	
Example: * Wander - People wandering about.

	*: "Wander"
	
	Include Simple Followers by Emily Short.
	
	Include General by Joshua McLean.
	Include People by Joshua McLean.
	
	The check for missing descriptions when play begins rule is not listed in any rulebook.
	
	When play begins, seed the random-number generator with 17.
	
	The Square Center is a room.
	The Square NW is northwest of the square center.
	The Square NE is northeast of the square center.
	The Square N is north of the square center and west of the square ne and east of the square nw.
	The Square W is west of the square center and south of the square nw and southwest of the square n.
	The Square E is east of the square center and south of the square ne and southeast of the square n.
	The Square SE is southeast of the square center and south of the square e.
	The Square SW is southwest of the square center and south of the square w.
	The Square S is south of the square center and west of the square se and east of the square sw and southeast of the square w and southwest of the square e.

	A wandering man called John is in the square ne.
	A wandering woman called Susan is in the square nw.
	A wandering man called Paul is in the square se.
	A wandering woman called Agatha is in the square sw.
	A wandering man called Filip is in the square e.
	A wandering woman called Leslie is in the square w.
	A wandering man called Curtis is in the square center. He is shadowing yourself.
	A wandering animal called the turtle is in the square e. The wander turns is 10.

	Test me with "z / w / n / e / se / sw / e / n / z / z / z".