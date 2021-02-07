"Flexible Survival" by Nuku Valente

Book 0 - Pre game prep stuff

Release along with an interpreter.
Use memory economy.
Use slow route-finding.
[ The following adjust Informs compiler settings so that it allocates enough space. If these values are incorrect, inform will fail to compile.]
[ To determine if one of these is your issue, use the Errors tab in the inform 7 window. ]
Use MAX_INDIV_PROP_TABLE_SIZE of 500000.
Use MAX_PROP_TABLE_SIZE of 51000000.
use MAX_STATIC_DATA of 12500000.
Use MAX_OBJ_PROP_COUNT of 1280.
use MAX_SYMBOLS of 13000000. ["Compiler finished with code 10"]
use MAX_NUM_STATIC_STRINGS of 370000. [ Code 10 ]
use SYMBOLS_CHUNK_SIZE of 250000. [ Code 10 ]
use ALLOC_CHUNK_SIZE of 1450000.
use MAX_OBJECTS of 4000.
use MAX_ACTIONS of 2000.
use MAX_VERBS of 2000.
use MAX_VERBSPACE of 50000.
use MAX_ARRAYS of 100000.
[Use MAX_ZCODE_SIZE of 1000000.]
Use MAX_DICT_ENTRIES OF 5000.
Use maximum text length of at least 2000.
Use Scoring.
[ End compiler settings. ]

[To decide which number is the absolute value of (N - a number):
	if N < 0:
		let N be 0 minus N;
	decide on N.] [enable this to compile on older versions of inform]

The release number is 67.
The story creation year is 2010.
The maximum score is 2500.

[Dependencies] [Important - must get loaded early here]
Include Version 4 of Menus by Emily Short.
Include Basic Help Menu by Emily Short.
Include Basic Screen Effects by Emily Short.
Include Glulx Entry Points by Emily Short.
Include Glulx Text Effects by Emily Short.
Include Simple Graphical Window by Emily Short.
[New Graphics Handler]
Include Graphics Director by Executaball.

The file of flexiblestory is called "flexible1".

The parser error count is a number that varies.[@Tag:NotSaved] The parser error count is 0.

