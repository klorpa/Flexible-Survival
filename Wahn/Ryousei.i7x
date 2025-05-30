Version 1 of Ryousei by Wahn begins here.

"Adds a Tiger NPC/pet named Ryousei to Flexible Survival's Wandering Monsters table"

[ XP of Ryousei - Brushing                                                ]
[  0: never brushed                                                       ]
[  1: nonsexual brushing                                                  ]
[  2: brushing & sex                                                      ]

[ RyouseiXerxes - Interaction with the human dog                          ]
[  0: never met                                                           ]
[  1: talked with the player about him                                    ]
[  2: fucked Xerxes                                                       ]

[ RyouseiHayato - Interaction with Hayato                                 ]
[  0: never met                                                           ]
[  1: talked with the player about him                                    ]

RyouseiXerxes is a number that varies.
RyouseiHayato is a number that varies.
RyouseiRane is a number that varies.

RTWinCounter is a number that varies.

a postimport rule:
	choose a row with name of "Royal Tiger" in the Table of Random Critters;
	now enemy type entry is 2; [bugfix to skip the old values imported from previous playthroughs]

Section 1 - Meeting Event

Table of WalkInEvents (continued)
Priority	Name	EventObject	EventConditions	EventRoom	LastEncounterTurn	CoolDownTurns	EncounterPercentage
3	"Ryousei_Meeting"	Ryousei_Meeting	"[EventConditions_Ryousei_Meeting]"	Shinto Shrine	2500	2	100

to say EventConditions_Ryousei_Meeting:
	if level of Player > 10 and RTWinCounter is 0: [list of conditions here]
		now CurrentWalkinEvent_ConditionsMet is true;

Table of GameEventIDs (continued)
Object	Name
Ryousei_Meeting	"Ryousei_Meeting"

Ryousei_Meeting is a situation.
ResolveFunction of Ryousei_Meeting is "[ResolveEvent Ryousei_Meeting]".
Sarea of Ryousei_Meeting is "Nowhere". [standard walkins that cannot be hunted for are Nowhere, but walkin events can also be made huntable as an alternate access way]

to say ResolveEvent Ryousei_Meeting:
	if debugactive is 1:
		say "     DEBUG -> RYOUSEI SHRINE MEETING <- DEBUG [line break]";
	project Figure of Ryousei_clothed_icon;
	say "     Passing the last tall bamboo plants, you realize that there's already someone at the shrine. A muscular male tiger is kneeling before the large mirror disc forming the center of the shrine, dressed in a traditional Japanese kimono. A long striped tail gently waves through the air behind him as the being murmurs to the shrine, then eventually puts his hands together and bows before it. After finishing his prayer, the tiger rises to his feet, standing imposingly tall with a quite regal bearing.";
	say "     'Hajimemashite, stranger. I was just finished...' he says, indicating the spot in front of the shrine with a flourish of his clawed hand. 'It is... refreshing, to see that not all creatures in this land are base beasts. Maybe there is still hope for this nether-realm. So do not let me stand in your way to enlightenment - but before I go, know that you have met Ryousei, first general of the mighty shogun Aki. Which I will be again, once I have escaped this banishment plane.' And with that, the tiger brushes past you without waiting for a reply, walking over the gravel path to the rest of the park and leaving you standing alone at the Shinto shrine.";
	repeat with y running from 1 to number of filled rows in Table of Random Critters:
		choose row y in Table of Random Critters;
		if Name entry is "Royal Tiger":
			now MonsterID is y;
			now area entry is "Park";
			break;
	now RTWinCounter is 1;
	now Ryousei_Meeting is resolved;

Section 2 - Creature Responses

to say RTiger wins:
	if Royal Tiger companion is not tamed: [normal fight]
		say "     As you collapse at his feet, the muscled tiger looks down upon you with a sigh. 'A pity that you lost so easily, even though I held back quite a bit. I really thought you had more potential. Maybe it is just not your day today, hm? Let us try this again when you have had time to recuperate and... train a bit.' Ryousei folds his hands and gives a little bow to you, then calmly walks off along the forest path.";
	else: [sparring with Ryo]
		if HP of Player < 5: [beaten]
			say "     As you sway back and forth and are just about to fall on your ass, the muscled tiger quickly steps up and slides an arm around your back. It feels warm and soft against your skin as he holds you with a firm grasp, bracing your body so you stay on your feet. With a friendly chuckle, the tiger adds, 'A good fight, my friend, but this round goes to me. Come, let me help you to somewhere where you can sit down, and catch your breath.'";
		else: [surrendered]
			say "     As you pull back and tell him that you concede, Ryousei relaxes from his combat-ready stance and straightens himself. Bringing his hand-paws together before his chest, he grasps his right fist with the left hand, the muscular tiger gives you a small bow, not too deep but still showing respect. 'A good fight, my friend. I have missed sparring with my compatriots ever since coming to this world. It feels good to get a proper workout without having to battle for life and death.'";

to say RTiger loses: [TODO: Add option for asshole players]
	if Royal Tiger companion is not tamed: [normal fight]
		if RTWinCounter < 6:
			increase RTWinCounter by 1;
		if RTWinCounter is:
			-- 2:
				say "     Despite still looking like he could keep doing this all day, the muscled tiger suddenly takes a step back from you, interrupting the fight between you two. He puts the palms of his hands together and gives a little bow to you, then says, 'Well done, stranger. You are a promising fighter and it was a pleasure to trade blows with you. Far better than all those weaklings out and about who just throw themselves at me, ruled by their primitive urges.' Smiling, he adds, 'The workout has made me hungry, so I am off to find something to eat, but... let us do this again sometime. I will be looking forward to the next time we meet.' With that said, he walks off, leaving you alone on the forest path when he turns a corner just a moment later.";
			-- 3:
				say "     Despite still looking like he could keep doing this all day, the muscled tiger suddenly takes a step back from you, interrupting the fight between you two. He puts the palms of his hands together and gives a little bow to you, then says, 'You have beaten me a second time. Well done, stranger - it is always a pleasure to trade blows with such a promising fighter. You are far better than all those weaklings out and about who just throw themselves at me, ruled by their primitive urges.' Smiling, he adds, 'The workout has made me hungry, so I am off to find something to eat, but... let us do this again sometime. I will be looking forward to the next time we meet.' With that said, he walks off, leaving you alone on the forest path when he turns a corner just a moment later.";
			-- 4:
				say "     Despite still looking like he could keep doing this all day, the muscled tiger suddenly takes a step back from you, interrupting the fight between you two. He puts the palms of his hands together and gives a little bow to you, then says, 'Third time is the charm, my friend. I have to say I am really enjoying our little clashes. I knew from the start you would be a better opponent than those mindlessly ravishing beasts your world seems to be populated with.' Smiling, he adds, 'The workout has made me hungry, so I am off to find something to eat, but... let us do this again sometime. I will be looking forward to the next time we meet.' With that said, he walks off, leaving you alone on the forest path when he turns a corner just a moment later.";
			-- 5:
				say "     Despite still looking like he could keep doing this all day, the muscled tiger suddenly takes a step back from you, interrupting the fight between you two. He puts the palms of his hands together and gives a little bow to you, then says, 'And again you have won our little sparring duel, my friend. I find myself impressed, truly. I knew from the start you would be a better opponent than those mindlessly ravishing beasts your world seems to be populated with - but now you have really proven yourself.' Smiling, he adds, 'The workout has made me hungry, so I am off to find something to eat, but... let us do this again sometime. I will be looking forward to the next time we meet.' With that said, he walks off, leaving you alone on the forest path when he turns a corner just a moment later.";
			-- 6:
				say "     Despite still looking like he could keep doing this all day, the muscled tiger suddenly takes a step back from you, interrupting the fight between you two. He puts the palms of his hands together and gives a little bow to you, then says, 'You know what... since I am having so much fun with you - how about we travel together for a while? With the prowess you have proven to me time and again, I am sure you are having grand adventures that I would love to take part in!' Smiling, he adds, 'I will leave you to think about it for a while - but if you accept, you can just use a little magic to reach me. Just focus your mind on my image, then intone 'Watashi wa anata ni yonde, Ryousei'. I will meet you as soon as I am able.' With that said, he walks off, leaving you alone on the forest path when he turns a corner just a moment later.";
				say "     (Ryousei the royal tiger companion is now a possible ally! You can make him your active ally by typing [bold type][link]ally Ryousei[end link][roman type] or [bold type][link]ally tiger[end link][roman type] and initiate sex with him while active by typing [bold type][link]fuck Ryousei[end link][roman type]. You can see all the allies you have with the [bold type][link]allies[end link][roman type] command. Allies will lower the XP you gain from battle, but can gain levels themselves to be more useful in a scrap. Want to get rid of an ally? Use [bold type][link]ally dismiss[end link][roman type], or just [bold type][link]dismiss[end link][roman type])[line break]";
				repeat with y running from 1 to number of filled rows in Table of Random Critters:
					choose row y in Table of Random Critters;
					if Name entry is "Royal Tiger":
						now MonsterID is y;
						now area entry is "Nowhere";
						break;
				now royal tiger companion is tamed;
				add "Tamed" to Traits of royal tiger companion;
				move Ryousei to Grey Abbey Library;
	else:
		say "     As you wind yourself up for the next attack, the muscled tiger suddenly takes a step back from you. 'That will be enough for now. I concede to you, my friend. Well fought, it was a pleasure to spar with you.' Bringing his hand-paws together before his chest, he grasps his right fist with the left hand, the muscular tiger gives you a half-bow, showing the respect you earned for your prowess. He gives your shoulder a friendly tap and squeezes it, then adds with a smile, 'Ever since coming to this world, I have really been missing just being able to measure up against a companion, without it having to be a life or death fight. So thank you, for this.'";

to say RTigerDesc:
	if Royal Tiger companion is not tamed: [normal fight]
		say "     Walking along one of the overgrown paths of the park, you meet Ryousei the tiger general, coming the other way. The muscled being gives you a nod in greeting, then says, 'You again. Good, good - I have been getting bored with the pretty lacking challenge of the creatures roaming this forest.' He unsheathes his claws and makes a ritualistic-seeming gesture, then relaxes his fingers again to let the pointy sickles slide into resting positions. 'There - a friendly duel has been declared. But no worries - I will just knock you around a bit - no claws, see!' Giving a wiggle of his fingers in front of his confidently smiling face, the tiger then rushes at you to attack.";
	else:
		say "     Smiling as he gets into a combat-ready posture, the muscular anthro tiger looks quite eager for some action. 'Let us measure our strength against one another then! Are you ready?' As soon as you nod, he wades into combat against you - claws sheathed though, as it is just a friendly clash.";

Section 3 - Creature Insertion

Table of CombatPrep (continued)
name(text)	PrepFunction(text)
"Royal Tiger"	"[PrepCombat_Royal Tiger]"

to say PrepCombat_Royal Tiger:
	project Figure of Ryousei_clothed_icon;

Table of Random Critters (continued)
NewTypeInfection (truth state)	Species Name	Name	Enemy Title	Enemy Name	Enemy Type	Attack	Defeated	Victory	Desc	Face	Body	Skin	Tail	Cock	Face Change	Body Change	Skin Change	Ass Change	Cock Change	str	dex	sta	per	int	cha	sex	HP	lev	wdam	area	Cock Count	Cock Length	Ball Size	Nipple Count	Breast Size	Male Breast Size	Cunt Count	Cunt Depth	Cunt Tightness	SeductionImmune	Libido	Loot	Lootchance	TrophyFunction	MilkItem	CumItem	Scale (number)	Body Descriptor (text)	Type (text)	Magic (truth state)	Resbypass (truth state)	non-infectious (truth state)	Cross-Infection (text)	DayCycle	Altcombat (text)	BannedStatus (truth state)
--	--	--	--	--	--	--	--	--	--	--	--	--	--	--	--	--	--	--	--	--	--	--	--	--	--	--	--	--	--	--	--	--	--	--	--	--	--	--	--	--	--	--	--	--	--	--	--	--	--	--	--	--	--	--	--	--;

