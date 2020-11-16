Books by Joshua McLean begins here.

Section 1 - Readability

A book is a kind of thing. A book has a list of text called pages. A book can be read or unread. A book is usually unread.

After examining a book, say "It [have] [number of pages in the noun] pages."

To add page (str - text) to (b - a book):
	add str to the pages of b.
	
To add (l - list of values) to (b - a book):
	repeat with p running through l:
		add page p to b.

Section 2 - Reading

To read (he reads, they read, he read, it is read, he is reading) is a verb.

To decide what number is the number of pages in (b - book):
	decide on the number of entries in the pages of b.

To display page (n - number) in (b - book):
	let str be entry n from the pages of b;
	say "Page [n] reads: '[str]'[paragraph break]".

Understand the command "read" as something new.
The empty book description is text that varies. The empty book description is "It's blank."
Reading it is an action applying to one visible thing and requiring light. Understand "read [something]" as reading it.
Check reading it:
	if the noun is not a book, say "That's not readable." instead;
	if the number of pages in the noun is 0, say "[empty book description]" instead.
Carry out reading it:
	repeat with n running from 1 to the number of pages in the noun:
		display page n in the noun;
	now the noun is read.

Reading an ambiguous book page is an action applying to one number. Understand "read page [number]" as reading an ambiguous book page.
Carry out reading an ambiguous book page:
	let n be the number understood;
	let booklist be a list of books;
	repeat with b running through visible books:
		if n is at most the number of pages in b:
			add b to booklist;
	if the number of entries in booklist is greater than 1:
		say "Which book? [booklist]" instead;
	if the number of entries in booklist is 0:
		say "No visible book has a page [n]." instead;
	display page n in entry 1 of booklist.

Reading a book page is an action applying to one visible thing and one number and requiring light. Understand "read [something] page [number]" as reading a book page.
Check reading a book page:
	if the noun is not a book, say "That only makes sense with books." instead;
	let n be the number understood;
	if n is greater than the number of pages in the noun:
		say "[The noun] [are] only [number of pages in the noun] pages." instead.
Carry out reading a book page:
	let n be the number understood;
	display page n in the noun.

Books ends here.


---- DOCUMENTATION ----

A book is a thing that can be read. If a book has one page, simply reading the book will show the first page. Otherwise, the player can READ (book) PAGE (number) to get a specific page, or READ (book) to see the full text.

If the player tries to READ PAGE (number) without specifying a page, the first visible book is assumed to be the target.
	
Example: * Books - Reading a book.

	*: "Books"
	
	Include Books by Joshua McLean.
	
	The Library is a room.
	
	A book called Calculus is here. Understand "book" as Calculus.
	When play begins:
		let pagelist be { "Welcome to Calculus! You will learn limits, derivatives, and integrals.",  "The limit as x goes to 0 of the function 3x + 1 is 1.", "The limit as x goes to infinity of the function (3x + 1)/(3x^2 - 2) is 0.", "The derivative of 4x^2 + 2x + 8 is 4x + 2.", "The derivative of sin x is cos x.", "Integrals are boring. Don't worry about those." };
		add pagelist to Calculus.
	A book called Cooking is here. Understand "book" as Cooking.
	When play begins:
		let pagelist be { "A recipe for Chicken Francese...", "A recipe for Chicken Marsala...", "A recipe for something that isn't chicken..." };
		add pagelist to Cooking.
		
	The Reading Area is east of the library.

	Test me with "get calculus / east / read book / read page 2 / drop book / w / read page 5 / read page 1 / get book / e / read page 4 / read calculus page 4".