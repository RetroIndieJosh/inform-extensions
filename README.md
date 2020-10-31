# Inform Extensions

(c)2020 Joshua McLean 

## License

If you use any of this code as a basis for your own work, you must include the
following notice and a copy of the included `LICENSE.md`.

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

## TO DO

replace dependencies with (for use with X):
- memory (review after general)
- shopping (review after general)
- time management
- violence
- general

tests:
- general
- books
- household items
- liquids & containers
- music
- time management
- violence

documentation:
- general
- books
- household items
- liquids & containers
- music
- time management
- violence

## General

- bare bones, could have more
- some parts could be their own extension but not enough content
- should focus on things to be used across all extensions

## Books

- should handle pagination for extneded book reading

## Household Items

- descenders not updated or tested, may want to restructure
- movable descenders? i.e. ladder, stepstool

## Keypad

- text keypads for codes with letters
- reset button on keypads
- handle relocking
- generalize unlocking feature to handle any action on success

## Liquids and Containers

## Memory

- don't remember what's in a container or on a supporter if you haven't seen
  the things (or describe them when remembering?)
- remember rooms in addition to things
- forget things/rooms (difficult because they may not be visible)
- forget specific text (difficult because they would need some sort of
  numerical handle and to be stored in a dynamic array rather than a single
  text)
- warn if text memory getting too long (Glulxe is good up to 10,000 chars or
  so)

## Music

- link audio files to instrument playing
- more complex instrument playing

## People

- rename to "People and Animals"

## Shopping

- after first move attempt, allow second for stealing, reset after each payment
- could go all-out with a "wanted level" and guards/police (like Skyrim)
- sell items (reduced price)
- shopkeeper coin tracking (economy)

## Time Management

- this would be an easy one to write tests for

## Violence

- left/right hand handling
- actual combat system