When Play begins:
	Choose a blank row from Table of Random Critters;
	now NewTypeInfection entry is false;
	now Species Name entry is "Royal Tiger";
	add "Royal Tiger" to infections of FelineList;
	add "Royal Tiger" to infections of FurryList;
	add "Royal Tiger" to infections of OtherworldlyList;
	add "Royal Tiger" to infections of MaleList;
	add "Royal Tiger" to infections of BarbedCockList;
	add "Royal Tiger" to infections of BipedalList;
	add "Royal Tiger" to infections of TailList;
	now Name entry is "Royal Tiger";
	now enemy title entry is "Tiger Warrior";
	now enemy Name entry is "Ryousei";
	now enemy type entry is 2; [ 0 = non unique enemy; 1 = unique (unknown name); 2 = unique (known name) | Used to disqualify unique enemies from Vore/UB and showing the enemy name in encounters. ]
	now attack entry is "[one of]Ryousei gives you a lightning-quick side kick with his clawed foot - leaving you bruised but taking care not to slash you.[or]The muscled tiger punches you in the face with his open palm, stunning you for a second.[or]A hard chop of Ryousei's hand has you holding a hurting forearm a moment later.[at random]";
	now defeated entry is "[RTiger loses]";
	now victory entry is "[RTiger wins]";
	now desc entry is "[RTigerDesc]";
	now face entry is "beautiful tiger-like visage, its short muzzle and feline eyes giving your features an exotic predatory cast. Your slightly rounded furry ears complete the look, creating the perfect blend of human and tiger features in your ";
	now body entry is "lean and lined with corded muscle. It has an interesting hybrid look, as you balance easily on digitigrade tiger paws, while your hands are still almost human, just having small claws tipping each finger";
	now skin entry is "[one of]tiger striped[or]tiger furred[or]soft furred[or]orange and black striped[at random]";
	now tail entry is "You have a long, tiger-like tail extending from just above your ass, lashing back and forth in excitement with every movement.";
	now cock entry is "[one of]feline[or]Tiger[or]barbed[at random]";
	now face change entry is "a pleasurable stretching sensation comes over your face, as your teeth begin to sharpen and length, and your jaw extends outward and the muscles rearrange themselves into the powerful configuration of a tiger. Your nose twitches as it flattens out, newly discovered scents washing over you as it merges into your new muzzle. From one eye-blink to the next, your view shifts to now come though slitted, cat-like pupils, and your ears finishing their adjustment to their new place on top of your head";
	now body change entry is "muscles tighten underneath your skin, twisting and cording and arranging themselves in a more feline manner. You stumble as your legs shift underneath you, their ankles stretching upwards as your feet expand and change, shifting your balance to the balls of new paw-like feet while the rest of the leg rearranges itself into a partially digitigrade stance, causing you to lean forward slightly";
	now skin change entry is "it shudders and seems to shift on its own, thick orange and black tiger fur pushing out in soft pleasurable waves of change all over your body";
	now ass change entry is "it grows firm and muscled, and a long sleek tiger tail erupts outwards from your tailbone. Soon completing its growth, it starts lashing around behind you in long natural motions, almost feeling as if it had always been a part of you";
	now cock change entry is "it shifts and tapers to a soft point, short nubby barbs slowly sprouting along the shaft neat the head. The skin of your belly and crotch stretches out to pull the feline cock up close to your body, and wraps it in a proper furry tiger's sheath.";
	now str entry is 22;
	now dex entry is 18;
	now sta entry is 24;
	now per entry is 16;
	now int entry is 14;
	now cha entry is 16;
	now sex entry is "Male";
	now HP entry is 95;
	now lev entry is 13;
	now wdam entry is 10;
	now area entry is "Nowhere"; [ Case sensitive]
	now Cock Count entry is 1; [ number of cocks if sex is 'Male' or 'Both' ]
	now Cock Length entry is 12;
	now Ball Size entry is 3; [ Size of balls ]
	now Nipple Count entry is 2; [ Number of nipples. ]
	now Breast Size entry is 0; [cup size as number, counting Flat Pecs = 0, A = 1, B = 2, ...]
	now Male Breast Size entry is 0; [ Breast size for if Sex="Male", usually zero. ]
	now Cunt Count entry is 0; [ number of pussies if sex is 'Female' or 'Both' ]
	now Cunt Depth entry is 0;
	now Cunt Tightness entry is 0; [size 1-5, generates adjectives of extremely tight/tight/receptive/open/gaping]
	now SeductionImmune entry is true;
	now libido entry is 10; [ As part of infection, the Player will be gradually moved towards this value; also used for the creature's seduce defense as a penalty ]
	now loot entry is ""; [ Dropped item, blank for none. Case sensitive. ]
	now lootchance entry is 0; [ Percentage chance of dropping loot, from 0-100. ]
	now MilkItem entry is "royal tiger milk"; [ Item to be given to the player if they have this infection and milk themselves. ]
	now CumItem entry is ""; [ Item to be given to the player if they have this infection and jerk off. ]
	now TrophyFunction entry is "-"; [ Function to generate a list of optional loot items, of which the player can choose one after victory. ]
	now scale entry is 3; [ Number 1-5, approx size/height of infected PC body: 1=tiny, 3=avg, 5=huge ]
	now body descriptor entry is "muscled"; [ Ex: "plump" "fat" "muscled" "strong" "slimy" "gelatinous" "slender". Use [one of] to vary ]
	now type entry is "feline"; [ one-word creature type. Ex: feline, canine, lupine, robotic, human... Use [one of] to vary ]
	now magic entry is false;
	now resbypass entry is false;
	now non-infectious entry is true;
	now Cross-Infection entry is ""; [ Infection that this infection will give the player when they lose; can be left empty if they infect with the monster's own strain. ]
	now DayCycle entry is 0; [ 0 = Up at all times; 1 = Nocturnal (night encounters only); 2 = Diurnal (day encounters only) ]
	now altcombat entry is "default";
	now BannedStatus entry is false;

[
Table of New Infection Parts (continued)
Species Name	Name	Body Weight	Body Definition	Androginity	Head Change	Head Description	Head Adjective	Head Skin Adjective	Head Color	Head Adornments	Hair Length	Hair Shape	Hair Color	Hair Style	Beard Style	Body Hair Length	Eye Color	Eye Adjective	Mouth Length	Mouth Circumference	Tongue Adjective	Tongue Color	Tongue Length	Torso Change	Torso Description	Torso Adjective	Torso Skin Adjective	Torso Adornments	Torso Color	Torso Pattern	Breast Adjective	Breast Size	Male Breast Size	Nipple Count	Nipple Color	Nipple Shape	Back Change	Back Adornments	Back Skin Adjective	Back Color	Arms Change	Arms Description	Arms Skin Adjective	Arms Color	Locomotion	Legs Change	Legs Description	Legs Skin Adjective	Legs Color	Ass Change	Ass Description	Ass Skin Adjective	Ass Color	Ass Width	Tail Change	Tail Description	tail skin adjective	Tail Color	Asshole Depth	Asshole Tightness	Asshole Color	Cock Change	Cock Description	Cock Adjective	Cock Color	Cock Count	Cock Girth	Cock Length	Ball Description	Ball Count	Ball Size	Cunt Change	Cunt Description	Cunt Adjective	Cunt Color	Cunt Count	Cunt Depth	Cunt Tightness	Clit Size
--	--	--	--	--	--	--	--	--	--	--	--	--	--	--	--	--	--	--	--	--	--	--	--	--	--	--	--	--	--	--	--	--	--	--	--	--	--	--	--	--	--	--	--	--	--	--	--	--	--	--	--	--	--	--	--	--	--	--	--	--	--	--	--	--	--	--	--	--	--	--	--	--	--	--	--	--	--	--	--;

When Play begins:
	Choose a blank row from Table of New Infection Parts;
	now Species Name entry is ""; [ Name of the overall species of the infection, used so a "male x" and "female x" have "pureblood X" children. ]
	now Name entry is ""; [matching infection name to Table of Random Critters]
	now Body Weight entry is 5; [scale of 1-9 for body weight, grouped into low weight (1-3), mid weight (4-6) and high weight (7-9)]
	now Body Definition entry is 5; [scale of 1-9 for body definition, grouped into low muscle (1-3), mid muscle (4-6), high muscle (7-9)]
	[Body Adjective is generated out of the body weight and body definition and can be used in scenes - one word descriptive adjective depending on weight and definition groups: low weight group: skinny/slender/lithe; mid weight group: average/fit/muscled; high weight group: pudgy/husky/jacked]
	now Androginity entry is 5; [1-9 scale of hypermasculine to hyperfeminine]
	[Gender Adjective is generated out of androginity 1-9: hypermasculine/masculine/effeminate/somewhat effeminate/androgynous/feminine butch/tomboyish/feminine/hyperfeminine]
	now Head Change entry is ""; [partial sentence that fits in: "Your head and face [one of]tingle[or]go flush[or]vibrate with odd pleasure[or]go cold[or]feel oily[at random] as [head change entry]."]
	now Head Description entry is ""; [partial sentence that fits in "Your face and head resemble that of [Head Description of Player]. You have [Eye Adjective of Player], [Eye Color of Player] eyes and an overall [Gender Adjective of Player] appearance."]
	now Head Adjective entry is ""; [one word descriptive adjective (avian/canine/...)]
	now Head Skin Adjective entry is ""; [one word descriptive adjective]
	now Head Color entry is ""; [single word color adjective for the dominant color of the skin/fur/feathers/scales]
	now Head Adornments entry is "";[partial sentence that fits in "Before moving on from your head, you give your [Head Adornments of Player] a proud glance followed by a light caress."]
	now Hair Length entry is 2; [hair length in inches]
	now Hair Shape entry is ""; [one word shape descriptor (curly/straight/...)]
	now Hair Color entry is ""; [one word color descriptor]
	now Hair Style entry is ""; [one word style descriptor (ponytail/mohawk/buzzcut/...) to fit "On top of your head you have [Hair Length of Player] inch long, [Hair Shape of Player] [Hair Color of Player] hair in the [Hair Style of Player] style."]
	now Beard Style entry is ""; [short beard style (goatee/3-day stubble beard/porn stache/mutton chops beard/...) to go into "You have a [Hair Color of Player] [Beard Style of Player]."]
	now Body Hair Length entry is 0; [numerical value, 0-4 (no body hair/light/moderate/heavy/furry) - only set to > 0 if the infection does not have fur/scales/etc. !]
	now Eye Color entry is ""; [one word color descriptor]
	now Eye Adjective entry is ""; [one word descriptive adjective (slitted/round/...)]
	now Mouth Length entry is 3; [inches deep for face fucking; maximum possible will be double this number (when deep throating)]
	[Mouth Length Adjective is generated by a function and can be used in scenes too - "petite, shallow, average, deep, bottomless"]
	now Mouth Circumference entry is 3; [mouth circumference 1-5, see Mouth Circumference Adjective]
	[Mouth Circumference Adjective is generated by a function and can be used in scenes too - "tiny, small, normal, wide, gaping"]
	now Tongue Adjective entry is ""; [one word descriptive adjective (wide/slobbery/...)]
	now Tongue Color entry is ""; [one word color descriptor]
	now Tongue Length entry is 3; [length in inches]
	now Torso Change entry is ""; [partial sentence that fits in: "Your torso [one of]tingles[or]goes flush[or]vibrates with odd pleasure[or]goes cold[or]feels oily[at random] as [Torso Change entry]."]
	now Torso Description entry is ""; [partial sentence, fitting in "Looking down at yourself, you appear [Gender Adjective of Player] with a [Body Adjective of Player] build. Your torso is [Torso Description of Player][if Body Hair Length of Player > 1], covered in [Torso Color of Player] skin and [Body Hair Description of Player][else if Body Hair Length of Player is 1], covered in smooth, [Torso Color of Player] skin[end if]."]
	now Torso Adjective entry is ""; [one word descriptive adjective (avian/canine/...)]
	now Torso Adornments entry is ""; [(pouch/udders/...); partial sentence to fit: "You take a moment to feel your [Torso Adornments of Player]."]
	now Torso Skin Adjective entry is ""; [one word adjective (feathered/furred/scaly/...); EMPTY "" for creatures with just skin]
	now Torso Color entry is ""; [single word color adjective for the dominant color of the skin/fur/feathers/scales]
	now Torso Pattern entry is ""; [single word color adjective for the dominant pattern of the skin/fur/feathers/scales]
	now Breast Adjective entry is ""; [adjective(s) example: round, pointy, perky, saggy, bouncy. This would serve as either a general appearance of a infections breasts or possibly something that may be effected by a item or NPC.]
	now Breast Size entry is 0; [cup size as number, counting Flat Pecs = 0, A = 1, B = 2, ...]
	now Male Breast Size entry is 0; [cup size as number, counting Flat Pecs = 0, A = 1, B = 2, ...]
	now Nipple Count entry is 2; [count of nipples]
	now Nipple Color entry is ""; [one word color descriptor]
	now Nipple Shape entry is ""; [shape example: any shape will do as long as it has a baseline with a current infection or item]
	now Back Change entry is ""; [partial sentence that fits in: "Your back [one of]tingles[or]goes flush[or]vibrates with odd pleasure[or]goes cold[or]feels oily[at random] as [Back Change entry]."]
	now Back Adornments entry is ""; [partial sentence to fit: "Your back tickles with the feeling of movement caused by [back adornments of Player]."]
	now Back Skin Adjective entry is ""; [one word adjective (feathered/furred/scaly/...); EMPTY "" for creatures with just skin]
	now Back Color entry is ""; [single word color adjective for the dominant color of the skin/fur/feathers/scales]
	[Limbs Adjective is generated by a function and can be used in scenes too - "rail-thin, slender, sinewy, average, firm, muscular, flabby, meaty, rippling"]
	now Arms Change entry is ""; [partial sentence that fits in: "Your arms [one of]tingle[or]go flush[or]vibrate with odd pleasure[or]go cold[or]feel oily[at random] as [Arms Change entry]."]
	now Arms Description entry is ""; [partial sentence to fit: "Your [Limbs Adjective of Player] arms are [Arms Description of Player]."]
	now Arms Skin Adjective entry is ""; [one word adjective (feathered/furred/scaly/...); EMPTY "" for creatures with just skin]
	now Arms Color entry is ""; [single word color adjective for the dominant color of the skin/fur/feathers/scales]
	now Locomotion entry is ""; [one word adjective: (bipedal/quadrupedal/octapedal/serpentine/sliding)]
	now Legs Change entry is ""; [partial sentence that fits in: "Your legs [one of]tingle[or]go flush[or]vibrate with odd pleasure[or]go cold[or]feel oily[at random] as [Legs Change entry]."]
	now Legs Description entry is ""; [partial sentence to fit: "As your inspection goes even lower, you come to the two [Body Adjective of Player] legs supporting you. They are [Legs Description of Player]."]
	now Legs Skin Adjective entry is ""; [one word adjective (feathered/furred/scaly/...); EMPTY "" for creatures with just skin]
	now Legs Color entry is ""; [single word color adjective for the dominant color of the skin/fur/feathers/scales]
	now Ass Change entry is ""; [partial sentence that fits in: "Your ass [one of]tingles[or]goes flush[or]vibrates with odd pleasure[or]goes cold[or]feels oily[at random] as [Ass Change entry]."]
	now Ass Description entry is ""; [partial sentence to fit: "Using your hands you feel your behind enjoying the sensation of your [Ass Width Adjective of Player], [Ass Shape Adjective of Player] [Ass Description of Player]." (For players with skin, instead of the period: ", covered in [Ass Color of Player] skin and [Body Hair Description of Player]"]
	now Ass Skin Adjective entry is ""; [one word adjective (feathered/furred/scaly/...); EMPTY "" for creatures with just skin]
	now Ass Color entry is ""; [single word color adjective for the dominant color of the skin/fur/feathers/scales]
	now Ass Width entry is 3; [ass width from 1-5]
	[Ass Width Adjective generated by function out of ass width: dainty/small/round/huge/enormous]
	[Ass Adjective generated by function out of body definition and ass width]
	now Tail Change entry is ""; [partial sentence that fits in: "Your rear [one of]tingles[or]goes flush[or]vibrates with odd pleasure[or]goes cold[or]feels oily[at random] as [if HasTail of Player is true]your existing tail is changed into a [Tail Description entry][else][Tail Change entry][end if]."]
	now Tail Description entry is ""; [partial sentence to fit: "Just below your lower back sprouts a [Tail Description of Player], which you move back and forth with glee."]
	now Tail Skin Adjective entry is ""; [one word adjective (feathered/furred/scaly/...); EMPTY "" for creatures with just skin]
	now Tail Color entry is ""; [single word color adjective for the dominant color of the skin/fur/feathers/scales]
	now Asshole Depth entry is 7; [inches deep for anal fucking]
	[Asshole Depth Adjective is generated by a function and can be used in scenes too - "petite (< 3), shallow (< 5), average (< 9), deep (< 15), bottomless (15+)"]
	now Asshole Tightness entry is 3; [asshole tightness 1-5, "extremely tight, tight, receptive, open, gaping"]
	[Asshole Tightness Adjective is generated by a function and can be used in scenes too - "extremely tight, tight, receptive, open, gaping"]
	now Asshole Color entry is ""; [one word color descriptor]
	now Cock Count entry is 0;
	now Cock Girth entry is 0; [thickness 1-5, generates the Cock Girth Adjective]
	[Cock Girth Adjective is generated by a function and can be used in scenes too: thin/slender/average/thick/monstrous]
	now Cock Length entry is 0; [length in inches]
	now Cock Adjective entry is ""; [one word adjective: avian/canine/...]
	now Cock Change entry is ""; [partial sentence that fits in: "Your cock [one of]tingles[or]goes flush[or]vibrates with odd pleasure[or]goes cold[or]feels oily[at random] as [Cock Change entry]."]
	now Cock Description entry is ""; [partial sentence to fit: "You have a [Cock Girth Adjective of Player], [Cock Length of Player]-inch-long [Cock Adjective of Player] [one of]cock[or]penis[or]shaft[or]maleness[at random] that [cock Description of Player]."]
	now Cock Color entry is ""; [one word color descriptor]
	now Ball Count entry is 0; [allowed numbers: 1 (uniball), 2 or 4]
	now Ball Size entry is 0; [size of balls 1-7: "acorn-sized", "dove egg-sized", "chicken egg-sized" "goose-egg sized", "ostrich-egg sized", "basketball-sized", "beachball-sized"]
	[Ball Size Adjective is generated by a function and can be used in scenes too]
	now Ball Description entry is ""; [partial sentence to fit: "Underneath it hangs a pair of [Ball Size Adjective of Player] [Ball Description of Player]."]
	now Cunt Count entry is 0;
	now Cunt Depth entry is 0;
	now Cunt Tightness entry is 0; [size 1-5, generates adjectives of extremely tight/tight/receptive/open/gaping]
	[Cunt Tightness Adjective is generated by a function and can be used in scenes too: extremely tight/tight/well-used/open/gaping]
	now Cunt Adjective entry is ""; [one word adjective: avian/canine/...]
	now Cunt Change entry is ""; [partial sentence that fits in: "Your pussy [one of]tingles[or]goes flush[or]vibrates with odd pleasure[or]goes cold[or]feels oily[at random] as [Cunt change entry]."]
	now Cunt Description entry is ""; [partial sentence to fit: "You have a [Cunt Tightness Adjective of Player] [one of]cunt[or]pussy[or]vagina[or]cleft[at random] that [Cunt Description of Player]."]
	now Cunt Color entry is ""; [one word color descriptor]
	now Clit Size entry is 0; [size 1-5, see Clit Size Adjective]
	[Clit Size Adjective is generated by a function and can be used in scenes: very small/small/average/large/very large]
]


Section 4 - NPC/Pet

Table of GameCharacterIDs (continued)
object	name
royal tiger companion	"royal tiger"
royal tiger companion	"royal tiger companion"

royal tiger companion is a pet.
NPCObject of royal tiger companion is Ryousei.
understand "Ryousei" as royal tiger companion.
understand "Ryo" as royal tiger companion.
IDList of royal tiger companion is { "Ryousei", "ryousei", "ryo", "Ryo", "tiger", "tiger warrior", "tiger general", "royal tiger", "royal tiger companion" }.
printed name of royal tiger companion is "Ryousei".
Description of royal tiger companion is "[RyouseiDesc]".
Weapon Damage of royal tiger companion is 15.
The level of royal tiger companion is 1.
Dexterity of royal tiger companion is 15.
The summondesc of royal tiger companion is "[SummonRyousei]".
The dismissdesc of royal tiger companion is "[DismissRyousei]".
The assault of royal tiger companion is "[one of]Ryousei wades into the fight with sure strides, swiping his claws to hurt your enemy at a critical moment.[or]The royal tiger charges into combat, roaring at your opponent and making them back down a step.[or]A growled roar by Ryousei distracts your enemy a moment - long enough for you to score a quick hit![or]Snarling, your royal tiger companion slashes your enemy with his claws![at random]".
the fuckscene of royal tiger companion is "[sexwithRyousei]".

to say SummonRyousei:
	project Figure of Ryousei_clothed_icon;
	if Ryousei is visible: [summoning while standing next to him]
		say "     Walking a few steps over to where your tiger companion currently resides, you tell him that you'd like him to accompany you. The muscular feline stands up and smiles, then puts the palms of his hands together and gives a little bow. 'Of course, my friend. It is good that you have chosen to let me share your path. Onwards then, to grand adventures!' With that said, the proud tiger takes position by your side, ready to support you in what fights lie ahead.";
	else: [regular summoning]
		say "     Calling out the words, 'Watashi wa anata ni yonde, Ryousei,' you wait expectantly, and in a little swirl of blue energy, the muscled tiger indeed appears before you. He puts the palms of his hands together and gives a little bow to you, then says, '[if daytimer is day]Konnichiwa[else]Konbanwa[end if], my friend. It is good that you have chosen to let me share your path. Onwards then, to grand adventures!' With that said, the proud tiger takes position by your side, ready to support you in what fights lie ahead.";

to say DismissRyousei:
	move Ryousei to Grey Abbey Library;
	if Player is not in Grey Abbey Library: [regular dismiss]
		say "     Putting a hand on Ryousei's arm, you give him a companionable squeeze, then go on to say that you have to do without his companionship for a while. He doesn't ask why you are sending him away, just nods and gives a small bow. 'Do what you must, my friend. I will be there if you have a need of me.' With that, he walks off in a calm and unhurried stride, exploring the for him unfamiliar world on his own.";
	else: [dismissing him in the abbey]
		say "     Putting a hand on Ryousei's arm, you give him a companionable squeeze, then go on to say that you have to do without his companionship for a while. He doesn't ask why you are sending him away, just nods and gives a small bow. 'Do what you must, my friend. I will be here for a while to rest for a while. But even if I set out for exploration at some later point, you know how to call me and I will be there if you have a need of me.' With that, he strolls over to one of the bookshelves and starts to browse the knowledge of this for him unfamiliar world.";

Table of GameCharacterIDs (continued)
object	name
Ryousei	"Ryousei"

Ryousei is a man.
understand "Ryo" as Ryousei.
ScaleValue of Ryousei is 3. [human sized]
Body Weight of Ryousei is 5. [scale of 1-9 for body weight, grouped into low weight (1-3), mid weight (4-6) and high weight (7-9)]
Body Definition of Ryousei is 8. [scale of 1-9 for body definition, grouped into low muscle (1-3), mid muscle (4-6), high muscle (7-9)]
[Body Adjective is generated out of the body weight and body definition and can be used in scenes - one word descriptive adjective depending on weight and definition groups: low weight group: skinny/slender/lithe; mid weight group: average/fit/muscled; high weight group: pudgy/husky/jacked]
Androginity of Ryousei is 2. [Gender Adjective is generated out of androginity 1-9: hypermasculine/masculine/somewhat effeminate/effeminate/androgynous/feminine butch/tomboyish/feminine/hyperfeminine]
Mouth Length of Ryousei is 6. [inches deep for face fucking; maximum possible will be double this number (when deep throating)]
Mouth Circumference of Ryousei is 4. [mouth circumference 1-5, "tiny, small, normal, wide, gaping"]
Tongue Length of Ryousei is 6. [length in inches]
Breast Size of Ryousei is 0. [cup size as number, counting Flat Pecs = 0, A = 1, B = 2, ...]
Nipple Count of Ryousei is 2. [count of nipples]
Asshole Depth of Ryousei is 8. [inches deep for anal fucking]
Asshole Tightness of Ryousei is 3. [asshole tightness 1-5, "extremely tight, tight, receptive, open, gaping"]
Cock Count of Ryousei is 1. [number of cocks]
Cock Girth of Ryousei is 3. [thickness 1-5, thin/slender/average/thick/monstrous]
Cock Length of Ryousei is 12. [length in inches]
Ball Count of Ryousei is 2. [allowed numbers: 1 (uniball), 2 or 4]
Ball Size of Ryousei is 3. [size of balls 1-7: "acorn-sized", "dove egg-sized", "chicken egg-sized" "goose-egg sized", "ostrich-egg sized", "basketball-sized", "beachball-sized"]
Cunt Count of Ryousei is 0. [number of cunts]
Cunt Depth of Ryousei is 0. [penetrable length in inches; some minor stretching allowed, or more with Twisted Capacity]
Cunt Tightness of Ryousei is 0. [size 1-5, generates adjectives of extremely tight/tight/receptive/open/gaping]
Clit Size of Ryousei is 0. [size 1-5, very small/small/average/large/very large]
[Basic Interaction states as of game start]
PlayerMet of Ryousei is false.
PlayerRomanced of Ryousei is false.
PlayerFriended of Ryousei is false.
PlayerControlled of Ryousei is false.
PlayerFucked of Ryousei is false.
OralVirgin of Ryousei is false.
Virgin of Ryousei is true.
AnalVirgin of Ryousei is false.
PenileVirgin of Ryousei is false.
SexuallyExperienced of Ryousei is true.
TwistedCapacity of Ryousei is false. [Twisted Characters can take any penetration, no matter the size]
Sterile of Ryousei is false. [steriles can't knock people up]
MainInfection of Ryousei is "Royal Tiger".
Description of Ryousei is "[RyouseiDesc]".
Conversation of Ryousei is { "Royal Tiger!" }.

instead of sniffing Ryousei:
	say "[RyouseiScent]";

instead of fucking Ryousei:
	say "[sexwithRyousei]";

to say RyouseiDesc:
	if debugactive is 1:
		say "DEBUG -> RyouseiEricInteraction: [RyouseiEricInteraction], lastRyouseiEricInteraction: [lastRyouseiEricInteraction], RyouseiXerxes: [RyouseiXerxes], RyouseiHayato: [RyouseiHayato], RyouseiRane [RyouseiRane] <- DEBUG[line break]";
	project Figure of Ryousei_clothed_icon;
	say "     Ryousei is an anthro tiger - and not just any tiger, but a magnificent example of his species. Standing quite tall and strong, corded muscles ripple under his luscious, well-groomed fur and he has an undeniable air of confidence and power around him. Truly, if there is royalty among tiger-folk, this is it. Something in his proud bearing and in the somewhat out of place mannerisms he often uses tells you that this male really isn't a transformed human, but came here from someplace else. He wears an exceedingly well made blue kimono, consisting of smooth, very durable fabric. A green jade disc hangs on a leather string around his neck, the amulet bearing the sigil of two dragons flanking a radiant pearl.";
	if Player is in Grey Abbey Library:
		say "     Having made himself at home in the library, the large cat usually hangs out on the ground floor - doing Tai Chi exercises, browsing books or meditating while sitting cross-legged on a sofa. He never is far from the front door though, and you notice that he frequently glances over to it, ready to react in case someone - or something - might invade your refuge. As he notices your attention on himself, the tiger gives you a companionable nod and a wink. Seems like he's more than ready to chat - or do other things...";
	else:
		say "     Accompanying you on your adventures throughout the city, he is never far away, usually just a step behind and a little to the side - leaving you the lead as his local guide. As he notices your attention on himself, the tiger gives you a companionable nod and a wink. Seems like he's more than ready to chat - or do other things...";
	if royal tiger companion is listed in companionList of Player:
		say "     [bold type]He is currently following you as your battle companion.[roman type][line break]";

instead of sniffing royal tiger companion:
	say "[RyouseiScent]";

to say RyouseiScent:
	say "     There is a hint of sandalwood underlying the scent of Ryousei's clean fur.";

instead of conversing the Ryousei:
	if Player is in Grey Abbey Library and Ryousei is in Grey Abbey Library:
		say "[RyouseiTalkMenu]";
	else if royal tiger companion is listed in companionList of Player:
		say "[RyouseiTalkMenu]";
	else:
		say "     Ryousei isn't here.";

instead of conversing royal tiger companion:
	if royal tiger companion is not tamed:
		say "     Who?";
	else:
		if Player is in Grey Abbey Library and Ryousei is in Grey Abbey Library:
			say "[RyouseiTalkMenu]";
		else if royal tiger companion is listed in companionList of Player:
			say "[RyouseiTalkMenu]";
		else:
			say "     Ryousei isn't here.";

to say RyouseiTalkMenu:
	LineBreak;
	project the figure of Ryousei_face_icon;
	now sextablerun is 0;
	blank out the whole of table of fucking options;
	[]
	choose a blank row in table of fucking options;
	now title entry is "Ask him about becoming a tiger";
	now sortorder entry is 0;
	now description entry is "Tell the proud tiger you want to be like him";
	[]
	choose a blank row in table of fucking options;
	now title entry is "Talk about the place he is from";
	now sortorder entry is 1;
	now description entry is "Ask the tiger to tell you of his world";
	[]
	if carried of fur brush > 0:
		choose a blank row in table of fucking options;
		now title entry is "Offer to brush his fur";
		now sortorder entry is 2;
		now description entry is "Suggest grooming the proud tiger";
	[]
	if "TaiChi_Seen" is listed in Traits of Ryousei or "TaiChi_Joined" is listed in Traits of Ryousei:
		choose a blank row in table of fucking options;
		now title entry is "Ask if he wants to do some Tai Chi";
		now sortorder entry is 4;
		now description entry is "Suggest that the two of you perform some exercises together";
	[]
	choose a blank row in table of fucking options;
	now title entry is "Suggest a sparring match";
	now sortorder entry is 5;
	now description entry is "Spar against the muscular tiger";
	[]
	repeat with y running from 1 to number of filled rows in table of fucking options:
		choose row y from the table of fucking options;
		say "[link][y] - [title entry][as][y][end link][line break]";
	say "[link]0 - Nevermind[as]0[end link][line break]";
	while sextablerun is 0:
		say "Pick the corresponding number> [run paragraph on]";
		get a number;
		if calcnumber > 0 and calcnumber <= the number of filled rows in table of fucking options:
			now current menu selection is calcnumber;
			choose row calcnumber in table of fucking options;
			say "[title entry]: [description entry]?";
			if Player consents:
				let nam be title entry;
				now sextablerun is 1;
				if (nam is "Ask him about becoming a tiger"):
					say "[RyouseiTalk1]";
				else if (nam is "Talk about the place he is from"):
					say "[RyouseiTalk2]";
				else if (nam is "Offer to brush his fur"):
					say "[RyouseiBrushing]";
				else if (nam is "Ask if he wants to do some Tai Chi"):
					say "[RyouseiTaiChi]";
				else if (nam is "Suggest a sparring match"):
					say "[RyouseiSparring]";
				wait for any key;
				say "[RyouseiTalkMenu]";
		else if calcnumber is 0:
			now sextablerun is 1;
			say "     You step back from the royal tiger, shaking your head slightly as he gives a questioning look.";
			wait for any key;
		else:
			say "Invalid Option. Pick between 1 and [the number of filled rows in the table of fucking options] or 0 to exit.";
	clear the screen and hyperlink list;

to say RyouseiTalk1:
	say "     Ryousei looks at you with surprise on his face and strokes his furry chin. 'You want to... be like me? This strange world still surprises me, no matter how many creatures I see change before my very eyes. But if that is your custom, I am willing to help. May bringing more tiger-folk into this place lead to greater wisdom and restraint. Your native beasts certainly lack both.' With that, he curls his clawed fingers, looking at the cup of his hand in intense concentration, then suddenly presses his palm flat against your chest. 'There, that should do it from what I have observed.'";
	repeat with y running from 1 to number of filled rows in Table of Random Critters:
		choose row y in Table of Random Critters;
		if Name entry is "Royal Tiger":
			now MonsterID is y;
			break;
	now non-infectious entry is false;
	now Cross-Infection entry is ""; [ Infection that this infection will give the player when they lose; can be left empty if they infect with the monster's own strain. ]
	infect "Royal Tiger";
	now non-infectious entry is true;

to say RyouseiTalk2:
	say "     Starting a conversation about the otherworldly place Ryousei came from, you listen with rapt attention to a tale about [one of]the flying mountain of On'huang and the hawk-men that live there[or]the lush land of the middle, dominion of his overlord, the shogun Aki[or]Shir'ley, a beautiful dancer that two generals almost fought a war over[or]a gruesome red oni, eating dozens of people from a lone village before he could be stopped[or]the monks of the oblivion and their everlasting vigil to keep the bottomless abyss from consuming everything around it[or]the evil djinn Zardoz, who entrapped those who wished on his lamp[at random]. It certainly is an epic story, told in the rich, deep voice of your companion. You can picture the beautiful and terrible landscapes appearing in it from his detailed descriptions, taking you away from the dreary reality of the nanite apocalypse for a moment. With that and all the strange people and creatures appearing in it, the tale would certainly make a fitting script for a Hollywood movie.";

to say RyouseiBrushing:
	project Figure of Ryousei_fundoshi_icon;
	if XP of Ryousei is 0: [never brushed before]
		say "     As you pull the wooden brush from your backpack and approach Ryousei, he watches you come closer with a curious yet friendly expression on his face, followed by a chuckle as you make your offer to brush his fur. 'Your people do certainly have interesting customs, my friend,' the proud tiger says while rubbing the underside of his chin thoughtfully, the edges of his mouth curving up in amusement. 'But as the saying goes, [']If you walk the golden road of Amate'okoku, be sure to bow to the sunrise.[']' He winks at you and glances around, reflexively making sure that no threats are near, then undoes the obi of his blue kimono. Sliding the durable garment back over his shoulders, he bares his well-trained body to you, clad in nothing more than a white fundoshi beneath. Folding the blue fabric into a small-ish square, the otherworldly cat brushes a spot on the ground, then lays the kimono down on it and kneels facing away from you.";
		say "     You can see the muscles of the skilled warrior's back flex under his short fur as he partly turns to look over his shoulder, calling out, 'I await your brush, friend.' His tail is raised in a gentle curve, the end hooked as if to form a question mark. Smiling, you step up behind Ryousei, turning the brush to its rubber-tipped wooden pegs and stroking it gently through the striped fur on his back. Little tangles of fur smooth out easily when you do, and a few loose hairs are taken up by the brush. There is something pleasant and relaxing about the simple act of stroking your friend, grooming this large and powerful warrior. Putting a hand on his shoulder to brace yourself as you work your hand down Ryousei's broad back, you feel that you're not the only one who thinks so. You can feel the beginning vibrations of an intense purr in your hand and arm even before you hear any sound come from the tiger's chest.";
		WaitLineBreak;
		say "     Eventually having groomed all of your otherworldly companion's back, as well as his muscled arms, you step around to work on his front, too. As your brush slowly slides over the firm contours of his pecs, the tiger lets out a pleased growling sound that makes you look up to meet his gaze. 'You know, in my world there are few instances in which people groom each other like this. Cubs obviously, and invalid battle-brothers - both of which I assume you don't think me part of.' An underlying tone of amusement tells you he's making a joke, so you join his chuckle. What remains when that ebbs off is a relatively intense gaze in your feline friend's eyes, followed by him adding the words, 'The other people who do this for each other are mates.' He looks down between you, focusing on the erection tenting out his fundoshi. 'Now, I know of course that you have a different culture and don't necessarily mean things as my people would, but try telling my body this,' Ryousei says with a wink.";
		LineBreak;
		say "     [bold type]How do you respond to his teasing?[roman type][line break]";
		say "     [link](1)[as]1[end link] - Put your hand on his crotch and give him a rub.";
		say "     [link](2)[as]2[end link] - Just being a good friend here. The fundoshi stays on.";
		say "     [link](3)[as]3[end link] - Err, stop touching him right now.";
		now calcnumber is 0;
		while calcnumber < 1 or calcnumber > 3:
			say "Choice? (1-3)>[run paragraph on]";
			get a number;
			if calcnumber is 1 or calcnumber is 2 or calcnumber is 3:
				break;
			else:
				say "Invalid choice. Type [link]1[end link] to suggest more than grooming, [link]2[end link] to keep things platonic or [link]3[end link] to stop.";
		if calcnumber is 1:
			LineBreak;
			say "[RyouseiSexualGrooming1]";
			now XP of Ryousei is 2; [sexual grooming before]
		else if calcnumber is 2: [platonic stroking]
			LineBreak;
			say "     Giving the well-trained tiger and his bulge some respectful glances, you murmur something about just being friendly, then continue to stroke him in the same unhurried tempo. Both of you enjoy the quiet time together, but eventually you're all done and pack away the brush. Ryousei lets out a little sigh full of unfulfilled desires, then stands up and gets dressed again. 'Thank you for a pleasant time. I enjoyed spending it with you.' With that said, the tiger takes his usual place by your side once more.";
			now XP of Ryousei is 1; [nonsexual grooming before]
		else: [stop right away]
			LineBreak;
			say "     Quickly lowering the brush, you quietly tell Ryousei that maybe it'd be best if you stopped this for now. The tiger acknowledges you with a dignified look full of understanding, but you think you can detect a little note of disappointment in his eyes as he stands up to get dressed again. 'My apologies if that made you uncomfortable. As I said, our cultures clearly are quite different in some regards.' With a shrug, the tiger takes his usual place by your side once more.";
			now XP of Ryousei is 1; [nonsexual grooming before]
	else if XP of Ryousei is 1: [nonsexual brush before]
		say "     As you pull the wooden brush from your backpack and approach Ryousei, he watches you come closer with an amused expression on his face, followed by a chuckle as you again make your offer to brush his fur. 'I can say that I do enjoy this custom of your people, my friend,' the proud tiger says while rubbing the underside of his chin thoughtfully, the edges of his mouth curving up. 'Just remember that such intimate touching will likely have a certain effect on me. I wouldn't want you to be disconcerted by that.' He winks at you and glances around, reflexively making sure that no threats are near, then undoes the obi of his blue kimono. Sliding the durable garment back over his shoulders, he bares his well-trained body to you, clad in nothing more than a white fundoshi beneath. Folding the blue fabric into a small-ish square, the otherworldly cat brushes a spot on the ground, then lays the kimono down on it and kneels facing away from you.";
		say "     You can see the muscles of the skilled warrior's back flex under his short fur as he partly turns to look over his shoulder, calling out, 'I await your brush, friend.' His tail is raised in a gentle curve, the end hooked as if to form a question mark. Smiling, you step up behind Ryousei, turning the brush to its rubber-tipped wooden pegs and stroking it gently through the striped fur on his back. Little tangles of fur smooth out easily when you do, and a few loose hairs are taken up by the brush. There is something pleasant and relaxing about the simple act of stroking your friend, grooming this large and powerful warrior. Putting a hand on his shoulder to brace yourself as you work your hand down Ryousei's broad back, you feel that you're not the only one who thinks so. You can feel the beginning vibrations of an intense purr in your hand and arm even before you hear any sound come from the tiger's chest.";
		WaitLineBreak;
		say "     Eventually having groomed all of your otherworldly companion's back, as well as his muscled arms, you step around to work on his front, too. As your brush slowly slides over the firm contours of his pecs, the tiger lets out a pleased growling sound that makes you look up to meet his gaze. 'So, here we are again. As close together as mates would be in my world, with the expected result.' He looks down between you, focusing on the erection tenting out his fundoshi. 'By all means, continue. This is pleasant enough, even if I have to remind myself that it doesn't mean what my body expects it to,' Ryousei says with a wink.";
		LineBreak;
		say "     [bold type]How do you respond to his r?[roman type][line break]";
		say "     [link](1)[as]1[end link] - Put your hand on his crotch and give him a rub.";
		say "     [link](2)[as]2[end link] - Just being a good friend here. The fundoshi stays on.";
		say "     [link](3)[as]3[end link] - Err, stop touching him right now.";
		now calcnumber is 0;
		while calcnumber < 1 or calcnumber > 3:
			say "Choice? (1-3)>[run paragraph on]";
			get a number;
			if calcnumber is 1 or calcnumber is 2 or calcnumber is 3:
				break;
			else:
				say "Invalid choice. Type [link]1[end link] to suggest more than grooming, [link]2[end link] to keep things platonic or [link]3[end link] to stop.";
		if calcnumber is 1:
			LineBreak;
			say "[RyouseiSexualGrooming1]";
			now XP of Ryousei is 2; [sexual grooming before]
		else if calcnumber is 2: [platonic stroking]
			LineBreak;
			say "     Giving the well-trained tiger and his bulge some respectful glances, you murmur something about just being friendly, then continue to stroke him in the same unhurried tempo. Both of you enjoy the quiet time together, but eventually you're all done and pack away the brush. Ryousei lets out a little sigh full of unfulfilled desires, then stands up and gets dressed again. 'Thank you for a pleasant time. I enjoyed spending it with you.' With that said, the tiger takes his usual place by your side once more.";
		else: [stop right away]
			LineBreak;
			say "     Quickly lowering the brush, you quietly tell Ryousei that maybe it'd be best if you stopped this for now. The tiger acknowledges you, yet raises an eyebrow in surprise. 'I have to ask: What did you expect, my friend? I told you before that some things just come natural, yet you seem oddly surprised. Oh well, our different cultures clearly are at odds here. My apologies if I made you uncomfortable.' With a shrug, the tiger takes his usual place by your side once more.";
	else if XP of Ryousei is 2: [sexual brush before]
		say "     As you pull the wooden brush from your backpack and approach Ryousei, he watches you come closer with an amused expression on his face, followed by a chuckle as you again make your offer to brush his fur. 'I can say that I do enjoy this custom of your people, my friend,' the proud tiger says while rubbing the underside of his chin thoughtfully, the edges of his mouth curving up, 'especially if you want to give it another intimate ending. I know that this does not necessarily mean that you're my mate, but I can say that I wouldn't mind if it were true.' He winks at you and glances around, reflexively making sure that no threats are near, then undoes the obi of his blue kimono. Sliding the durable garment back over his shoulders, he bares his well-trained body to you, clad in nothing more than a white fundoshi beneath. Folding the blue fabric into a small-ish square, the otherworldly cat brushes a spot on the ground, then lays the kimono down on it and kneels facing away from you.";
		say "     You can see the muscles of the skilled warrior's back flex under his short fur as he partly turns to look over his shoulder, calling out, 'I await your brush, friend.' His tail is raised in a gentle curve, the end hooked as if to form a question mark. Smiling, you step up behind Ryousei, turning the brush to its rubber-tipped wooden pegs and stroking it gently through the striped fur on his back. Little tangles of fur smooth out easily when you do, and a few loose hairs are taken up by the brush. There is something pleasant and relaxing about the simple act of stroking your friend, grooming this large and powerful warrior. Putting a hand on his shoulder to brace yourself as you work your hand down Ryousei's broad back, you feel that you're not the only one who thinks so. You can feel the beginning vibrations of an intense purr in your hand and arm even before you hear any sound come from the tiger's chest.";
		WaitLineBreak;
		say "     Eventually having groomed all of your otherworldly companion's back, as well as his muscled arms, you step around to work on his front, too. As your brush slowly slides over the firm contours of his pecs, the tiger lets out a pleased growling sound that makes you look up to meet his gaze. 'So, here we are again. As close together as mates would be in my world, with the expected result.' He looks down between you, focusing on the erection tenting out his fundoshi. Leaning forward to lick your cheek, he adds in a throaty voice, 'Would you like to take this further? I very much desire to do so.'";
		LineBreak;
		say "     [bold type]How do you respond to his teasing?[roman type][line break]";
		say "     [link](1)[as]1[end link] - Put your hand on his crotch and give him a rub.";
		say "     [link](2)[as]2[end link] - Just being a good friend here. The fundoshi stays on.";
		now calcnumber is 0;
		while calcnumber < 1 or calcnumber > 2:
			say "Choice? (1-3)>[run paragraph on]";
			get a number;
			if calcnumber is 1 or calcnumber is 2:
				break;
			else:
				say "Invalid choice. Type [link]1[end link] to suggest more than grooming or [link]2[end link] to keep things platonic this time.";
		if calcnumber is 1:
			LineBreak;
			say "[RyouseiSexualGrooming1]";
		else if calcnumber is 2: [platonic stroking]
			LineBreak;
			say "     Giving the well-trained tiger and his bulge some respectful glances, you put your hand on his shoulder and quietly explain that this time, you really only did want to be friendly. He takes your decision amicably enough, remaining in position as you continue to stroke him in the same unhurried tempo. Both of you enjoy the quiet time together, but eventually you're all done and pack away the brush. Ryousei lets out a little sigh full of unfulfilled desires, then stands up and gets dressed again. 'Thank you for a pleasant time. I enjoyed spending it with you.' With that said, the tiger takes his usual place by your side once more.";

to say RyouseiSexualGrooming1:
	project Figure of Ryousei_naked_icon;
	say "     Lowering a hand and placing it on the bulge of your tiger-striped companion, you look into Ryousei's eyes and say that you wouldn't mind making more than just grooming out of this. His purr increases in volume and the large feline leans forward to lick your cheek, then lowers a hand to pull the fundoshi off his hips. No longer constrained by the white fabric, your otherworldly companion's erection swings upwards to proudly stand straight, aimed right at you. It is very well sized even for a large being such as Ryousei, thick and weighty above his dangling furry balls. Putting down the brush, you wrap your fingers around the purring tiger's erection. Stroking up and down his shaft, you feel the small, nubby spines along its length, which are soft but have just enough rigidity to rub someone in just the right way. Near the base, his cock bulges out just a little bit, forming something that is not quite the knot of a canine, but large enough to leave an impression as it slides in and out of someone.";
	say "     As you handle his manhood, the naked tiger puts his arms around your body in turn, pulling you in against his broad chest and licking your neck affectionately. There is no need for words between you as you touch and feel one another, the vibrations of Ryousei's purr radiating through your entwined bodies. You can't help but feel taken up in the open affection the male tiger is sharing with you, something about the way he regards you feeling primal and intense. While he may be a proud and civilized man, Ryousei is clearly in touch with his feline urges as well and doesn't shy away from doing what feels natural. As you touch and stroke one another, you feel your own arousal grow alongside Ryousei's obvious pleasure, the big feline's throaty moans like music to your ears.";
	WaitLineBreak;
	say "     The tiger's lustful grunts soon gain a definite tone of urgency as you stroke and pump his length, the reactions you elicit bringing a smile to your face. Enjoying the intimacy with your feline partner, you lower your other hand to cup his full and weighty balls, gently rolling those softly furred orbs between your fingers. This coaxes a throaty sound of pleasure from the depth of his broad chest, followed by him drawing your mouth to his in a forceful kiss. Ryousei's manhood starts to throb in your grasp, the anthro feline's pre leaking liberally over your fingers, and you can feel his balls start to tighten as nears his inevitable peak.";
	say "     Before long, the first heavy spurt of tiger cum shoots from his cock, splashing across your arm and marring your [Skin of Player] skin. You continue to stroke him while he climaxes, savoring the way his uniquely shaped cock throbs and pulses in time with each powerful blast. Moaning his pleasure, the tiger squeezes you tightly against his trembling form, his muzzle locking to your lips in a hungry kiss that has your tongues dance and spar. His length twitches with each thick spurt of feline seed, splattering your body in dripping webs of the virile fluid. He purrs like an idling motor as his orgasm tapers to an end, his breath still strained by the time his muzzle pulls away to look into your eyes with a great sense of loyalty and affection.";
	WaitLineBreak;
	say "     When the two of you eventually come down from the lustful excitement, you realize that you're now soaked in Ryousei's cum, the tiger's creamy release clinging to your body. He follows your gaze as you check yourself out, then wiggles his eyebrows and says, 'I'll take care of that. Grooming goes both ways, after all.' Chuckling softly, he pulls your arm up with gentle force and begins to clean the mess with his tongue. In a mixture of playful and dutifully thorough ministrations, the tiger doesn't let you go until you're as clean as a cat-wash can make you. Then he kisses you deeply once more, sharing the taste of his load as he explores your mouth with his tongue. When he draws back after a little while, Ryousei looks at you and smiles. 'Spending time with someone like you makes even a strange world like this more bearable. Thank you for your company[if Player is not defaultnamed], [name of Player][end if]. I really enjoyed every part of it, and I wouldn't mind doing more with you soon.'";
	say "     Grabbing the fundoshi from the ground and standing up to properly wrap it around his hips, the proud tiger shakes out the folded bundle of his kimono before putting it back on again. Soon, he is as well-dressed as ever, ready to accompany you wherever you may go and share in your adventures.";

to say sexwithRyousei:
	if lastfuck of Ryousei - turns < 6:
		say "     The proud tiger reaches out to squeeze your arm in a companionable way, but stops you as you move to embrace him. 'Sorry my friend, but one should always strive for moderation. It would not do to exhaust ourselves completely and then be surprised by some wandering beast. This city is a dangerous place, after all.' With that said, your companion lets go of you. Seems like you've got to wait a bit if you want to get frisky with him...";
	else:
		say "     As you approach the proud tiger with your offer of sex, Ryousei smiles, showing off his rather impressive fangs. 'So you did not just want me as your companion in fights, did you? Very well - I would be more than happy to indulge you. One takes what pleasure there is on a campaign, and I am no stranger to sharing a bed with those who have earned my respect, be they male or female.' His gaze wanders up and down over your form, and the anthro tiger reaches out to caress your arm.";
		say "[RyouseiSexMenu]";

to say RyouseiSexMenu:
	LineBreak;
	project the Figure of Ryousei_naked_icon;
	now sextablerun is 0;
	blank out the whole of table of fucking options;
	[]
	choose a blank row in table of fucking options;
	now title entry is "Suck the proud anthro tiger off";
	now sortorder entry is 1;
	now description entry is "Kneel down and get your lips around that shapely dick of his";
	[]
	if Player is female:
		choose a blank row in table of fucking options;
		now title entry is "Let Ryousei eat your pussy";
		now sortorder entry is 2;
		now description entry is "Feel the big cat's tongue lap over your crotch";
	[]
	if Player is male:
		choose a blank row in table of fucking options;
		now title entry is "Frot with Ryousei";
		now sortorder entry is 3;
		now description entry is "Rub your cocks against each other until you both come";
	[]
	choose a blank row in table of fucking options;
	now title entry is "69 with Ryousei";
	now sortorder entry is 4;
	now description entry is "Share mutual oral pleasure";
	[]
	choose a blank row in table of fucking options;
	now title entry is "Get fucked in the ass by Ryousei";
	now sortorder entry is 10;
	now description entry is "Ask the proud tiger to fuck you";
	[]
	if Player is female:
		choose a blank row in table of fucking options;
		now title entry is "Take Ryousei's shaft in your pussy";
		now sortorder entry is 11;
		now description entry is "Ask the proud tiger to fuck you";
	[]
	if Player is male:
		choose a blank row in table of fucking options;
		now title entry is "Fuck the anthro tiger";
		now sortorder entry is 21;
		now description entry is "Sink your prick into Ryousei's tight hole";
	[]
	if RyouseiXerxes is 1 and player is in Grey Abbey Library:
		choose a blank row in table of fucking options;
		now title entry is "Offer the anthro tiger a go with Xerxes";
		now sortorder entry is 90;
		now description entry is "Let Ryousei enjoy Xerxes['] rear while you make use of his front";
	[]
	repeat with y running from 1 to number of filled rows in table of fucking options:
		choose row y from the table of fucking options;
		say "[link][y] - [title entry][as][y][end link][line break]";
	say "[link]0 - Nevermind[as]0[end link][line break]";
	while sextablerun is 0:
		say "Pick the corresponding number> [run paragraph on]";
		get a number;
		if calcnumber > 0 and calcnumber <= the number of filled rows in table of fucking options:
			now current menu selection is calcnumber;
			choose row calcnumber in table of fucking options;
			say "[title entry]: [description entry]?";
			if Player consents:
				let nam be title entry;
				now sextablerun is 1;
				if (nam is "Suck the proud anthro tiger off"):
					say "[PlayerSucksRyousei]";
				else if (nam is "Let Ryousei eat your pussy"):
					say "[RyouseiLicksPlayerPussy]";
				else if (nam is "Frot with Ryousei"):
					say "[RyouseiPlayerFrot]";
				else if (nam is "69 with Ryousei"):
					say "[RyouseiPlayer69]";
				else if (nam is "Get fucked in the ass by Ryousei"):
					say "[RyouseiFucksPlayer]";
				else if (nam is "Take Ryousei's shaft in your pussy"):
					say "[RyouseiFucksPlayerAss]";
				else if (nam is "Fuck the anthro tiger"):
					say "[PlayerFucksRyousei]";
				else if (nam is "Offer the anthro tiger a go with Xerxes"):
					say "[RyouseiXerxesSex]";
				wait for any key;
		else if calcnumber is 0:
			now sextablerun is 1;
			say "     You step back from the royal tiger, shaking your head slightly as he gives a questioning look.";
			wait for any key;
		else:
			say "Invalid Option. Pick between 1 and [the number of filled rows in the table of fucking options] or 0 to exit.";
	clear the screen and hyperlink list;

to say PlayerSucksRyousei: [player goes down on Ryousei's dick]
	say "     Taking the lead, you slide a hand through the soft, mid-length fur on the back of his neck and hook it behind his head, drawing the statuesque tiger to you to meet his muzzle with your mouth. A deep purr rumbles in the depth of his throat as Ryousei eagerly gives in to the kiss, opening his muzzle to let his tongue wrestle with yours. Your other arm more or less automatically slides around his side, holding on to the muscled form of the tall cat. He feels warm and soft against your skin, yet with a rock-solid firmness underneath, speaking of many years of hard martial training. Towards you, he's showing his gentler side right now, caressing your shoulders and back with strong hands, while at the same time lowering his head to yours. The rumbling purr from his broad chest vibrates throughout your body, putting you into a very relaxed, open state. 'You are one sexy being - a shining star in this dreary place,' Ryousei grunts lustily as you draw back for a breather.";
	say "     Eager to touch the tiger and take care of him, your hands move to his hips and pull away the cloth belt bound around them. As the knot of fabric at the front is undone, it falls to the ground, leaving Ryousei's kimono to be pulled open by you. Doing so, you reveal the muscled tiger's cream-colored front, its glorious fur short enough to let his impressive physique show clearly - muscled pecs and rock hard abs above the longer fur of his pubes, nestled around a proper feline sheath from which his rigid cock protrudes, hard and ready for you. Very well sized even for a large being such as Ryousei, the erection stands straight out, thick and weighty above his dangling furry balls. It tapers sharply near the end, coming to a point that promises many interesting sensations - as do the numerous small, nubby spines along its shaft. You can't help but want to touch it, so you do - fingers closing around the firm length and feeling over the spines, finding them pretty soft, with just enough rigidity to rub someone in just the right way when they get fucked by Ryousei.";
	WaitLineBreak;
	say "     'Do you like it?' the big tiger asks, continuing with, 'Even many denizens of my own plane get a bit frightened when they lay eyes on a tiger's manhood and... nnnngghhh!' Squeezing his cock and giving it an appreciative jerk, you tell your feline companion in an unmistakable way that you have absolutely no problem with his cock. And to follow up on that, you sink to your knees with a wide grin, then lap at the underside of his cock-head. A drawn-out mrowl comes from Ryousei and he strokes your head when you lick him a few times (with the direction of the spines, not against). Then you close your lips around his cock-head and start to suck, while both your hands are busy fondling Ryousei's balls as well as his shaft.";
	say "     Moans and grunts fill your surroundings, underlain by purring loud enough the resemble an idling motor as you go down on your otherworldly companion. Being on the receiving end of your dedicated oral attention, Ryousei's arousal grows in leaps and bounds and before all that long, he gasps out in an urgent tone, 'You are quite good at this. I am gonna come soon.' In response, you just suck harder, and just a few moments later are rewarded with a spurt of warm and creamy cum, spurting in a tasty streak over your tongue. Then another follows, and another, prompting you to swallow his load quickly to be ready for even more cum to come. And so you gobble up every last drop of the tiger's seed, filling your stomach with the rich bounty his balls churn out. Eventually, the spurts ebb and your friend puts a restraining hand on your shoulder.";
	WaitLineBreak;
	say "     'Thank you. That was quite pleasurable,' Ryousei says with a purr in his voice, then pulls you up to your feet and hugs you tight. His lust satisfied for now, Ryousei nevertheless keeps his arms around you and strokes your skin gently. Not one for cheap one-night-stands, he clearly wants to spend time with you, even outside of immediate sex. Then, after giving the side of your neck a long lick and breathing in your scent deeply, he says, 'Being your companion makes the time on this wretched world bearable, even... pleasant, at times. I want you to think about what you will do when I eventually find my way back home. Would you accompany me, leave this place? My army needs people like you - strong and dependable. There will be hardship, but also rewards...' He squeezes your shoulder with one hand, mrowling affectionately before stepping away to reach for his kimono. 'Do not answer now, it is moot until I can open a portal anyways. Just... think about it,' he says, then moves away a bit to groom his fur into its usual impeccable state and get dressed.";
	NPCSexAftermath Player receives "OralPussy" from Ryousei;

to say RyouseiLicksPlayerPussy: [player's pussy is licked by Ryo]
	say "     Letting Ryousei take the lead, you lean into his touch as he puts his arms around you, drawing you close against his furred body. He feels warm and soft against your skin, yet with a rock-solid firmness underneath, speaking of many years of hard martial training. Towards you, he's showing his gentler side right now, caressing your shoulders and back with strong hands, while at the same time lowering his head to yours. Meeting his muzzle, you're drawn into a long kiss, with his tongue wrestling pleasurably with your own. A rumbling purr from his broad chest vibrates throughout your body, putting you into a very relaxed, open state.";
	say "     As you pant into his mouth that you are dripping wet from arousal because of him, the tiger gives a teasing smile and replies, 'Let us see about that. I cannot leave my favorite companion wanting.' With that said, he starts to slide his hands under your clothes, caressing your body and pulling them off piece by piece. Eager to feel his touch, you readily help the anthro tiger to strip you, then watch as he himself quickly shrugs out of the kimono he wears. Putting an arm around you, Ryousei then moves to gently lower your naked form on top of the resulting small pile of discarded clothing, giving you a soft place to lie as he leans over you.";
	WaitLineBreak;
	say "     The tiger general makes out with you for a quite pleasurable time before he eventually moves lower, bringing his head to the same level as your crotch. You can feel his warm breath against your nether lips as he leans over them and inhales deeply several times, taking in your scent. Moving a paw-hand on top of your crotch, he strokes your clit and nether lips gently, tracing their outline. 'It is interesting how every one of these is a little different, with their folds and pleasure spots - especially if one travels to other worlds. Yours is beautiful, as are you - and the scent of your arousal is simply amazing.'";
	say "     The large cat follows up his compliment with a slow, long lick, all the way from the base of your pussy to the sensitive clit at the top. The slight roughness of his warm, wet tongue against your female parts sends tingles of pleasure up your spine and makes you writhe on the ground. Then Ryousei puts one of his large paw-hands on your belly in a calming gesture and as you raise your head to look down, you see him smiling at you. 'Did you like that?' the noble feline asks with a purr vibrating in his chest. Replying with an eager nod and a pleased sigh prompts him to start brushing over your nether lips with a teasing touch that has you let out a loud moan.";
	WaitLineBreak;
	say "     After a little while of building up your anticipation and need even further, the tiger finally starts to focus on your clit, rubbing it with a gentle, steady touch. Man, that feels good. No, GREAT! You can't help but squirm and tremble under his touch, straining to raise your hips towards him - and the tiger reacts to your unvoiced invitation, sliding two fingers into your pussy a moment later. Your feline companion wasn't kidding when he said he did have experience in these matters too - as he knows just how to wiggle his probing digits and where to brush against very sensitive spots deep inside your body.";
	say "     With a single finger on the magic button of your clit, he proceeds to drive you to breathless arousal, writhing on top of your improvised bedding as [if Player is purefemale]your pussy gets very wet and swollen, ready for more[else if Player is male]your cock goes rock hard and starts to drip with pre-cum[else]feelings of intense pleasure wash over you[end if]. 'I want to taste you,' the muscled tiger tells you as he lowers his head until his muzzle touches your crotch, starting to lick you in earnest this time.";
	WaitLineBreak;
	say "     Brush after brush of that amazing tongue, he laps over your sex and wiggles it to give your clit special attention, while at the same time still sliding his fingers in and out of your pussy. The feeling of him pleasuring you - inside and out - is literally breathtaking, forcing you to pant for air in between letting out long, oh so pleased gasps. Wow. Just... wow. The large feline winds you up expertly, building your arousal more and more, then pausing at just the right moment to extend your pleasure and keep you just at the brink of orgasm. It could almost be called sensual torture to nearly reach the point of no return several times, then be strung along by your partner for another dip and dip and rise in the roller-coaster of pleasure that he is taking you on.";
	say "     You're almost ready to scream out loud for him to let you come at last - but it seems Ryousei has gauged well just how far he should push you - and suddenly, he attacks your clit with full force, sucking on it and teasing it - hard - with the tip of his tongue. At the same time, his two fingers in your pussy stretch it a little more to allow a third to slip in, which then stretches even deeper and brushes against one very sensitive spot. The all-out assault on your pleasure centers is something you just can't - and don't want to - resist, pushing you to a screaming orgasm just moments later.";
	WaitLineBreak;
	say "     For you don't know how long, you forget all about the city, the nanites, everything that is going on - your whole world instead being the warm furry shape between your legs, the sensations of him moving against you - and inside you. Bliss fills your being as one intense touch and stimulation follows the next - prolonging the sensations of your climax so it only tapers off very slowly, at the end of which you're left exhausted but oh so very satisfied. The anthro tiger pushes himself up to kneel between your legs and grins down at your naked form as you lie there and try to catch your breath.";
	say "     'It was my pleasure to satisfy you,' he says with a purr, then nods down to his own crotch, showing the well-sized shaft of his erection that rests in his hand. Stroking up and down on his hard shaft, the horny tiger doesn't take long to reach his own release. Throb after heavy throb of his cum erupts from his cock, painting your crotch and lower body with streaks of white[if Player is male] and mixing with your own cum that you covered your front with when you came[end if]. Panting rapidly with his head thrown back and eyes closed, Ryousei rides out his climax until the throbs of cum eventually ebbs off, then looks down over you. 'But my task is not done it seems - let me help you clean up,' he adds in an amused tone, then lowers himself on top of you and starts to lick all over your naked body.";
	WaitLineBreak;
	say "     You spend a pleasurable time being cat-washed and caressed by the muscular tiger, sharing more than a few kisses with him and tasting his cum on your lips. Eventually, he lies down beside you and puts an arm around you, caressing your side and wearing a thoughtful expression on his face. Then, after taking in your naked form for a long moment, he says, 'Being your companion makes the time on this wretched world bearable, even... pleasant, at times. Which makes me wonder about the time when I will eventually find my way back home. Would you like to accompany me, leave this place? My army needs people like you - strong and dependable. There will be hardship, but also rewards...' Ryousei caresses your cheek gently, then puts a finger on your lips. 'Do not answer now, it is moot until I can open a portal anyways. Just... think about it,' he says, then gets up to groom his fur into its usual impeccable state and get dressed.";
	NPCSexAftermath Ryousei receives "OralPussy" from Player;

to say RyouseiPlayer69: [player 69 with Ryo]
	if "Knows69" is not listed in Traits of Ryousei:
		say "     Putting a smile on your face, you tell the tiger that you want to 69 with him, which makes your otherworldly friend raise an eyebrow. 'I'm afraid I'm not quite following,' he says in an honest tone while continuing to run the surprisingly soft pads of his paw-hands over your skin, tracing small circles in his caresses. That is the moment when it hits you - the two of you might be able to talk and understand one another somehow (who knows, maybe its magic?) but that apparently doesn't extend to writing. The large anthro might have never even seen the number sixty-nine written out, and he apparently has no idea of the sex act its shape is shape suggests. Chuckling at the realization, you tell him what you mean, first using your hands to mime the shapes of a 6 and 9, then going into detail of the circles being people's heads, with the pointy end of the letter being something else entirely. 'Ah, the congress of the crow,' your feline companion says in a purr, followed by the words, 'I know it well.'";
		add "Knows69" to Traits of Ryousei;
	else:
		say "     Putting a smile on your face, you tell the tiger that you want to 69 with him again, which makes your otherworldly friend chuckle and stroke over his whiskers. 'That position is always fun,' he replies, reaching out to stroke your side before he adds, 'Though I still prefer to think of it as the congress of the crow. Makes me remember a tengu-woman who introduced me to it soon after I had left behind cub-dom and became a man. It is quite... exhilarating to do, when you are clinging to someone flying over the rainforest. Hah, she almost crashed into a tree when I stuck my tongue deep into her that one time - ah, but enough of my old tales. Let us make some of our own together!' A rumbling purr rises from his broad chest, filling the air between you as the anthro places his surprisingly soft paw-pads on your skin, tracing small circles of caresses over it.";
	say "     Nodding eagerly to the tall tiger, you lean into his touch as he puts his arms around you, drawing you close against his furred body. Ryousei feels warm and soft against your skin, yet with a rock-solid firmness underneath, speaking of many years of hard martial training. Towards you, he's showing his gentler side right now, stroking your shoulders and back with strong hands, while at the same time lowering his head to yours. Meeting his muzzle, you're drawn into a long kiss, with his tongue wrestling pleasurably with your own. His continuing purr vibrates throughout your body, putting you into a very relaxed, open state. Ryousei's hand snakes down to your crotch, [if Player is not naked]slipping under your clothes[else]making use of your nakedness[end if] and feeling for your sex, [if Player is male]soon encountering your firm [Cock of Player] rod. Fingers sliding up your shaft, he brushes them over your dickhead, then brings them up to his face, licking your pre-cum off with a grin. [else if Player is female]soon encountering your wet pussy. Fingers stroking over your folds, he rubs your clit for a few moments, then brings them up to his face, licking your female juices off with a grin. [else]soon realizing that you are genderless. But he doesn't let that discourage him, instead simply petting the sensitive skin of your pubic mound.";
	WaitLineBreak;
	say "     He continues to stimulate with just his fingers for a little while longer, then says in a lusty tone, 'How about we take this to the next level? I long to taste your arousal on my tongue!' With that said, he starts to [if Player is not naked]slide his hands under your clothes, caressing your body and pulling them off piece by piece. [else]caress your body too, giving you a wink. [end if]Eager to feel Ryousei's touch, you [if Player is not naked]readily help the anthro tiger to strip you naked, [else]lean into his embrace for a time, [end if]then watch as he himself quickly shrugs out of the kimono he wears. Putting an arm around you, Ryousei then moves to gently lower your naked form on top of the resulting small pile of discarded clothing, giving you a soft place to lie as he joins you on the ground. His striped form stretches out next to you, lying on his side, and you can see the red shaft of his cock close to your face, fully erect and with its pointy tip glistening with pre.";
	say "     A loud purr fills the air between you as Ryousei moves his head closer to your crotch. You can feel his warm breath against your [if Player is male]erection[else if Player is female]nether lips[else]pubic mound[end if], coupled with his whiskers against your skin, as he inhales deeply several times, taking in your scent. Moving a paw-hand on top of your crotch, he strokes you gently. 'It is interesting how different - yet similar - beings are in that area, especially if one travels to other worlds. Yours is beautiful, as are you - and the scent of your arousal is simply amazing.' The large cat follows up his compliment with a slow, long lick, all the way from the base of your [if Player is male]shaft to its throbbing head[else if Player is female]pussy to the sensitive clit at the top[else]pubic mound to your navel[end if]. The slight roughness of his warm, wet tongue sends tingles of pleasure up your spine and makes you writhe on the ground, in the process of which your face bumps against his own manhood, hard and ready just inches before your eyes.";
	WaitLineBreak;
	say "     Remembering that you wanted to share mutual pleasure with the tiger, not just let him take care of your body, you focus on the otherworldly cat's manhood and reach out to touch it and the weighty pair of balls in his white-furred sack. Ryousei's cum-factories are warm and soft under your fingers as you give them a squeeze, then feel for the folds of his sheath resting loosely at the base of the erect cock sticking out at you. Sliding a finger inside and tracing it around the very root of the tiger's erection draws a pleased rumble from his broad chest, followed by Ryousei giving your crotch another long, stimulating lick. Then you move on to wrapping your hand around his shaft itself, with it lying hot and firm in your grasp in its full nonhuman glory. It features twin bulges near the base, not quite a canine knot, but close enough to surely provide extra pleasure when fucking someone. Further up, there are nubby, soft spines along the shaft, and especially the rim of his dickhead.";
	say "     Leaning in, you stick out your tongue and lick over the dickhead of your companion, tasting his arousal as pre-cum starts to well up from the cum-slit. Taking this as a signal to start going down on you in earnest, Ryousei opens his muzzle and presses forward against your crotch, [if Player is male]taking your shaft into his mouth[else if Player is female]cupping your clit and pussy with his lips[else]cupping your pubes with his lips[end if] and lapping at you with his soft, yet also somewhat rough tongue, giving you an enticing mix of sensations. Not wanting to be outdone, you slide your lips over his dickhead, engulfing it in your mouth and suckling, while at the same time squeezing his bulging cock at the base. Starting out as a pleasure-filled grumble in this broad chest, Ryousei begins to purr deeply and loudly, the vibration giving his oral attention another layer of stimulation that hits you in a very, very good way.";
	WaitLineBreak;
	say "     You proceed to go deeper on Ryousei's cock, bobbing your head as you slide your lips along his shaft and feeling for his soft spines with the tip of your tongue. It isn't just that these are made to stimulate his partners, but apparently the tiger is also quite sensitive when they're played with, so you make sure to really give him some nice attention there. Especially the rim of his dickhead is ribbed with the little bumps, making it fun to tighten your lips around it with just his dickhead in your mouth and feeling Ryousei tremble in pleasure as a result. He is sure to give back as good as he gets from you, suckling, licking and caressing your most sensitive spots, leaving you breathless and intensely aroused. [if Anallevel > 2 and Player is male]You can also feel the anthro tiger slide a paw-hand between your legs, followed by a soft finger-pad stroke over your pucker. It is wet with spit, making it easier to slide into you as Ryousei presses forward and feels around for your prostate. Soon he finds the pleasure-button and starts pressing against it lightly, giving your already tightly wound libido another push. [end if][line break]";
	say "     The roller-coaster ride of mutual pleasuring that the two of you are on builds more and more, until you finally reach the point of no return, reflexively humping your hips against Ryousei's face as the wave of orgasm breaks over you. [if Player is male]With your erect [Cock of Player] shaft being driven down his throat, Ryousei gulps and swallows, making his inner muscles squeeze and flex around you as your first blast of cum shoots into him. It almost feels like he's milking you, drawing heavier spurts from your throbbing balls and eagerly swallowing everything that you have to give. [else if Player is female]Driving his tongue deeper into your pussy to now reach even more pleasure-spots while his soft-furred muzzle and wet nose rub your clit, you are treated to a glorious bit of tongue-play as he licks and teases you all throughout your climax. It almost feels like there's no end to it, with Ryousei skillfully pushing your buttons to make sure your lust doesn't flag for a long, long time. [else]Pushing his muzzle firmly against your sensitive pubes, you are treated to a glorious bit of tongue-play as he licks and teases all the little sensitive spots he found on your sexless, but still receptive nether region. It almost feels like there's no end to it, with Ryousei skillfully pushing your buttons to make sure your lust doesn't flag for a long, long time. [end if]Finding yourself lost in your own pleasure, you are reminded of the tiger's own need to finish by him moving his hips a little, making his throbbing cock push between your panting lips again. At his prompt, you get back to sucking on your purring partner, inhaling as much of his big cock as you can and giving it all the attention you can muster.";
	WaitLineBreak;
	say "     You can feel a large paw-hand come to rest on the back of your head, a sign of the urgency of Ryousei's lust as he can't help but want to take over. Spreading his fingers to cradle your head in a firm grasp, the tiger pushes you deeper onto his cock at the same time as thrusting forwards with his hips, really sinking as much of his length as he can into your warm and welcoming mouth. Frantic thrusts follow that have his heavy balls slap your chin in a rapid pattern, until he soon lets out a full-throated roar as he starts to unload a deluge of cum straight into your stomach. Feeling his thick cock throb again and again, you revel in getting your sexy anthro off, swallowing to give his erection some additional stimulation. Eventually, when you start to feel a bit faint from not breathing for so long, you pull off his shaft, easily escaping the now slack grip of his hand on your head. As you start to gasp for air urgently, but still with a smile on your lips from the fun you had together, Ryousei's cock keeps throbbing, with some of the ebbing spurts of cum painting white streaks on your face.";
	say "     A minute or so later, the anthro tiger pushes himself up from lying on his side, now half-sitting next to you. He reaches out to pull you up to him and leans in to lick your face, dutifully cleaning up the mess he made there and swallowing his own cum. When your face his clean of tiger cum, he says with a purr, 'It was amazing to share pleasure with you!' You chuckle and kiss his muzzle, responding that you had a great time too. This leads to a little bit more time of caresses and further cat-washing by the muscular tiger, until you eventually sink down to lie together, now side by side. Ryousei puts an arm around you, a thoughtful expression on his face. Then, after taking in your naked form for a long moment, he says, 'Being your companion makes the time on this wretched world bearable, even... pleasant, at times. Which makes me wonder about the time when I will eventually find my way back home. Would you like to accompany me, leave this place? My army needs people like you - strong and dependable. There will be hardship, but also rewards...' Ryousei caresses your cheek gently, then puts a finger on your lips. 'Do not answer now, it is moot until I can open a portal anyways. Just... think about it,' he says, then gets up to groom his fur into its usual impeccable state and get dressed.";
	if Player is male:
		NPCSexAftermath Ryousei receives "OralCock" from Player;
	else if Player is female:
		NPCSexAftermath Ryousei receives "OralPussy" from Player;
	else:
		NPCSexAftermath Ryousei receives "Other" from Player;
	NPCSexAftermath Player receives "OralCock" from Ryousei;

to say RyouseiPlayerFrot: [frot with Ryo]
	if "KnowsFrot" is not listed in Traits of Ryousei:
		say "     Smiling eagerly, you tell the tiger that you want to frot, which draws a curious expression from the otherworldly feline. It becomes apparent that he's not quite following what you mean, so you stroke a hand down the front of his broad, muscular chest and say that you could explain, but it might be a lot more fun if you just show him. Chuckling warm-heartedly, the anthro tiger purrs as he replies, 'How could I resist such a charming offer? Lead on, I'll follow where you take me.' ";
		add "KnowsFrot" to Traits of Ryousei;
	else:
		say "     Smiling eagerly, you tell the tiger that you want to frot, with him again, which draws a lusty purr from Ryousei. Eagerness vibrates in his voice as he replies, 'How could I resist such a charming offer? I'll gladly lay down with you.' ";
	say "That said, the tall and trained warrior relaxes and lets you take point, rubbing his muscles through the fabric of his kimono. Stretching your neck to kiss Ryousei, you make out with him while your hands wander, soon finding the belt of his kimono and undoing the knot holding it closed. Pulling aside the garment no longer bound around him, the tiger's fur-covered chest is laid bare, allowing you to run your fingers over his warm coat, feeling its softness and the hard muscles underneath.";
	say "     'I like where this is going,' Ryousei says eagerly before pulling you into another long kiss, his tongue wrestling pleasurably with your own. His continuing purr vibrates throughout your body while your feline friend moves his hands and [if Player is not naked]starts to pull off your own clothing[else]makes use of your nakedness to caress you[end if]. The two of you share pleasurable moments of simply touching and snogging with each other, and before long both of you are hard and ready for more. [if Player is not naked]By now having been stripped of everything you were wearing, [else]Hungry to have the tiger join you in your nakedness, [end if] you slowly disentangle yourself from the embrace of his arms, then reach out to push the cloth of the kimono off his shoulders. Lowering his arms, Ryousei proceeds to let the garment completely slip off his body, falling down to pool behind him on the floor.";
	WaitLineBreak;
	say "     Now dressed in nothing more but a traditional fundoshi around his hips and crotch, the proud tiger lets out a pleased purr as you bid him to lay on the ground. He leans forward to lick your cheek one last time, then lowers himself to sit on the cloth of his kimono before leaning back and stretching himself out before you. Moving to straddle Ryousei's thighs, you run your hands over the tented white cloth of his fundoshi, feeling the firm tip of his erection and cupping the full orbs of his balls easily apparent through the thin fabric. The next thing to do is to find the ends of the fundoshi's cloth to und-wrap your sexy feline, allowing you to pull the last piece of cloth off him in short notice. Now he is as naked as you are, leaning back and braced on his elbows as he looks up to your face with an almost boyish smirk on his muzzle.";
	say "     Moving a little further up along his body, with the insides of your legs brushing against the soft fur of Ryousei's legs, your cock is soon right next to his own. You take hold of it by the base and begin a little bit of a playful 'sword-fight' with the big cat, creating pleasant tingles up and down your spine as you feel the warmth of his erection against your own, with the nubby spines of his cock rubbing your hard shaft lightly. Lining both erections up side by side, you then reaching out for one of the tiger's arms and pull Ryousei's hand down to his crotch. The otherworldly visitor takes the hint immediately and wraps his paw-hand around both of your cocks, pressing them together gently and starting to jerk up and down along the shafts. 'This is nice,' Ryousei tells you with a purr, his free hand moving up to stroke your side.";
	WaitLineBreak;
	say "     Feeling very good as you grind your cock lightly against the tiger's grasping hand, you proceed to lean over your feline friend, bracing yourself on his firm pecs as you return to making out with each other. The two of you share your breath and moan into each other's mouths while rubbing front to front, dick to dick and tongue to tongue. You revel in the warm feeling of his fur against your skin, never getting enough of stroking and rubbing it, while Ryousei keeps up an amazing, slow burn of masturbation for the two of you, cupping your balls with the other hand and giving them very satisfying squeezes. Grinding against each other like that for a long, pleasant while, you react to each little gasp and moan, building the shared pleasure ever higher. Then finally, when it is made more than apparent that you're close to orgasm by your labored breathing, the tiger asks, 'Ready?'";
	say "     The breathless nod that you give him is the only signal that Ryousei needs, and he goes full out right away after that, stroking your twin cocks in a rapid beat, up and down along the pressed-together shafts. You couldn't have held back even if you wanted to, throwing your head back and moaning out loud as you start to erupt only a heartbeat or two before Ryousei himself, the first spurt of your cum landing in his chest-fur and making it lay flat and stick to his muscles. Then the throb of his cock pulses against your own, and it almost seems like your bodies compete about who can shoot the most cum, as you make a proper mess of Ryousei's front, plastering his usually so well-groomed fur against the tiger's skin.";
	WaitLineBreak;
	say "     When your shared arousal finally winds down, Ryousei loosens his previous death-grip on your cocks and brings his paw-hand up to his face, looking at the cum clinging to its edge before licking it off. Then he focuses on you, meeting your gaze and saying, 'It was amazing to share pleasure with you!' You chuckle and kiss his muzzle, responding that you had a great time too. This leads to a little bit more time of caresses and further cat-washing by the muscular tiger, until you eventually sink down to lie together, now side by side. Ryousei puts an arm around you, a thoughtful expression on his face.";
	say "     Then, after taking in your naked form for a long moment, he says, 'Being your companion makes the time on this wretched world bearable, even... pleasant, at times. Which makes me wonder about the time when I will eventually find my way back home. Would you like to accompany me, leave this place? My army needs people like you - strong and dependable. There will be hardship, but also rewards...' Ryousei caresses your cheek gently, then puts a finger on your lips. 'Do not answer now, it is moot until I can open a portal anyways. Just... think about it,' he says, then gets up to groom his fur into its usual impeccable state and get dressed.";

to say RyouseiFucksPlayer: [player gets fucked in the ass]
	say "     Letting Ryousei take the lead, you lean into his touch as he puts his arms around you, drawing you close against his furred body. He feels warm and soft against your skin, yet with a rock-solid firmness underneath, speaking of many years of hard martial training. Towards you, he's showing his gentler side right now, caressing your shoulders and back with strong hands, while at the same time lowering his head to yours. Meeting his muzzle, you're drawn into a long kiss, with his tongue wrestling pleasurably with your own. A rumbling purr from his broad chest vibrates throughout your body, putting you into a very relaxed, open state. 'I want to be inside you,' Ryousei grunts lustily as he draws back for a breather, then starts to slide his hands under your clothes and pulls them off.";
	say "     Eager to feel his touch, you readily help the anthro tiger to strip you, then watch as he himself quickly shrugs out of the kimono he wears. Putting an arm around you, Ryousei then moves to gently lower your naked form on top of the resulting small pile of discarded clothing, giving you a soft place to lie as he leans over you. The tiger general makes out with you for a quite pleasurable time before he eventually brings up a hand to lick over his fingers with broad swipes of his tongue. Once he has got his fingers nice and wet, the purring tiger moves them down between your legs and brushes teasingly over your pucker, then starts to worm a slick finger in against the clenched muscle, gaining entry after just a short moment of reflexive resistance from your body.";
	WaitLineBreak;
	say "     Your feline companion wasn't kidding when he said he did have experience in these matters too - as he knows just how to wiggle his probing digit and where to brush against very sensitive spots deep inside your body. With a single finger, he drives you to breathless arousal, writhing on top of your improvised bedding as [if Player is purefemale]your pussy gets very wet and swollen, ready for more[else if Player is male]your cock goes rock hard and starts to drip with pre-cum[else]feelings of intense pleasure wash over you[end if]. 'It is time, prepare yourself,' the muscled tiger tells you as he lines up the pointy tip of his feline shaft with your back door, then leans in and gives your neck a long lick with his somewhat rough tongue. Suddenly, Ryousei nips the bend between your neck and shoulder a little with his sharp canines - and the unexpected sensation distracts you in just the moment he thrusts his hips against you, sinking the spined shaft between his legs deep into your welcoming opening.";
	say "     Giving you a moment to get used to his cock, now that the initial penetration is over, the broad-shouldered tiger laps soothingly over the little marks his teeth left on your skin, 'Best to get the hard part over quick, you know.' He mrowls in lust, then kisses you full on the mouth before adding, 'Mmmh, you feel great - so warm and tight.' And with that, he pulls back a tiny bit, causing the nubby spines on his erection to brush your inner walls in an explosion of pleasure that sears through your mind, followed by another hard thrust that pushes even deeper into you. You writhe in lust and clutch the clothing under you with both hands as he works more and more of his shaft into you with sure movements, then finally the soft fur on his balls brushes against your crotch. He's all the way inside.";
	WaitLineBreak;
	say "     With Ryousei's mighty spear filling you out very nicely, you can feel the throb of his heartbeat pulse against your passage. It makes the many spines along his shaft's length rub you in tiny but still quite pleasant ways, increasing your arousal even while he's holding still otherwise. But that's not the only way the big feline makes your coupling a thing to remember for both of you - [if Player is purefemale]his hand seeks out your pussy and caresses it, soon sinking two fingers in between your folds and rubbing your sensitive clit with his thumb. [else if Player is male]his hand seeks out your own hard shaft, encircling it in a firm grip and jerking up and down in a steady pace. [else]his hand seeks out your smooth crotch, brushing over the sensitive skin in stimulating movements. [end if]Then Ryousei starts to move in and out of your back passage, fucking you with long strokes that leave you gasping and moaning with each new pull and thrust.";
	say "     For you don't know how long, you forget all about the city, the nanites, everything that is going on - your whole world instead being the warm furry shape on top of you, the sensations of him moving against you - and inside you. Bliss fills your being as one intense touch and stimulation follows the next - the many little spines brushing your inner walls, a wet tongue lapping over your nipples, then the tiger's gentle bite and suck on them, his fingers on your crotch... Eventually all of those combined push you past your limit, and in a wave of lust you scream out as your climax breaks and [if Player is purefemale]a gush of femcum drenches your partner's rubbing fingers. He brings them up to his muzzle to suck your sweet juices off, then intensifies the movement of his hips, eager to join you in orgasm[else if Player is male]the [Cock of Player] erection in your partner's hand pulses as spurt after spurt of cum sprays all over your chest. He swipes a good bit up with his fingers and brings them up to his muzzle, sucking your seed off and swallowing it, then intensifies the movement of his hips, eager to join you in orgasm[else]your whole body trembles in completion. He puts his hand on your chest, taking a moment to feel your movements as you come, then intensifies the movement of his hips, eager to join you in orgasm[end if].";
	WaitLineBreak;
	say "     Ryousei pounds into you hard and deep, making the virile orbs under his shaft thud against you in a rapid pace. Having brought you to completion, he takes out all the stops and fully gives in to the mating urges of a wild tiger, bellowing out possessive roars as he sinks into his willing partner again and again. No longer content to just take you as you lie under him, the tiger general even puts his arms around you, pulling you and holding you as he grinds against your hips with you on his lap. Given the furious pace of his rutting against you, it is no wonder that the anthro feline soon reaches his own climax. He drives his pointy shaft all the way into you one last time, then lets loose a massive spurt of his creamy seed, painting your insides white. And then another, and another. A deep rumbling purr starts to resound in the depth of Ryousei's chest as he rides out the orgasm, panting breathlessly as he breeds your ass.";
	say "     With both of your lusts satisfied for now, Ryousei nevertheless keeps his arms around you and strokes your skin gently. He makes no move to withdraw his cock, keeping its slowly softening shape inside you as if to prolong your intimate moment as long as he can. Then, after giving your chest another long lick and breathing in your scent deeply, he says, 'Being your companion makes the time on this wretched world bearable, even... pleasant, at times. I want you to think about what you will do when I eventually find my way back home. Would you accompany me, leave this place? My army needs people like you - strong and dependable. There will be hardship, but also rewards...' He squeezes your shoulder with one hand, mrowling as his manhood throbs inside you again, then finally pulls out and reaches for his kimono. 'Do not answer now, it is moot until I can open a portal anyways. Just... think about it,' he says, then moves away a bit to groom his fur into its usual impeccable state and get dressed.";
	NPCSexAftermath Player receives "AssFuck" from Ryousei;

to say RyouseiFucksPlayerAss: [player gets fucked in the pussy]
	say "     Letting Ryousei take the lead, you lean into his touch as he puts his arms around you, drawing you close against his furred body. He feels warm and soft against your skin, yet with a rock-solid firmness underneath, speaking of many years of hard martial training. Towards you, he's showing his gentler side right now, caressing your shoulders and back with strong hands, while at the same time lowering his head to yours. Meeting his muzzle, you're drawn into a long kiss, with his tongue wrestling pleasurably with your own. A rumbling purr from his broad chest vibrates throughout your body, putting you into a very relaxed, open state. 'I want to be inside you,' Ryousei grunts lustily as he draws back for a breather, then starts to slide his hands under your clothes and pulls them off.";
	say "     Eager to feel his touch, you readily help the anthro tiger to strip you, then watch as he himself quickly shrugs out of the kimono he wears. Putting an arm around you, Ryousei then moves to gently lower your naked form on top of the resulting small pile of discarded clothing, giving you a soft place to lie as he leans over you. The tiger general makes out with you for a quite pleasurable time before he eventually brings up a hand to lick over his fingers with broad swipes of his tongue. Once he has got his fingers nice and wet, the purring tiger moves them down between your legs and brushes teasingly over your nether lips, then starts to focus on your clit, rubbing it with a gentle, steady touch. Man, that feels good. You can't help but squirm and tremble under his touch, straining to raise your hips towards him - and the tiger reacts to your unvoiced invitation, sliding two fingers into your pussy a moment later.";
	WaitLineBreak;
	say "     Your feline companion wasn't kidding when he said he did have experience in these matters too - as he knows just how to wiggle his probing digits and where to brush against very sensitive spots deep inside your body. With a single finger on the magic button of your clit, he proceeds to drive you to breathless arousal, writhing on top of your improvised bedding as [if Player is purefemale]your pussy gets very wet and swollen, ready for more[else if Player is male]your cock goes rock hard and starts to drip with pre-cum[else]feelings of intense pleasure wash over you[end if]. 'It is time, prepare yourself,' the muscled tiger tells you as he lines up the pointy tip of his feline shaft with your pussy, then leans in and gives your neck a long lick with his somewhat rough tongue. Suddenly, Ryousei nips the bend between your neck and shoulder a little with his sharp canines - and the unexpected sensation distracts you in just the moment he thrusts his hips against you, sinking the spined shaft between his legs deep into your welcoming opening.";
	say "     Giving you a moment to get used to his cock, now that the initial penetration is over, the broad-shouldered tiger laps soothingly over the little marks his teeth left on your skin, 'Best to get the first moments over quick, you know. Spines on a cock may look scary, but once my partners actually felt them... let's just say I've had no complaints. None.' He mrowls in lust, then kisses you full on the mouth before adding, 'Mmmh, you feel great - so warm and tight.' And with that, he pulls back a tiny bit, causing the nubby spines on his erection to brush your inner walls in an explosion of pleasure that sears through your mind, followed by another hard thrust that pushes even deeper into you. You writhe in lust and clutch the clothing under you with both hands as he works more and more of his shaft into you with sure movements, then finally the soft fur on his balls brushes against your crotch. He's all the way inside.";
	WaitLineBreak;
	say "     With Ryousei's mighty spear filling you out very nicely, you can feel the throb of his heartbeat pulse against your passage. It makes the many spines along his shaft's length rub you in tiny but still quite pleasant ways, increasing your arousal even while he's holding still otherwise. But that's not the only way the big feline makes your coupling a thing to remember for both of you - as his hand never leaves your clit, instead circling and rubbing, even while he is busy pushing his cock into you. Then Ryousei starts to move in and out of your passage, fucking you with long strokes that leave you gasping and moaning with each new pull and thrust.";
	say "     For you don't know how long, you forget all about the city, the nanites, everything that is going on - your whole world instead being the warm furry shape on top of you, the sensations of him moving against you - and inside you. Bliss fills your being as one intense touch and stimulation follows the next - the many little spines brushing your inner walls, a wet tongue lapping over your nipples, then the tiger's gentle bite and suck on them, his fingers on your crotch... Eventually, all of those combined push you past your limit, and in a wave of lust you scream out as your climax breaks and [if Player is purefemale]a gush of femcum drenches your partner's rubbing fingers. He brings them up to his muzzle to suck your sweet juices off[else if Player is male]the [Cock of Player] erection standing upright above your pussy pulses as spurt after spurt of cum sprays all over your chest. Ryousei swipes a good bit up with his fingers and brings them up to his muzzle, sucking your seed off and swallowing it[else]your whole body trembles in completion. He puts his hand on your chest, taking a moment to feel your movements as you come[end if], then intensifies the movement of his hips, eager to join you in orgasm.";
	WaitLineBreak;
	say "     Ryousei pounds into you hard and deep, making the virile orbs under his shaft thud against you in a rapid pace. Having brought you to completion, he takes out all the stops and fully gives in to the mating urges of a wild tiger, bellowing out possessive roars as he sinks into his willing partner again and again. No longer content to just take you as you lie under him, the tiger general even puts his arms around you, pulling you and holding you as he grinds against your hips with you on his lap. Given the furious pace of his rutting against you, it is no wonder that the anthro feline soon reaches his own climax. He drives his pointy shaft all the way into you one last time, then lets loose a massive spurt of his creamy seed, painting your insides white. And then another, and another. A deep rumbling purr starts to resound in the depth of Ryousei's chest as he rides out the orgasm, panting breathlessly as he breeds you.";
	say "     With both of your lusts satisfied for now, Ryousei nevertheless keeps his arms around you and strokes your skin gently. He makes no move to withdraw his cock, keeping its slowly softening shape inside you as if to prolong your intimate moment as long as he can. Then, after giving your chest another long lick and breathing in your scent deeply, he says, 'Being your companion makes the time on this wretched world bearable, even... pleasant, at times. I want you to think about what you will do when I eventually find my way back home. Would you accompany me, leave this place? My army needs people like you - strong and dependable. There will be hardship, but also rewards...' He squeezes your shoulder with one hand, mrowling as his manhood throbs inside you again, then finally pulls out and reaches for his kimono. 'Do not answer now, it is moot until I can open a portal anyways. Just... think about it,' he says, then moves away a bit to groom his fur into its usual impeccable state and get dressed.";
	NPCSexAftermath Player receives "PussyFuck" from Ryousei;

to say PlayerFucksRyousei: [player fucks Ryo]
	setmonster "Royal Tiger";
	choose row MonsterID from the Table of Random Critters;
	say "     Taking the lead, you lean into Ryousei's touch and slide an arm around his hips, drawing him close against your own body. His furred form feels warm and soft against your skin, yet with a rock-solid firmness underneath, speaking of many years of hard martial training. Towards you, he's showing his gentler side right now, caressing your shoulders and back with strong hands, while at the same time lowering his head to yours. Meeting his muzzle, you're drawn into a long kiss, with his tongue wrestling pleasurably with your own. A rumbling purr from his broad chest vibrates throughout your body, filling you with a pleasant feeling and soaring arousal.";
	say "     Sliding your hands down behind his back, you place them on the muscular tiger's firm buttocks and give them a squeeze through the thin fabric of his kimono. A rumbling chuckle comes from your feline partner as you tell him that you want to fuck. 'Sure of yourself, are you not, my friend?! More than one of my enemies had to learn that attempts to dominate Ryousei are perilous at best!' Showing his impressive set of fangs and teeth in a wide smile, the tiger leans his head towards your ear and adds in an amused whisper, 'But for my compatriots, other rules apply. I am not averse to enjoying a proud warrior's hard spear in my tailhole.' With a lust-filled mrowl, Ryousei licks the side of your neck and allows you to fondle him some more, then gently extracts himself from your embrace and starts to strip.";
	WaitLineBreak;
	say "     It is quite a nice show to watch the tall feline undress. First, he undoes the obi belt of his outfit, pulling the broad band of fabric from around his hips and allowing his kimono to fall open, revealing his cream-colored chest with its firm pecs and rock hard abs. Further down, the crotch of the sexy tiger is covered by a fundoshi - traditional Japanese underwear consisting of a twisted fabric bands and a relatively skimpy pouch for the family jewels. You can see it bulge with the virile male's balls and there is a noticeable bump in the white cloth from his cock starting to push out from his sheath.";
	project the figure of Ryousei_fundoshi_icon;
	say "     Sliding the kimono off his shoulders with a supple and smooth movement, the tiger folds the garment once, then drops it to the ground. Muscles ripple under his short fur as he stands tall and straight after that, smiling at you with his hands on his hips. 'Wanna unwrap your companion, my warrior friend?' he says in a teasing tone and winks, waiting for you to make the next move. Eager to touch the anthro tiger, you step up to him and slide a hand down his abs, then cup his bulge and give it an appreciative squeeze. It is an easy task to tug the ends of the single strip of cloth forming the fundoshi underwear out and unravel its tie, allowing the garment to fall to the ground between Ryousei's feet.";
	WaitLineBreak;
	say "     Using a hand to cup your feline friend's now free-swinging furry balls, you gleefully fondle Ryousei, helping the tiger become fully erect in just a few moments. His sizable shaft quickly pushes out of his furred sheath, brushing hotly against your wrist. Reddish-pink in color, with a pointy head and a number of small, nubby spikes along its length, it certainly looks interesting and even has a pair of bulges near the base - not quite a full canine knot, but certainly something that could provide extra pleasure as it slides in and out of someone. You're almost tempted to feel that hot shaft inside you right now, but you've already got a date with this tiger's tight hole!";
	say "     'This will be fun,' Ryousei grunts lustily as he brushes his erection against you some more, then starts to slide his hands under your clothes and pulls them off. Eager to get naked yourself, you readily help the anthro tiger to strip you down to nakedness, then embrace him for a long moment of shared touches, gropes, kisses and licks. Eventually, he starts to lower himself bit by bit, crouching down and laying a trail of licks on your torso, then laps at your [Cock of Player] manhood. It certainly is a stimulating experience to feel his somewhat rough tongue brush over your privates, getting your cock slick with his spit.";
	WaitLineBreak;
	say "     Soon, the proud tiger gives you a last long lick, playing his tongue over your shaft, then says in a lustful tone, 'Mount me like a cavalryman does his horse!' With that, the big anthro cat turns around and takes a position on all fours, his rear stretched high for you. You're distracted for a second with what his comment suggests about the cavalry tradition of Ryousei's home plane, but the striped tail sinuously swaying in front of your nose quickly draws your attention back to the matter at hand. Crouching behind the anthro tiger, you playfully slide a hand along the length of his tail, then take hold of his buttocks and spread them, revealing the pink ring of his pucker.";
	say "     One hand on your own throbbing cock, you guide it in against Ryousei's back door, finding it relaxed and receptive for another male's entry. It only takes a little pressure forward to pop past the ring muscle - drawing a satisfied roar from Ryousei - and start sinking into the warm and tight depth of his insides. Your feline companion clearly has some experience in such matters, and his hole is pleasantly snug around your shaft. Before much longer, your crotch meets his furry buttocks as you bottom out. You're balls-deep in the powerful otherworldly warrior!";
	WaitLineBreak;
	say "     Ryousei mrowls in pleasure, his inner muscles flexing to squeeze your cock. 'Feels nice,' he growls in a lusty tone. Bracing himself against the floor he calls out next, 'Now fuck me hard!' Oho - someone's eager for a pounding! Only too happy to follow his urgent request, you grasp him by the hips, fingers digging into the tiger's short fur, then start thrusting in and out of his sexy ass. It feels great to feel his chute slide over your saliva-slick length, see the pink ring of his tailstar gape open as you pull out, then winking open and shut, before hammering your prick back into him all the way.";
	say "     He asked for a hard fuck - and that's exactly what you're giving him! Thrusting deep into the tight squeeze of his ass, your own balls smacking against the big cat's swinging orbs again and again. Before long, you're not content with just holding his hips, instead leaning forward to press your front to his back, arms wrapping around his broad and muscular chest and enjoying the softness and warmth of his fur against your skin while still fucking the anthro tiger. Burying your nose in the fur of his back, you huff Ryousei's attractive scent - all masculine and a little musky. The large feline reacts to your embrace by purring loud and deep, sending the vibrations through your whole body.";
	WaitLineBreak;
	say "     'Fuuuck yeah!' the horny tiger shouts, though the exclamation has more of a bestial roar than his usually so carefully chosen words. He's close - you can literally feel it from the way his inner muscles squeeze your prick more and more. Rubbing your cheek against the striped fur covering the rippling muscles of his back, you move your hands down along Ryousei's front, soon encountering the hot length of his manhood. Ryousei's mighty spear is quite a handful and as you close your fingers around it, you can feel his strong heartbeat in the throbs of the thick piece of man-meat.";
	say "     Running your fingers over the little spines of his prick, you imagine those nubby bumps softly scraping against your insides and spreading tingling sensations. What was that old condom slogan again... 'ribbed for her pleasure'?! Ryo is definitely equipped to do just that. Going lower, you close your hand around the twin bulges near the base of his cock - not quite a canine knot, but close enough. And sensitive too, as the tiger lets out an animal-like rumble when you squeeze them. Keeping your tight grip on Ryousei's length, you proceed to jerk him off in rhythm with your own thrusts into his ass, driving both of you to higher and higher arousal.";
	WaitLineBreak;
	say "     The two of you reach orgasm virtually simultaneously, with your first blast of cum splashing the tiger's inner passage barely a second or two before he roars in completion and his shaft starts to throb heavily in your grasp. More and more creamy seed is pumped out of your balls and into the big cat with each heartbeat - almost as if to make up for the load he is spraying over the ground beneath his panting body. You just hold on to him tightly, enjoying the soft fur and warmth, his enticing scent as well as the tight grip of his inner muscles as you ride out your own orgasm.";
	say "     For you don't know how long, you forget all about the city, the nanites, everything that is going on - your whole world instead being the warm furry shape on top which you lie, and whom you're still balls-deep inside of. The bliss of completion tempts you to just stay like this, rest with closed eyes on top of Ryousei, but sadly, one can't doze away all day - especially not with the chancy survival situation for yourself and your companion in this city. Eventually, you push yourself up a bit against his back (which is rock-steady, despite having to hold you up) and open your eyes to the orange and black striped male under you.";
	WaitLineBreak;
	say "     Running a hand over Ryousei's back in an appreciative touch, you slowly pull out of his ass, sighing softly as your still sensitive prick slides against his inner walls. There is a little bit of a wet slurp as your cock-head pulls past his pucker, accompanied by a trickle of white cum that leaks past his tailstar. No longer impaled on your cock, the anthro tiger lets himself sink to one side, turning and sitting down facing you. With a broad smile on his muzzle, he says, 'That was fun.' Then the muscular cat reaches down between his legs, swiping up the cum leaking from his back door and licking it off his own fingers.";
	say "     With both of your lusts satisfied for now, Ryousei leans backwards to rest on his elbows and keeps looking at you with a thoughtful expression. Then, after taking in your naked form for a long moment, he says, 'Being your companion makes the time on this wretched world bearable, even... pleasant, at times. Which makes me wonder about the time when I will eventually find my way back home. Would you like to accompany me, leave this place? My army needs people like you - strong and dependable. There will be hardship, but also rewards...' Ryousei stretches out his leg, rubbing the side of his shin against your own in a soft-furred touch that reminds you of being entwined with him not too long ago. 'Do not answer now, it is moot until I can open a portal anyways. Just... think about it,' he says, then gets up to groom his fur into its usual impeccable state and get dressed.";
	NPCSexAftermath Ryousei receives "AssFuck" from Player;

to say RyouseiXerxesSex: [Ryousei, Xerxes & the player have fun]
	say "     Giving your tiger companion a smile, you put two fingers into your mouth and give a sharp whistle, attracting the attention of your pet Xerxes. The human dog eagerly jumps up from his bedding, then rushes towards you on all fours in a flash, greeting you with [if lust of Xerxes >= 4 and a random chance of 2 in 5 succeeds]an enthusiastic, 'Master play?' [else]a friendly bark. [end if]A happy grin never leaves his face as you tousle his hair and the young man leans into your touch. Clearing your throat, you turn to Ryousei while still stroking Xerxes head, asking the proud tiger if he would like to have some fun with your pet. As he raises his eyebrow and looks at the naked form of the crouching young man, you call out one of the 'special' commands Mike trained into his transformed animals - and Xerxes immediately reacts, pushing his head and chest down to the ground and raising the very shapely ass on his lithely muscled body. With his legs spreading a little too, he's the very image of a receptive bottom.";
	say "     Ryousei lets an appreciative gaze wander over the young man's form, then gives a nod of his head in your direction as he says, 'A well-behaved pet. My compliments to you as his master.' There is a slight bulge at the crotch of Ryousei's kimono, making it obvious that Xerxes charms haven't been without effect - and so it is just an eye-blink later that the otherworldly feline gives a rumbling purr and adds, 'Domo arigato, my friend. I accept the very generous offer.' As the tiger's hands move to undo the knot of his kimono's belt, he formally adds, 'It pleases me quite a lot to have such a courteous host, offering delicious treats to pass the time. And that despite my - temporary - exile and reduced status. You are a truly deserving being.'";
	WaitLineBreak;
	say "     With the simple fabric belt of his kimono falling to the floor, Ryousei pulls his garment open, then slides it off over his shoulders, revealing his tall and well-muscled physique to you. With his orange fur and black stripes, as well as a cream-colored front side, the anthro tiger has quite an imposing figure - and the feline shaft standing fully erect over his heavy, furred balls does make him even more so. There is a deep, lusty grumble from his throat as Ryousei crouches over Xerxes, putting both hands on his buttocks to grope and feel them. With a submissive whine, the human dog moves back a little to press against the tiger's warm and furry form, literally begging to be fucked. 'Good boy,' Ryousei tells Xerxes with a pleased purr, then drops down to kneel behind your pet, bringing his muzzle to Xerxes crack. As his first lick brushes over the young human's pucker, teasing his skin with the rough texture of a tiger's tongue, Xerxes can't help but moan loudly, telling everyone in the whole room how good this makes him feel.";
	say "     Eager to join in on the fun, you quickly get rid of your own clothes, then crouch down before the naked human dog. Xerxes happily gives you a sloppy kiss as you lean in to him, then starts to [if Player is male]suck on your cock[else if Player is female]lap at your pussy[else]lap at your crotch[end if] with great enthusiasm. Sitting back on the ground, you take hold of his head to stroke and caress your amazing pet while he pleases you orally. After a few long moments of eating out Xerxes ass, Ryousei gives a pleased rumble from his throat and says, 'You are ready, pretty little human.' And with that, he moves to crouch behind Xerxes, bending his erection down a little to line its tapering head up with the human dog's wet and shiny pucker. With a full-throated roar, the anthro tiger thrusts in, burying his shaft deep into the gripping hole. 'Sexy bitch-boy!' he grunts to himself as he pushes in a little more and soon bottoms out, stretching Xerxes hole tight around his feline shaft. Your pet meanwhile whimpers in lust and raises his rear end a little more, really asking for it - and Ryousei delivers promptly. His large hands grip the young man's hips tightly and the tiger pulls back, the soft spines on his cock scraping Xerxes inner walls in a very stimulating way that makes the young man give a breathless moan. Then Ryousei thrusts in hard and keeps going like that, pounding into his smaller partner from behind in a rapid pace.";
	WaitLineBreak;
	say "     Gasps, moans and roars fill the library as the big cat and transformed dog have sex and Xerxes proves once more what a well-trained submissive pet he is. The young man takes all that Ryousei can dish out with a happy grin on his face, then immediately pushes his head down between your legs again, continuing to service you. The full-on erection dangling between his legs is the best indicator of how much he enjoys being taken, with it leaking pre-cum constantly and flinging strings of it every which way as the young man's shaft bounces with each thrust into his ass. Your otherworldly visitor does let go of his usually so calm and regal composure as he fucks the human dog hard, demonstrating the wild side of his people - lusty growls, possessive roars and an almost feral intensity as he gets closer and closer to orgasm. Soon no longer content to just pound Xerxes into the ground, he even wraps his arms around your pet, picking him up while still impaled on the thrusting cock at his hips.";
	say "     Now deprived of your submissive human dog's talented mouth and tongue, you nevertheless have quite a bit of fun - just the sight of the two of them is something you happily masturbate to. It really is a sexy show - with the sun-bronzed, black-haired Xerxes held tightly against Ryousei's broad chest, bouncing up and down on his thick shaft. There is something entrancing in the way the young man's own cock swings up and down, slapping rippling abs in tact with the muscled tiger's furry balls smacking into his ass. Accompanied by growls and a rumbling purr, the anthro tiger keeps pounding Xerxes hard until their shared lust finally can't be contained anymore. With an urgent sound somewhere between a moan and a bark, your pet's hands dig into Ryousei's fur, holding on tight as Xerxes cock lets loose a first long spurt of cum, arching high before landing on the library floor with a splat, then another and another.";
	WaitLineBreak;
	say "     As the gasping young man keeps shooting his quite impressive load, the contractions of his inner muscles push Ryousei over the edge in short notice too, and with a roar the tiger buries himself all the way in his human partner. Furry balls resting against Xerxes smooth skin, they visibly twitch and pulse as the tiger breeds your pet, his virile load blasting into Xerxes and painting his insides white. With your hand [if Player is male]tightly wrapped around your manhood, jerking up and down[else if Player is female]buried between your legs, rubbing your clit and pussy lips[else]buried between your legs, rubbing your sexless but still sensitive crotch[end if], you quickly bring yourself to completion too, panting loudly as you call out in a breathtaking climax. The two of them grunt and pant as their orgasms run their courses, slowly ebbing off as Xerxes cum-shots get less intense and Ryousei's seed starts to squish out around his hard cock from an already over-stuffed asshole he slowly grinds against. Eventually they quiet down, nothing audible except for the big tiger's purr and Xerxes soft breathing.";
	say "     Now that his untamed libido has been satisfied, the tiger once more proves his underlying compassion and decency as he just holds on to Xerxes, gently stroking the young man's chest and making both of their bodies vibrate with his purring. Ryousei licks Xerxes sweaty skin playfully at his neck and cheek, then stretches to bring his muzzle to Xerxes mouth as the young man turns his head, sharing a long and eager kiss. The two of them spend some pleasant moments just touching and making out, then Ryousei eventually gently pulls the human dog off his softening erection and lowers him to the ground. Coming to kneel before the anthro tiger, Xerxes gives him a hug around the midriff before scampering off to his bedding, curling up to take a post-coital nap. Meanwhile, Ryousei gives you a gracious smile and a little bow as he says, 'Thank you. Xerxes really is an exceptional pet,' then he starts cleaning himself up and gets dressed.";
	if Player is male:
		NPCSexAftermath Xerxes receives "OralCock" from Player;
	else if Player is female:
		NPCSexAftermath Xerxes receives "OralPussy" from Player;
	NPCSexAftermath Xerxes receives "AssFuck" from Ryousei;

Section 5 - Events

Table of NavInEvents (continued)
Priority	Name	EventObject	EventConditions	EventRoom	LastEncounterTurn	CoolDownTurns	EncounterPercentage
3	"Ryousei_Xerxes_Encounter1"	Ryousei_Xerxes_Encounter1	"[EventConditions_Ryousei_Xerxes_Encounter1]"	Grey Abbey Library	2500	2	100

Table of WalkInEvents (continued)
Priority	Name	EventObject	EventConditions	EventRoom	LastEncounterTurn	CoolDownTurns	EncounterPercentage
3	"Ryousei_Xerxes_Encounter1"	Ryousei_Xerxes_Encounter1	"[EventConditions_Ryousei_Xerxes_Encounter1]"	Grey Abbey Library	2500	2	100

to say EventConditions_Ryousei_Xerxes_Encounter1:
	if (royal tiger companion is tamed and Xerxes is in Grey Abbey Library and RyouseiXerxes is 0) and Player is not CoA: [list of conditions here]
		now CurrentWalkinEvent_ConditionsMet is true;

Table of GameEventIDs (continued)
Object	Name
Ryousei_Xerxes_Encounter1	"Ryousei_Xerxes_Encounter1"

Ryousei_Xerxes_Encounter1 is a situation.
ResolveFunction of Ryousei_Xerxes_Encounter1 is "[ResolveEvent Ryousei_Xerxes_Encounter1]".
Sarea of Ryousei_Xerxes_Encounter1 is "Nowhere". [standard walkins that cannot be hunted for are Nowhere, but walkin events can also be made huntable as an alternate access way]

to say ResolveEvent Ryousei_Xerxes_Encounter1:
	if lust of Xerxes < 3:
		project Figure of Xerxes_soft_icon;
	else:
		project Figure of Xerxes_awesome_soft_icon;
	say "[LibraryEntry_NavOrWalk]";
	say "Xerxes immediately rushes towards you on all fours and gives happy barks. Eager to greet his master, the naked human circles you with exuberant energy, then jumps up to brace himself with both hands on your shoulder and licks you in the face, happily [if lust of Xerxes > 2]yammering, 'Master's back! Master's back! Xerxes missed Master!' [else]barking to greet you. [end if]While you deal with the very excitable dog in the body of a nineteen-year-old, drop dead gorgeous man with black hair and a charming smile, you become aware that Ryousei is watching you with a raised eyebrow, standing not too far away. As you meet his eyes, the anthro tiger clears his throat and says, 'What an interesting... pet, you have there. I was under the impression that humans usually are more, well... civilized. What's his story?'";
	say "     Tousling your human dog's hair, you explain to Ryousei that Xerxes actually isn't a human. Or wasn't originally, at least - until the whole trouble with the nanites started and everything went to hell. By the time you proceed to explaining about Mike, the dog trainer turned anthro stag, Xerxes begins trotting over to Ryousei to check out your new friend. 'Ah - I see,' the tiger general tells you with a thoughtful nod, holding a clawed hand out for Xerxes to sniff. 'Now if you will forgive me my ignorance - what exactly is a dog? We do not have such beasts in my plane. Maybe... similar to an ahuizotl? Those are sometimes trained to infiltrate enemy lines and drown their men when they least expect it.'";
	WaitLineBreak;
	say "     You notice a certain tenseness in the proud tiger, stemming from having to admit he doesn't know something, combined with a bit of caution from suspecting a connection with those watery assassins he mentioned. Quickly, you proceed to explain some everyday facts about dogs - being four-legged animals with fur, the size ranges and that they're harmless - well, usually... as it depends on what they're trained for. Trusted companions for families, for hunting or guarding or sniffing things out for the police, some sadly even for fighting. Now much more relaxed about Xerxes, Ryousei looks down on the young man - smirking at the fact that the human dog is busily sniffing his crotch, really pressing his nose right into the material of the tiger's pants. 'So, what exactly IS your pet trained for then?' the otherworldly visitor asks, patting Xerxes softly on the head.";
	say "     Clearing your throat at the question, you tell the tiger that your dog has been trained to guard, as well as providing pleasure. 'Ah yes,' Ryousei nods, crouching down to stroke over Xerxes muscled back and over his firm buttocks. The human dog leans into his touch, giving a pleased whine as if to beg for more petting. The tiger continues, 'I can see how a human shape would be advantageous for such tasks. Your world with its very changeable people and beasts certainly has some interesting customs.' You open your mouth to explain that what happened to Xerxes actually wasn't planned, but quickly change your mind and don't bother - Ryousei seems happy enough with having made sense of your pet, so you leave it at that and just watch as he allows Xerxes to sniff him some more and checks out the young man's body.";
	WaitLineBreak;
	say "     [bold type]Do you call on Xerxes to leave your companion in peace and go back to lie on his mattress ([link]Y[as]y[end link]), or do you want to offer Ryousei the chance to try Xerxes out for himself ([link]N[as]n[end link])?[roman type][line break]";
	if Player consents:
		LineBreak;
		say "     Calling out to Xerxes, you stop the human dog cold and he immediately turns away from nuzzling Ryousei's crotch to look at you attentively. With a casual command, you send him off to his bedding and the black-haired stud happily obeys, dashing over and laying down. Following the young man's movement with an attentive look, Ryousei lets his gaze rest on Xerxes for a moment longer, then turns to you and nods. 'A well-behaved pet. My compliments to you as his master.'";
	else:
		if lust of Xerxes < 3:
			project Figure of Xerxes_hard_icon;
		else:
			project Figure of Xerxes_awesome_hard_icon;
		LineBreak;
		say "     Walking over, you join the proud tiger and your human dog. With a smile on your face at him petting Xerxes and stroking his hair, the next thing you do is give a sharp whistle, making the young man whirl around to eagerly look up at you, followed by one of the 'special' commands Mike trained into his transformed animals - and Xerxes immediately reacts, pushing his head and chest down to the ground and raising the very shapely ass on his lithely muscled body. With his legs spreading a little too, he's the very image of a receptive bottom. Ryousei lets his gaze wander over the young man's form, then looks at you with a raised eyebrow. Chuckling, he nods appreciatively and says, 'A well-behaved pet. My compliments to you as his master.'";
		say "     There is a slight bulge at the crotch of Ryousei's kimono, making it obvious that Xerxes charms haven't been without effect - and you capitalize on that, offering your otherworldly companion some fun with him. The muscular tiger's tail twitches in the air behind him for a second, then the anthro feline gives a rumbling purr as he looks down upon Xerxes still holding his position. Not taking his eyes off the sun-bronzed round buns your pet presents, Ryousei says, 'Domo arigato, my friend. A very generous offer.' As the tiger's hands move to undo the knot of his kimono's belt, he casually adds, 'As a wise man told me, 'Should you find yourself in an oni's lair, drink from the skull if he offers it - or it might soon be your own head serving as a cup.' Not that I want to compare you to a red-skinned demonic brute, of course. Still - I learned my lessons well and it always pays to be courteous to your host. Especially if he offers such a treat, which I gladly accept.'";
		WaitLineBreak;
		project Figure of Ryousei_naked_icon;
		say "     With the simple fabric belt of his kimono falling to the floor, Ryousei pulls his garment open, then slides it off over his shoulders, revealing his tall and well-muscled physique to you. With his orange fur and black stripes, as well as a cream-colored front side, the anthro tiger has quite an imposing figure - and the feline shaft standing fully erect over his heavy, furred balls does make him even more so. There is a deep, lusty grumble from his throat as Ryousei crouches over Xerxes, putting both hands on his buttocks to grope and feel them. With a submissive whine, the human dog moves back a little to press against the tiger's warm and furry form, literally begging to be fucked. 'Good boy,' Ryousei tells Xerxes with a pleased purr, then drops down to kneel behind your pet, bringing his muzzle to Xerxes crack. As his first lick brushes over the young human's pucker, teasing his skin with the rough texture of a tiger's tongue, Xerxes can't help but moan loudly, telling everyone in the whole room how good this makes him feel.";
		say "     After a few long moments of eating out Xerxes ass, Ryousei gives a pleased rumble from his throat and says, 'You're ready, pretty little human.' And with that, he moves to crouch behind Xerxes, bending his erection down a little to line its tapering head up with the human dog's wet and shiny pucker. With a full-throated roar, the anthro tiger thrusts in, burying his shaft deep into the gripping hole. 'Sexy bitch-boy!' he grunts to himself as he pushes in a little more and soon bottoms out, stretching Xerxes hole tight around his feline shaft. Your pet meanwhile whimpers in lust and raises his rear end a little more, really asking for it - and Ryousei delivers promptly. His large hands grip the young man's hips tightly and the tiger pulls back, the soft spines on his cock scraping Xerxes inner walls in a very stimulating way that makes the young man give a breathless moan. Then Ryousei thrusts in hard and keeps going like that, pounding into his smaller partner from behind in a rapid pace.";
		WaitLineBreak;
		say "     Gasps, moans and roars fill the library as the big cat and transformed dog have sex and Xerxes proves once more what a well-trained submissive pet he is, taking all that Ryousei can dish out with a happy grin on his face. The full-on erection dangling between his legs is the best indicator of how much he enjoys being taken, with it leaking pre-cum constantly and flinging strings of it every which way as the young man's shaft bounces with each thrust into his ass. Your otherworldly visitor does let go of his usually so calm and regal composure as he fucks the human dog hard, demonstrating the wild side of his people - lusty growls, possessive roars and an almost feral intensity as he gets closer and closer to orgasm. Soon no longer content to just pound Xerxes into the ground, he even wraps his arms around your pet, picking him up while still impaled on the thrusting cock at his hips.";
		say "     It is quite a sight to have the sun-bronzed, black-haired Xerxes held tightly against Ryousei's broad chest, bouncing up and down on his thick shaft. There is something entrancing in the way the young man's own cock swings up and down, slapping rippling abs in tact with the muscled tiger's furry balls smacking into his ass. Accompanied by growls and a rumbling purr, the anthro tiger keeps pounding Xerxes hard until their shared lust finally can't be contained anymore. With an urgent sound somewhere between a moan and a bark, your pet's hands dig into Ryousei's fur, holding on tight as Xerxes cock lets loose a first long spurt of cum, arching high before landing on the library floor with a splat, then another and another.";
		WaitLineBreak;
		say "     As the gasping young man keeps shooting his quite impressive load, the contractions of his inner muscles push Ryousei over the edge in short notice too, and with a roar the tiger buries himself all the way in his human partner. Furry balls resting against Xerxes smooth skin, they visibly twitch and pulse as the tiger breeds your pet, his virile load blasting into Xerxes and painting his insides white. The two of them grunt and pant as their orgasms run their courses, slowly ebbing off as Xerxes cum-shots get less intense and Ryousei's seed starts to squish out around his hard cock from an already over-stuffed asshole he slowly grinds against. Eventually they quiet down, nothing audible except for the big tiger's purr and Xerxes soft breathing.";
		say "     Now that his untamed libido has been satisfied, the tiger once more proves his underlying compassion and decency as he just holds on to Xerxes, gently stroking the young man's chest and making both of their bodies vibrate with his purring. Ryousei licks Xerxes sweaty skin playfully at his neck and cheek, then stretches to bring his muzzle to Xerxes mouth as the young man turns his head, sharing a long and eager kiss. The two of them spend some pleasant moments just touching and making out, then Ryousei eventually gently pulls the human dog off his softening erection and lowers him to the ground. Coming to kneel before the anthro tiger, Xerxes gives him a hug around the midriff before scampering off to his bedding, curling up to take a post-coital nap. Meanwhile, Ryousei gives you a gracious smile and a little bow as he says, 'Thank you. Xerxes really is an exceptional pet,' then he starts cleaning himself up and gets dressed.";
		NPCSexAftermath Xerxes receives "AssFuck" from Ryousei;
	now RyouseiXerxes is 1;
	now Ryousei_Xerxes_Encounter1 is resolved;

Table of WalkInEvents (continued)
Priority	Name	EventObject	EventConditions	EventRoom	LastEncounterTurn	CoolDownTurns	EncounterPercentage
2	"Ryousei_Hayato_Encounter1"	Ryousei_Hayato_Encounter1	"[EventConditions_Ryousei_Hayato_Encounter1]"	Grey Abbey 2F	2500	2	100

to say EventConditions_Ryousei_Hayato_Encounter1:
	if (royal tiger companion is tamed and Hayato is in Darkened Alcove and RyouseiHayato is 0): [list of conditions here]
		now CurrentWalkinEvent_ConditionsMet is true;

Table of GameEventIDs (continued)
Object	Name
Ryousei_Hayato_Encounter1	"Ryousei_Hayato_Encounter1"

Ryousei_Hayato_Encounter1 is a situation.
ResolveFunction of Ryousei_Hayato_Encounter1 is "[ResolveEvent Ryousei_Hayato_Encounter1]".
Sarea of Ryousei_Hayato_Encounter1 is "Nowhere". [standard walkins that cannot be hunted for are Nowhere, but walkin events can also be made huntable as an alternate access way]

to say ResolveEvent Ryousei_Hayato_Encounter1:
	if debugactive is 1:
		say "     DEBUG: RYOUSEI / HAYATO MEETING[line break]";
	project Figure of Ryousei_clothed_icon;
	say "     As you angle your steps towards the stairs to the upper level of the library, your tiger companion suddenly tenses up. Stepping forward, he stretches out a clawed hand to hold you back, the fur on the back of his neck and tail bristling up. 'Wait. I feel a powerful presence quite near us - an Oni! We should challenge and kill it at once, before it starts eating people!' Before you can say anything, he starts sprinting up the stairs with unsheathed claws, leaving deep scratches in the handrail as he takes several steps at once in long jumps, ready for violence. Chasing after him, you reach the crest of the stairway a few seconds after the tiger, who is now standing in a combat-stance and seems to be taking in the tactical situation. The intensity of Ryousei's glare is almost frightening as he observes the little camp Hayato has made for himself - as well as Hayato himself, who is sitting on the ground, facing away from you and bent forward over something.";
	say "     Feelings of aggression hang heavy in the air and Ryousei's sharp teeth show visibly in a silent snarl. He gives you a sidelong glance, never really taking his gaze off the red Oni, then hisses in a low tone, 'How could this be? A giant Red Oni has made his home here - and you let it happen? Do you not know how dangerous and barbarically violent these beasts are? I have stood knee-deep in gnawed bones in an Oni's lair, some of which belonged to my compatriots and friends.' That said, he is off again, letting out a hissed yowl as he closes in on Hayato. 'Turn around and face me, creature! I will have justice for your victims or die trying!'";
	WaitLineBreak;
	say "     Hayato half-stumbles as he turns and stands up from a cross-legged position at the same time, dropping the book he was holding in the process. Skittishly retreating from the furious tiger, he looks completely shocked, surprised and alarmed. Seeing you coming in behind Ryousei, he calls out, 'What's going on!? What did I do wrong? I was just reading a book!' The exclamation surprises Ryousei for a second and he glances down at the dropped novel, then immediately snaps his attention back to the oni. 'What sort of trickery is this, demon? You may have fooled my companion, but I know your kind! Did you hide your bone pit from [if Player is purefemale]her[else]him[end if]? How many victims have you devoured on this world already?!' Finally catching up as the royal tiger shouts his accusations, you jump between him and Hayato, hands raised to keep them apart as you explain that Hayato is not a threat - and neither is he an oni, not as Ryousei knows them.";
	say "     The snarling tiger's eyes narrow to thin slits and he looks from you to the red giant behind you, then back again. After a long moment, he eventually sheathes his claws, only to cross his arms and stare at the two of you with suspicion. Checking behind you, Hayato has retreated some more steps and looks almost frightened. Ryousei calls out, 'How can you say he is not an Oni? Look at him! I never heard of one as large as he is. Thousands of innocent lives must have been taken by this beast! I can sense his power too, and the smell of old blood is...' Ryo takes a sniff, then gets an odd expression and crouches down over Hayato's camp to take a longer sniff. '...absent.' The tiger eventually admits, clearly baffled. After another quick sniff, he eventually seems to relax and states, 'How very strange. Your scent is not entirely of an oni, but you clearly bear the appearance of one. And I've never known of one to be your size...' Hayato replies warily. 'Well, that's because I am human! I mean, I was human... am human... umm, it's a long story...' Hayato tells him, waving his hands in frustration.";
	WaitLineBreak;
	say "     Smoothing down the ruffled fur over his neck, Ryousei steps up to Hayato and gives him a deep bow. 'My apologies. I clearly let the memories of past encounters of... actual oni... get the better of me. Now then - please do me the honor of telling me your tale. The least I can do is listen to it, no matter how long.' The royal tiger stands calmly in front of the red oni, both hands with their sheathed claws clasped in front of himself. 'Um - eh... yes of course,' Hayato replies a moment later, still a bit flustered. As he waves Ryousei to one of the thin sitting mats he laid out in his camp and the tiger sits down in a cross-legged pose, you leave the two of them to get acquainted.";
	now RyouseiHayato is 1;
	now Ryousei_Hayato_Encounter1 is resolved;

Table of WalkInEvents (continued)
Priority	Name	EventObject	EventConditions	EventRoom	LastEncounterTurn	CoolDownTurns	EncounterPercentage
3	"Ryousei_Rane_Encounter1"	Ryousei_Rane_Encounter1	"[EventConditions_Ryousei_Rane_Encounter1]"	Grey Abbey 2F	2500	2	100

to say EventConditions_Ryousei_Rane_Encounter1:
	if (royal tiger companion is tamed and Rane is in Sitting Area and RyouseiRane is 0) and Player is not CoA: [list of conditions here]
		now CurrentWalkinEvent_ConditionsMet is true;

Table of GameEventIDs (continued)
Object	Name
Ryousei_Rane_Encounter1	"Ryousei_Rane_Encounter1"

Ryousei_Rane_Encounter1 is a situation.
ResolveFunction of Ryousei_Rane_Encounter1 is "[ResolveEvent Ryousei_Rane_Encounter1]".
Sarea of Ryousei_Rane_Encounter1 is "Nowhere". [standard walkins that cannot be hunted for are Nowhere, but walkin events can also be made huntable as an alternate access way]

to say ResolveEvent Ryousei_Rane_Encounter1:
	project Figure of Ryousei_clothed_icon;
	say "     As you move to the front section of the upper floor of the library, at the same time as Ryousei is doing so, you see the back of a head sticking out over the balcony railing of the upper library floor - easily identifiable as belonging to Rane by both the white hair as well as the two thin blue horns rising to sharp points. Reaching the end of the stairway, you see that the blue oni is sitting on the ground, leaning back relaxedly against the railing. He is resting his arm on one of a small pile of boxes and sacks he seems to have brought up here recently and gives you a friendly smile as he recognizes you. 'Hey hey,' the blue demon calls out cheerfully and you guide your steps his way - only to find yourself overtaken by your feline companion, who moves to stand straight in front of Rane.";
	say "     'Konnichiwa wise one,' the anthro tiger says as he lays one of his hands upon the other and gives a little bow to the blue oni. 'It is good to see one of your people in this strange land, filled with beasts and peril as it is.' Rane's eyebrows rise a little at the tone of Ryousei's greeting and he looks the striped feline up and down. After casually letting his gaze linger on your companion's crotch for several seconds, the blue demon huffs out a little snort of amusement, then nods knowingly at Ryousei. 'Yeah, isn't it just the weirdest place, hm? Good thing that we've run into each other. But where are my manners - come on, sit down and let me offer you something to drink,' Rane adds next, waving your companion closer and pointing out a piece of free ground in front of himself.";
	WaitLineBreak;
	say "     'I gladly accept,' Ryousei replies in a warm tone, lowering himself into a cross-legged position while adding, 'I haven't had a proper tea-ceremony since before I came to this world.' The blue oni leans forward and gives Rane a companionable pat on the shoulder, making a comment about being in the land of lewd barbarians (at which point he winks at you). Then Rane looks to his side, picking one of the boxes there and pulling it up before levering the wooden lid off with the nails of strong fingers. 'Forget the tea - I got just the right stuff to drink together with a new friend,' he tells Ryousei with a grin, then pulls out a big-bellied clay bottle with sake. The tiger's tail freezes in its regular movements then twitches haltingly as your companion does a confused double-take of Rane, his brows drawing together. Yet before he can say or do anything, the oni has already set out several masu boxes... traditional containers to drink sake from. As Rane pours one, then another 'glass' of sake, he looks over to you and gives an inviting wave. 'Come sit with us, it's more fun to drink together!' he calls to you, then looks expectantly, the neck of the bottle poised above a still-empty sake box.";
	say "     [bold type]Do you join the cheerful oni and his puzzled feline drinking partner?[roman type][line break]";
	if Player consents:
		LineBreak;
		say "     Wanting out of curiosity to see just what kind of lascivious plan the hot blooded blue oni has in mind this time, you decide to follow his lead and sit down next to him. Having filled all the boxes right up to the rim, Rane waves to the two of you to get to it, then carefully picks up his own to take a long swig of the rice wine, smiling as the tiger sitting across from him follows his lead. Knowing full well that your lusty demon friend is far from the serene and wise image Ryousei seems to have of his people, you yourself do hold back mostly, only sipping the potent drink as the blue oni strikes up a conversation with your feline companion. Picking up on the role of a calm and cultured person, Rane waxes on a bit about the 'savage and lewd' people all around here, giving Ryousei knowing nods as he recounts stories from the otherworldly realm he hails from.";
		WaitLineBreak;
		say "     While you learn some stories about the land of the shogun Aki and the surrounding kingdoms that threaten its security and prosperity, the blue oni's hands are never far from his bottle of sake, casually filling the masu boxes up again as soon as they've been set down. With that done, Rane then is free to repeatedly pick his drink up at an opportune moment - toasting the health of one person or the defeat of another, confidently leading Ryousei to down one mouthful after another. As the drinking and storytelling progresses, it does become clear that while Ryousei may have been taken in by Rane playing on his preconceptions, he sure isn't a lightweight when it comes to downing glasses of rice wine. Proving an enviable fortitude worthy of a tiger general, Ryousei proves that he can hold his liquor just as well as the oni himself - meaning that they're both getting a bit sloshed as Rane keeps toasting, too invested in his plan to stop at this point.";
		say "     Eventually, the oni does guide the topic of conversation towards amorous exploits with somewhat slurred words, recounting his pursuit of a particularly aloof anthro gazelle. In turn, Ryousei offers up an episode from one of his campaigns, with things getting quite steamy in some hot springs where his scout troop stopped for the night. More tales of sexual exploits follow and the sake flows even more freely as both of them keep drinking, until finally it is indeed Ryousei who dozes off drunkenly. 'Ah HA,' Rane babbles with a drunken grin on his face, then throws back another glass of sake and adds, 'Knnnnew I'd wore - wear - him down! Now let's see some of those stripes kitty!' With that, the oni tries (and fails) to stand up, then crawls over to the passed out tiger, working to undo the belt of his kimono. As you watch, he eventually manages to tug the garment off Ryousei, exposing his battle-hardened muscles and well-groomed fur.";
		WaitLineBreak;
		project Figure of Ryousei_fundoshi_icon;
		say "     'Mmmhhh,' Rane hums as he strokes the lying tiger's side, reveling in the softness of his fur. Then the drunken blue oni crawls even closer and rubs his cheek against Ryousei's body, burying his nose in the fur and taking a deep breath. His hand wanders over your feline companion's chest and abs, then over to his buttocks for an appreciative squeeze before honing in on his crotch. Yet before he can do much more than reach around the tiger, the oni passes out in turn, all the sake finally catching up with him. This leaves you the last one standing, having wisely only gotten a little bit buzzed, and now being able to observe the two of them cuddled up as they sleep it off.";
	else: [don't watch]
		LineBreak;
		project Figure of Ryousei_fundoshi_icon;
		say "     Waving the oni off, you leave the two of them at it and decide to go for a stroll through the rows of bookshelves up here. Who knows, there might be something that helps in your survival - or at least is some nice distraction from the daily battle for survival. The good thing is that you've got a whole library to choose from... although in some cases that does make it harder, not easier, to pick just what you want. At first, as you wander around, you hear snippets of Rane and Ryousei talking, laughing and drinking but at some point you find a really interesting book and sit down to browse through its pages. Being so focused on the book, you don't really know just how much time passes as you have a good read, but eventually you realize that things have become rather quiet compared to before.";
		say "     Curious, you put in a bookmark and walk back towards Rane's little camp near the railing, only to find that both your friends have passed out half atop each other, with Rane's arm draped over a half-naked Ryousei. Looks like they finished off that whole sake bottle - or maybe even two, looking at the bottle you see tucked behind a crate. Seems like Rane casually switched them at some point. No matter what, the two of them are well and truly plastered and you doubt they'll wake up anytime soon...";
	LineBreak;
	say "     Seeing the hunky blue oni in his loincloth and an already half-undressed anthro tiger on the ground before you does allow for some quite naughty ideas to take root in your mind. Wouldn't it just be an awesome trick to play on them to put these two in a bit of a compromising position? They're half on top of each other, so it should not be too much work to nudge things for an interesting awakening...";
	LineBreak;
	say "     [link](1)[as]1[end link] Forget it, they're your friends.";
	say "     [link](2)[as]2[end link] Put Rane behind Ryousei in a spooning position (naked).";
	say "     [link](3)[as]3[end link] Let Ryousei spoon Rane (naked).";
	now calcnumber is -1;
	while calcnumber < 1 or calcnumber > 3:
		say "Choice? (1-3)>[run paragraph on]";
		get a number;
		if calcnumber is 1 or calcnumber is 2 or calcnumber is 3:
			break;
		else:
			say "Invalid choice. Type [link]1[end link] to leave them in peace, [link]2[end link] to make Rane spoon Ryousei or [link]3[end link] to make Ryousei spoon Rane.";
	if calcnumber is 1: [don't mess with them]
		LineBreak;
		say "     Nah, you wouldn't like being messed with while you're asleep either. Tugging on Rane so that he's lying on his back beside Ryousei, no longer half on top of him, you leave the two of them to just sleep it off and grab a book from the shelves nearby that does look quite interesting. Its intriguing storyline pulls you under its spell and you're devouring it page by page until a somewhat pained grunt eventually draws your attention over to the slowly awakening oni and tiger.";
		LineBreak;
		say "     'Nggh, that might have been a bit too much sake for either of us. My headache sure tells me it was,' Ryousei says as he sits up and rubs his temples, then looks over at Rane. 'How about you, friend? I know I am not really used to lots of drinking because I never do when on campaign, but from what I remember, you seemed to put away the sake quite well. Surprisingly so, I have to say. It was my belief your people didn't... indulge like that.' A look of friendly curiosity shows on the anthro tiger's face, prompting Rane to scratch the back of his neck and look away for a moment before giving a shrug and admitting, 'Well... the thing is - I am not the oni you think I am! That whole stupid wise master stuff. Being all high-minded and cultured. Yeah, right. That's not me!'";
		say "     The tiger's brows draw together in even greater puzzlement and he says, 'What are you talking about? Everyone knows that...' Ryousei's brows stitch together as a new realization dawns upon him, 'Oh! Now I see. The blue oni from my plane of origin follow a certain... mold - and you clearly are not one of them, aside from the looks.' Ryousei lays his hands on one another and gives a little bow to Rane, then adds, 'My apologies for assuming things about yourself, honored oni. Having been thrust into this realm by enemy machinations to remove me from my shogun's side, I was too glad to find someone seemingly familiar in this strange world.'";
		WaitLineBreak;
		say "     In response, Rane just gives the tiger a companionable slap on the shoulder, then says, 'Aw, don't worry about it buddy. I totally went with it too because I wanted to see what you'd do. No harm no foul, eh? I'll gladly have you as a drinking buddy.' The two of them smile at each other for a moment, then Rane squeezes Ryousei's shoulder once more before running a hand down the tiger's muscled flank. 'Just so you know... I am interested in more than just knocking back sake too. One thing this oni definitely isn't is monk-ish and celibate, if you get my drift.' With a wink at Ryousei's surprised expression, Rane then gets up and adds, 'It's a standing offer for such a sexy cat as yourself. But now, I am off to re-stock on sake. Something tells me I need more in the future.' Then the blue oni casually vaults over the railing and light-footedly bounces off the tops of one, two, three sturdy bookshelves before jumping onto the floor of the library. With a grin over his shoulder, he vanishes through the main doors soon after.";
		say "     After sorting out his appearance and binding the belt of his kimono again, Ryousei comes back over to your side a moment later. The tiger looks over to Rane's camp with a raised eyebrow, his tail twitching a bit through the air in an unruly fashion. 'Quite an unusual being,' he remarks, to which you smile and nod while he continues, '...but definitely interesting to know. I never knew a blue oni could be like that. I suppose everything truly is different in this realm...' There is a thoughtful shimmer in his eyes as Ryousei says this, and you notice that he casually tugs the front of his kimono a bit, having to adjust his crotch. Looks like he wouldn't be opposed to some action with the blue demon.";
	else if calcnumber is 2:
		LineBreak;
		say "[RaneSpoonsRyo]";
	else if calcnumber is 3:
		LineBreak;
		say "[RyoSpoonsRane]";
	now RyouseiRane is 1;
	now Ryousei_Rane_Encounter1 is resolved;

to say RaneSpoonsRyo:
	project Figure of Ryousei_naked_icon;
	say "     With a wide grin on your face, you tug the kimono off your passed-out feline companion, relishing in un-wrapping his attractive form. You can't help but feel up his muscled body and soft fur as you strip Ryousei, then roll him over on his side. Rane is far easier to get bare-ass naked after that, as the only thing he actually wears is that loincloth of his. With eager fingers, you un-clasp the segmented metal belt holding it around his hips, then pull the fabric away from the oni's body, revealing the sapphire-hued piece of man-meat he sports, complete with a sexy bush of pure white pubic hair. You keep your fingers on the oni's crotch for a moment, gently cupping his balls and weighing the big cock in your hand, then eventually move to the oni's top end, hooking a grip under his shoulders and pulling.";
	say "     It isn't easy to move someone as big as the huge oni, but thankfully you only have to arrange him a bit, as he was half on top of Ryousei anyways. Soon, you've got your two friends arranged as you want them to be - in the typical spooning position next to one another, sprawled out on the library floor. Rane came to lie quite close to the tiger, his nose just brushing against the big cat's neck-fur and you put his arm around Ryousei too as if holding him by the chest. Hah, that'll make for an interesting awakening in a bit. Stepping back to inspect your handiwork, you can't help but smile. Then suddenly, an even naughtier thought rears its head in your mind - there's one thing that would make the situation even more memorable... some creamy 'evidence' of them having a good time.";
	LineBreak;
	say "     [bold type]It wouldn't be hard to get Rane and Ryo erect and jerk them off, leaving them a little bit of a mess to wake up to. Do you do so?[roman type][line break]";
	if Player consents: [jerking fun]
		LineBreak;
		say "     With a wide smile on your face, you move over to the passed-out tiger and take in his impressive physique in detail - muscled pecs and rock hard abs above the longer fur of his pubes, nestled around a proper feline sheath with two full balls beneath it. Bringing your hand to the furry orbs, you caress them gently, rolling Ryousei's cum-factories between your fingers. Even in his drunken state, the tiger can't help but react to the stimulation, and with a pleased growl from the unconscious feline, his cock starts to harden, poking out of the sheath with its tapering end. After a few more moments of caressing Ryousei, you shift your attention to his erection now, taking the thick and weighty member into your hand. It feels hot under your fingers and on inspection offers various characteristics that promise interesting sensations for someone on the receiving end - from the somewhat pointy head and its overall not quite human shape to numerous small, nubby spines along its shaft. You can't help but want to touch them, so you do - fingers gently pressing against one, then another. They are pretty soft, with just enough rigidity to rub someone in a very, very good way when they get fucked by Ryousei.";
		say "     Hand clasped around your feline companion's manhood, you give it a gentle squeeze and then start jerking up and down on it. Just as you want to start going in a steady rhythm, the sound of a mrowl from the tiger makes you pause and look up at him. Your heart almost jumps out of your chest as you anxiously wonder if you went too far in your 'prank' - but no, the tiger just made a sound in his drunken stupor. He seems to be having a most pleasant dream right now, as the next thing you hear from Ryousei is a loud purr rumbling around in his broad chest. The fact that your friend quite obviously enjoys himself motivates you to go at it more intensely and soon you're jerking him in a rapid pace, reacting to the twitches and noises he makes. It doesn't take all that much longer before your attention bears fruit and his body stiffens, followed by pulsing of the cock in your hand as it erupts with a spurt after spurt of his creamy cum.";
		WaitLineBreak;
		say "     You hold on to Ryousei's manhood for a moment, pleased with the fact that you got control over the hunky tiger with his 'joy-stick'. As his orgasm slowly ebbs off after a short while, you squeeze the last drops of cum out of his softening erection and look at the dollop of creamy white on the side of your index-finger, then lick it off with a grin. One down, one to go, you tell yourself as you look over at Rane next - to find that with him, you don't even have to coax his pillar of masculinity to hardness... the blue oni is hard as a rock already. Who knows - it might be that he's a 'horny drunk', or the noises of Ryousei having a good time right next to him caused the demon to dream of naughty things. No matter what, you can just move in and slide your fingers over the blue-skinned shaft, stroking its impressive length with relish.";
		say "     Rane's is more human in shape - except for the sheer size of it - which gives the blue oni a very nice contrast to Ryousei's equipment, making you wish you could have the guys crotch to crotch and handling both of them at once. Just the thought of tiger and oni grinding their dicks against one another winds you up more than a little, and you squeeze his cock pretty hard in distraction, drawing a grunt from Rane. Slowing down a bit, not wanting to actually wake him up, you get your other hand on his balls and work a bit on them in turn, building up the oni's arousal more and more. As he shows no further signs of coming to, the more rapid jerking starts up again a moment later and soon, you feel Rane's balls tightening under your gasp, followed by the first thick spurt of cum from his blue cock - leaving a nice white streak over Ryousei's lower back, just above the tail. Almost giggling in glee, you aim his fire-hose of a throbbing erection at the tiger's rear end, directing blast after blast of Rane's seed to hit Ryousei, leaving the orange and black fur white-speckled and matted to his skin.";
		WaitLineBreak;
		say "     Eventually, the oni's explosive orgasm runs its course, with further spurts of cum becoming less and less intense until the last eventually barely squirts out anymore, leaving a sticky trail over the back of your fingers. Letting go of the blue shaft, you take in your handy-work - two hunky guys with their balls drained and one thoroughly cum-splattered ass on the otherworldly tiger. One detail is slightly off though - despite your attempts at aiming, there's no cum at all in the crack between Ryousei's buttocks... something you quickly remedy with the bit of cum just about to drip off your knuckles. Groping the drunk feline's firm rear end, you wipe off your hand along his crack, leaving behind a properly creamy finish of their imagined coupling.";
		if Player is male:
			say "     In the playful mood you are in, you can't help but run your index finger through one of the shots you accidentally missed with, dabbing some small amount of additional cum on Ryousei's pucker. As you run your fingertip over the opening of the tiger's rear end and feel the muscle twitch a little in response, another idea grows in your head - or possibly was sent from the 'other' head you have, the one straining against the material of your pants at the tip of a raging erection. You've already gone this far with the dozing tiger, so it wouldn't be that much of a step to take things the rest of the way.";
			LineBreak;
			say "     [bold type]One open and available butt-hole right in front of you and a hard dick in your pants - the temptation is quite strong to line yourself up with Ryousei's rear entrance and fuck him. Will you do so?[roman type][line break]";
			if Player consents:
				LineBreak;
				say "     Lust overrules any concern you may have about fucking a sleeping tiger and you quickly strip off your clothes. The [Cock of Player] shaft between your legs is freed to stick up straight, aiming at Ryousei's muscled rear end. Reaching over to milk a little more of Rane's cum out of his softening cock, you lube yourself up with the blue oni's seed, then move up close behind Ryousei's stretched-out form. Tightly gripping your own manhood, you guide it to the anthro feline's pucker and press against his opening, slowly increasing in pressure until the head pops in. As you slide into the warm and tight chute that your tiger companion calls his own, a low rumble raises from the tiger's broad chest in reaction to the intrusion. Could it be that you've overstepped the line and he's about to wake up and find you with your cock up his bottom?";
				say "     Given what you've already done with the two of them and the amazing feelings of being inside Ryousei, you can't really find it in you to worry about it. Instead, you speed up, gripping his hip with one hand and his tail with the other as you push deeper. Ryousei's hole stretches further as your erection sinks into it, proving to be a quite welcoming cock-sleeve. Only when you're finally balls-deep inside his ass, your balls being tickled by the soft fur of his butt, do you look up and check on the tiger - and he's still dozing like before, relaxed and with closed eyes, albeit with a subconscious grin on his muzzle. Bumping against his prostate as you give another little hump, you even draw a deep purr from him, again without waking the tiger up. Seems like that potent sake really did a number on him - and if he doesn't even come to from being penetrated...";
				WaitLineBreak;
				say "     The thrill of it all puts a wide grin on your face as you start to slide your cock in and out of the sleeping tiger in a rapid pace, balls slapping his rear rhythmically and echoing out into the library together with your own grunts and moans. What a truly delicious situation - not so long ago you'd never have believed in a thousand years that you'd be one day fucking anyone so openly in a public library, least of all a muscled anthro tiger, or even a sleeping tiger who's unaware that you're fucking him. Not that he seems to mind really - Ryousei is purring loudly now, the constant rumbling indicating his pleasure and flaring up whenever you thrust against his prostate. You wish you could go on like this forever, but your arousal is close to boiling over after all the playing around. All too soon, a familiar, urgent feeling builds up in your balls, and with one last deep thrust, you bury yourself in the tiger, painting his insides white with spurt after spurt of your seed.";
				NPCSexAftermath Ryousei receives "AssFuck" from Player;
				say "     Keeping your hips pressed against Ryousei's rear as you twitch with further blasts of cum shooting into him, you lean over him and rest your head against the tiger's soft-furred side. He is pleasantly warm to the touch, soft too, and you contently breathe in his scent - masculine and definitely furry, with an undertone of his own cum from earlier. Staying on top - and inside - of your feline companion for a little while longer, you finish coming into him, then wait till your cock softens far enough to pop out of Ryousei's chute on its own. With a little sigh at not having the energy for a second, third and fourth time with the hunk of a big cat right now, you stand up and inspect your handiwork - now the fiction that they had a drunken fuck is all but assured to be true - with your deposit of creamy evidence leaking out of Ryousei's back door.";
				LineBreak;
				say "     Grinning wildly, you stand up and walk away from the guys - grabbing a book from the shelves nearby that does look quite interesting. Its intriguing storyline pulls you under its spell and you're devouring it page by page. More than an hour passes until a somewhat pained grunt eventually draws your attention over to the slowly awakening oni and tiger.";
				WaitLineBreak;
				say "     'Uhhm...' Ryousei says, finding himself hugged by Rane's strong arm - then he realizes he is naked and sits up, brushing the oni's hand off as Rane comes to and reflexively tries to hold on. As Ryousei puts a hand on the floor to brace himself, he reaches right into his own dried cum and quickly pulls away from it again, his expression more shocked and embarrassed by the second. Turning his head to check on his surprise bedfellow, Ryousei gives a shocked hiss and says, 'Sumimasen deshita, Rane-san. I - I cannot believe something like this happened. My apologies, in my drunken state I must have... done shameful things. But why can't I remember?!' A clearly flustered Ryousei shifts his position away from the blue oni and rubs his temples, all the while frowning at the sticky and unkempt state of his fur.";
				say "     Meanwhile, Rane inspects himself and sees that he's bare-ass naked too. His brows draw together as he tries to recall what happened during their drinking binge, but doesn't have much success apparently and can barely stop staring at the dried cum-trickled from Ryousei's obviously fucked asshole. A moment later, Ryousei looks back over at the blue oni and notices where he's staring, then twists around a bit to check himself out, his tail twitching wildly as he realizes the extent of what seems to have transpired between them. 'Oh no. Did I somehow... come on to you and make you do that?' Ryousei asks in shame-faced embarrassment, then adds, 'You just wanted to be a good host and offered me a drink, but things must have gone out of hand with all the sake. Sumimasen, I do know your people do not usually... indulge to excess.'";
			else:
				LineBreak;
				say "     Nah, up till now it's all been just a bit of 'innocent' playing around. No need to take it too far and actually fuck someone. Pushing the thought aside, you stand up and walk away from the guys - grabbing a book from the shelves nearby that does look quite interesting. Its intriguing storyline pulls you under its spell and you're devouring it page by page. More than an hour passes until a somewhat pained grunt eventually draws your attention over to the slowly awakening oni and tiger.";
				LineBreak;
				say "     'Uhhm...' Ryousei says, finding himself hugged by Rane's strong arm - then he realizes he is naked and sits up, brushing the oni's hand off as Rane comes to and reflexively tries to hold on. As Ryousei puts a hand on the floor to brace himself, he reaches right into his own dried cum and quickly pulls away from it again, his expression more shocked and embarrassed by the second. Turning his head to check on his surprise bedfellow, Ryousei gives a shocked hiss and says, 'Sumimasen deshita, Rane-san. I - I cannot believe something like this happened. My apologies, in my drunken state I must have... done shameful things. But why can't I remember?!' A clearly flustered Ryousei shifts his position away from the blue oni and rubs his temples, all the while frowning at the sticky and unkempt state of his fur.";
				say "     Meanwhile, Rane inspects himself and sees that he's bare-ass naked too. His brows draw together as he tries to recall what happened during their drinking binge, but doesn't have much success apparently and can barely stop staring at the dried cum-trickled from Ryousei's obviously fucked asshole. A moment later, Ryousei looks back over at the blue oni and notices where he's staring, then twists around a bit to check himself out, his tail twitching wildly as he realizes the extent of what seems to have transpired between them. 'Oh no. Did I somehow... come on to you and make you do that?' Ryousei asks in shame-faced embarrassment, then adds, 'You just wanted to be a good host and offered me a drink, but things must have gone out of hand with all the sake. Sumimasen, I do know your people do not usually... indulge to excess.'";
		else:
			say "     Grinning wildly, you stand up and walk away from the guys - grabbing a book from the shelves nearby that does look quite interesting. Its intriguing storyline pulls you under its spell and you're devouring it page by page. More than an hour passes until a somewhat pained grunt eventually draws your attention over to the slowly awakening oni and tiger.";
			WaitLineBreak;
			say "     'Uhhm...' Ryousei says, finding himself hugged by Rane's strong arm - then he realizes he is naked and sits up, brushing the oni's hand off as Rane comes to and reflexively tries to hold on. As Ryousei puts a hand on the floor to brace himself, he reaches right into his own dried cum and quickly pulls away from it again, his expression more shocked and embarrassed by the second. Turning his head to check on his surprise bedfellow, Ryousei gives a shocked hiss and says, 'Sumimasen deshita, Rane-san. I - I cannot believe something like this happened. My apologies, in my drunken state I must have... done shameful things. But why can't I remember?!' A clearly flustered Ryousei shifts his position away from the blue oni and rubs his temples, all the while frowning at the sticky and unkempt state of his fur.";
			say "     Meanwhile, Rane inspects himself and sees that he's bare-ass naked too. His brows draw together as he tries to recall what happened during their drinking binge, but doesn't have much success apparently and can barely stop staring at the dried cum-trickled from Ryousei's obviously fucked asshole. A moment later, Ryousei looks back over at the blue oni and notices where he's staring, then twists around a bit to check himself out, his tail twitching wildly as he realizes the extent of what seems to have transpired between them. 'Oh no. Did I somehow... come on to you and make you do that?' Ryousei asks in shame-faced embarrassment, then adds, 'You just wanted to be a good host and offered me a drink, but things must have gone out of hand with all the sake. Sumimasen, I do know your people do not usually... indulge to excess.'";
		WaitLineBreak;
		say "     As Ryousei gives a deep bow to him and tries to apologize for his perceived misdeeds, Rane scratches the back of his neck and looks away in something like embarrassment. Then he gives himself a visible shrug and clears his throat. 'Hey. Cool it a bit with beating yourself up - I am not the oni you think I am! That whole stupid wise master stuff. Being all high-minded and cultured. Yeah, right. That's not me!' The tiger's brows draw together in even greater puzzlement and he says, 'What are you talking about? The fault clearly is mine. Everyone knows that...' Ryousei's brows stitch together as a new realization dawns upon him, 'Oh! Now I see. The blue oni from my plane of origin follow a certain... mold - and you clearly are not one of them, aside from the looks. As I should have realized immediately from this... situation, if not before.'";
		say "     Ryousei lays his hands on one another and gives a little bow to Rane, then adds, 'My apologies for assuming things about yourself, honored oni. Having been thrust into this realm by enemy machinations to remove me from my shogun's side, I was too glad to find someone seemingly familiar in this strange world. Still, it was irresponsible of myself to get drunk like this. Did I - um, join you in some sort of mating ritual?' In response, Rane just gives the tiger a companionable slap on the shoulder, then says, 'Nope. Just a fun bit of drinking, that's all it was. Aw, don't worry about it buddy. I totally went with it too because I wanted to see what you'd do. No harm no foul, eh? You must have liked it too, hm?' For the last bit, Rane nods at the dried patch of cum from where the tiger lay originally. Rane grins confidently at Ryousei and after a few moments, the tiger returns a slightly embarrassed smile.";
		WaitLineBreak;
		project Figure of Rane_face_icon;
		say "     With having made up, more or less, the blue oni then starts to nonchalantly check out Ryousei's body and reaches out to runs his hand down tiger's muscled flank. 'Just so you know... sake or no sake, I'd be interested in getting together with you again. One thing this oni definitely isn't is monk-ish and celibate, if you get my drift.' With a wink at Ryousei, Rane then gets up and bends over to grab his loincloth - not at all accidentally flashing the tiger his dick and firmly muscled blue butt. He adds, 'It's a standing offer for such a sexy cat as yourself. But now, I am off to re-stock on sake. Something tells me I need more in the future.' Then the blue oni casually vaults over the railing and light-footedly bounces off the tops of one, two, three sturdy bookshelves before jumping onto the floor of the library. With a grin over his shoulder, he puts his loincloth back on, then vanishes through the main doors soon after.";
		say "     After sorting out his appearance and donning his kimono again, Ryousei comes back over to your side a moment later. The tiger looks over to Rane's camp with a raised eyebrow, his tail twitching a bit through the air in an unruly fashion. 'Quite an unusual being,' he remarks, to which you smile and nod while he continues, '...but definitely interesting to know. I never knew a blue oni could be like that. I suppose everything truly is different in this realm...' There is a thoughtful shimmer in his eyes as Ryousei says this, and you notice that he casually tugs the front of his kimono a bit, having to adjust his crotch. Looks like he wouldn't be opposed to some action with the blue demon.";
	else: [nope]
		LineBreak;
		say "     Nah, you wouldn't like being messed with while you're asleep either. Tugging on Rane so that he's lying on his back beside Ryousei, no longer half on top of him, you leave the two of them to just sleep it off and grab a book from the shelves nearby that does look quite interesting. Its intriguing storyline pulls you under its spell and you're devouring it page by page until a somewhat pained grunt eventually draws your attention over to the slowly awakening oni and tiger.";
		LineBreak;
		say "     'Uhhm...' Ryousei says, finding himself hugged by Rane's strong arm - then he realizes he is naked and sits up, brushing the oni's hand off as Rane comes to and reflexively tries to hold on. Turning his head to check on his surprise bedfellow, Ryousei gives a surprised mrowl from his throat and says, 'So - we're both naked. And were curled up together - but I can't remember a thing otherwise. Clearly, that was too much sake for either of us.' Ryousei shifts his position a little bit away from the blue oni and rubs his temples. Meanwhile, Rane inspects himself and sees that he's bare-ass naked too. His brows draw together as he tries to recall what happened during their drinking binge, but doesn't have much success apparently. A moment later, Ryousei looks back over at the blue oni and asks, 'How about you, friend? I know I am not really used to lots of drinking because I never do when on campaign, but from what I remember, you seemed to put away the sake quite well. Surprisingly so, I have to say. It was my belief your people didn't... indulge like that.'";
		say "     A look of friendly curiosity shows on the anthro tiger's face, prompting Rane to scratch the back of his neck and look away for a moment before giving a shrug and admitting, 'I am not the oni you think I am! That whole stupid wise master stuff. Being all high-minded and cultured. Yeah, right. That's not me!' The tiger's brows draw together in even greater puzzlement and he says, 'What are you talking about?! Everyone knows that...' Ryousei's brows stitch together as a new realization dawns upon him, 'Oh! Now I see. The blue oni from my plane of origin follow a certain... mold - and you clearly are not one of them, aside from the looks.' Ryousei lays his hands on one another and gives a little bow to Rane, then adds, 'My apologies for assuming things about yourself, honored oni. Having been thrust into this realm by enemy machinations to remove me from my shogun's side, I was too glad to find someone seemingly familiar in this strange world.'";
		WaitLineBreak;
		project Figure of Rane_face_icon;
		say "     In response, Rane just gives the tiger a companionable slap on the shoulder, then says, 'Aw, don't worry about it buddy. I totally went with it too because I wanted to see what you'd do. No harm no foul, eh? I'll gladly have you as a drinking buddy.' The two of them smile at each other for a moment, with a bit of embarrassment on Ryousei's face while Rane nonchalantly checks out his body. Then the oni reaches out and runs his hand down tiger's muscled flank. 'Just so you know... sake or no sake, I'd be interested in getting together with you again. One thing this oni definitely isn't is monk-ish and celibate, if you get my drift.' With a wink at Ryousei, Rane then gets up and bends over to grab his loincloth - not at all accidentally flashing the tiger his dick and firmly muscled blue butt. He adds, 'It's a standing offer for such a sexy cat as yourself. But now, I am off to re-stock on sake. Something tells me I need more in the future.' Then the blue oni casually vaults over the railing and light-footedly bounces off the tops of one, two, three sturdy bookshelves before jumping onto the floor of the library. With a grin over his shoulder, he puts his loincloth back on, then vanishes through the main doors soon after.";
		say "     After sorting out his appearance and donning his kimono again, Ryousei comes back over to your side a moment later. The tiger looks over to Rane's camp with a raised eyebrow, his tail twitching a bit through the air in an unruly fashion. 'Quite an unusual being,' he remarks, to which you smile and nod while he continues, '...but definitely interesting to know. I never knew a blue oni could be like that. I suppose everything truly is different in this realm...' There is a thoughtful shimmer in his eyes as Ryousei says this, and you notice that he casually tugs the front of his kimono a bit, having to adjust his crotch. Looks like he wouldn't be opposed to some action with the blue demon.";

to say RyoSpoonsRane:
	project Figure of Rane_butt_icon;
	say "     With a wide grin on your face, you get Rane bare-ass naked - an easy task as the only thing he actually wears is that loincloth of his. With eager fingers, you un-clasp the segmented metal belt holding it around his hips, then pull the fabric away from the oni's body, revealing the sapphire-hued piece of man-meat he sports, complete with a sexy bush of pure white pubic hair. You keep your fingers on the oni's crotch for a moment, gently cupping his balls and weighing the big cock in your hand, then eventually move to the oni's top end, hooking a grip under his shoulders and pulling. It isn't easy to move someone as big as the huge oni, but thankfully you only have to arrange him a bit, as he was half on top of Ryousei anyways. So it costs you some sweat, but before long you have Rane lying on his side, bare-ass naked and looking quite delicious.";
	say "     Ryousei is the next one to go, and you relish in un-wrapping the attractive form of your passed-out feline companion. You can't help but feel up his muscled body and soft fur as you strip Ryousei, then start tugging him closer to Rane. Soon, you've got your two friends arranged as you want them to be - in the typical spooning position next to one another, sprawled out on the library floor. Ryousei came to lie quite close to the blue oni, his nose just brushing against the muscled demon's neck and you put his arm around Rane too as if holding him by the chest. Hah, that'll make for an interesting awakening in a bit. Stepping back to inspect your handiwork, you can't help but smile. Then suddenly, an even naughtier thought rears its head in your mind - there's one thing that would make the situation even more memorable... some creamy 'evidence' of them having a good time.";
	LineBreak;
	say "     [bold type]It wouldn't be hard to get Rane and Ryo erect and jerk them off, leaving them a little bit of a mess to wake up to. Do you do so?[roman type][line break]";
	if Player consents: [jerking fun]
		LineBreak;
		project Figure of Ryousei_naked_icon;
		say "     With a wide smile on your face, you move over to the passed-out oni and find that you don't even have to coax his pillar of masculinity to hardness... the blue oni is hard as a rock already. Who knows - it might be that he's a 'horny drunk', or that the demon dreams of very naughty things. No matter what, you can just move in and slide your fingers over the blue-skinned shaft, stroking its impressive length with relish. Rane's manhood human in shape - except for the sheer size of it - which gives the blue oni a very nice contrast to Ryousei's equipment, making you wish you could have the guys crotch to crotch and handling both of them at once. Just the thought of tiger and oni grinding their dicks against one another winds you up more than a little, and you squeeze his cock pretty hard in distraction, drawing a grunt from Rane. Slowing down a bit, not wanting to actually wake him up, you get your other hand on his balls and work a bit on them in turn, building up the oni's arousal more and more.";
		say "     As he shows no further signs of coming to, your more rapid jerking starts up again a moment later and soon, you feel Rane's balls tightening under your gasp, followed by the first thick spurt of cum from his blue cock - leaving a nice white streak on the ground in front of the demon. Another and another throb follows, splashing the library floor with even more oni cum. Eventually, the oni's explosive orgasm runs its course, with further spurts of cum becoming less and less intense until the last eventually barely squirts out anymore, leaving a sticky trail over the back of your fingers. Looking down at them, you then lick it off with a grin. One down one to go, you tell yourself as you look over to Ryousei next. Moving over to the passed-out tiger, you take in his impressive physique in detail - muscled pecs and rock hard abs above the longer fur of his pubes, nestled around a proper feline sheath with two full balls beneath it.";
		WaitLineBreak;
		say "     Bringing your hand to the furry orbs, you caress them gently, rolling Ryousei's cum-factories between your fingers. Even in his drunken state, the tiger can't help but react to the stimulation, and with a pleased growl from the unconscious feline, his cock starts to harden, poking out of the sheath with its tapering end. After a few more moments of caressing Ryousei, you shift your attention to his erection now, taking the thick and weighty member into your hand. It feels hot under your fingers and on inspection offers various characteristics that promise interesting sensations for someone on the receiving end - from the somewhat pointy head and its overall not quite human shape to numerous small, nubby spines along its shaft. You can't help but want to touch them, so you do - fingers gently pressing against one, then another. They are pretty soft, with just enough rigidity to rub someone in a very, very good way when they get fucked by Ryousei.";
		say "     Hand clasped around your feline companion's manhood, you give it a gentle squeeze and then start jerking up and down on it. Just as you want to start going in a steady rhythm, the sound of a mrowl from the tiger makes you pause and look up at him. Your heart almost jumps out of your chest as you anxiously wonder if you went too far in your 'prank' - but no, the tiger just made a sound in his drunken stupor. He seems to be having a most pleasant dream right now, as the next thing you hear from Ryousei is a loud purr rumbling around in his broad chest. The fact that your friend quite obviously enjoys himself motivates you to go at it more intensely and soon you're jerking him in a rapid pace, reacting to the twitches and noises he makes. It doesn't take all that much longer before your attention bears fruit and his body stiffens, followed by pulsing of the cock in your hand as it erupts with a spurt after spurt of his creamy cum.";
		WaitLineBreak;
		say "     Almost giggling in glee, you aim his fire-hose of a throbbing erection at the blue oni's rear end, directing blast after blast of Ryousei's seed to hit Rane's ass, leaving the blue-skinned demon white-speckled with cum. You hold on to Ryousei's manhood for a moment, pleased with the fact that you got control over the hunky tiger with his 'joy-stick'. As his orgasm slowly ebbs off after a short while, you squeeze the last drops of cum out of his softening erection and look at the dollop of creamy white on the side of your index-finger. Letting go of the spined shaft, you take in your handy-work - two hunky guys with their balls drained and one thoroughly cum-splattered ass on the muscular demon. One detail is slightly off though - despite your attempts at aiming, there's no cum at all in the crack between Rane's buttocks... something you quickly remedy with the bit of cum just about to drip off your hand. Groping the drunk oni's firm rear end, you wipe off your hand along his crack, leaving behind a properly creamy finish of their imagined coupling.";
		if Player is male:
			say "     In the playful mood you are in, you can't help but run your index finger through one of the shots you accidentally missed with, dabbing some small amount of additional cum on Rane's pucker. As you run your fingertip over the opening of the blue demon's rear end and feel the muscle twitch a little in response, another idea grows in your head - or possibly was sent from the 'other' head you have, the one straining against the material of your pants at the tip of a raging erection. You've already gone this far with the passed-out oni, so it wouldn't be that much of a step to take things the rest of the way.";
			LineBreak;
			say "     [bold type]One open and available butt-hole right in front of you and a hard dick in your pants - the temptation is quite strong to line yourself up with Rane's rear entrance and fuck him. Will you do so?[roman type][line break]";
			if Player consents:
				LineBreak;
				project Figure of Rane_butt_icon;
				say "     Lust overrules any concern you may have about fucking a sleeping demon and you quickly strip off your clothes. The [Cock of Player] shaft between your legs is freed to stick up straight, aiming at Rane's muscled rear end. Reaching over to milk a little more of Ryousei's cum out of his softening cock, you lube yourself up with the tiger general's seed, then move up close behind Rane's stretched-out form. Tightly gripping your own manhood, you guide it to the blue oni's pucker and press against his opening, slowly increasing in pressure until the head pops in. As you slide into the warm and tight chute that your oni friend calls his own, a groan rises from the muscled man's broad chest in reaction to the intrusion. Could it be that you've overstepped the line and he's about to wake up and find you with your cock up his bottom?";
				say "     Given what you've already done with the two of them and the amazing feelings of being inside Rane, you can't really find it in you to worry about it. Instead, you speed up, gripping his hips with both hands as you push deeper. Rane's hole stretches further as your erection sinks into it, proving to be a quite welcoming cock-sleeve. Only when you're finally balls-deep inside his ass, your balls brushing against the smooth curve of his butt, do you look up and check on the oni - and he's still dozing like before, relaxed and with closed eyes, albeit with a subconscious grin on his face. Bumping against his prostate as you give another little hump, you even draw a lusty groan from him, again without waking the oni up. Seems like that potent sake really did a number on him - and if he doesn't even come to from being penetrated...";
				WaitLineBreak;
				say "     The thrill of it all puts a wide grin on your face as you start to slide your cock in and out of the sleeping demon in a rapid pace, balls slapping his rear rhythmically and echoing out into the library together with your own grunts and moans. What a truly delicious situation - not so long ago you'd never have believed in a thousand years that you'd be one day fucking anyone so openly in a public library, least of all a muscled blue oni, or even a sleeping oni who's unaware that you're fucking him. Not that he seems to mind really - Rane is moaning in his sleep, the gasps and sights indicating his pleasure and getting louder whenever you thrust against his prostate. You wish you could go on like this forever, but your arousal is close to boiling over after all the playing around. All too soon, a familiar, urgent feeling builds up in your balls, and with one last deep thrust, you bury yourself in the oni, painting his insides white with spurt after spurt of your seed.";
				NPCSexAftermath Rane receives "AssFuck" from Player;
				say "     Keeping your hips pressed against Rane's rear as you twitch with further blasts of cum shooting into him, you lean over him and rest your head against the oni's gently rising and falling side. He is pleasantly warm to the touch, soft enough despite his firm muscles, and you contently breathe in his scent - masculine and enticing, with an undertone of his own cum from earlier. Staying on top - and inside - of your oni friend for a little while longer, you finish coming into him, then wait till your cock softens far enough to pop out of Rane's chute on its own. With a little sigh at not having the energy for a second, third and fourth time with the hunk of a blue demon right now, you stand up and inspect your handiwork - now the fiction that they had a drunken fuck is all but assured to be true - with your deposit of creamy evidence leaking out of Rane's back door.";
				LineBreak;
				say "     Grinning wildly, you stand up and walk away from the guys - grabbing a book from the shelves nearby that does look quite interesting. Its intriguing storyline pulls you under its spell and you're devouring it page by page. More than an hour passes until a somewhat pained grunt eventually draws your attention over to the slowly awakening oni and tiger.";
				WaitLineBreak;
				LineBreak;
				project Figure of Ryousei_naked_icon;
				say "     'Uhhm...' Ryousei says, finding himself embracing Rane from behind - then he realizes he is naked and sits up, hastily pulling his arm from around the stretched-out oni. As Ryousei puts a hand on the floor to brace himself, his gaze falls upon the dried cum showing quite visibly on Rane's blue skin, his expression more shocked and embarrassed by the second. Looking down over his own body, Ryousei sees the slightly sticky patch where some cum dripped on his leg and gives a shocked hiss. 'Sumimasen deshita, Rane-san. I - I cannot believe something like this happened. My apologies, in my drunken state I must have... done shameful things. But why can't I remember?!' A clearly flustered Ryousei shifts his position away from the blue oni and rubs his temples, all the while frowning at the sticky and unkempt state of his fur.";
				say "     Meanwhile, Rane inspects himself and sees that he's bare-ass naked too. His brows draw together as he tries to recall what happened during their drinking binge, but doesn't have much success apparently. Reaching back to gingerly feeling his somewhat sore asshole, he can barely stop starting at the half-dried cum sticking to his fingers afterwards. A moment later, Ryousei looks back over at the blue oni and notices what he is doing, then growls in frustration. 'Oh no. Did I besmirch your honor?' Ryousei asks in shame-faced embarrassment, then adds, 'You just wanted to be a good host and offered me a drink, but things must have gone out of hand with all the sake. Sumimasen, I do know your people do not usually... indulge to excess.'";
			else:
				LineBreak;
				say "     Nah, up till now it's all been just a bit of 'innocent' playing around. No need to take it too far and actually fuck someone. Pushing the thought aside, you stand up and walk away from the guys - grabbing a book from the shelves nearby that does look quite interesting. Its intriguing storyline pulls you under its spell and you're devouring it page by page. More than an hour passes until a somewhat pained grunt eventually draws your attention over to the slowly awakening oni and tiger.";
				LineBreak;
				project Figure of Ryousei_naked_icon;
				say "     'Uhhm...' Ryousei says, finding himself embracing Rane from behind - then he realizes he is naked and sits up, hastily pulling his arm from around the stretched-out oni. As Ryousei puts a hand on the floor to brace himself, his gaze falls upon the dried cum showing quite visibly on Rane's blue skin, his expression more shocked and embarrassed by the second. Looking down over his own body, Ryousei sees the slightly sticky patch where some cum dripped on his leg and gives a shocked hiss. 'Sumimasen deshita, Rane-san. I - I cannot believe something like this happened. My apologies, in my drunken state I must have... done shameful things. But why can't I remember?!' A clearly flustered Ryousei shifts his position away from the blue oni and rubs his temples, all the while frowning at the sticky and unkempt state of his fur.";
				say "     Meanwhile, Rane inspects himself and sees that he's bare-ass naked too. His brows draw together as he tries to recall what happened during their drinking binge, but doesn't have much success apparently. Having felt between his buttocks, he can barely stop staring at the half-dried cum sticking to his fingers. A moment later, Ryousei looks back over at the blue oni and notices what he is doing, then growls in frustration. 'Oh no. Did I somehow... besmirch your honor?' Ryousei asks in shame-faced embarrassment, then adds, 'You just wanted to be a good host and offered me a drink, but things must have gone out of hand with all the sake. Sumimasen, I do know your people do not usually... indulge to excess.'";
		else:
			say "     Grinning wildly, you stand up and walk away from the guys - grabbing a book from the shelves nearby that does look quite interesting. Its intriguing storyline pulls you under its spell and you're devouring it page by page. More than an hour passes until a somewhat pained grunt eventually draws your attention over to the slowly awakening oni and tiger.";
			WaitLineBreak;
			project Figure of Ryousei_naked_icon;
			say "     'Uhhm...' Ryousei says, finding himself embracing Rane from behind - then he realizes he is naked and sits up, hastily pulling his arm from around the stretched-out oni. As Ryousei puts a hand on the floor to brace himself, his gaze falls upon the dried cum showing quite visibly on Rane's blue skin, his expression more shocked and embarrassed by the second. Looking down over his own body, Ryousei sees the slightly sticky patch where some cum dripped on his leg and gives a shocked hiss. 'Sumimasen deshita, Rane-san. I - I cannot believe something like this happened. My apologies, in my drunken state I must have... done shameful things. But why can't I remember?!' A clearly flustered Ryousei shifts his position away from the blue oni and rubs his temples, all the while frowning at the sticky and unkempt state of his fur.";
			say "     Meanwhile, Rane inspects himself and sees that he's bare-ass naked too. His brows draw together as he tries to recall what happened during their drinking binge, but doesn't have much success apparently. Reaching back to gingerly feeling his somewhat sore asshole, he can barely stop starting at the half-dried cum sticking to his fingers afterwards. A moment later, Ryousei looks back over at the blue oni and notices what he is doing, then growls in frustration. 'Oh no. Did I besmirch your honor?' Ryousei asks in shame-faced embarrassment, then adds, 'You just wanted to be a good host and offered me a drink, but things must have gone out of hand with all the sake. Sumimasen, I do know your people do not usually... indulge to excess.'";
		WaitLineBreak;
		say "     As Ryousei gives a deep bow to him and tries to apologize for his perceived misdeeds, Rane scratches the back of his neck and looks away in something like embarrassment. Then he gives himself a visible shrug and clears his throat. 'Hey. Cool it a bit with beating yourself up - I am not the oni you think I am! That whole stupid wise master stuff. Being all high-minded and cultured. Yeah, right. That's not me!' The tiger's brows draw together in even greater puzzlement and he says, 'What are you talking about? The fault clearly is mine. Everyone knows that...' Ryousei's brows stitch together as a new realization dawns upon him, 'Oh! Now I see. The blue oni from my plane of origin follow a certain... mold - and you clearly are not one of them, aside from the looks. As I should have realized immediately from this... situation, if not before.'";
		say "     Ryousei lays his hands on one another and gives a little bow to Rane, then adds, 'My apologies for assuming things about yourself, honored oni. Having been thrust into this realm by enemy machinations to remove me from my shogun's side, I was too glad to find someone seemingly familiar in this strange world. Still, it was irresponsible of myself to get drunk like this. Did I - um, join you in some sort of mating ritual?' In response, Rane just gives the tiger a companionable slap on the shoulder, then says, 'Nope. Just a fun bit of drinking, that's all it was. Aw, don't worry about it buddy. I totally went with it too because I wanted to see what you'd do. No harm no foul, eh? You must have liked it too, hm?' For the last bit, Rane nods at the dried patch of cum from where the tiger lay originally. Rane grins confidently at Ryousei and after a few moments, the tiger returns a slightly embarrassed smile.";
		WaitLineBreak;
		project Figure of Rane_face_icon;
		say "     With having made up, more or less, the blue oni then starts to nonchalantly check out Ryousei's body and reaches out to runs his hand down tiger's muscled flank. 'Just so you know... sake or no sake, I'd be interested in getting together with you again. One thing this oni definitely isn't is monk-ish and celibate, if you get my drift.' With a wink at Ryousei, Rane then gets up and bends over to grab his loincloth - not at all accidentally flashing the tiger his dick and firmly muscled blue butt. He adds, 'It's a standing offer for such a sexy cat as yourself. But now, I am off to re-stock on sake. Something tells me I need more in the future.' Then the blue oni casually vaults over the railing and light-footedly bounces off the tops of one, two, three sturdy bookshelves before jumping onto the floor of the library. With a grin over his shoulder, he puts his loincloth back on, then vanishes through the main doors soon after.";
		say "     After sorting out his appearance and donning his kimono again, Ryousei comes back over to your side a moment later. The tiger looks over to Rane's camp with a raised eyebrow, his tail twitching a bit through the air in an unruly fashion. 'Quite an unusual being,' he remarks, to which you smile and nod while he continues, '...but definitely interesting to know. I never knew a blue oni could be like that. I suppose everything truly is different in this realm...' There is a thoughtful shimmer in his eyes as Ryousei says this, and you notice that he casually tugs the front of his kimono a bit, having to adjust his crotch. Looks like he wouldn't be opposed to some action with the blue demon.";
	else: [nope]
		LineBreak;
		say "     Nah, you wouldn't like being messed with while you're asleep either. Tugging on Rane so that he's lying on his back beside Ryousei, no longer half on top of him, you leave the two of them to just sleep it off and grab a book from the shelves nearby that does look quite interesting. Its intriguing storyline pulls you under its spell and you're devouring it page by page until a somewhat pained grunt eventually draws your attention over to the slowly awakening oni and tiger.";
		LineBreak;
		project Figure of Ryousei_naked_icon;
		say "     'Uhhm...' Ryousei says, finding himself hugging Rane's stretched-out form - then he realizes he himself also doesn't have anything on and sits up. Turning his head to check on his surprise bedfellow, Ryousei gives a surprised mrowl from his throat and says, 'So - we're both naked. And were curled up together - but I can't remember a thing otherwise. Clearly, that was too much sake for either of us.' Ryousei shifts his position a little bit away from the blue oni and rubs his temples. Meanwhile, Rane inspects himself and sees that he's bare-ass naked too. His brows draw together as he tries to recall what happened during their drinking binge, but doesn't have much success apparently. A moment later, Ryousei looks back over at the blue oni and asks, 'How about you, friend? I know I am not really used to lots of drinking because I never do when on campaign, but from what I remember, you seemed to put away the sake quite well. Surprisingly so, I have to say. It was my belief your people didn't... indulge like that.'";
		say "     A look of friendly curiosity shows on the anthro tiger's face, prompting Rane to scratch the back of his neck and look away for a moment before giving a shrug and admitting, 'I am not the oni you think I am! That whole stupid wise master stuff. Being all high-minded and cultured. Yeah, right. That's not me!' The tiger's brows draw together in even greater puzzlement and he says, 'What are you talking about?! Everyone knows that...' Ryousei's brows stitch together as a new realization dawns upon him, 'Oh! Now I see. The blue oni from my plane of origin follow a certain... mold - and you clearly are not one of them, aside from the looks.' Ryousei lays his hands on one another and gives a little bow to Rane, then adds, 'My apologies for assuming things about yourself, honored oni. Having been thrust into this realm by enemy machinations to remove me from my shogun's side, I was too glad to find someone seemingly familiar in this strange world.'";
		WaitLineBreak;
		project Figure of Rane_face_icon;
		say "     In response, Rane just gives the tiger a companionable slap on the shoulder, then says, 'Aw, don't worry about it buddy. I totally went with it too because I wanted to see what you'd do. No harm no foul, eh? I'll gladly have you as a drinking buddy.' The two of them smile at each other for a moment, with a bit of embarrassment on Ryousei's face while Rane nonchalantly checks out his body. Then the oni reaches out and runs his hand down tiger's muscled flank. 'Just so you know... sake or no sake, I'd be interested in getting together with you again. One thing this oni definitely isn't is monk-ish and celibate, if you get my drift.' With a wink at Ryousei, Rane then gets up and bends over to grab his loincloth - not at all accidentally flashing the tiger his dick and firmly muscled blue butt. He adds, 'It is a standing offer for such a sexy cat as yourself. But now, I am off to re-stock on sake. Something tells me I need more in the future.' Then the blue oni casually vaults over the railing and light-footedly bounces off the tops of one, two, three sturdy bookshelves before jumping onto the floor of the library. With a grin over his shoulder, he puts his loincloth back on, then vanishes through the main doors soon after.";
		say "     After sorting out his appearance and donning his kimono again, Ryousei comes back over to your side a moment later. The tiger looks over to Rane's camp with a raised eyebrow, his tail twitching a bit through the air in an unruly fashion. 'Quite an unusual being,' he remarks, to which you smile and nod while he continues, '...but definitely interesting to know. I never knew a blue oni could be like that. I suppose everything truly is different in this realm...' There is a thoughtful shimmer in his eyes as Ryousei says this, and you notice that he casually tugs the front of his kimono a bit, having to adjust his crotch. Looks like he wouldn't be opposed to some action with the blue demon.";

Table of NavInEvents (continued)
Priority	Name	EventObject	EventConditions	EventRoom	LastEncounterTurn	CoolDownTurns	EncounterPercentage
3	"Ryousei_TaiChi_Intro"	Ryousei_TaiChi_Intro	"[EventConditions_Ryousei_TaiChi_Intro]"	Grey Abbey Library	2500	2	100

Table of WalkInEvents (continued)
Priority	Name	EventObject	EventConditions	EventRoom	LastEncounterTurn	CoolDownTurns	EncounterPercentage
3	"Ryousei_TaiChi_Intro"	Ryousei_TaiChi_Intro	"[EventConditions_Ryousei_TaiChi_Intro]"	Grey Abbey Library	2500	2	100

to say EventConditions_Ryousei_TaiChi_Intro:
	if (Ryousei is in Grey Abbey Library and "TaiChi_Seen" is not listed in Traits of Ryousei and "TaiChi_Joined" is not listed in Traits of Ryousei and "TaiChi_Ignored" is not listed in Traits of Ryousei): [list of conditions here]
		now CurrentWalkinEvent_ConditionsMet is true;

Table of GameEventIDs (continued)
Object	Name
Ryousei_TaiChi_Intro	"Ryousei_TaiChi_Intro"

Ryousei_TaiChi_Intro is a situation.
ResolveFunction of Ryousei_TaiChi_Intro is "[ResolveEvent Ryousei_TaiChi_Intro]".
Sarea of Ryousei_TaiChi_Intro is "Nowhere". [standard walkins that cannot be hunted for are Nowhere, but walkin events can also be made huntable as an alternate access way]

to say ResolveEvent Ryousei_TaiChi_Intro:
	project Figure of Ryousei_clothed_icon;
	say "[LibraryEntry_NavOrWalk]";
	say "you spot your anthro tiger companion Ryousei moving along between the bookshelves towards the back of the room, then leave through the back door. He is moving with a determined stride, and curiosity about where he is going draws you to follow after the feline. Hustling along to catch up, you catch the door before it swings fully shut and open it again, looking outside. Your otherworldly guest doesn't appear to have gone all that far, just to the nearest stretch of grass, next to the fountain. Bringing his hands together, he stands straight and bends his head with closed eyes for a second, then begins to move, slow but smoothly, taking a peculiar pose with one arm stretched down, the other slightly raised. Holding this for a few seconds, another pose follows easily, now with the tiger's hands furled in towards his body. Ah, now you recognize what this is - Ryousei is doing something that seems similar to Tai Chi! Looks pretty neat and relaxing, how he moves in the shine of the [if daytimer is day]sunlight[else]moonlight[end if].";
	say "     [bold type]Do you want to do something?[roman type][line break]";
	say "     [link](1)[as]1[end link] - Walk up and sit on the edge of the fountain. You can keep him some company.";
	say "     [link](2)[as]2[end link] - Walk up and ask to join him.";
	say "     [link](3)[as]3[end link] - Nah, just leave him to it. He's already started and you don't want to interrupt.";
	say "     [link](4)[as]4[end link] - You don't have any interest in this. Not your thing.";
	now calcnumber is 0;
	while calcnumber < 1 or calcnumber > 4:
		say "Choice? (1-4)>[run paragraph on]";
		get a number;
		if calcnumber is 1 or calcnumber is 2 or calcnumber is 3 or calcnumber is 4:
			break;
		else:
			say "Invalid choice. Type [link]1[end link] to watch, [link]2[end link] to join in, [link]3[end link] to give Ryousei his peace or [link]4[end link] to ignore him.";
	if calcnumber is 1:
		say "     Stepping outside yourself, you stroll up the footpath towards the fountain. Ryousei notices you before you're more than halfway, with a smile spreading on his face. 'Hello, my friend. Would you like to join me?' the feline offers gracefully, indicating a free spot of grass by his side. You thank him and say that you're fine just watching, with his reply being, 'Of course. I am glad for your company no matter what.' As he starts his next set of poses, you continue on to the fountain and sit on the rim, just relaxing and watching, with some casual conversation thrown in for good measure. Ryousei tells you some stories about life in the world he comes from - everyday tales from his youth, and living in a village, with you detailing how things were here - before the nanite apocalypse. All in all, you have a pretty nice time, letting go of the worries of survival for a little while, and you feel better for it as you eventually go back inside the library.";
		SanBoost 10;
		follow the turnpass rule;
		add "TaiChi_Seen" to Traits of Ryousei;
	else if calcnumber is 2:
		say "     Stepping outside yourself, you stroll up the footpath towards the fountain. Ryousei notices you before you're more than halfway, with a smile spreading on his face. 'Hello, my friend. Would you like to join me?' the feline offers gracefully, indicating a free spot of grass by his side. You thank him for the offer and add that you were just about to ask him, which draws a little chuckle from the strong tiger. 'No matter what, I am glad for your company. Do you have experience in the Way of the Mantis, or do you want me to guide you?' Explaining that there is something quite similar on Earth, called 'Tai Chi', you accept and follow along as he demonstrates pose after pose, slowly taking you through them. While you work out your bodies, some casual conversation also stimulates your minds, with Ryousei telling some stories about life in the world he came from - everyday tales from his youth, and living in a village, with you detailing how things were here - before the nanite apocalypse. All in all, you have a pretty nice time, letting go of the worries of survival for a little while, and you feel better for it in body and mind as you eventually go back inside the library.";
		PlayerHealed 10;
		SanBoost 15;
		follow the turnpass rule;
		add "TaiChi_Joined" to Traits of Ryousei;
	else if calcnumber is 3:
		say "     Deciding that you do not want to intrude, you keep looking for a little while, watching the anthro tiger go through several poses in a smooth, well-experienced way. He clearly has been doing exercises like that for years. It looks like it's a fairly nice and relaxing thing to do. Maybe you should ask him about joining in sometime. When you eventually close the door quietly and walk back to the front of the library, you can't help but feel a little better and less stressed out.";
		SanBoost 5;
		add "TaiChi_Seen" to Traits of Ryousei;
	else:
		say "     With a shrug, you close the door and walk back to the front of the library. You have better things to do than watching some glorified stretching exercises.";
		add "TaiChi_Ignored" to Traits of Ryousei;
	add "TaiChi_DoneForToday" to Traits of Ryousei; [filter for only one session a day]
	now Ryousei_TaiChi_Intro is resolved;

to say RyouseiTaiChi:
	if "TaiChi_DoneForToday" is listed in Traits of Ryousei: [already had some today]
		say "     As you propose to do another set of 'Way of the Mantis' exercises, the anthro tiger lets out a hearty chuckle, rumbling in his broad, furred chest. 'Patience, my friend. The training helps you get centered for what you want to do, but you can't keep at it all day. Let's start again tomorrow.'";
	else if Ryousei is not booked: [not in the library/bunker]
		say "     As you propose to do another set of 'Way of the Mantis' exercises, the anthro tiger glances around, then slowly shakes his head. 'I don't think this is the right place for it, sorry. We don't want to get interrupted after all. How about going back to the Grey Abbey Library instead?'";
	else if Energy of Player > 3: [drunk]
		say "     As you propose to do another set of 'Way of the Mantis' exercises, the anthro tiger looks at you with raised eyebrows and shakes his head. 'I don't think that there's much sense in even trying that, given your state right now. We can gladly do it when you sober up and still feel like it, okay?'";
	else:
		say "     Walking back to the stretch of grass next to the fountain behind the library with Ryousei, you take positions side by side there. Then Ryousei starts the two of you out in your 'Way of the Mantis' exercises, slowly going through stretches and various poses. While you work out your bodies, some casual conversation also stimulates your minds, with Ryousei telling some stories about life in the world he came from - everyday tales from his youth, and living in a village, with you detailing how things were here - before the nanite apocalypse. All in all, you have a pretty nice time, letting go of the worries of survival for a little while, and you feel better for it in body and mind as you eventually go back inside the library.";
		PlayerHealed 10;
		SanBoost 15;
		follow the turnpass rule;
		if "TaiChi_Joined" is not listed in Traits of Ryousei:
			add "TaiChi_Joined" to Traits of Ryousei;
		add "TaiChi_DoneForToday" to Traits of Ryousei; [filter for only one session a day]

an everyturn rule:
	if Royal Tiger companion is tamed:
		if TimekeepingVar is 1 or TimekeepingVar is -7: [midnight]
			if "TaiChi_DoneForToday" is listed in Traits of Ryousei: [filter for only one session a day]
				remove "TaiChi_DoneForToday" from Traits of Ryousei;
		[else if TimekeepingVar is 0 or TimekeepingVar is -8:] [pre-dawn]
		[else if TimekeepingVar is 7 or TimekeepingVar is -1:] [early morning]
		[else if TimekeepingVar is 6 or TimekeepingVar is -2:] [mid-morning]
		[else if TimekeepingVar is 5 or TimekeepingVar is -3:] [noon]
		[else if TimekeepingVar is 4 or TimekeepingVar is -4:] [mid afternoon]
		[else if TimekeepingVar is 3 or TimekeepingVar is -5:] [evening]
		[else if TimekeepingVar is 2 or TimekeepingVar is -6:] [early night]

to say RyouseiSparring:
	say "     When you suggest a friendly match between the two of you, ";
	if Ryousei is not booked: [outside of the home base]
		say "Ryousei glances around, taking in your surroundings. 'I don't think this is the appropriate place for that. We wouldn't want to be surprised by roaming beasts, or disturb innocent bystanders. How about we take this up again, back at the Grey Abbey?'";
	else if HP of Player < (MaxHP of Player / 2):
		say "Ryousei looks you up and down and raises one eyebrow. 'Are you sure that is the best idea right now? You seem like you're at less than your best, and I wouldn't want to take advantage of having you in a weakened state. Better if you rest a bit first, don't you think?'";
	else:
		repeat with y running from 1 to number of filled rows in Table of Random Critters:
			choose row y in Table of Random Critters;
			if Name entry is "Royal Tiger":
				now MonsterID is y;
				now lev entry is (13 + Level of Royal Tiger companion);
				now wdam entry is (Weapon Damage of Royal Tiger companion);
				now HP entry is (95 + (Level of Royal Tiger * 10));
				break;
		say "Ryousei chuckles and nods eagerly. 'What a great idea. I'm ready if you are!'";
		if Royal Tiger companion is listed in CompanionList of Player: [temporary dismissal since he can't fight with you against himself]
			ForceCompanionDismiss "Ryousei";
			challenge "Royal Tiger";
			ForceCompanionJoin "Ryousei";
		else:
			challenge "Royal Tiger";
		if fightoutcome < 30: [won  or lost]
			let needed be 0;
			increase the XP of Royal Tiger companion by level of Player;
			now needed is ( level of Royal Tiger companion ) times 10;
			if "Good Teacher" is listed in feats of Player:
				now needed is ( level of Royal Tiger companion ) times 6;
			if XP of Royal Tiger companion >= needed and level of Royal Tiger companion < level of Player and humanity of Player > 0:
				pet level up Royal Tiger companion;

Section 6 - Endings

Table of GameEndings (continued)
Name (text)	Type (text)	Subtype (text)	Ending (rule)	Priority (number)	Triggered (truth state)
"Ryousei's Epilogue"	"Companion"	"Pet"	Ryousei's Epilogue rule	750	false

This is the Ryousei's Epilogue rule:
	if royal tiger companion is tamed: [player became companion of Ryo]
		trigger ending "Ryousei's Epilogue"; [Here it states, that the ending has been played.]
		if humanity of Player < 10: [succumb ending]
			say "     Ryousei is sad to see his favorite companion in this world succumb to the mental effects of the nanite infection, but there is little he can do to bring you back to the old self he learned to know and like. The proud tiger stays close to you for a while afterwards, but your quickly building lust soon makes you look at him in a lewd and hungry way. Rather than taking the chance of hurting you if he has to fight off forceful advances, your friend chooses to go instead - leaving you behind with a sigh.";
		else: [sane]
			say "     Having come to know and trust you, Ryousei readily accompanies you when the military moves in to pick you and other survivors up. The soldiers are pleasantly surprised to find the powerful anthro tiger calm and composed - incredibly well-tempered in comparison to others that attack them with teeth and claws. A while later, the doctors in the quarantine site just outside the military blockade around the city find themselves nonplussed by Ryousei's test results - he clearly isn't human, but there are literally no nanites anywhere in his system. They record the tiger's explanation about being from another world, but can't quite take it seriously, then release him quickly to free up a spot for one of the multitude of evacuated people still waiting for a checkup.";
			say "     The large feline hangs out near the camp until you are released yourself, then joins you once more, ready to get to know this world in a less catastrophe-stricken setting. Given the changes caused by the nanite apocalypse that ripple throughout society, with all sorts of transformed people trying to find a new place, it definitely is an adventure for both of you. Meanwhile, Ryousei never stops in his search of a way to 'escape' back to his own world... yet if he ever will find it, only time will tell. Maybe he'll not want to leave after all at some point, after having stayed here with you for a while...";

Ryousei ends here.
