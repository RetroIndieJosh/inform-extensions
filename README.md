# Inform Extensions

(c)2020 Joshua McLean 

## License

If you use any of this code as a basis for your own work, you must include the
following notice and a copy of the included LICENSE.md:

    <names of extensions>
    Copyright (C) 2020 Joshua McLean

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <https://www.gnu.org/licenses/>.

## General

- common include files
- auto startup check for missing descriptions (in debug)
- ignore commands starting with punctuation (playtester notes)
- default responses
- default bulk values
- vulgarity 
- text handling
- count saves
- pull action

Notes:

- bare bones, could have more
- some parts could be their own extension but not enough content
- should focus on things to be used across all extensions
- NO DOCUMENTATION
- MINIMAL TEST

## Books

- reading implementation
- book item?

Notes:

- should handle pagination for extneded book reading
- NO DOCUMENTATION
- NO TESTS

## Household Items

- furniture 
- descenders (stairs, ladders, etc.)
- stairs

Notes:

- descenders not updated or tested, may want to restructure
- movable descenders? i.e. ladder, stepstool
- NO DOCUMENTATION
- NO TESTS

## Keypad

- numerical keypads

Notes:

- text keypads for codes with letters
- reset button on keypads
- handle relocking
- generalize unlocking feature to handle any action on success
- fully documented & tested as of 2020-10-22

## Liquids and Containers

- containers which can hold liquid
- EMPTY containers of their contents (liquid or otherwise)
- NO DOCUMENTATION
- NO TESTS

## Memory

- REMEMBER some text
- REMEMBER any target thing (open/closed and locked/unlocked remembered)
- REMEBER a container/supporter (including its contents)
- automatically remember anything dropped
- forget anything taken
- set `auto memory` for player hints
- RECALL to get a summary of memories
- FORGET any target thing (by number on recall list)
- FORGET ALL to erase remembered text

Notes:

- don't remember what's in a container or on a supporter if you haven't seen
  the things (or describe them when remembering?)
- remember rooms in addition to things
- forget things/rooms (difficult because they may not be visible)
- forget specific text (difficult because they would need some sort of
  numerical handle and to be stored in a dynamic array rather than a single
  text)
- warn if text memory getting too long (Glulxe is good up to 10,000 chars or
  so)
- fully documented & tested as of 2020-10-22

## Music

- instruments (nothing special/unique)
- playing instruments

Notes:

- NO DOCUMENTATION
- NO TESTS

## People

- character anonymity ("real name")
- introduce people
- animal types

Notes:

- rename to "People and Animals"
- fully documented & tested as of 2020-10-22

## Shopping

- coin purse for currency handling
- shops and shopkeepers
- coin value of things
- things can be paid/unpaid
- PAY FOR thing and PAY shopkeeper to pay for all unpaid things
- theft resistance (can't leave with unpaid things)

Notes:

- after first move attempt, allow second for stealing, reset after each payment
- could go all-out with a "wanted level" and guards/police (like Skyrim)
- sell items (reduced price)
- shopkeeper coin tracking (economy)
- fully documented & tested as of 2020-10-22

## Time Management

- built on top of Eric Eve's Variable Time Control
- reasonable defaults
- xyzzy command to see current time

Notes:

- this would be an easy one to write tests for
- NO DOCUMENTATION
- NO TESTS

## Violence

- weapon type
- WIELD weapon (one at a time)
- DISARM weapon (remove)
- KICK synonym for attack
- allow attacking (but not really because it just says it's not nice)

Notes:

- left/right hand handling
- actual combat system
- NO DOCUMENTATION
- tests need revision
