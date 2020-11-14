Shopping by Joshua McLean begins here.

"Basic shop handling with a purse automatically held by the player. A shop is a room with a matching shopkeeper who stops the player from leaving with unpaid goods. Implements PAY FOR (thing) and PAY (shopkeeper), as well as DROP UNPAID and LIST to see all items available in a shop with prices."

Include General by Joshua McLean.

Section 1 - Purse

A person has a number called the coins carried. The coins carried is usually 0.

A thing called the purse is carried by the player. Understand "coin" and "coins" as the purse. After printing the name of the purse while taking inventory, say " (with [coins carried of the player] coins)". The description is "A small purse[if the coins carried of the player is 0]. It's empty.[otherwise] with [coins carried of the player] coins."

To give (count - a number) coins to (target - a person):
	increase the coins carried of the target by count.
	
To take (count - a number) coins from (target - a person):
	decrease the coins carried of the target by count.

Section 2 - Purchasable

A thing has a number called the coin value. The coin value of a thing is usually 1.

A thing can be paid or unpaid. A thing is usually paid.

After printing the name of an unpaid thing while taking inventory:
	say " (unpaid)".

Section 3 - Shopkeeper and Shop

A shopkeeper is a kind of person. A shopkeeper has a number called the expected payment. A shopkeeper can be expecting pay. A shopkeeper is usually not expecting pay.

A shop is a kind of room. A shop has a shopkeeper called the owner. No shop keeper is a shopkeeper. They are nowhere. They are without description.

Section 4 - Shopkeeper Conversation (for use with Conversation Framework by Eric Eve)

Check quizzing a shopkeeper (called the owner) about something (called the target) when the player is in a shop (called the current shop):
	if the owner is not the owner of the current shop, say "'That's not [i]my[/i] [target],' [regarding the owner][they] [say]. 'You'll have to ask [the owner of the current shop].'" instead.
Report quizzing a shopkeeper (called the owner) about something (called the target) when the player is in a shop (called the current shop):
	say "[regarding the owner][They] considers [the target]. 'That'll be [coin value of the target] coins.'" instead.

Section 5 - Listing

Shop listing is an action applying to nothing. Understand "list" as shop listing.
Check shop listing:
	if the player is not in a shop, say "[The actor] [are] sure there's a shop around here somewhere." instead.
Report shop listing:
	say "You see the following for sale:[br]";
	repeat with item running through visible unpaid things:
		say "  [item] for [coin value of item] coins[br]".
		
Section 6 - Bribing

A person has a number called the bribe amount. The bribe amount is usually 0.

Bribing wrongly is an action applying to one visible thing. Understand "bribe [someone]" as bribing wrongly. Report bribing wrongly: say "Try giving them coins instead."

Giving coins with no amount is an action applying to one visible thing. Understand "give coins to [someone]" and "give [someone] coins" and "give coin to [someone]" and "give [someone] coin" as giving coins with no amount. Report giving coins with no amount: show bribe syntax for the noun with "#".

Giving coins wrongly is an action applying to one visible thing and one number. Understand "give [someone] [number] coin" and "give [someone] [number] coins" as giving coins wrongly. Report giving coins wrongly: show bribe syntax for the noun with "[number understood]".

Instead of giving the purse to someone, show bribe syntax for the second noun with "#".

To show bribe syntax for (target - person) with (n - text):
	let the name be "[the target]" in upper case;
	say "Use [i]GIVE [n] COINS TO [the name][/i] instead."

Bribing is an action applying to one number and one visible thing. Understand "give [number] coin to [someone]" and "give [number] coins to [someone]" as bribing.
Check bribing:
	if the number understood is greater than the coins carried of the player, say "You don't have that many coins." instead;
	if the second noun is bribed:
		say "[The second noun] [do] not need any more." instead.
