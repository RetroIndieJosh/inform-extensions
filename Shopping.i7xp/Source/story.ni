"Purchasing Equipment"

Include Shopping by Joshua McLean.

When play begins:
	give the player 15 coins.

The Adventurers Shop is a shop. "A shop for adventurers. The street is north."
A male shopkeeper called John is here. He is without description. The owner of the adventurers shop is John.

A female shopkeeper called Susan is here. She is without description.
A man called Thomas is here. He is without description.

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
