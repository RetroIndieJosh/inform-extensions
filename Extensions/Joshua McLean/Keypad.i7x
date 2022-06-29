Keypad by Joshua McLean begins here.

"A keypad that unlocks a locked target when the correct code is entered. Can take any numerical input values specified by a maximum and minimum."

Section 1 - Keypad Type

A keypad is a kind of thing. A keypad is usually scenery.
A keypad has some text called the pressed code. The pressed code is usually "".
A keypad has some text called the code. The code is usually "1234".
A keypad has a number called the minimum value. The minimum value is usually 0.
A keypad has a number called the maximum value. The maximum value is usually 9.
A keypad has a thing called a locked target.
To say the display of (kp - a keypad):
	if the pressed code of kp is "":
		say "the display is blank";
	otherwise:
		say "the display reads [the pressed code of kp]".
After examining a keypad (called kp), say "The keys range from [minimum value of kp] to [maximum value of kp]. Above the keypad, [the display of kp]."

Section 2 - Pushing a Number

Instead of pushing a keypad:
	say "Try pushing a specific number on [the noun] instead."

Pushing a number on is an action applying to one number and one thing. Understand "push [number] on [keypad]" as pushing a number on.

Check pushing a number on:
	if the locked target of the second noun is unlocked, say "You already unlocked [the locked target of the second noun], so no need to push buttons on [the second noun] anymore." instead;
	if the number understood is less than 0, say "Keypads don't usually have negative numbers, and [the second noun] is no exception." instead;
	if the number understood is less than the minimum value of the second noun or the number understood is greater than the maximum value of the second noun, say "There is no key for [the number understood] on [the second noun]." instead.

Carry out pushing a number on:
	let n be "[the number understood]";
	if the pressed code of the second noun is "":
		now the pressed code of the second noun is "[n]";
	otherwise:
		let old be "[the pressed code of the second noun]";
		now the pressed code of the second noun is "[old][n]";
			
Report pushing a number on:
	say "You push [the number understood] on [the second noun] and it beeps.";
	let ca be the number of characters in the pressed code of the second noun;
	let cb be the number of characters in the code of the second noun;
	if ca is cb:
		if the pressed code of the second noun is the code of the second noun:
			get the code right for the second noun;
		otherwise:
			get the code wrong for the second noun.

To get the code right for (kp - a keypad):
	say "A jingle comprised of several beeps suggests the code worked.";
	now the locked target of the kp is unlocked;
	now the pressed code of kp is "".
To get the code wrong for (kp - a keypad):
	say "This beep is a bit more angry than the other ones. You must have gotten the code wrong. [The kp] is now reset.";
	now the pressed code of kp is "".

Keypad ends here.

---- DOCUMENTATION ----

Example: * Keypad - A numerical keypad with a code.

	*: "Keypad"
	
	Include Keypad by Joshua McLean.

	The Exterior is a room.
	
	A locked closed door called the security door is north of the exterior.
	
	A scenery keypad called the security keypad is in the exterior. Understand "key pad" as the security keypad. The code is "1928". The locked target is the security door.
	
	To get the code right for the security keypad:
		now the security door is unlocked;
		continue the action.
	
	The Interior is north of the security door.
	
	Test me with "push 10 / push -2 / push 5 / push 3 / push 2 / push 9 / push 1 / push 9 / push 2 / push 8 / push 5 / open door / north".