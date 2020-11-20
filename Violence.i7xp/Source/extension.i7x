Violence by Joshua McLean begins here.

Include General by Joshua McLean.

Section 1 - Weapons and Wielding

A weapon is a kind of thing.
A person can be armed or unarmed. A person is usually unarmed.
A person has a thing called the wielded weapon.

To wield (w - a weapon):
	now the wielded weapon of the player is w;
	now the player is armed.
To decide whether the player wields (w - a weapon):
	if the wielded weapon of the player is w, yes;
	otherwise no.

Attacking it with is an action applying to two visible things. Understand "attack [something] with [something]" as attacking it with.
Carry out attacking it with:
	silently try arming the second noun;
	if the player wields the second noun:
		say "(first wielding [the second noun])[/p]";
	try attacking the noun.

Arming is an action applying to one carried thing. Understand "wield [something]" as arming.
Check arming:
	if the noun is not a weapon, say "You cannot wield that." instead;
	if the player wields the noun, say "You are already wielding it!" instead;
	if the player is armed, say "You are already wielding [the wielded weapon of the player]." instead.
Carry out arming:
	wield the noun.
Report arming:
	say "You wield [the noun]."
After dropping:
	if the player is armed and the player wields the noun:
		say "You are no longer wielding [the noun].";
		now the player is unarmed;
	continue the action.
	
Disarming is an action applying to nothing. Understand "disarm" as disarming.
Check disarming:
	if the player is unarmed, say "You are not wielding a weapon." instead.
Carry out disarming:
	say "You are no longer wielding [the wielded weapon of the player].";
	now the player is unarmed.
	
After examining an armed person:
	say "[regarding the noun][They] [are] wielding [the wielded weapon of the noun].";
	continue the action.

Section 2 - Attacking

The block attacking rule is not listed in the check attacking rulebook.
Understand "kick" as attacking.
Instead of attacking the player, say "Surely there is still hope!"
Report attacking: say "That's not very nice."

Section 3 - Death

To kill (target - person) with corpse (corpse - supporter):
	now corpse is in location of target;
	now target is nowhere;
	now target is dead;
	repeat with T running through things worn by target:
		now T is carried by target;
	repeat with T running through things carried by target:
		now T is on corpse.

Violence ends here.

---- DOCUMENTATION ----

Example: * Weapons - Wielding weapons.

	*: "Weapons"
	
	Include Violence by Joshua McLean.
	
	The Armory is a room. "Many weapons are here, but only a few take your notice." 
	A weapon called the sword is here. The description is "A sharp blade with an onyx pommel."
	A weapon called the rock is here. The description is "A fist-sized rock with a natural point."
	A cloth is here. The description is "A white linen cloth."
	
	Test me with "get cloth / wield cloth / get rock / wield rock / x me / get sword / wield sword / disarm / wield sword / x me".
