Version 2 of Ancient Tome by Wahn begins here.
[ Version 2 - Merged Additional Tome Scenes into the main Tome file                    ]

[ Versions of Additional Tome Scenes                                                   ]
[ v1 - Adds tentacles and demon fox                                                    ]
[ v2 - Breaks up the file into more abstract pieces                                    ]
[ v3 - Added support for the Dullahan summon - Gherod                                  ]
[ v4 - Added support for Drelgoth - Gherod                                             ]
[ v5 - Straightened out reading/summoning with the tome                                ]

[ TomeFound  - Tracking variable for interaction with Eric                             ]
[   0: not found                                                                       ]
[   1: Eric got the book                                                               ]
[   2: Eric is reading the book                                                        ]
[   3: Eric is was tentacle-fucked, player saw nothing                                 ]
[   4: Eric is was tentacle-fucked, player watched                                     ]
[  20: player took the book after Eric was almost tentacle-fucked                      ]
[  21: player told Eric the truth about him being almost tentacle-fucked               ]
[  22: player told Eric he doesn't have the book                                       ]
[  23: player told Eric the truth about him being tentacle fucked                      ]
[  24: player told Eric he doesn't have the book (after tentacle fucking)              ]
[  96: player gave Eric the book back after he got tentacle-fucked                     ]
[  97: player gave Eric the book back after he got almost tentacle-fucked              ]
[  98: player took the book after Eric was tentacle fucked (unknown to the player)     ]
[  99: player took the book after Eric had a read                                      ]
[ 100: player took the book right from the start                                       ]
[ 101: Eric is afraid of the book and was offered it back before                       ]

[ TENTACLE CODE - Dys/Ancient Tentacles.i7x                                            ]
[ DEMON FOX CODE - Dys/Demon Fox.i7x                                                   ]

[ TomeTimer tracks how long it's been since the player has been                        ]
[ influenced by the tome                                                               ]
[ TomeInfluence tracks how much the player has been influenced                         ]
[   0 = Never influenced. Cannot use tome                                              ]
[   1 = Influenced once. Cannot use tome                                               ]
[   2 = Influenced twice. Cannot use tome                                              ]
[   3 = Influenced three times. Can now use the tome                                   ]
[ TomeInteractions tracks the number of times the player has used the tome.            ]
[ TomeEventPending flags if a tome event is waiting to fire                            ]

"Adds Ancient Tome item and actions with it."

TomeFound is a number that varies.
lastTomeInteraction is a number that varies.
TomeTimer is a number that varies. TomeTimer is usually 5000.
TomeInfluence is a number that varies. TomeInfluence is usually 0.
TomeInteractions is a number that varies. TomeInteractions is usually 0.
TomeEventPending is a truth state that varies. TomeEventPending is usually false.
TomeInfluenceTimer is a number that varies. TomeInfluenceTimer is usually 5000.

An everyturn rule: [item cleanup]
	if carried of ancient tome > 1:
		say "     You feel movement in your backpack and pull it off, checking over what might have happened. Strange, didn't you have more than one ancient tome? Oh well, one is plenty anyways...";
		now carried of ancient tome is 1;

instead of navigating Grey Abbey Library while (Eric is in Bunker and HP of Eric > 9 and HP of Eric < 99 and TomeFound is 0 and a random chance of 1 in 2 succeeds):
	say "[NavCheck Grey Abbey Library]";
	if NavCheckReturn is false, stop the action;
	move player to Grey Abbey Library;
	if debugactive is 1:
		say "     DEBUG: Eric finds a book - TomeFound: [TomeFound], lastTomeInteraction: [lastTomeInteraction], current turn: [turns][line break]";
	say "     As you enter the library, you find Eric sitting cross-legged on one of the sofas close to the entrance. A dusty box sits on the low sofa table he has dragged close and is apparently in the progress of unpacking. Small stacks of old, sometimes damaged-looking books are spread out next to him as he takes stock. Looking up from the box, Eric smiles at you and calls out, 'Hey there - look what I found back in one of the storerooms! I got bored just sitting around and since it is so dangerous to go outside, I looked around a bit in here...' Leaning forward, the college athlete pulls another item out of his mystery box - an old crucifix made from blackened wood this time.";
	say "     'Oh, another one. Guess now we know where all the crosses from the old abbey went, hm?' he says, putting the piece of wood on a pile of similar items next to him.' Curiosity makes you step up closer and check the crosses out - are they supposed to look... singed? Then Eric suddenly pulls a thick book out of the box, bound in black leather. 'Hey, this looks interesting. And old... I wonder what it is about.' The book - well, more like a tome actually - is clearly quite old and looks heavy enough to break someone's foot if dropped. It bears a triangle symbol with a slit-pupiled eye on the front, branded into the leather.";
	say "     [bold type]This find somehow seems... ominous to you. Maybe you should let Eric give it to you...[roman type][line break]";
	LineBreak;
	say "     ([link]Y[as]y[end link]) - Yup. Better safe than sorry.";
	say "     ([link]N[as]n[end link]) - You're just imagining things. Let him have the book, it'll give him something to do.";
	if Player consents: [take it]
		LineBreak;
		say "     Clearing your throat, you ask Eric to hand you the book - twice actually, as he doesn't react the first time and just keeps staring at the cover. Only when you repeat yourself does he look up, blinking a few times before focusing on you. With a shrug, he holds out the book and you quickly pack it away into your backpack.";
		ItemGain ancient tome by 1;
		if carried of ancient tome > 1:
			say "     You feel movement in your backpack and pull it off, checking over what might have happened. Strange, didn't you have more than one of these books? Oh well, one is plenty anyways...";
			now carried of ancient tome is 1;
		now TomeFound is 100; [player took the book right at the start]
		now lastTomeInteraction is turns;
	else: [let Eric have the book]
		LineBreak;
		say "     Eric keeps staring at the symbol of the book for a long moment, then shakes his head as if chasing a stray thought away. He puts the tome down after that, placing it on the sofa right next to him - so close that his bare leg actually touches the leather constantly. After that, Eric proceeds to delve further into the old box, but doesn't find anything more that is really interesting.";
		now TomeFound is 1; [Eric got the book]
		now lastTomeInteraction is turns;

after going down from Grey Abbey Library while (Eric is in Bunker and HP of Eric > 9 and HP of Eric < 99 and TomeFound is 1 and lastTomeInteraction - turns > 10 and a random chance of 1 in 2 succeeds):
	if debugactive is 1:
		say "     DEBUG: Eric reads the book - TomeFound: [TomeFound], lastTomeInteraction: [lastTomeInteraction], current turn: [turns][line break]";
	say "     Walking down the multiple flights of stairs to the bunker under the library, you step through the doorway into the underground chamber. As let your gaze sweep over the room, you spot Eric, lying stretched out on his bed and reading - but not just any book but that old tome he found not long ago. Elbows braced on the mattress, his head is bent over the book and he seems to be studying with an intent gaze. Curious, you wander over to the college student and glance over his shoulder. The page he is looking at is filled with strange curving squiggles, following no script you can really recognize. Clearing your throat, you manage to draw Eric's attention away from the book after a few seconds and he looks up at you with a curious expression.";
	say "     Asking if he can understand what the book says, your red-headed friend replies, 'Not really, no - but sometimes I kinda feel like I do. Certainly looks very interesting. You should see some of the pictures in here!' With that, he turns a few pages back, revealing more of the unknown script. 'Strange, I could have sworn there was an image there. Oh well, I'll put in a bookmark if I find it again and you can have a look next time,' Eric says in a distracted tone of voice, then turns the page back to where he was before.";
	say "     [bold type]Something doesn't seem quite right here. Do you take the book from Eric?[roman type][line break]";
	LineBreak;
	say "     ([link]Y[as]y[end link]) - Yup. Better safe than sorry.";
	say "     ([link]N[as]n[end link]) - You're just imagining things. Let him have the book, it'll give him something to do.";
	if Player consents: [take the book]
		LineBreak;
		say "     Clearing your throat, you ask Eric to hand you the book - and he doesn't react to that at all, almost as if he hadn't heard a word you said. After waiting a moment or two, you finally decide to just take it. Reaching down, you pull the book out from under Eric's nose, closing the cover with a thud and tugging the tome under your arm. 'Hey!' Eric reacts with a slight delay, almost as if he had been in a trance. 'I was reading that, give it back!' the red-headed college student complains, but you tell him in a friendly, but firm, tone that you'll have to check this thing out for yourself first. He reaches out in a bid to snatch the book back, but you keep it out of his reach. Finally, he sits up and gives a sigh, then adds, 'Fine. I'll get something else to read then.' With a somewhat sullen expression on his face, Eric walks off towards the stairwell.";
		ItemGain ancient tome by 1;
		if carried of ancient tome > 1:
			say "     You feel movement in your backpack and pull it off, checking over what might have happened. Strange, didn't you have more than one of these books? Oh well, one is plenty anyways...";
			now carried of ancient tome is 1;
		now TomeFound is 99; [player took the book after Eric had a read]
		now lastTomeInteraction is turns;
	else: [leave it]
		LineBreak;
		say "     You simply shrug and leave Eric to get back to... well, not exactly reading - more like looking at the symbols and following their shapes with his gaze. Maybe he'll figure out what it all means eventually.";
		now TomeFound is 2; [Eric is reading the book]
		now lastTomeInteraction is turns;

after going down from Grey Abbey Library while (Eric is in Bunker and HP of Eric > 9 and HP of Eric < 20 and TomeFound is 2 and lastTomeInteraction - turns > 10 and a random chance of 1 in 2 succeeds):
	if debugactive is 1:
		say "     DEBUG: Eric gets tentacled - TomeFound: [TomeFound], lastTomeInteraction: [lastTomeInteraction], current turn: [turns][line break]";
	say "     Walking down the multiple flights of stairs to the bunker under the library, you step through the doorway into the underground chamber. As let your gaze sweep over the room, you spot Eric, lying in his bed under a thin blanket. He is sleeping, yet from the looks of it, it seems a bit fitful as he moves around, his head lolling back and forth slowly as he pants visibly.";
	say "     [bold type]Maybe you should check on him...[roman type][line break]";
	LineBreak;
	say "     ([link]Y[as]y[end link]) - Walk over and wake him if he is having a nightmare or something.";
	say "     ([link]N[as]n[end link]) - It'll just be a strange dream. You'd bet that he will forget all about it by the time he wakes up naturally.";
	if Player consents: [check on him]
		LineBreak;
		say "     Moving over to the bed in which the college athlete sleeps, you see that he is indeed very unruly in his sleep. Sweat glistens on his face and he is breathing quickly, letting out some sudden pants from time to time. His feet and legs seem especially agitated, twitching and moving under the blanket. Concerned, you step forward in order to feel his forehead for fever and in doing so, hit something with your foot. It is the leather-bound tome Eric has been reading lately. Must have fallen off the bed due to Eric's fidgeting. It lies there, opened with the face down. Somehow you can't help yourself and pick it up. One of the images Eric mentioned is visible in between the strange text on the open page - a depiction of countless black tentacles that almost seems to move as you look at it.";
		say "     Suddenly, Eric lets out a noise that you can only describe as a moan and bucks his hips up under the blanket. With the ancient tome still held in your arm, you feel the college student's forehead - sweaty, but not feverish. Deciding that waking him should would be best, you shake Eric by the shoulder after that, but he just groans a little with his eyes closed, no further sign of coming to except that. And then it hits you - he may be twitching unruly in his sleep, but unless Eric has suddenly grown an... extra appendage between his legs, there is one too many bulges under that blanket!";
		WaitLineBreak;
		say "     Throwing the book aside to bounce off the next row of beds and tumble behind them, you wrench the blanket off Eric. He is far from sleeping alone! More than a dozen jet-black tentacles are snaked up around the edge of his mattress at the foot of the bed, seemingly in constant movement as they wrap around and stroke Eric's lower legs and thighs. One strand of the appendages is thicker than the rest and comes to a somewhat bulbous end. That tentacle is right between your transgendered friend's legs, rubbing back and forth over his crotch and leaking a slow but steady throb of clear slimy fluid on him. It rears up almost like a cobra at suddenly being exposed like this, turning the head as if to look at you with its vertical slit.";
		say "     The creature's tentacle cock turns from you to Eric's pussy, then back to you and it spurts out a small string of further... goop, or pre-cum, or lube? Doesn't take much to guess what it is trying to tell you, as the other tentacles wrap even tighter around Eric's body and the big one tenses, as if to ready itself for movement.";
		say "     [bold type]Uh-oh! Quick - What do you do?[roman type][line break]";
		LineBreak;
		say "     ([link]Y[as]y[end link]) - Watch in shock (or arousal?) as Eric is penetrated by the creature.";
		say "     ([link]N[as]n[end link]) - Stop it[if EricVirginityTaken is 0]! This thing might just knock him up[end if]!";
		if Player consents: [watch]
			LineBreak;
			say "     In the blink of an eye, the tentacle cock strikes, plunging in between Eric's nether lips and making the transgendered teen buck and moan on the bed - still asleep though, with not even being fucked able to wake him from the clearly unnatural slumber. [if EricVirginityTaken is 0]A groan leaves his mouth as the relentless plunge breaks through Eric's hymen, losing his virginity to this black-tentacled beast - and that without Eric even consciously realizing it. [end if]The creature worms into him deeper and deeper while its other tentacles seem to hold the college student in a firm but gentle embrace, making sure he isn't pushed back or accidentally falls out of the bed while thrashing and moaning in helpless lust. You can't help but gape as his belly starts to bulge out a little, showing the shape of the tentacle cock's head - the creature pushed all the way into Eric's womb!";
			say "     You watch with tense attention as Eric gets tentacle-fucked hard and deep, the thick appendage between his legs writhing and throbbing as it thrusts into his pussy and womb again and again. Satisfied burbling noises come from beneath the bed as the creature violates the sleeping college student, its sounds of pleasure eventually rising in a way that reminds you of a kettle about to boil. Then the smaller gripping tentacles suddenly tighten their hold on the naked human and you can literally see a series of slightly thicker bulges move up the tentacle cock in a rapid progression. Before you can even think of maybe doing anything about that, the first heavy throb of monster cum gushes deep into Eric, followed by countless others.";
			WaitLineBreak;
			say "     The pulsing and throbbing of the black tentacle cock seems endless, delivering its fertile load into the trans teen's [if EricVirginityTaken is 0]receptive [end if]body. You've long lost count by the time you find yourself stepping forward a little bit more and laying a hand on the slowly swelling belly on Eric. You can literally feel each spurt of cum blasting into him! Eventually, the monster's orgasm slowly ebbs off when he looks a month or two pregnant, with a visible bulge to his tummy. By that time, the creature loosens its hold on Eric and retracts appendages under the bed, with the thick shaft between his legs being the last one. Slipping out of Eric's pussy with a wet slurp and a gush of cum from his over-filled body, the tentacle rears up for a moment, aiming its cock-head at you as if its dripping cum-slit was an eye.";
			say "     The thing seems to wink at you, closing and opening in quick secession, then splurts out a last gob of off-white cum and sinks out of sight behind the bed. Maybe a message - but it's anyone's guess what that was supposed to mean. Crouching down, you look under the bed... and there's nothing there, just empty air. With a shrug, you turn your attention back to Eric - who is still out for the count, despite everything that has happened to him just now! The steady trickle of monster cum from between his legs has the potential to make a hell of a mess of the bed, so you quickly snatch up the t-shirt he took off before going to bed and position the bunched-up fabric under his crotch to soak up what it can. Snatching up another piece of usable fabric, you then start working on cleaning him up from all the other goop that came off the tentacles, and Eric's own sweat from being fucked.";
			WaitLineBreak;
			say "     It'll be better if he doesn't wake up all slimed up - since the college student slept through the whole situation, he otherwise would be in for quite a shock. You'll have to see what he will or will not remember when he wakes up. By the time you're done cleaning up everything that made his naked body wet and sticky, Eric's belly has gone down to normal once more, no longer showing the slight bulge all the cum gave it. The t-shirt between his legs is a soppy mess as you pull it away and do a final wipe over Eric's pussy with your other cum-rag. Well, that's about as good as this will get - from looking at him now, you couldn't tell he was fucked by a tentacle monster ten minutes ago. With a concerned look at the young guy's now peaceful face, you cover him with a blanket again and go pick up the tome. It clearly has something to do with all this. Better to confiscate it and keep it out of Eric's hands for now unless you want to see a repeat of this...";
			CreatureSexAftermath "Eric" receives "PussyFuck" from "Tentacle Horror";
			if HP of Eric is 10: [virgin cboy]
				now HP of Eric is 14; [tentacles took his virginity]
				now EricVirginityTaken is 7; [impregnated with tentacle spawn]
			ItemGain ancient tome by 1;
			if carried of ancient tome > 1:
				say "     You feel movement in your backpack and pull it off, checking over what might have happened. Strange, didn't you have more than one of these books? Oh well, one is plenty anyways...";
				now carried of ancient tome is 1;
			now TomeFound is 4; [Eric is was tentacle-fucked, player watched]
		else: [stop it]
			LineBreak;
			say "     [bold type]Err - how?![roman type][line break]";
			LineBreak;
			say "     ([link]Y[as]y[end link]) - Grab the tentacle cock and wrestle it away from Eric!";
			say "     ([link]N[as]n[end link]) - Quickly drop to the ground and look under the bed. Maybe this thing follows the classic rules...";
			if Player consents: [wrestle]
				LineBreak;
				say "     Throwing yourself forward, you manage to intercept the tentacle cock - barely - as it pounces on Eric. Hands closing around the wriggling appendage, you stop it short just before it touches the moaning trans-boy's crotch and burrows in between his nether lips. In reply, a strange burble of sound from under the bed seems to express the creature's displeasure. The tentacle in your grip splurges another throb of defiant ooze over Eric's crotch, then begins to writhe against your hold as you pull it away from him. Further black tentacles snake from beneath the bed or let go of Eric to attack you and things quickly escalate to a full-on wrestling match between the monster and yourself.";
				say "     The smaller tentacles move frantically against you - wrapping around anything they can reach or snaking directly under your clothing to touch you in rather intimate places, leaving behind slimy feelings of ooze against your skin. A few times as you let go with one hand to deal with such mostly annoying distractions, the big tentacle cock almost writhes out of your grasp, really throwing around every little bit of power in it. But no, you keep hold of it with grim determination, resisting any attempt to pull away and turn back on its original target, creating a considerable amount of frustration for the beast (if you are judging the sound of wet clay being punched correctly that comes from beneath the bed).";
				WaitLineBreak;
				say "     Then suddenly, the creature switches tactics and instead does its best to subdue you directly! Its smaller appendages squeeze tighter around your arms and legs, with the tentacle cock now trying to... head-butt you? At least that's the least disturbing option why it keeps pushing towards your face. It is quite hard to keep hold of the slimy shaft of its cock, especially as it now pushes itself through the grip of your hands lengthwise, no longer trying to worm away sideways. The worst thing is that it seems to be enjoying your hands firm hold, leaking more of its slimy pre-cum that gets flung everywhere as you wrestle - hitting yourself, the sheets and even stretched-out Eric with clear splatters of goop.";
				say "     The sounds coming from beneath the bed quickly increase in intensity, kinda reminding you of a kettle that is about to boil over. And fitting to that, the energy of the creature's struggle builds in turn, surprising you with a sudden wrench that almost flings you off the bed. Somehow you can hold on but in the course of which get struck in the cheek by the rubbery dickhead, leaving a trail of goop on your face. Pushing the tentacle away from your head with both hands, you soon come eye to... cum-slit with it and really have to strain as it resists you with all its might. Then the vertical opening almost seems to wink, closing and reopening even wider than before - followed by a splurge of off white monster cum hitting you right in the face!";
				WaitLineBreak;
				say "     In shock, you can do little but squeeze your lids shut and try not to get any goop in your eyes. As you feel another spurt and another of the creamy cum cover your features, you realize that an outcome like this was kinda inevitable - you've been basically jerking the creature off by wrestling with its cock! Well, at least you managed to keep it from getting to Eric - or entering your mouth... a small consolation to being creamed by this tentacled creature. As the further splurges of its seed ebb off, the beast starts to pull back - retracting its smaller appendages and tugging the big one against your grasp. With a shrug, you let go and raise your hands to wipe the goop off your face.";
				say "     By the time you can open your eyes again without the danger of something oozing into them, there is no sight at all of the creature. It must have vanished under the bed once more, leaving behind yourself and Eric in a somewhat bedraggled and slimy state. You lean over the edge of the bed and peer at the space beneath - it is empty, with only a few trails of slime indicating that something was there just moments ago. With a sigh, you sit up and take stock of the situation. Eric is surprisingly still asleep - it really must have dosed him with something or other - naked and with his crotch glistening wetly from its external stimulation. You yourself are fairly slimy too, both with the creature's pre as well as cum, so you start to wipe it all up with the worn t-shirt Eric must have taken off before going to bed.";
				WaitLineBreak;
				say "     Soon dabbing away the last of the cum on Eric's crotch with a gentle touch, you look down at his naked form and hope that whatever the monster did to him will wear off soon. It'll be better if he doesn't wake up all slimed up - since the college student slept through the whole situation, he otherwise would be in for quite a shock. You'll have to see what he will or will not remember when he wakes up. With a concerned look at the young guy's now peaceful face, you cover him with a blanket again and go pick up the tome. It clearly has something to do with all this. Better to confiscate it and keep it out of Eric's hands for now.";
			else:
				LineBreak;
				say "     You throw yourself on the ground and look under Eric's bed, coming face to... black mass with an azure blue slitted eye. The creature hisses and seems to recoil from actually being observed, then quickly disintegrates into a cloud of black dust that vanishes into nothingness in a few seconds. Phew, good thing that monsters under people's beds do not like to be looked at! You make doubly sure that it really is gone, halfway crawling under the bed yourself and groping around, then even checking under the bunched up blanket you wrenched off the bed. Relieved that you seem to be alone for the moment, you then stand up again and check on Eric.";
				say "     He still is in a state of oddly deep sleep, not having woken up from anything that happened so far. You just hope that this will pass given enough time. As there is nothing much else you can do right now, you grab the t-shirt Eric took off before going to sleep and gently dab it at his crotch, wiping away the goop that the creature squirted on him. It could be the reason he is in that sleep-trance after all, and Eric would surely be freaked out if he woke up all slimed up. With a concerned look at his now peaceful face, you cover him with a blanket again and go pick up the tome. It clearly has something to do with all this and you should keep it out of Eric's hands for now.";
			ItemGain ancient tome by 1;
			if carried of ancient tome > 1:
				say "     You feel movement in your backpack and pull it off, checking over what might have happened. Strange, didn't you have more than one of these books? Oh well, one is plenty anyways...";
				now carried of ancient tome is 1;
			now TomeFound is 20; [player took the book after Eric was almost tentacle-fucked]
		now lastTomeInteraction is turns;
	else: [don't do anything]
		LineBreak;
		say "     With a shrug, you leave Eric in peace and turn to other things. When you glance over to him again some while later, he has indeed calmed down and is again sleeping peacefully.";
		CreatureSexAftermath "Eric" receives "PussyFuck" from "Tentacle Horror";
		now TomeFound is 3; [Eric is was tentacle-fucked, player saw nothing]
		if HP of Eric is 10: [virgin cboy]
			now HP of Eric is 14; [tentacles took his virginity]
			now EricVirginityTaken is 7; [impregnated with tentacle spawn]
		now lastTomeInteraction is turns;


Table of Game Objects (continued)
name	desc	weight	object
"ancient tome"	"A large book, bound in black leather. There is no title on its cover, only a triangle-symbol with a slit-pupiled eye branded into the leather."	1	ancient tome

Ancient Tome is a grab object. Ancient Tome is not temporary.
Ancient Tome has a Usedesc "[TomeUse]".

to say TomeUse:
	LineBreak;
	say "[TomeExpansionUse]";

instead of trading the ancient tome when the current action involves the Eric:
	if TomeFound is 100: [Eric never looked into it]
		say "     Pulling your backpack off, you dig around in it and find the thick tome. As you pull it out, Eric steps up and thanks you as he accepts the book. He exchanges some more words in friendly conversation with you, then walks off with the book held tightly to his chest.";
		ItemLoss ancient tome by 1;
		now TomeFound is 1; [Eric got the book now]
	else if TomeFound is 4 or TomeFound is 20: [player took the book after watching Eric be tentacle-fucked or almost tentacle fucked]
		say "     Just handing the book back to Eric after what you observed might not be such a good idea. You really should talk to him about it first.";
	else if TomeFound is 21 or TomeFound is 23: [Eric was told about the creature the book summoned]
		say "     Eric goes deathly pale as you hold up the book. His left hand rises to reach out and touch it seemingly on its own accord, only to be snatched back by the trembling teenager. 'I - I...' he stutters in a terrified tone, then whirls around and runs to the other side of the small-ish bunker room. From there he calls out, 'Please keep it away from me! I'm afraid what it - or I - might to...'";
		now TomeFound is 101; [Eric refuses any further contact with the book]
	else if TomeFound is 22: [player told Eric he doesn't have the book]
		say "     Pulling your backpack off, you dig around in it and find the thick tome. As you pull it out, Eric's eyes seem to have an inner glow for a heartbeat or two and he steps up close to you, holding out his hands with a hungry expression. Snatching the book from your grasp, he pulls it tightly to his chest and thanks you, then walks off with a thoughtful expression on his face.";
		ItemLoss ancient tome by 1;
		now TomeFound is 97; [player gave Eric the book back after he got almost tentacle-fucked]
	else if TomeFound is 24: [player told Eric he doesn't have the book (after tentacle sex)]
		say "     Pulling your backpack off, you dig around in it and find the thick tome. As you pull it out, Eric's eyes seem to have an inner glow for a heartbeat or two and he steps up close to you, holding out his hands with a hungry expression. Snatching the book from your grasp, he pulls it tightly to his chest and thanks you, then walks off with a thoughtful expression on his face.";
		ItemLoss ancient tome by 1;
		now TomeFound is 96; [player gave Eric the book back after he got tentacle-fucked]
	else if TomeFound is 98: [player took the book after Eric was tentacle fucked (unknown to the player) ]
		say "     Pulling your backpack off, you dig around in it and find the thick tome. As you pull it out, Eric's eyes seem to have an inner glow for a heartbeat or two and he steps up close to you, holding out his hands with a hungry expression. Snatching the book from your grasp, he pulls it tightly to his chest and thanks you, then walks off with a thoughtful expression on his face.";
		ItemLoss ancient tome by 1;
		now TomeFound is 3; [player gave Eric the book back after he got almost tentacle-fucked, so same state as never having taken the book at all]
	else if TomeFound is 99: [player took the book after Eric started reading               ]
		say "     Pulling your backpack off, you dig around in it and find the thick tome. As you pull it out, Eric's eyes seem to have an inner glow for a heartbeat or two and he steps up close to you, holding out his hands with a hungry expression. Snatching the book from your grasp, he pulls it tightly to his chest and thanks you, then walks off with a thoughtful expression on his face.";
		ItemLoss ancient tome by 1;
		now TomeFound is 2; [Eric is back to reading the tome]
	else if TomeFound is 100: [Eric never opened the book before]
		say "     Pulling your backpack off, you dig around in it and find the thick tome. As you pull it out, Eric steps up and thanks you as he accepts the book. He exchanges some more words in friendly conversation with you, then walks off with the book held tightly to his chest.";
		ItemLoss ancient tome by 1;
		now TomeFound is 1; [Eric got the book now]
	else if TomeFound is 101: [Eric is afraid of the book and was offered it back before]
		say "     You shouldn't tease Eric with the tome any further. He was genuinely afraid the last time. Confronting him with the book would just be cruel after that.";


Section 2 - Menus

to say TomeSexMenu:
	say "     The dark book seems to draw you towards it. You can't help but to be tempted to use it. Do you give in? If so, what will you do with it?";
	now sextablerun is 0;
	blank out the whole of table of fucking options;
	[]
	if "Tome_Tentacle_Read" is listed in Traits of Player and Player is puremale and TentacleInteractions > 0:
		choose a blank row from table of fucking options;
		now title entry is "Summon a tentacle monster";
		now sortorder entry is 1;
		now description entry is "Perhaps you could get the tentacle monster to have its way with you";
	[]
	if "Tome_DemonFox_Read" is listed in Traits of Player and "DemonFoxGone" is not listed in Traits of Kal Ren and Player is puremale and DemonFoxInteractions > 0:
		choose a blank row from table of fucking options;
		now title entry is "Summon a demon fox";
		now sortorder entry is 2;
		now description entry is "The demon fox sounds like it could be fun";
	[]
	if "Tome_DemonLover_Read" is listed in Traits of Player and Resolution of MeetingDrelgoth < 99:
		choose a blank row from table of fucking options;
		now title entry is "Summon a demon lover";
		now sortorder entry is 3;
		now description entry is "Maybe having a demonic companion would not be so bad";
	[]
	if Resolution of Corruption of Dreams > 0 and Resolution of Dullahan Knight is not 0:
		choose a blank row from table of fucking options;
		now title entry is "Summon the Dullahan";
		now sortorder entry is 4;
		now description entry is "Face the mythical dark knight";
	[]
	if Resolution of Hellish Trashpile > 2 and Resolution of Hellish Trashpile < 99 and Resolution of Hell Realm is 0:
		choose a blank row from table of fucking options;
		now title entry is "Perform the Demonic Ritual";
		now sortorder entry is 99;
		now description entry is "Try to mimic the ritual you saw in the tape";
	[]
	sort the table of fucking options in sortorder order;
	repeat with y running from 1 to number of filled rows from table of fucking options:
		choose row y from the table of fucking options;
		say "[link][y] - [title entry][as][y][end link][line break]";
	say "[line break][link]0 - Nevermind[as]0[end link][line break]";
	while sextablerun is 0:
		say "Pick the corresponding number> [run paragraph on]";
		get a number;
		if calcnumber > 0 and calcnumber <= the number of filled rows from table of fucking options:
			now current menu selection is calcnumber;
			choose row calcnumber from table of fucking options;
			say "[title entry]: [description entry]?";
			if Player consents:
				let nam be title entry;
				now sextablerun is 1;
				if nam is:
					-- "Summon a tentacle monster":
						say "[TentacleSex]";
					-- "Summon a demon fox":
						say "[DemonFoxSummon]";
					-- "Summon a demon lover":
						say "[DrelgothSummon]"; [on his file]
					-- "Perform the Demonic Ritual":
						say "[HellRealmRitual]";
					-- "Read on the mythical Dullahan":
						say "[DullahanFirstRead]";
					-- "Summon the Dullahan":
						say "[DullahanSummon]";
				wait for any key;
		else if calcnumber is 0:
			now sextablerun is 1;
			say "     You shake your head, banishing the tempting thoughts. You can't afford to give in to it.";
			wait for any key;
		else:
			say "Invalid selection made. Please pick an option from 0 to [the number of filled rows in the table of fucking options].";
	clear the screen and hyperlink list;

Section 3 - Use Scenes

to say TomeExpansionUse:
	if TomeInfluence is 0: [Never influenced, can't read]
		say "     You open the old book and flip through a few pages. Sadly, it seems to be written in a squiggly script that you can make no heads or tails of, and the images in it are mildly disturbing, full of weird creatures and situations. A shiver runs down your spine as you close the book again.";
	else if TomeInfluence is 1: [Influenced once, can't read]
		say "     You open the dark book and flip through a few pages. Sadly, you're still unable to make heads or tails of the script inside. Something about it makes you shiver in dread, making you somewhat okay with your inability to understand its contents.";
	else if TomeInfluence is 2: [Influenced twice, can't read]
		say "     You open the thick tome and skim across a few pages. Surprisingly, you can actually make out a few words here and there, though they aren't near enough for you to actually [italic type]read[roman type] the thing. You tremble involuntarily before shutting the book, somewhat glad that you aren't able to read it.";
	else: [Influenced thrice, can finally read]
		if TomeTimer - turns >= 4:
			if TomeInteractions is 0: [First use]
				say "     You look over the ancient book, examining it closely as you ponder, what exactly, you can do with it. [if TomeFound is 4]You saw what happened to Eric. Even still, you could give it a read... [else if TomeFound is 20]You saw what nearly happened to Eric. Even still, you could give it a read... [else if TomeFound is 3]Something just doesn't feel right about it, even though Eric seemed relatively unaffected by it. Even still, you could give it a read... [else]Perhaps you could give it a read? [end if]It [italic type]is[roman type] a book, after all.";
				LineBreak;
				say "     [link](Y)[as]y[end link] - Give it a quick read.";
				say "     [link](N)[as]n[end link] - It's probably best not to.";
				if Player consents:
					say "     You open the tome to a random page, deciding that no real harm can come from just quick glance at it. Your eyes skim over page after page of text and drawings depicting all sorts of monsters and demons, taking all the information in eagerly. For some reason you can't quite comprehend, the contents of the book have really piqued your interest. Nearly two hours later, you find that you've read more than half of the large books contents, and you suddenly blink, realizing how much time you've spent doing this. Shutting the book, you heave a sigh as you place it in your pack before moving on. There's some part of you that eagerly awaits further reading.";
					now TomeTimer is turns;
					now TomeInteractions is 1;
				else:
					say "     You shake your head, deciding that there's not really any benefit to reading the contents of the book, before you place it back in your pack and move along.";
			else if TomeInteractions > 0: [Second+ use]
				say "     Do you want to [link]read the tome[as]y[end link] (y), or [link]use the tome[as]n[end link] (n)?";
				if Player consents:
					say "[TomeReadMenu]";
				else:
					say "[TomeSexMenu]";
		else:
			say "     You contemplate using the dark book for only a moment before shaking your head. Using it too often may be a bad idea.";

to say TomeReadMenu:
	say "     You pull the tome out of your pack once more, looking over its leather cover for a moment before deciding that giving it another read wouldn't hurt. After all, delving into a mythic tome of unknown origins could never have any bad consequences, could it? Lamenting the total lack of an index in this thing, you're left to just browse at random, quickly finding something that seems interesting. The page on the left of the open book depicts a sort of mass of tentacles[if TomeFound is 4], possibly related to the ones that assaulted Eric. [else if TomeFound is 20], possibly related to the ones that nearly kidnapped Eric. [else]. [end if]Each of the tendrils is a sort of bluish-purple, and they all seem to be covered in some sort of clear slime. The adjacent page depicts a demonic-looking anthro fox, with a lengthy description beneath the detailed image of the creature. Turning another page, you see a vague description of an attractive man, by society's standards, with the description below detailing it as a sort of soulbound... Lover?";
	say "     [bold type]What do you want to have a closer look at?[roman type][line break]";
	let Tome_Read_Choices be a list of text;
	add "Read about the tentacle monster." to Tome_Read_Choices;
	add "Read about the demonic fox." to Tome_Read_Choices;
	add "Read about the demon lover." to Tome_Read_Choices;
	if Resolution of Corruption of Dreams > 0 and Resolution of Dullahan Knight is 0: [extra demonic summoning unlocked]
		add "Read on the mythical Dullahan." to Tome_Read_Choices;
	add "Close the book and put it away." to Tome_Read_Choices;
	let Tome_Read_Choice be what the player chooses from Tome_Read_Choices;
	if Tome_Read_Choice is:
		-- "Read about the tentacle monster.":
			say "[TentaclesFirstRead]";
		-- "Read about the demonic fox.":
			say "[DemonFoxFirstRead]";
		-- "Read about the demon lover.":
			say "[DemonLoverFirstRead]";
		-- "Read on the mythical Dullahan.":
			say "[DullahanFirstRead]";
		-- "Close the book and put it away.":
			say "     Closing the book with a solid thud, you heft its weight and put it back into your backpack.";

to say TentaclesFirstRead:
	say "     As you read about the mass of tentacles, you can't help but be drawn in by the shockingly detailed descriptions of its behavior. Apparently, the tentacles will not only rape the unlucky victim, they also sometimes lay eggs in them! No one is exactly sure why the tentacles do this, or who they'll do it to, as it seems to be random. If there's one good thing to note, it's that the tentacles don't usually deposit fertilized eggs, leaving the victim with their insides stuffed with inert, gelatinous orbs. [if Player is puremale]Interestingly[else]Thankfully[end if], they only seem to be interested in [italic type]males[roman type], oddly enough. At the bottom of the page are instructions of how to summon the creature. You shut the book after reading the page, shaking your head in an attempt to get intrusive thoughts of egg-laying tentacles out of your head.";
	TraitGain "Tome_Tentacle_Read" for Player;
	now TomeEventPending is true;

to say DemonFoxFirstRead:
	say "     Looking over the passage dedicated to the demonic fox, you manage to learn a few things. The demon fox is said to be able to change its size to whatever it desires. Supposedly, he's possessive, with a pathological need to force submission in others. Anyone who has encountered the beast has reaffirmed that fact.";
	say "     According to the page's short physical description, the fox is taller than the average human, with hulking muscles and two demonic horns between vulpine ears. His fur is mostly black but bright, blazing red around his stomach, chest, and part of his lower jaw, while his eyes are an arcane yellow with slitted pupils. Three tails jut from his rear end, moving independently at his beck and call to trap unwary prey.";
	say "     A quickly jotted addendum adds that his cum is bright orange and glows like hot lava, with a steaming heat that nearly hurts. There are some stains at the bottom of the page too, a streak of... something, and several splotches. Eww, given the haphazard way that the words above are written, you can just imagine what [italic type]that[roman type] is.";
	say "     [if Player is puremale]Interestingly[else]Thankfully[end if], he only seems to be attracted to males.";
	TraitGain "Tome_DemonFox_Read" for Player;
	now TomeEventPending is true;

to say DemonLoverFirstRead:
	say "     Browsing the pages on this mysterious demon lover, you cannot find much other than a vague description of an attractive and caring male individual. It seems this ritual is meant to invoke a lover of some kind, though you could guess that, if it comes from this tome, it might certainly be demonic in nature. Some of its requirements mention that it draws from your emotions, desire and needs. Only someone truly depraved would summon something like them!";
	TraitGain "Tome_DemonLover_Read" for Player;

Section 4 - Other Stuff

to UpdateTomeEventPending:
	if TomeEventPending is true:
		if "Tome_DemonFox_Read" is listed in Traits of Player and "Tome_Tentacle_Read" is listed in Traits of Player and (TentacleInteractions is 0 or DemonFoxInteractions is 0): [One event completed, but another is pending.]
			now TomeEventPending is true;
		else:
			now TomeEventPending is false;
	else:
		now TomeEventPending is true;

Section 5 - Influence system

an everyturn rule:
	if carried of ancient tome > 0 and TomeEventPending is false:
		if TomeInfluence is 0: [Never tempted by the book]
			if TomeInfluenceTimer - turns >= 2:
				say "     As you go about your business, you mind keeps going to the book inside your bag. You can't help but be tempted to pull out the [bold type]ancient tome[roman type], just to see why you're so drawn to it.";
				now TomeInfluenceTimer is turns;
				now TomeInfluence is 1;
		else if TomeInfluence is 1: [Tempted by the book once]
			if TomeInfluenceTimer - turns >= 2:
				say "     You glance at your bag, a sudden desire to read the [bold type]ancient tome[roman type] entering your mind. Something about the book seems to be calling to you, and you can't help but be just a bit fearful of the thing.";
				now TomeInfluenceTimer is turns;
				now TomeInfluence is 2;
		else if TomeInfluence is 2: [Tempted by the book twice]
			if TomeInfluenceTimer - turns >= 2:
				say "     You blink, suddenly aware that your hand is reaching into your bag, seemingly on its own accord. Wondering what could possibly be going on, you grab the first thing you touch and pull it out. It just so happens to be the [bold type]ancient tome[roman type]! You glance over its leather cover, running your fingers across its surface for a second before you flip the cover open, going to a random page. Much to your amazement, you can actually read the words there! [bold type]Perhaps you could give it a read, now that you can actually do so?[roman type][line break]";
				now TomeInfluenceTimer is turns;
				now TomeInfluence is 3;
		else if TomeInfluence is 3: [Tempted fully]
			if TomeInfluenceTimer - turns >= 8:
				say "     You can't help but feel drawn to the book inside your bag. The [bold type]ancient tome[roman type] really seems like it [italic type]wants[roman type] you to [if TomeInteractions is 0]read it, now that you finally can[else]read it once more[end if].";
				now TomeInfluenceTimer is turns;
	if "Tome_DemonFox_Read" is listed in Traits of Player and DemonFoxInteractions is 0 and (Cock Count of Player is not 0 and Cunt Count of Player is 0) and TomeTimer - turns >= 4 and daytimer is night:
		say "[DemonFoxFirstEncounter]";
	else if "Tome_Tentacle_Read" is listed in Traits of Player and TentacleInteractions is 0 and (Cock Count of Player is not 0 and Cunt Count of Player is 0) and ((TomeTimer - turns >= 4 and a random chance of 1 in 3 succeeds) or (TomeTimer - turns >= 11)):
		say "[TentaclesFirstEncounter]";


Section 6 - Dev Cheats

GetTome is an action applying to nothing.
Understand "zGiveTome" as GetTome.

check GetTome:
	if debugactive is 0:
		say "You aren't currently debugging.";
		stop the action;

Carry out GetTome:
	say "     An ancient tome appears in the air before you, dropping weightily into your grasp.";
	ItemGain ancient tome by 1;

Ancient Tome ends here.