Carry out bribing:
	if the bribe amount of the second noun is 0:
		say "[regarding the noun][The second noun] [don't] seem interested in your money.";
	otherwise:
		say "[The actor] [give] [the number understood] coins to [the second noun].";
		take the number understood coins from the player;
		give the number understood coins to the second noun;
		try finishing bribing the second noun.

Definition: a person is bribed if the coins carried of it is greater than the bribe amount of it.

Finishing bribing is an action applying to one visible thing.
Check finishing bribing:
	if the noun is not bribed, stop the action.

Section 7 - Paying

To decide what number is the total amount owed:
	let the total amount be 0;
	repeat with item running through unpaid things carried by the player:
		increase the total amount by the coin value of the item;
	repeat with item running through unpaid things worn by the player:
		increase the total amount by the coin value of the item;
	decide on the total amount.

Paying to them is an action applying to one visible thing. Understand "pay [someone]" as paying to them.
Check paying to them:
	if the player is not in a shop, say "You can only pay in shops." instead;
	if the noun is not a shopkeeper, say "You should only pay shopkeepers." instead;
	if the noun is not the owner of the location of the player, say "You should probably pay the owner of the shop, [owner of the location]." instead;
	if the total amount owed is greater than the coins carried of the player, say "You owe [total amount owed] coins but only have [coins carried of the player]." instead.
Carry out paying to them:
	say "You pay [total amount owed] coins to [owner of the location] for all of your items.";
	take total amount owed coins from the player;
	repeat with item running through unpaid things carried by the player:
		now the item is paid;
	repeat with item running through unpaid things worn by the player:
		now the item is paid.

Paying for it is an action applying to one visible thing. Understand "pay for [something]" as paying for it.
Check paying for it:
	if the location of the player is not a shop, say "You're not in a shop!" instead;
	if the noun is paid, say "You already paid for that." instead;
	if the player is not carrying the purse, say "You need a purse to pay for [the noun]." instead;
	if the coins carried of the player is less than the coin value of the noun, say "You don't have enough to pay for [the noun]." instead.
Carry out paying for it:
	take coin value of the noun coins from the player;
	now the noun is paid.
Report paying for it:
	say "You give [coin value of the noun] coins to [owner of the location of the player] to pay for [the noun].".

The block buying rule is not listed in any rulebook. Instead of buying something, say "Try PAY FOR instead."

Section 8 - Shoplifting

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
	
	When play begins:
		give 15 coins to the player.
	
	The Adventurers Shop is a shop. "A shop for adventurers. The street is north."
	A male shopkeeper called John is here. He is without description. The owner of the adventurers shop is John.

	A female shopkeeper called Susan is here. She is without description.
	A man called Thomas is here. He is without description. The bribe amount is 5.
	After bribing when the second noun is Thomas and Thomas is not bribed:
		say "He tilts his head. 'Perhaps you could give a bit more?'".
	After finishing bribing Thomas:
		say "He smiles. 'Thank you.'".
	
	A supporter called the countertop is here. Understand "counter" and "counter top" as the countertop. The description is "A broad, wooden counter for holding goods."
	An unpaid thing called the sword is on the countertop. The coin value of the sword is 8. It is without description.
	An unpaid wearable thing called the shield is on the countertop. The coin value of the shield is 10. It is without description.
	An unpaid wearable thing called the helmet is on the countertop. The coin value of the helmet is 4. It is without description.
	
	A dagger is carried by the player. The coin value of the dagger is 2. It is without description.
	
	After dropping something in the adventurers shop:
		say "You drop [the noun] on the floor. With a grumble, John picks it up and replaces it on the countertop.";
		now the noun is on the countertop.
	
	The Street is north of the adventurers shop. "An empty cobblestone street. The shop is south."
	
	Test me with "list / ask thomas about sword / ask susan about sword / ask john about sword / get sword / get shield / wear shield / get helmet / n / inventory / pay for sword / pay for shield / pay thomas / pay susan / pay john / pay for helmet / inventory / n / drop unpaid / n".