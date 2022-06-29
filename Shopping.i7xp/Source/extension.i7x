Shopping by Joshua McLean begins here.

"Basic shop handling with a purse automatically held by the player. A shop is a room with a matching shopkeeper who stops the player from leaving with unpaid goods. Implements PAY FOR (thing) and PAY (shopkeeper), as well as DROP UNPAID and LIST to see all items available in a shop with prices."

Include General by Joshua McLean.

Section 1 - Verbs

To owe is a verb. To consider is a verb.

Section 2 - Coins

A coin is a kind of thing. A coin has a number called the monetary value. The monetary value is usually 1.

Section 3 - Purse

The player carries a container called the purse. The bulk capacity of the purse is 100.
Instead of inserting something into the purse when the noun is not a coin, say "[The actor] [can] only put coins in there."
[After printing the name of the purse while taking inventory, say " (with [coins carried by the player] coins)". The description is "A small purse[if the coins carried by the player is 0]. It's empty.[otherwise] with [coins carried of the player] coins."]

To decide what number is how many coins in (c - a container):
	let the coin count be the number of coins in c;
	repeat with item running through containers in c:
		increase the coin count by how many coins in item;
	decide on the coin count.
	
To decide what number is the player coin count:
	let the coin count be the number of coins carried by the player;
	repeat with item running through containers carried by the player:
		increase the coin count by how many coins in item;
	decide on the coin count.

Section 4 - Purchasable

A thing has a number called the coin cost. The coin cost of a thing is usually 0.

A thing can be paid or unpaid. A thing is usually paid.

After printing the name of an unpaid thing while taking inventory:
	say " (unpaid)".

Section 5 - Shopkeeper and Shop

A shopkeeper is a kind of person. A shopkeeper has a number called the expected payment. A shopkeeper can be expecting pay. A shopkeeper is usually not expecting pay.

A shop is a kind of room. A shop has a shopkeeper called the owner. No shop keeper is a shopkeeper. They are nowhere. They are without description.

Section 6 - Shopkeeper Conversation (for use with Conversation Framework by Eric Eve)

Check quizzing a shopkeeper (called the owner) about something (called the target) when the player is in a shop (called the current shop):
	if the owner is not the owner of the current shop, say "'That's not [i]my[/i] [target],' [regarding the owner][they] [say]. 'You'll have to ask [the owner of the current shop].'" instead.
Report quizzing a shopkeeper (called the owner) about something (called the target) when the player is in a shop (called the current shop):
	say "[regarding the owner][They] [consider] [the target]. 'That'll be [coin cost of the target] coins.'" instead.

Section 7 - Listing

Shop listing is an action applying to nothing. Understand "list" as shop listing.
Check shop listing:
	if the player is not in a shop, say "[The actor] [are] sure there's a shop around here somewhere." instead.
Report shop listing:
	say "You see the following for sale:[br]";
	repeat with item running through visible unpaid things:
		say "  [item] for [coin cost of item] coins[br]".

Section 8 - Giving

The block giving rule is not listed in any rulebook.
The standard report giving rule is not listed in any rulebook.
Carry out giving it to:
	say "[The actor] [give] [the noun] to [the second noun].";
	now the second noun carries the noun.

Multiply-giving it to is an action applying to two things. Understand "give [things preferably held] to [someone]" and "give [things] to [someone]" as multiply-giving it to.
Check multiply-giving it to:
	let L be the multiple object list;
	repeat with item running through L:
		if item is not a coin, say "[The actor] [can't] give multiple things at once, unless they [are] all coins." instead;
	try the actor giving the noun to the second noun.

Section 9 - Bribing

A person has a number called the bribe amount. The bribe amount is usually 0.

Bribing wrongly is an action applying to one visible thing. Understand "bribe [someone]" as bribing wrongly. Report bribing wrongly: say "Try giving them coins instead."

Check giving when the noun is a coin:
	if the bribe amount of the second noun is 0:
		if the second noun is not a shopkeeper or the second noun is not the owner of the location or the total amount owed is 0:
			say "[They] [aren't] interested in your money." instead.
After giving:
	try finishing bribing the second noun.

Definition: a person is bribed if the number of coins carried by it is greater than the bribe amount of it.

Finishing bribing is an action applying to one visible thing.
Check finishing bribing:
	if the noun is not bribed, stop the action.

Section 10 - Paying

A shopkeeper has a number called the amount paid. The amount paid of a shopkeeper is usually 0.