After printing a parser error when the parser error count is at least 0:
	increment the parser error count;
	if the turn count divided by the parser error count < three:
		say "(If you are feeling lost, try typing [italic type]help[roman type] for suggestions.)";
		now the parser error count is -1. [This ensures that we don't keep printing the message.]

Include (-
[ YesOrNo i j;
	TEXT_TY_Say((+ yes or no message +));
	for (::) {
	#Ifdef TARGET_ZCODE;
	      if (location == nothing || parent(player) == nothing) read buffer parse;
	      else read buffer parse DrawStatusLine;
	      j = parse->1;
	      #Ifnot; ! TARGET_GLULX;
	      KeyboardPrimitive(buffer, parse);
	      j = parse-->0;
	      #Endif; ! TARGET_
	      if (j) { ! at least one word entered
			i = parse-->1;
			if (i == YES1__WD or YES2__WD or YES3__WD or '1//') rtrue;
			if (i == NO1__WD or NO2__WD or NO3__WD or '2//') rfalse;
	      }
		TEXT_TY_Say((+ yes or no message +));
		YES_OR_NO_QUESTION_INTERNAL_RM('A'); print "> ";
	}
];
[ YES_OR_NO_QUESTION_INTERNAL_R; ];
-) instead of "Yes/No Questions" in "Parser.i6t".

The yes or no message is a text that varies.[@Tag:NotSaved]
The yes or no message is "[link]yes[end link] or [link]no[end link]> [run paragraph on]".

playerinput is a snippet that varies.[@Tag:NotSaved]

To select an option from (curtable - a table name):
	while 1 is 1:
		repeat with y running from 1 to number of filled rows in curtable:
			choose row y from curtable;
			say "[link][y] - [title entry][as][y][end link][line break]";
		say "Type the number corresponding to the choice you want> [run paragraph on]";
		get a number;
		if calcnumber > 0 and calcnumber <= the number of filled rows in curtable:
			now current menu selection is calcnumber;
			choose row calcnumber from curtable;
			follow the toggle entry;
			break;
		else:
			say "Invalid Selection.";

To get typed command as (S - a snippet): (-
	KeyboardPrimitive(buffer, parse);
	{S} = 100 + WordCount();  -)

To get next key as (S - a snippet): (-
	{S} = VM_KeyChar();  -)

Include (-
[ Serial s;
	for (s=0 : s<6 : s++) print (char) ROM_GAMESERIAL->s;
];
-)

Book 1 -  Core Game Files

[ DO NOT CHANGE THE ORDER IN WHICH THEY ARE LOADED ]
Include Gametables by Core Mechanics. [declares global tables for items, monsters, etc. - used in core functionality and export/import]
Include Situations by Core Mechanics. [declares situation objects and associated definitions and functions]
Include Scavenging by Core Mechanics. [declares scavenging (subtype of situations) and associated functions]
Include Time by Core Mechanics. [declares the time, date, etc. variables and associated functions]
Include Rest by Core Mechanics. [declares resting functions, and the need for sleep]
Include Inline Hyperlinks by Nuku Valente.
Include Game UI by Core Mechanics. [declares status bar details, and command prompt]
Include Lists and Banning by Core Mechanics. [declares global lists and content banning functions]
Include Game Objects by Core Mechanics. [declares object types: grab object, armament and equipment, plus associated functions ]
Include Sexual Orientation by Core Mechanics. [declares sexual orientation variables and a function to adjust them]
Include Characters by Core Mechanics. [declares person objects, the player object, creature objects, plus associated display functions]
Include Pregnancy by Core Mechanics. [declares pregnancy variables and contains associated functions ]
Include Offspring by Core Mechanics. [declares tables for varied player offspring, and an Offspring npc]
Include Inventory by Core Mechanics. [homemade inventory system to replace the Inform7 standard]
Include Infection Vials by Core Mechanics. [declares vial inventory and vial functions]
Include Infections by Core Mechanics. [declares infection and sex change functions]
Include Hunting and Exploration by Core Mechanics. [declares the hunt and explore commands]
include FS Graphics by Core Mechanics. [handles all graphics used in the game]
Include Game Start by Core Mechanics. [declares game setting variables and the start menu]
Include Presets by Core Mechanics. [presets for the game setting variables, with some documentation]
Include Leveling by Core Mechanics. [declares the level up function]
Include Misc Pieces by Core Mechanics.
Include Help by Core Mechanics. [adjusts the standard help to match FS]
Include Story Skipper by Core Mechanics. [declares export/import system for version-spanning transfers - standard variables]
Include Story Skipper Loose Variables by Core Mechanics. [declares export/import system for version-spanning transfers - loose variables]

Book 2 - More Core Mechanics

Include Alt Combat by Core Mechanics.
Include Alt Vore by Core Mechanics.
Include AlcoholMechanics by Core Mechanics.
Include Assorted Items by Stripes.
Include Basic Functions by Core Mechanics.
Include Basic Locations by Core Mechanics.
Include Basic Shops by Core Mechanics.
Include BFandI by Core Mechanics.
Include Bound State Universals by Core Mechanics.
Include Debugging Tools by Core Mechanics.
Include Definitions by Core Mechanics.
Include Expanded Clothing Mechanics by Core Mechanics.
Include Equipment by Core Mechanics.
Include Feats by Core Mechanics.
Include Fighting by Core Mechanics.
Include Fucking by Core Mechanics.
Include Game Endings by Core Mechanics.
Include Gender Pronouns by Core Mechanics.
Include Masturbate by Core Mechanics.
Include Microwave by Core Mechanics.
Include Milking by Core Mechanics.
Include Misc Items by Core Mechanics.
Include Navigation by Core Mechanics.
Include Notes by Core Mechanics.
Include Needy Heat by Core Mechanics.
Include Patron Credits by Nuku Valente.
Include Pets by Core Mechanics.
Include Quest Log by Core Mechanics.
Include Sex and Infection Functions by Core Mechanics.
Include Status View by Core Mechanics.
Include Store Mechanics by Core Mechanics.
Include Special Merchandize by Core Mechanics.
Include Tape Inventory by Core Mechanics.
Include Text Capture by Eric Eve.
Include Vending Machine by Core Mechanics.
Include Weapons by Core Mechanics.

Book 3 - Loading the Main Game Content

Part 1 - Locations

Include Apocalypse Store by Omen.
Include Approaching the Capitol Building by Guest Writers.
Include Astor by Rikaeus.
Include Astroslide Field Locker-room by Kernog.
Include Astroslide Field Showers by Kernog.
Include Astroslide Football Field by Kernog.
Include Atlantis by Rikaeus.
Include Avalon by Taelyn.
Include Azrael by Rikaeus.
Include Beach by Speedlover.
Include Bargain Bin by Wahn.
Include Black Market by Luneth.
Include Black Market Items by Luneth.
Include Body Shop by Wahn.
Include Branson & Partner by Wahn.
Include Bunker Communal Shower Events by Luneth.
Include Camp Bravo by Wahn.
Include Tenvale College Campus by Rikaeus.
Include Dog House by Kaleem mcintyre.
Include Down Under Pub by Stripes.
Include Equinoid Camp by Song.
Include Farm by Wahn.
Include Gloryhole by SgtPepper234.
Include Hellfire Club by Gherod.
Include High Rise District by Guest Writers.
Include Hitching Post by SgtPepper234.
Include Hospital by Stripes.
Include Hyena Hideout by Stripes.
Include Junkyard and Warehouse by Wahn.
Include Kitsune Hideaway by Shadowwolf94.
Include Mall Community Center by Wahn.
Include Mall Residents by Rikaeus.
Include Medical Checkups by Stripes.
Include Milking Facility by Kernog.
Include Museum by Sarokcat.
Include New Ewe Store by Luneth.
Include PIG Frat by Stripes.
Include Pirate Island by Sarokcat.
Include Power Plant by Hellerhound.
Include Qytat a'th Lundrues by Hellerhound.
Include Red Light District by Wahn.
Include Shag Shack by Wahn.
Include Stablemasters by Sarokcat.
Include Stables Hotel by Sarokcat.
Include State Fair by Sarokcat.
Include Tattoo Parlor by Sarokcat.
Include Tiger Den by Sarokcat.
Include Tyr's Club by Kaleem mcintyre.
Include Underwater Zone by Hellerhound.
Include Urban Forest by Stripes.
Include Void Realm by Gherod.
Include Vohr Island by Kernog.
Include Zephyr Inc by Nuku Valente.
Include Zoo by Wahn.

Part 2 - Quests & Events

Include AG Beach Events by Aureas Gigas.
Include Ancient Tome by Wahn.
Include Additional Tome Scenes by Dys.
Include Apartment 319 by Kaleem Mcintyre.
Include Assorted Events by Stripes.
Include Beach Events by Sarokcat.
Include Black Pearl by Lone Wanderer.
Include Bouncy Castle by Stripes.
Include Broken Husky Bad-End by Luneth.
Include Brookstone Books by Guest Writers.
Include Campus Events by Wahn.
Include Campus Lovers by CloserHenry.
Include Campus Couple NPC by CloserHenry.
Include CandyShop by Stripes.
Include Capitol Events by Blue Bishop.
Include Carrypacks by Indigo Eclipse.
Include Catapult Encounter by Hellerhound.
Include Central Library by Stripes.
Include Consolidated Outside Events by Song.
Include Consolidated Park Events by Song.
Include Chase by Luneth.
Include Chance Meetings by Kernog.
Include Combat Helmet by Nuku Valente.
Include Control Pills by Hellerhound.
[Include Disorganization by Kaleem mcintyre.] [Disabled till review]
Include Diego Events by Vinickus.
Include Dmitri the Peacock by Aureas Gigas.
Include Dry Plains Events by Stripes.
Include Endings by Darthan.
Include E-shocker by Stripes.
Include Eva by Kurainyx.
Include Event Rewrites by Draegon.
Include Exploration Events by Kurainyx.
Include Extra Added Scenes by Kaleem mcintyre.
Include Extra College Events by Speedlover.
Include Fair Events by Sarokcat.
Include Fair Events by Sarokcat.
Include Female Dorm Events by Prometheus.
Include Feral Events by MGEddie.
Include Fire House by Kaleem Mcintyre.
Include Food and Water Finding by Nuku Valente.
Include Forest Events by Aureas Gigas.
Include Forest Events by Defth.
Include Forest Gang Bang by Defth.
Include Gildwing Kobold Events by Taelyn.
Include giving in by Core Mechanics.
Include Greek Mythos by Prometheus.
Include HellHound by Speedlover.
Include High Rise Events by Stripes.
Include High Rise Events by Wahn.
Include Horus by Rikaeus.
Include How High by Kaleem mcintyre.
Include Hyena Bikers by Stripes.
Include Hyena Shoppers by Doots.
Include Hyena Situations by Hellerhound.
Include Hyper Serum by Vrael.
[Include Important Research Quests by Kaleem Mcintyre.]
Include Infected Pool by Hellerhound.
Include Inner Mall Events by Wahn.
Include Inventory by Core Mechanics.
Include Ironscale Items by Taelyn.
Include Junkyard Events by Stripes.
Include Kitsune by Shadowwolf94.
Include Kitsune Expansion by Shadowwolf94.
Include Latex Quad Husky by Stripes.
Include Leonard Events by Stripes.
Include Little Old Woman by Kaleem mcintyre.
Include Lizard Parlor by Kaleem Mcintyre.
Include Main Storyline by Stripes.
Include Male Dorm Events by Rikaeus.
Include Mall Events by Sarokcat.
Include Mall Expansion by Wahn.
Include Misc Events by Pandemonium.
Include Misc 10 by Kaleem mcintyre.
Include Misc 3 by Kaleem mcintyre.
Include Misc 4 by Kaleem mcintyre.
Include Misc 6 by Kaleem mcintyre.
Include Misc 7 by Kaleem mcintyre.
Include Misc 8 by Kaleem mcintyre.
Include Misc 9 by Kaleem mcintyre.
Include Misc Scene 5 by Kaleem mcintyre.
Include More Misc Events by Kaleem mcintyre.
Include Murder Mystery by Rikaeus.
Include Museum Events by Sarokcat.
Include Museum Rounds by Stripes.
Include Nemean Lion by Prometheus.
Include New Events by Sarokcat.
Include Odd Weapons by Hellerhound.
Include Old BoomBox by Kaleem mcintyre.
Include Orc Events by Wahn.
Include Orc Researcher by Luneth.
Include Origins by Luneth.
Include Park Events by Sarokcat.
Include Patreon Menu by Stripes.
Include Pepperspray by Stripes.
Include Pet Shop by Wahn.
Include Qytat Shifters by Hellerhound.
Include Random Events by Hiccup.
Include Rane Events by KorekaBii.
Include Recordings by Wahn.
Include Red Events by Stripes.
Include Reservoir by Kaleem Mcintyre.
Include Rubber Sneakers by Kernog.
Include Satyr Frat by Wahn.
Include Save the Dame by Kaleem Mcintyre.
Include Scavevents by Stripes.
Include Sea Lion and Orca by Stripes.
Include Sex Ed by Prometheus.
Include Settings Menus by Core Mechanics.
Include Shifting by Hellerhound.
Include Shrinking Shrooms by Defth.
Include Smell by Core Mechanics.
Include Smith Haven Mall by Wahn.
Include Soldier Events by Wahn.
Include SpartanVikingCouple by Rikaeus.
Include Special Forces Events by Vinickus.
Include Stable Related Events by Sarokcat.
Include Stable Related Quests by Sarokcat.
Include Storage Locker by Core Mechanics.
Include Sugar Feud by AGentlemanCalledB.
Include TFTG Feats by Luneth.
Include Tidepool Event by FwuffyMouse.
Include Toy Store by Song.
Include Underground Events by Wahn.
Include Walkinmall by Ssely.
Include Warehouse District by Kaleem Mcintyre.
Include Warehouse Events by StripeGuy.
Include Wereraptor by Stripes.
Include Werewolf by CrimsonAsh.
Include Xeno Nest by Kernog.
Include Zephyr Phone by Executaball.
Include Zoo Events by Sarokcat.
Include Zoo Events by Wahn.

Part 3 - Monsters/Infections

Include Albino Mouse by Stripes.
Include Alien Felinoid by Damaged.
Include Alpha Husky by Sarokcat.
Include Alpha Wolf by Sarokcat.
Include Amazonian by Stripes.
Include Ancient Tentacles by Dys.
Include Anime Babe by Stripes.
Include Anthro Shaft Beast by Guest Writers.
Include Anthro Cow Infections by Luneth.
Include Anthro Rabbit by Rikaeus.
Include Arctic Fox by Sarokcat.
Include Army Ant by Glitch.
Include Avalon Kobold by Taelyn.
Include Ember Breeder by Stripes.
Include Automaton by Stripes.
Include Awesome Tree by Damaged.
Include Badger by StripeGuy.
Include Bald Eagle by Stripes.
Include Batcubus by Blaydrex.
Include Brown Bear by Nuku Valente.
Include Beaver by Stripes.
Include Behemoth by Kaleem mcintyre.
Include Bird of Paradise by Stripes.
Include Black Equinoid by Song.
Include Black Wolf by Stripes.
Include Blob by Kaleem Mcintyre.
Include Blue Chaffinch by Stripes.
Include Latex Bobcat by Stripes.
Include Bottlenose Toy by Stripes.
Include Bovine by Damaged.
Include Breederslut by Stripes.
Include Brown Rat by Wahn.
Include Bunny Jock by Rikaeus.
Include Butterfly by Guest Writers.
Include Candy Striper by Stripes.
Include Cannon by Hiccup.
Include Cat Ninjas by Stripes.
Include Catgirl by Wahn.
Include Caveman by TheRecipe.
Include Centaur Mare by Stripes.
Include Centaur Stallion by Stripes.
Include Cerberus by Stripes.
Include Cheetah by Sarokcat.
Include Chocolate Lab by Stripes.
Include Clockwork Fox by Stripes.
Include Copper Dragoness by Kurainyx.
Include Corota by Stripes.
Include Corrupted Spawner by Stripes.
Include Cougar by Stripes.
Include Cowboy Cuntboy by Wahn.
Include Coyote by Darthan.
Include Cum Girl by AGentlemanCalledB.
Include Cute Chinchilla Girl by Guest Writers.
Include Dalmatian by Wahn.
Include Dark Elf by Stripes.
Include Demon Brute by Wahn.
Include Demon Fox by Dys.
Include Dino Pack by Qazarar.
Include Dire Wolf by Qazarar.
Include Doberman Cop by Stripes.
Include Doberman Male by Wahn.
Include Donkeyman by Sarokcat n Verath.
Include Donkeywoman by Sarokcat n Verath.
Include Draco-Mantis Infections by Prometheus.
Include Dracovixentaur by Stripes.
Include Dragontaur by Stripes.
Include Dragon Pool Toy by Hina Vache.
Include Drone Wasp by Nuku Valente.
Include Dryad by Hellerhound.
Include Dwarves by Gherod.
Include Easter Bunny by Stripes.
Include Ebonflame Dragator by Blue Bishop.
Include Ebonflame drake by Blue Bishop.
Include Ebonflame Whelp by Blue Bishop.
Include Elf by Nuku Valente.
Include Elk by Stripes.
Include Elven Hunter by Wahn.
Include Enhanced Chimera by Stripes.
Include Erica by Wahn.
Include Ewe by Luneth.
Include Feline Gymnast by Guest Writers.
Include Female Husky by Nuku Valente.
Include Fennec by Stripes.
Include Feral Cheetah by Shadowwolf94.
Include Feral Gryphon by UrsaOmega.
Include Feral Mutt by CrimsonAsh.
Include Feral Sea Dragon by Blue Bishop.
Include Feral Sea Dragoness by Blue Bishop.
Include Feral Shaft Beast by Guest Writers.
Include Feral Unicorn by Taelyn.
Include Feral Wolf Bitch by Prometheus.
Include Feral Wolf Male by Stripes.
Include Ferret Infection by Luneth.
Include Fire Elemental by Stripes.
Include Fire Sprite by AGentlemanCalledB.
Include Flaming Lynx by Stripes.
Include Flesh Blob by Stripes.
Include Fluffy Owl by Stripes.
Include Football Gorilla Infections by Luneth.
Include Foul Scuttler by Xenophiliac.
Include Francois Infections by AGentlemanCalledB.
Include Friendship Pony by Stripes.
Include Frost Drake by CrimsonAsh.
Include Fruit Bat by Stripes.
Include Furling by Wahn.
Include Gargoyle Sentry by Gherod.
Include Gargoyle by Kaleem mcintyre.
Include Gator by Nuku Valente.
Include Gazelle by Sarokcat.
Include Gels by Darthan.
Include German shepherd by Stripes.[replaces 'Random German shepherd']
Include German Shepherd Bitch by Kirov.
Include Giant by Gherod.
Include Giraffe by Stripes.
Include Goat Janitor by McRabid.
Include Goblin by Blue Bishop.
Include Golden Retriever Male Infection by Luneth.
Include Goo Girl by Nuku Valente.
Include Gorilla by Wahn.
Include Great Dane by Kaleem Mcintyre.
Include Greek Nymph by Sarokcat.
Include Gray Squirrel by Stripes.
Include Grizzly Bear by UrsaOmega.
Include Gryphons Plot by Shay.
Include Gunbunny by Stripes.
Include Harpy by Nuku Valente.
Include Hawkman by Sarokcat.
Include Hellfire Demon by Gherod.
Include Helot by Wahn.
Include Hentai Fan by Stripes.
Include Herm Dolphin by Hellerhound.
Include Herm Hyena by Guest Writers.
Include Hermaid by Xenophiliac.
Include Hermaphrodite Gryphon by Nuku Valente.
Include Hermaphrodite Latex Vixen by Guest Writers.
Include Hippo Strongman by Stripes.
Include Homo Sapiens by Wahn.
Include Horny Doctor by Stripes.
Include Horse-Hung Nerd by Wahn.
Include Horseman by Sarokcat n Verath.
Include Horsemazon by Kirov.
Include Hulking Cheerleader by Wahn.
Include Human Infections by Wahn.
Include Hydra Beast by Stripes.
Include Hyena Matriarch by Stripes.
Include Hyperskunk by Stripes.
Include Imp by Wahn.
Include Impala by UrsaOmega.
Include Incubus by Stripes.
Include Inflatable Vulpine by Stripes.
Include Jackal Alpha by Gherod.
Include Jackal Femboy by Gherod.
Include Jackal Guard by Xenophiliac.
Include Jackalboy by Sarokcat.
Include Jackalman by Sarokcat.
Include Jaguar Orderly by Stripes.
Include Jaguar Warrior by AGentlemanCalledB.
Include Junkman by Stripes.
Include Kangaroo by Guest Writers.
Include Killer Whale by Stripes.
Include Knight by Stripes.
Include Koballoon by Song.
Include Kobold Gang by Closerhenry.
Include Koghh by Wahn.
Include Komodo Dragon by Stripes.
Include Latex Ermine by Stripes.
Include Latex Fox by Nuku Valente.
Include Latex Mistress by Stripes.
Include Latex Wolf by Stripes.
Include Leopardman by Vinickus.
Include Liquidshifter by Ssely.
Include Lizard Girl by Damaged.
Include Lusty Skunk by Nuku Valente.
Include Magic Drake by Stripes.
Include Male Peacock by Guest Writers.
Include Mall Rat by Stripes.
Include Mammoth by Stripes.
Include Man-eating Plant by Kernog.
Include Mannequin by Wahn.
Include Manticore by Kaleem mcintyre.
Include Mareslut by Sarokcat.
Include Margay by Stripes.
Include Maternity Lamia By Blue Bishop.
Include Math Teacher by Stripes.
Include Megakitty by Stripes.
Include Mental Mouse by Stripes.
Include Messy Pig by Guest Writers.
Include Minotaur by Kaleem mcintyre.
Include Mismatched Chimera by Stripes.
Include Monkey King by Kernog.
Include MothGirl by Guest Writers.
Include Mpreg Platypus by Sapphire.
Include Mul by Wahn.
Include Mushroom Men by AGentlemanCalledB.
Include Mutant Centaur by Hellerhound.
Include Mutated Islanders by Kernog.
Include Naga by Nuku Valente.
Include Naiad by Wahn.
Include Naughty Nurse by Stripes.
Include Nerdy Mouse by McRabid.
Include Nightmare by Sarokcat.
Include Ocelot by Stripes.
Include Ogres by Lyall.
Include Opossum Sailor by StripeGuy.
Include Orc Infections by Wahn.
Include otter by Nuku Valente.
Include Painted Wolf Herm by Guest Writers.
Include Panda by Sarokcat.
Include Panther Herm by Sarokcat.
Include Panther Taur by Nuku Valente.
Include Parasite by Stripes.
Include Parasitic Plant by Guest Writers.
Include Pegasus by Kaleem mcintyre.
Include Pewter Consort By Blue Bishop.
Include Piggy by Stripes.
Include Pink Fox by Gherod.
Include Pink Poodle by AGentlemanCalledB.
Include Pirate Shark by Sarokcat.
Include Pit Bull by Guest Writers.
Include Placeholder Infections by Wahn.
Include Plush Lion by Sarokcat.
Include Prairie Dog by Stripes.
Include Psycho Weasel by Stripes.
Include Queen Bee by Stripes.
Include Quilled Tousky by Stripes.
Include Ram by Luneth.
Include Random Shemale Smooth Collie by Guest Writers.
Include Random Tentacle Horror by Guest Writers.
Include Rat Twins by Kernog.
Include Razorback Boar by Wahn.
Include Red Panda Infection by Luneth.
Include Red Oni by Stripes.
Include Reindeer by Stripes.
Include Reptaur by Kaleem mcintyre.
Include Retriever by AGentlemanCalledB.
Include Rhino by Stripes.
Include Robed Cultist by Wahn.
Include Rodeo Clown by Stripes.
Include Rubber Drake by Song.
Include Rubber Tigress by Sarokcat.
Include Ruby by CrimsonAsh.
Include Saber Kitty by Blaydrex.
Include Sabretooth by Sarokcat.
Include Salamander by Stripes.
Include Sand Man by Wahn.
Include Satyr by Sarokcat.
Include Satyress by Wahn.
Include Scarab Beetle by Xenophiliac.
Include Seraphim by Wahn.
Include Shadow Beast by UrsaOmega.
Include Siamese Cats by Stripes.
Include Sierrasaur by Blue Bishop.
Include Siren by Stripes.
Include Skunk by Damaged.
Include Skunkbeast Lord by Stripes.
Include Slime Cube by Kernog.
Include Slutrat by Nuku Valente.
Include Small Feline And Lion by Damaged.
Include Smilodon Male by Gherod.
Include Snake by Stripes.
Include Snow Bat by Stripes.
Include Snow Leopard by Stripes.
Include Spartan by Wahn.
Include Sphinx by Sarokcat.
Include Spidergirl by Guest Writers.
Include Spidertaur Male by Wahn.
Include Spidertaur Female by Wahn.
Include sprite by Nuku Valente.
Include Squid by Stripes.
Include Squire by Stripes.
Include Stallionboi by Sarokcat n Verath.
Include Succubus by Sarokcat.
Include Sugar Ferret by Stripes.
Include Sugar Glider by AGentlemanCalledB.
Include Taurus by Defth.
Include Teddy Bear by Sarokcat.
Include Tenrec by StripeGuy.
Include Thought Eater by Wahn.
Include Tiger by Sarokcat.
Include Tiger Cop by Stripes.
Include Tiger Shark by Lone Wanderer.
Include Tigertaur by Sarokcat.
Include Tigress Hooker by Stripes.
Include Toven by Wahn.
Include Trash Coon by Stripes.
Include Triceratops by Stripes.
Include Twisted Pimp by Sarokcat.
Include Unicorn by Sarokcat.
Include Viking Man by Wahn.
Include Viking Woman by Wahn.
Include Vixentaur by Stripes.
Include Voodoo Gecko by Stripes.
Include Vulpogryph by Stripes.
Include Werewolf Costume by Stripes.
Include Whiptail by Vervaine.
Include Wildcat by Stripes.
Include Wolfman by Wahn.
Include Wolftaur by Sarokcat.
Include Wolverine Guard by Stripes.
Include Wrestling Wolf by Guest Writers.
Include Wyvern by Damaged.
Include Xeno by Stripes.
Include Yamato Dragon by Blue Bishop.
Include Yamato Dragoness by Blue Bishop.
Include Yatur by Wahn.
Include Yinglet by KazeSequeris.
Include Yuppie Mink by StripeGuy.
Include Zebra by Vervaine.

Part 4 - NPCs

Include Absinthe by Bigfish15079.
Include Ace by Aureas Gigas.
Include Adam by Wahn.
Include Aeca by Wahn.
Include Alex by Stripes.
Include Alpha by Wahn.
Include Arcanologist by Taelyn.
Include Bad Alexandra by Wahn.
Include Allen by Wahn.
Include Alexandra Breeding by Wahn.
Include Alexandra Cuckolding by Wahn.
Include Alpha Fang Scenes by Nuku Valente.
Include Amaryllis by Song.
Include Amy by Wahn.
Include Andrew by Gherod.
Include Angie by Sarokcat.
Include Anthony by Wahn.
Include Araqiel by Gherod.
Include Ares by Wahn.
Include Arthur by Luneth.
Include Anastasia by Stripes.
Include Aster by Qazarar.
Include Atticus by Wahn.
Include Azari by Dys.
Include Bastet by Wahn.
Include Bjorn by Rikaeus.
Include Blake by Wahn.
Include Blanche by Stripes.
Include Blue by Wahn.
Include Boghrim by Wahn.
Include Bradford by Stripes.
Include Brennan by Wahn.
Include Brian by Vinickus.
Include Brooke by Stripes.
Include Bryony by Song.
Include Bubble by Stripes.
Include Callidora by Prometheus.
Include Cassiel by Tin Can.
Include Cynthia by Prometheus.
Include Campus Gym by UrsaOmega.
Include Cadmea by Prometheus.
Include Carl by Wahn.
Include Cherry by Gherod.
Include Chris by Wahn.
Include Cindy by Stripes.
Include College Guards by Rikaeus.
Include Colleen by Sarokcat.
Include Corbin by Wahn.
Include Coura by Wahn.
Include Daisy by Sarokcat n Verath.
Include Danny by Wahn.
Include Darius by Wahn.
Include David by Wahn.
Include Davies by Wahn.
Include Deer by Stripes.
Include Denise by Wahn.
Include Demonologist by Gherod.
Include Desperate Bunny by Nuku Valente.
Include Diana by Wahn.
Include Diavoborg by Gherod.
Include Diego by Wahn.
Include Dominick by Stripes.
Include Doran by Blue Bishop.
Include DrMoffatt by Stripes.
Include DrUtah by Stripes.
Include Duke by Wahn.
Include Dullahan by Gherod.
Include Egyptian Wing by Xenophiliac.
Include Elijah by Wahn.
Include Eric by Wahn.
Include Eric Loyalty by Luneth.
Include Erica by Wahn.
Include Fancy by Sarokcat n Verath.
Include Fang by Prometheus.
Include Farmhands by Wahn.
Include Felix by Wahn.
Include Finn by Wahn.
Include Flint by Gherod.
Include Francois by AGentlemanCalledB.
Include Frank by Stripes.
Include Friesian Twin Isaac by Wahn.
Include Friesian Twin Karel by Wahn.
Include G-Shep Squad by Rikaeus.
Include Genevieve by Prometheus.
Include Garrett by Stripes.
Include Gerty by Qazarar.
Include Glory by Wahn.
Include Good Alexandra by Wahn.
Include Gordon by Rikaeus.
Include Gregory by Wahn.
Include Gus by Hyliad.
Include Gwen by Stripes.
Include Hadiya by Stripes.
Include Hanu by Kernog.
Include Harold by Sarokcat.
Include Hayato by Gherod.
Include Hellfire Workers by Gherod.
Include Help Book by Prometheus.
Include HornyHorsey by femtoAmpere.
[Include Horus by Rikaeus.]
Include Hungry Boar Man by Gherod.
Include Hyper Squirrel by Nuku Valente.
Include HypnoGeeks by Luneth.
Include Icarus by Stripes.
Include Ice Fox by Wahn.
Include Inflatable Orca by Song.
Include Inflatable Otter Suit by Song.
Include Informant by Kaleem mcintyre.
Include Jana by Kirov.
Include Janice by Sarokcat.
Include Jake by Rikaeus.
Include Jay by Wahn.
Include Jenna by Rikaeus.
Include Jimmy by Stripes.
Include Joanna by Stripes.
Include Joey by Qazarar.
Include Joshiro by Wahn.
Include J'Reth by Prometheus.
Include Juergen by Wahn.
Include Julian by Prometheus.
Include Kai by WhiteRabbit.
Include Kara by Sarokcat.
Include Karen by AGentlemanCalledB.
Include Katherine by Kirov.
Include Krampus by Wahn.
Include Kristen by Stripes.
Include Kurt by Rikaeus.
Include Kyle by Qazarar.
Include Kyrverth by Speedlover.
Include Lance by Verath.
Include Landon by Luneth.
Include Larissa by Stripes.
Include Leon by Luneth.
Include Leonard by Stripes.
Include Lilith by Wahn.
Include Lindsey by Sarokcat.
Include Lingau by Wahn.
Include Logan by Wahn.
Include Lucy by Stripes.
Include Lux & Umbra by Prometheus.
Include Mack by Stripes.
Include Malik by Wahn.
Include Mark by Wahn.
Include Mary by Luneth.
Include Master Mind by Stripes.
Include Master-of-Hell-Quest by Luneth.
Include Matriarch NPC by Stripes.
Include Meredith by Stripes.
Include Micaela by Stripes.
Include Midnight by Sarokcat.
Include Milo by CrimsonAsh.
Include Mogdraz by Gherod.
Include Monty by Wahn.
Include Mouse Taur by Nuku Valente.
Include Pet Mutt by CrimsonAsh.
Include Nadia by Wahn.
Include Nakoma by Song.
Include Nala by CrimsonAsh.
Include Nelson by Wahn.
Include Nermine by Wahn.
Include Nermine Quests by Wahn.
Include Newt by Stripes.
Include NPC Interactions by Wahn.
Include Oliver by Rikaeus.
Include Onyx by Sarokcat n Verath.
Include Orc Female by Wahn.
Include Orc Lair by Wahn.
Include Orthas by Stripes.
Include Otto Fuchs by Prometheus.
Include Palomino by Verath.
Include Paula by Stripes.
Include Percy by Taelyn.
Include Pericles by Rikaeus.
Include Phantom Dolphin by Blue Bishop.
Include Phantom Pony by Blue Bishop.
Include Poseidon by Rikaeus.
Include Pretty Kitty by Xenophiliac.
Include Ranae by Kurainyx.
Include Randall and Brad by Rikaeus.
Include Rane by Wahn.
Include Reece by Luneth.
Include RexxyEvent by AGentlemanCalledB.
Include Richard by Rikaeus.
Include RodAndRonda by Stripes.
Include Roman by Kernog.
Include Sally by Stripes.
Include Sakura Sato by Rikaeus.
Include Sam by Stripes.
Include Santa Claws by Wahn.
Include Sarah by Wahn.
Include Savina by Kurainyx.
Include Serafino by Rikaeus.
Include Seraphis by Vinickus.
Include Serenity by Kurainyx.
Include Sheng by Rikaeus.
Include Sidney by Stripes.
Include Sirius by Prometheus.
Include Skarnoth by Wahn.
Include Skarnoth Loyalty by Luneth.
Include Skarnoth-Brutus Scenes by Luneth.
Include Solstice by Stripes.
Include Sonny by Rikaeus.
Include Spike by Wahn.
Include Stag by Wahn.
Include Stella by Stripes.
Include Stewart by Rikaeus.
Include Stuck Dragon by Stripes.
Include Sven by Stripes.
Include Sylvia by Prometheus.
Include Tanuki by Nuku Valente.
Include Tehuantl by Wahn.
Include Tenvale Gorillas Football Team by Kernog.
Include The-Voice by Luneth.
Include Thomas by Wahn.
Include Thunderbolt by CrimsonAsh.
Include Timothy by Sarokcat.
Include Tobias by Wahn.
Include Toron by Gherod.
Include Tristian by Verath.
Include Urik by Wahn.
Include Val by Wahn.
Include Vanessa by Stripes.
Include Velos by Blue Bishop.
Include Vent Fox by Dys.
Include Voria by Kurainyx.
Include Wally by Rikaeus.
Include Wendy by Wahn.
Include Wild Mustang by Wahn.
Include Yolanda by Stripes.
Include Zeke by Qazarar.
Include Zephias by Wahn.
Include Zigor by Stripes.
Include Zoe by Kernog.

Part 5 - Companions and Allies

Include Artemis by Stripes.
Include Aurora by Stripes.
Include Baby Pets by Luneth.
Include Equinoid Warrior by Song.
Include Felinoid Companion by Sarokcat.
Include Feral Pets by Luneth.
Include Gryphon Companion by Sarokcat.
Include Honey by Luneth.
Include Korvin by Wahn.
Include Rachel Mouse by Stripes.
Include Ryousei by Wahn.

[Game start autofires]

When play begins:
	adjustdefaulthelp; [adjusts help menu]
	let tempname be indexed text;
	repeat with q running from 1 to the number of rows in the table of game objects:
		add name in row Q of table of game objects to allobjs;
		choose row q in the table of game objects;
		now tempname is Name entry in lower case;
		now sortName entry is tempname;
	sort the table of game objects in sortname order;
	now the right hand status line is "[list of valid directions]";
	say "Before the game begins..."; [warn the player what to expect next]
	say "Do you want hyperlinks? (Y/N)[line break]";
	if Player consents:
		now hypernull is 0;
	else:
		now hypernull is 1;
	repeat with x running through featsets:
		now x is a part of Player; [TODO: Investigate if this is actually needed]
	if ScenarioChosen is 1: [sets name of scenario for menu based on preset]
		now scenario is "Bunker";
	else if ScenarioChosen is 2:
		now scenario is "Caught Outside";
	else if ScenarioChosen is 3:
		now scenario is "Rescuer Stranded";
	else if ScenarioChosen is 4:
		now scenario is "Forgotten";
	else if ScenarioChosen is 5:
		now scenario is "Researcher";
	else:
		now ScenarioChosen is 1;
		now scenario is "Bunker";
	if AnalLevel < 1 or AnalLevel > 3, now AnalLevel is 2;
	if WSLevel < 1 or WSLevel > 3, now WSLevel is 2;
	if OvipregLevel is not 1, now OvipregLevel is 2;
	increase the score by 10;
	let pointlessbump be 0;
	now MonsterID is a random number from 1 to number of filled rows in the Table of Random Critters;
	choose row MonsterID in Table of Random Critters;
	regularstart; [original start method. easier to move everything then leave here]

When play begins (this is the graphics window construction rule):
	if NewGraphics is true: [Build window regardless in case player decides to turn it on later]
		now the graphics window proportion is NewGraphicsRatio;
		build graphics window;
		[now the graphics window pixel count is 1;]
		follow the ngraphics_blank rule;
		follow the current graphics drawing rule;
		now NewGraphicsOpened is true;
