Music by Joshua McLean begins here.

"based on excerpts from The Art of Fugue by Victor Gijsbers, Jimmy Maher, Dorte Lassen, and Johan"

Section 1 - Audio

To loopplay (SFX - sound name):
	(- PlaySoundLoop(ResourceIDsOfSounds-->{SFX}); -).

Include (-
[ PlaySoundLoop resource_ID;
   if (resource_ID == 0) return;
   ResourceUsageFlags->resource_ID = true;
   if (glk_gestalt(gestalt_Sound, 0)) {
	  glk_schannel_play_ext(gg_foregroundchan, resource_ID, -1, 0);
   }
];
-).

To soundstop (SFX - sound name):
	(-StopSound(ResourceIDsOfSounds-->{SFX}); -).

Include (-
[ StopSound resource_ID;
   if (resource_ID == 0) return;
   ResourceUsageFlags->resource_ID = true;
   if (glk_gestalt(gestalt_Sound, 0)) {
	  glk_schannel_stop(gg_foregroundchan);
   }
];
-).

Yourself can be music enabled or music disabled.
The active background music is a sound name that varies.

Stopping music is an action out of world. Understand "stop music" and "end music" and "stop sound" and "end sound" and "music off" and "sound off" as stopping music.

Carry out stopping music:
	soundstop the active background music.
	
Report stopping music:
	say "Music is now turned off.";
	now the player is music disabled.
	
Starting music is an action out of world. Understand "start music" and "begin music" and "continue music" and "start sound" and "begin sound" and "continue sound" and "music on" and "sound on" as starting music.

Carry out starting music:
	loopplay the active background music;
	now the player is music enabled.
	
Report starting music:
	say "Music is now turned on."
	
A room has a sound name called the background music.

When play begins: 
	now yourself is music enabled;
	now the active background music is the background music of the location of the player;
	silently try starting music.

After looking in a room when the background music of the location of the player is not the active background music:
	silently try stopping music;
	now the active background music is the background music of the location of the player;
	if the player is music enabled, silently try starting music.

Section 2 - Instruments

An instrument is a kind of thing.

Playing it is an action applying to one carried thing. Understand "play [something]" as playing it.

Check playing it:
	if the noun is not an instrument, say "You can only play an instrument." instead;
	if the noun is not carried:
		[silently try taking the instrument;]
		if the noun is carried, say "(first taking [the noun])";
		otherwise say "You can't play [the noun] unless you are carrying it." instead.

Report playing it:
	say "You play [the noun] to beautiful effect."

Music ends here.

---- DOCUMENTATION ----

Change the background music with

	now the background music is the file "whatever.ogg"
	
Supported formats are ogg and mp3.

Also included are the commands STOP MUSIC and START MUSIC for toggling music on/off.

Example: * Music - Play background music

	*: "Music"

	Include Music by Joshua McLean.

	Release along with a file of "Test 1" called "Sounds\test.ogg".
	Release along with a file of "Test 2" called "Sounds\test2.ogg".

	Sound of Test 1 is the file "test.ogg".
	Sound of Test 2 is the file "test2.ogg".

	The Listening Room is a room. "Music fills the air." The background music is sound of test 1.
	
	The Other Listening Room is east of the listening room. "Music continues to fill the air." The background music is sound of test 1.

	The Outdoors is south of the listening room and southwest of the other listening room. "Something sounds different here." The background music is sound of test 2.