To decide what number is the total amount owed:
	let the total amount be 0;
	repeat with item running through unpaid things carried by the player:
		increase the total amount by the coin cost of the item;
	repeat with item running through unpaid things worn by the player:
		increase the total amount by the coin cost of the item;
	decide on the total amount.
	
Instead of taking something unpaid when the player carries something unpaid:
	say "'Oy!' [the owner of the location] [say]. 'Pay for what you have first.'"

After giving a coin to a shopkeeper:
	increase the amount paid of the second noun by 1;
	if the amount paid of the second noun is greater than the total amount owed:
		now the amount paid of the second noun is 0;
		repeat with item running through unpaid things carried by the player:
			now item is paid.

Paying to them is an action applying to one visible thing. Understand "pay [someone]" as paying to them.
Check paying to them:
	if the player is not in a shop, say "You can only pay in shops." instead;
	if the noun is not a shopkeeper, say "You should only pay shopkeepers." instead;
	if the noun is not the owner of the location of the player, say "You should probably pay the owner of the shop, [owner of the location]." instead;
	if the total amount owed is greater than the player coin count, say "You owe [total amount owed] coins but only have [the player coin count]." instead.
Report paying to them:
	say "[The actor] [owe] [total amount owed] coins to [owner of the location]. Give them coins to pay your bill."

Paying for it is an action applying to one visible thing. Understand "buy [something]" or "pay for [something]" as paying for it.
Check paying for it:
	if the location of the player is not a shop, say "You're not in a shop!" instead;
	if the noun is paid, say "You already paid for that." instead;
	if the player is not carrying the purse, say "You need a purse to pay for [the noun]." instead;
	if the player coin count is less than the coin cost of the noun, say "You don't have enough to pay for [the noun]." instead.
Report paying for it:
	say "'That'll be [coin cost of the noun] coins,' [the owner of the location] [say]. [The actor] should [give] [them] some coins."
The block buying rule is not listed in any rulebook. Carry out buying: say "Use PAY FOR [noun]."[try paying for the noun.]

Section 11 - Shoplifting

Dropping unpaid is an action applying to nothing. Understand "drop unpaid" as dropping unpaid.
Carry out dropping unpaid:
	repeat with item running through unpaid things carried by the player:
		try dropping the item;
	repeat with item running through unpaid things worn by the player:
		try dropping the item.

Before going direction from a shop (called the current shop):
	if the total amount owed is greater than 0:
		say "'Hey!' says [the owner of the current shop]. 'You can't leave. You still owe me [the total amount owed] coins.'" instead.

Shopping ends here.


---- DOCUMENTATION ----

Example: * Purchasing Equipment - Getting what we need from the shopkeeper.

	*: "Purchasing Equipment"
	
	Include Conversation Framework by Eric Eve.

	Include Shopping by Joshua McLean.
	
	In the purse are 15 coins. The description of a coin is usually "A boring copper piece." The description of the purse is "A tiny wallet."
	
	The Adventurers Shop is a shop. "A shop for adventurers. The street is north."
	A male shopkeeper called John is here. He is without description. The owner of the adventurers shop is John.

	A female shopkeeper called Susan is here. She is without description.
	A man called Thomas is here. He is without description. The bribe amount is 5.
	After giving when the second noun is Thomas and Thomas is not bribed:
		say "He tilts his head. 'Perhaps you could give a bit more?'".
	After finishing bribing Thomas:
		say "He smiles. 'Thank you.'".
	
	A supporter called the countertop is here. Understand "counter" and "counter top" as the countertop. The description is "A broad, wooden counter for holding goods."
	An unpaid thing called the sword is on the countertop. The coin cost of the sword is 8. It is without description.
	An unpaid wearable thing called the shield is on the countertop. The coin cost of the shield is 10. It is without description.
	An unpaid wearable thing called the helmet is on the countertop. The coin cost of the helmet is 4. It is without description.
	
	A dagger is carried by the player. The coin cost of the dagger is 2. It is without description.
	
	After dropping something in the adventurers shop:
		say "You drop [the noun] on the floor. With a grumble, John picks it up and replaces it on the countertop.";
		now the noun is on the countertop.
	
	The Street is north of the adventurers shop. "An empty cobblestone street. The shop is south."
	
	Test me with "list / ask thomas about sword / ask susan about sword / ask john about sword / get sword / get shield / wear shield / get helmet / n / inventory / pay for sword / pay for shield / pay thomas / pay susan / pay john / pay for helmet / inventory / n / drop unpaid / n".