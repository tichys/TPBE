/BankClass/*
1st Division, Command

This division is the head of Gotei 13 and the ones responsible for relaying Central 46 orders, dealing with Soul Society law and monitoring the other divisions.
The captain of the 1st Division is also the head of all other captains and the leader of Gotei 13, given the rank of General Commander.
Likewise, the 1st Division vice-captain is leader of the vice-captains and has authority over all vice-captains, next to their own captains and the General Commander.
This division has the least number of Soul Reaper.


2nd Division, Special Forces / Assassination & Undercover Operations

The captain of the 2nd Division is also captain of the Special Forces; one of Soul Society’s two other military fractions except for the Gotei 13.
Members of the 2nd Division are mainly dealing with stealth and assassination, and many of them are also members of the Special Forces as well. They also handle all undercover operations regarding Seireitei security.
Special Forces applicants take additional two-year training after Soul Reaper Academy.


3rd Division, Intelligence & Information

The 3rd Division is the unit that are responsible of the act of sending out Soul Reaper to gather information, and sometimes work in cooperation with 2nd Division agents on more serious missions. They are also the ones that sort all outgoing and incoming information before sending them to the 12th Division for storage.
Adding to this, they are in charge of the jigokuchou monitoring and message system.


4th Division, Medical Assistance & Supply

The 4th Division deals with the brunt of the healing when it comes to Soul Reaper or other spiritual entities. While the Soul Reaper in this division use medicines for their healing, they do have the ability to use their energies for curative purposes, something unique to those that are in or have been in the 4th Division, because the average Soul Reaper can only use their power for combat.
This unit is assigned many of the menial tasks in the Soul Society, such as cleaning the subterranean canals located under the Seireitei. Additionally, this particular division is considered the lowest in the Gotei 13 hierarchy, albeit the fact that they heal almost all the injured in the Soul Society.
4th Division members are taken from the Soul Reaper Academy at their third year, after proving exceptional, non-violent reiatsu, and then takes an additional study of four years to become medics.


5th Division, Kidou Corps / Kidou Tactics & Control

The captain of the 5th Division is also captain of the Kidou Corps; one of Soul Society’s two other military fractions except for the Gotei 13.
Members of the 5th are in general kidou experts, and are often stationed together with 11th Division members, 2nd Division assassins as well as 4th Division healers to form an all-around military group. They are also responsible for all sealing and magical workings inside Soul Society, as well as recording and storing any new kidou.
Members of the Kidou Corps are handpicked from the best kidou-users of the Soul Reaper, and undergo additional training.


6th Division, Internal Affairs

The 6th Division handles all of Gotei 13’s internal affairs, such as monitoring Soul Reaper activity and handling any disturbances from other Soul Reaper. They are responsible for apprehending Soul Reaper that breaks Soul Society laws and also detaining them until Central 46 has given their verdict in the matter.
Their division has the most holding cells, which is used to detain criminal offenders until they are judged.


7th Division, Seireitei-Rukongai Diplomacy

The 7th Division maintains peace between Seireitei and Rukongai. They make sure Soul Reaper don’t go causing chaos in Seireitei, and are completely responsible for keeping Rukongai civil… or at least the area closest to Seireitei.
When souls have complaints/suggestions/questions/etc, whatever, they send is sent to the 7th Division where it is read, ignored, taken into consideration, and decided upon.
They often act on their own, but also work with various other divisions.


8th Division, Reserves & Backup

The 8th Division is the mass reinforcement division. Their Soul Reaper are split into groups that are talented in kidou, offensive tactics, or defensive tactics. When any of the other divisions require extra Soul Reaper or reinforcements, the 8th is the division they turn to first.
Aside from the 11th and 13th, the 8th Division has the most amount of Soul Reaper.


9th Division, Counter Intelligence

The 9th Division prevents information from leaking, as well as information being stolen. Their Soul Reaper work close with the 12th Division research facility, to protect it from outside influence. They also prevent important information from leaking into Rukongai, especially information that could cause an uproar or mass panic.
Adding to this, they are also in charge of dealing with tactics and warfare against intelligent beings and massive hollow gatherings, and are the ones responsible for any counter tactics when Seireitei is under attack.
9th Division is also in charge of the memory-replacing that has to be done after Soul Reaper fight in the living world.


10th Division, Large-Scale Operations

The 10th Division is in charge of planning, coordinating, and executing large missions. Everything is run through their division first, and if approved, the 10th Division gathers the required Soul Reaper from each division, assembles them, assigns duties, plans the attack, coordinate the Soul Reaper according to the mission, execute the attack, and then keep maintenance over it. That includes sending out more reinforcements and information regarding the mission.


11th Division, Offensive Tactics

The 11th Division is the frontlines. They are the most skilled in physical combat and work mainly with other divisions. They rarely work on their own since they currently lack much coordination.
During times of danger, the 11th Division is flooded out in mass numbers to immediately subdue problems, which include invasions of Seireitei. The 11th Division works with nearly every other division, since they are the most powerful and offer the most defense and offense.
11th is the division with the largest number of Soul Reaper.
(It is also the division with the highest mortality rate.)


12th Division, Research & Development

The 12th Division is in charge of gaining new information through experimentation. They research information that is sent to them from the third division before storing it.
They are also in charge of storing a mass amount of information known to Seireitei in their database. The 12th Division also develops new technology to aid Soul Reaper in their missions.


13th Division, Defensive Tactics & Seireitei Protection

The 13th Division is the ones that actually send out patrols on a daily, frequent basis to survey Seireitei. If a threat occurs, they find and take care of it, sometimes with help from other divisions. They also work together with various divisions.
If a threat is a large enough, the 13th Division is in charge of sending out Soul Reaper, assembling them, assigning them duties, and other things. Their job is similar to the 10th, except on a smaller basis.
*/

var/list/CaptainOne=list()
var/list/CaptainTwo=list()
var/list/CaptainThree=list()
var/list/CaptainFour=list()
var/list/CaptainFive=list()
var/list/CaptainSix=list()
var/list/CaptainSeven=list()
var/list/CaptainEight=list()
var/list/CaptainNine=list()
var/list/CaptainTen=list()
var/list/CaptainEleven=list()
var/list/CaptainTwelve=list()
var/list/CaptainThirteen=list()
var/list/QuincyUno=list()

var/list/Challenge = list()
mob/var/Squad ="None"
mob/var/Squadrank=""
mob/var/insquad = 0
mob/var/tmp
		Challenger = 0
		Challenged = 0
		Chalengee = 0
		popup = 0
var/tmp/ChallengeOn = 0

obj/NPC
	Shopish
		Squad_Manager
			DblClick()
				if(src in get_step(usr,usr.dir))
			//		if(usr.Class!="Soul Reaper")
			//			ShowAlert(usr,"You are not a Soul Reaper, do no waste my time.")
			//			return
					if(usr.selecting==1)
						return
					if(usr.key in Squad1||usr.key in Squad2||usr.key in Squad2||usr.key in Squad4||usr.key in Squad5||usr.key in Squad6||usr.key in Squad7||usr.key in Squad8||usr.key in Squad9||usr.key in Squad10||usr.key in Squad11||usr.key in Squad12||usr.key in Squad13||usr.key in QuincyUno||usr.key in Quincy1)
						ShowAlert(usr,"You already belong to a Squad. Only one squad per byond key is allowed.")
						return
					if(usr.Class=="Soul Reaper")
						switch(ShowAlert(usr,"Greetings, Soul Reaper. I can assign you to a Squad, each Squad has a specific purpose so choose wisely.",list("Squads","Spawn","Cancel")))
							if("Squads")
								usr.selecting=1
								if(usr.insquad == 1)
									ShowAlert(usr,"You are already in a Squad [usr.Squad] [usr.Squadrank].")
									return
								switch(input(usr,"Choose which Squad of the six you would like to join.")in list("1","2","3","4","5","6","7","8","9","10","11","12","13","Cancel"))
									if("1")
										switch(ShowAlert(usr,"This division is the head of Gotei 13 and the ones responsible for relaying Central 46 orders, dealing with Soul Society law and monitoring the other divisions.> > Level 1 Bonus :STR 20, MGC 20, MGCDEF 20, VIT 20, LCK 10, AGI 10, MaxSTM 250, MaxREI 250 ",list("Join","Cancel")))
											if("Join")
												if(CaptainOne.len==0)
													if(usr.Level >=500)
														usr.Squad = "One"
														//CaptainOne = usr.name
													//	Squad1+=usr.name
													//	Squad1[usr.key]=list()
														usr.Squadlevel=1
														usr.Gotbonus0=0
														usr.Gotbonus1=0
														usr.Squadnexp=5000000
														CaptainOne+=usr.key
														CaptainOne[usr.key]=list()
														usr.Squadrank = "Captain"
														world << "<font color=green><b>Squad Info : <font color=red> <b>[usr] <font color=white><b>is now the Captain of Squad One!"
														usr.Give_Squad_Verbs()
														usr.insquad = 1
														Squad1+=usr.key
														Squad1[usr.key]=list()
														saveSecurity("SquadOne")
														saveSecurity("Captain1")
														usr.selecting=0

														//saveSecurity("SquadOne")
													else
														usr.Squad ="One"
														usr.Squadrank = "Member"
														usr.Squadlevel=1
														usr.Gotbonus0=0
														usr.Gotbonus1=0
														usr.Squadnexp=5000000
														usr.Bonus_Check()
														world << "<font color=green><b>Squad Info : <font color=red> <b>[usr] <font color=white><b>has joined Squad One!"
														usr.verbs += typesof(/mob/Squad_Verbs/verb)
														usr.insquad =1
														Squad1+=usr.key
														Squad1[usr.key]=list()
														saveSecurity("SquadOne")
														usr.selecting=0

												else
													usr.Squad ="One"
													usr.Squadrank = "Member"
													usr.Squadlevel=1
													usr.Gotbonus0=0
													usr.Gotbonus1=0
													usr.Squadnexp=5000000
													usr.Bonus_Check()
													world << "<font color=green><b>Squad Info : <font color=red> <b>[usr] <font color=white><b>has joined Squad One!"
													usr.verbs += typesof(/mob/Squad_Verbs/verb)
													usr.insquad =1
													Squad1+=usr.key
													Squad1[usr.key]=list()
													saveSecurity("SquadOne")
													usr.selecting=0
											if("Cancel")
												usr.selecting=0
												return
									if("2")
										switch(ShowAlert(usr,"Members of the 2nd Division are mainly dealing with stealth and assassination, and many of them are also members of the Special Forces as well.> > Level 1 Bonus : AGI 100, MaxSTM 300, MaxREI 200 ",list("Join","Cancel")))
											if("Join")
												if(CaptainTwo.len==0)
													if(usr.Level >=500)
														usr.Squad = "Two"
														//CaptainOne = usr.name
													//	Squad1+=usr.name
													//	Squad1[usr.key]=list()
														usr.Squadlevel=1
														usr.Gotbonus0=0
														usr.Gotbonus1=0
														usr.Squadnexp=5000000
														CaptainTwo+=usr.key
														CaptainTwo[usr.key]=list()
														usr.Squadrank = "Captain"
														world << "<font color=green><b>Squad Info : <font color=red> <b>[usr] <font color=white><b>is now the Captain of Squad Two!"
														usr.Give_Squad_Verbs()
														usr.insquad = 1
														Squad2+=usr.key
														Squad2[usr.key]=list()
														saveSecurity("SquadTwo")
														saveSecurity("Captain2")
														usr.selecting=0
													else
														usr.Squad ="Two"
														usr.Squadrank = "Member"
														usr.Squadlevel=1
														usr.Gotbonus0=0
														usr.Gotbonus1=0
														usr.Squadnexp=5000000
														usr.Bonus_Check()
														world << "<font color=green><b>Squad Info : <font color=red> <b>[usr] <font color=white><b>has joined Squad Two!"
														usr.verbs += typesof(/mob/Squad_Verbs/verb)
														usr.insquad =1
														Squad2+=usr.name
														Squad2[usr.key]=list()
														saveSecurity("SquadTwo")
														usr.selecting=0

												else
													usr.Squad ="Two"
													usr.Squadrank = "Member"
													usr.Squadlevel=1
													usr.Gotbonus0=0
													usr.Gotbonus1=0
													usr.Squadnexp=5000000
													usr.Bonus_Check()
													world << "<font color=green><b>Squad Info : <font color=red> <b>[usr] <font color=white><b>has joined Squad Two!"
													usr.verbs += typesof(/mob/Squad_Verbs/verb)
													usr.insquad =1
													Squad2+=usr.name
													Squad2[usr.key]=list()
													saveSecurity("SquadTwo")
													usr.selecting=0
											if("Cancel")
												usr.selecting=0
												return
									if("3")
										switch(ShowAlert(usr,"The 3rd Division is the unit that are responsible of the act of sending out Soul Reaper to gather information, and sometimes work in cooperation with 2nd Division agents on more serious missions.> > Level 1 Bonus: AGI 50, MaxSTM 500, LCK 50, CritBonus 5 ",list("Join","Cancel")))
											if("Join")
												if(CaptainThree.len==0)
													if(usr.Level >=500)
														usr.Squad = "Three"
														//CaptainOne = usr.name
													//	Squad1+=usr.name
													//	Squad1[usr.key]=list()
														usr.Squadlevel=1
														usr.Gotbonus0=0
														usr.Gotbonus1=0
														usr.Squadnexp=5000000
														CaptainThree+=usr.key
														CaptainThree[usr.key]=list()
														usr.Squadrank = "Captain"
														world << "<font color=green><b>Squad Info : <font color=red> <b>[usr] <font color=white><b>is now the Captain of Squad Three!"
														usr.Give_Squad_Verbs()
														usr.insquad = 1
														Squad3+=usr.key
														Squad3[usr.key]=list()
														saveSecurity("SquadThree")
														saveSecurity("Captain3")
														usr.selecting=0
													else
														usr.Squad ="Three"
														usr.Squadrank = "Member"
														usr.Squadlevel=1
														usr.Gotbonus0=0
														usr.Gotbonus1=0
														usr.Squadnexp=5000000
														usr.Bonus_Check()
														world << "<font color=green><b>Squad Info : <font color=red> <b>[usr] <font color=white><b>has joined Squad Three!"
														usr.verbs += typesof(/mob/Squad_Verbs/verb)
														usr.insquad =1
														Squad3+=usr.name
														Squad3[usr.key]=list()
														saveSecurity("SquadThree")
														usr.selecting=0
												else
													usr.Squad ="Three"
													usr.Squadrank = "Member"
													usr.Squadlevel=1
													usr.Gotbonus0=0
													usr.Gotbonus1=0
													usr.Squadnexp=5000000
													usr.Bonus_Check()
													world << "<font color=green><b>Squad Info : <font color=red> <b>[usr] <font color=white><b>has joined Squad Three!"
													usr.verbs += typesof(/mob/Squad_Verbs/verb)
													usr.insquad =1
													Squad3+=usr.name
													Squad3[usr.key]=list()
													saveSecurity("SquadThree")
													usr.selecting=0
											if("Cancel")
												usr.selecting=0
												return
									if("4")
										switch(ShowAlert(usr,"The 4th Division deals with the brunt of the healing when it comes to Soul Reaper or other spiritual entities.> > Level 1 Bonus: MGC 50, MGCDEF 50, MaxSTM 100, MaxREI 400",list("Join","Cancel")))
											if("Join")
												if(CaptainFour.len==0)
													if(usr.Level >=500)
														usr.Squad = "Four"
														//CaptainOne = usr.name
													//	Squad1+=usr.name
													//	Squad1[usr.key]=list()
														usr.Squadlevel=1
														usr.Gotbonus0=0
														usr.Gotbonus1=0
														usr.Squadnexp=5000000
														CaptainFour+=usr.key
														CaptainFour[usr.key]=list()
														usr.Squadrank = "Captain"
														world << "<font color=green><b>Squad Info : <font color=red> <b>[usr] <font color=white><b>is now the Captain of Squad Four!"
														usr.Give_Squad_Verbs()
														usr.insquad = 1
														Squad4+=usr.key
														Squad4[usr.key]=list()
														saveSecurity("SquadFour")
														saveSecurity("Captain4")
														SaveConfig()
														usr.selecting=0
													else
														usr.Squad ="Four"
														usr.Squadrank = "Member"
														usr.Squadlevel=1
														usr.Gotbonus0=0
														usr.Gotbonus1=0
														usr.Squadnexp=5000000
														usr.Bonus_Check()
														world << "<font color=green><b>Squad Info : <font color=red> <b>[usr] <font color=white><b>has joined Squad Four!"
														usr.verbs += typesof(/mob/Squad_Verbs/verb)
														usr.insquad =1
														Squad4+=usr.name
														Squad4[usr.key]=list()
														saveSecurity("SquadFour")
														usr.selecting=0
												else
													usr.Squad ="Four"
													usr.Squadrank = "Member"
													usr.Squadlevel=1
													usr.Gotbonus0=0
													usr.Gotbonus1=0
													usr.Squadnexp=5000000
													usr.Bonus_Check()
													world << "<font color=green><b>Squad Info : <font color=red> <b>[usr] <font color=white><b>has joined Squad Four!"
													usr.verbs += typesof(/mob/Squad_Verbs/verb)
													usr.insquad =1
													Squad4+=usr.name
													Squad4[usr.key]=list()
													saveSecurity("SquadFour")
													usr.selecting=0
											if("Cancel")
												usr.selecting=0
												return
									if("5")
										switch(ShowAlert(usr,"Members of the 5th are in general kidou experts, and are often stationed together with 11th Division members, 2nd Division assassins as well as 4th Division healers to form an all-around military group.> > Level 1 Bonus:  MGC 80, MGCDEF 20, MaxREI 500, Kidou 10",list("Join","Cancel")))
											if("Join")
												if(CaptainFive.len==0)
													if(usr.Level >=500)
														usr.Squad = "Five"
														//CaptainOne = usr.name
													//	Squad1+=usr.name
													//	Squad1[usr.key]=list()
														usr.Squadlevel=1
														usr.Gotbonus0=0
														usr.Gotbonus1=0
														usr.Squadnexp=5000000
														CaptainFive+=usr.key
														CaptainFive[usr.key]=list()
														usr.Squadrank = "Captain"
														world << "<font color=green><b>Squad Info : <font color=red> <b>[usr] <font color=white><b>is now the Captain of Squad Five!"
														usr.Give_Squad_Verbs()
														usr.insquad = 1
														Squad5+=usr.key
														Squad5[usr.key]=list()
														saveSecurity("SquadFive")
														saveSecurity("Captain5")
														usr.selecting=0
													else
														usr.Squad ="Five"
														usr.Squadrank = "Member"
														usr.Squadlevel=1
														usr.Gotbonus0=0
														usr.Gotbonus1=0
														usr.Squadnexp=5000000
														usr.Bonus_Check()
														world << "<font color=green><b>Squad Info : <font color=red> <b>[usr] <font color=white><b>has joined Squad Five!"
														usr.verbs += typesof(/mob/Squad_Verbs/verb)
														usr.insquad =1
														Squad5+=usr.name
														Squad5[usr.key]=list()
														saveSecurity("SquadFive")
														usr.selecting=0
												else
													usr.Squad ="Five"
													usr.Squadrank = "Member"
													usr.Squadlevel=1
													usr.Gotbonus0=0
													usr.Gotbonus1=0
													usr.Squadnexp=5000000
													usr.Bonus_Check()
													world << "<font color=green><b>Squad Info : <font color=red> <b>[usr] <font color=white><b>has joined Squad Five!"
													usr.verbs += typesof(/mob/Squad_Verbs/verb)
													usr.insquad =1
													Squad5+=usr.name
													Squad5[usr.key]=list()
													saveSecurity("SquadFive")
													usr.selecting=0
											if("Cancel")
												usr.selecting=0
												return
									if("6")
										switch(ShowAlert(usr,"The 6th Division handles all of Gotei 13’s internal affairs, such as monitoring Soul Reaper activity and handling any disturbances from other Soul Reaper.> > Level 1 Bonus:  MGC 50, STR 50, MaxSTM 250, MaxREI 250",list("Join","Cancel")))
											if("Join")
												if(CaptainSix.len==0)
													if(usr.Level >=500)
														usr.Squad = "Six"
														//CaptainOne = usr.name
													//	Squad1+=usr.name
													//	Squad1[usr.key]=list()
														usr.Squadlevel=1
														usr.Gotbonus0=0
														usr.Gotbonus1=0
														usr.Squadnexp=5000000
														CaptainSix+=usr.key
														CaptainSix[usr.key]=list()
														usr.Squadrank = "Captain"
														world << "<font color=green><b>Squad Info : <font color=red> <b>[usr] <font color=white><b>is now the Captain of Squad Six!"
														usr.Give_Squad_Verbs()
														usr.insquad = 1
														Squad6+=usr.key
														Squad6[usr.key]=list()
														saveSecurity("SquadSix")
														saveSecurity("Captain6")
														usr.selecting=0
													else
														usr.Squad ="Six"
														usr.Squadrank = "Member"
														usr.Squadlevel=1
														usr.Gotbonus0=0
														usr.Gotbonus1=0
														usr.Squadnexp=5000000
														usr.Bonus_Check()
														world << "<font color=green><b>Squad Info : <font color=red> <b>[usr] <font color=white><b>has joined Squad Six!"
														usr.verbs += typesof(/mob/Squad_Verbs/verb)
														usr.insquad =1
														Squad6+=usr.name
														Squad6[usr.key]=list()
														saveSecurity("SquadSix")
														usr.selecting=0
												else
													usr.Squad ="Six"
													usr.Squadrank = "Member"
													usr.Squadlevel=1
													usr.Gotbonus0=0
													usr.Gotbonus1=0
													usr.Squadnexp=5000000
													usr.Bonus_Check()
													world << "<font color=green><b>Squad Info : <font color=red> <b>[usr] <font color=white><b>has joined Squad Six!"
													usr.verbs += typesof(/mob/Squad_Verbs/verb)
													usr.insquad =1
													Squad6+=usr.name
													Squad6[usr.key]=list()
													saveSecurity("SquadSix")
													usr.selecting=0
											if("Cancel")
												usr.selecting=0
												return
									if("7")
										switch(ShowAlert(usr,"The 7th Division maintains peace between Seireitei and Rukongai. They make sure Soul Reaper don’t go causing chaos in Seireitei, and are completely responsible for keeping Rukongai civil… or at least the area closest to Seireitei.> > Level 1 Bonus: LCK 100, MaxREI 250, MaxSTM 250, DodgeBonus-=5",list("Join","Cancel")))
											if("Join")
												if(CaptainSeven.len==0)
													if(usr.Level >=500)
														usr.Squad = "Seven"
														//CaptainOne = usr.name
													//	Squad1+=usr.name
													//	Squad1[usr.key]=list()
														usr.Squadlevel=1
														usr.Gotbonus0=0
														usr.Gotbonus1=0
														usr.Squadnexp=5000000
														CaptainSeven+=usr.key
														CaptainSeven[usr.key]=list()
														usr.Squadrank = "Captain"
														world << "<font color=green><b>Squad Info : <font color=red> <b>[usr] <font color=white><b>is now the Captain of Squad Seven!"
														usr.Give_Squad_Verbs()
														usr.insquad = 1
														Squad7+=usr.key
														Squad7[usr.key]=list()
														saveSecurity("SquadSeven")
														saveSecurity("Captain7")
														usr.selecting=0
													else
														usr.Squad ="Seven"
														usr.Squadrank = "Member"
														usr.Squadlevel=1
														usr.Gotbonus0=0
														usr.Gotbonus1=0
														usr.Squadnexp=5000000
														usr.Bonus_Check()
														world << "<font color=green><b>Squad Info : <font color=red> <b>[usr] <font color=white><b>has joined Squad Seven!"
														usr.verbs += typesof(/mob/Squad_Verbs/verb)
														usr.insquad =1
														Squad7+=usr.name
														Squad7[usr.key]=list()
														saveSecurity("SquadSeven")
														usr.selecting=0
												else
													usr.Squad ="Seven"
													usr.Squadrank = "Member"
													usr.Squadlevel=1
													usr.Gotbonus0=0
													usr.Gotbonus1=0
													usr.Squadnexp=5000000
													usr.Bonus_Check()
													world << "<font color=green><b>Squad Info : <font color=red> <b>[usr] <font color=white><b>has joined Squad Seven!"
													usr.verbs += typesof(/mob/Squad_Verbs/verb)
													usr.insquad =1
													Squad7+=usr.name
													Squad7[usr.key]=list()
													saveSecurity("SquadSeven")
													usr.selecting=0
											if("Cancel")
												usr.selecting=0
												return
									if("8")
										switch(ShowAlert(usr,"The 8th Division is the mass reinforcement division. Their Soul Reaper are split into groups that are talented in kidou, offensive tactics, or defensive tactics.> > Level 1 Bonus:  MGC 60, MaxREI 300, MaxSTM 200, MGCDEF 40",list("Join","Cancel")))
											if("Join")
												if(CaptainEight.len==0)
													if(usr.Level >=500)
														usr.Squad = "Eight"
														//CaptainOne = usr.name
													//	Squad1+=usr.name
													//	Squad1[usr.key]=list()
														usr.Squadlevel=1
														usr.Gotbonus0=0
														usr.Gotbonus1=0
														usr.Squadnexp=5000000
														CaptainEight+=usr.key
														CaptainEight[usr.key]=list()
														usr.Squadrank = "Captain"
														world << "<font color=green><b>Squad Info : <font color=red> <b>[usr] <font color=white><b>is now the Captain of Squad Eight!"
														usr.Give_Squad_Verbs()
														usr.insquad = 1
														Squad8+=usr.key
														Squad8[usr.key]=list()
														saveSecurity("SquadEight")
														saveSecurity("Captain8")
														usr.selecting=0
													else
														usr.Squad ="Eight"
														usr.Squadrank = "Member"
														usr.Squadlevel=1
														usr.Gotbonus0=0
														usr.Gotbonus1=0
														usr.Squadnexp=5000000
														usr.Bonus_Check()
														world << "<font color=green><b>Squad Info : <font color=red> <b>[usr] <font color=white><b>has joined Squad Eight!"
														usr.verbs += typesof(/mob/Squad_Verbs/verb)
														usr.insquad =1
														Squad8+=usr.name
														Squad8[usr.key]=list()
														saveSecurity("SquadEight")
														usr.selecting=0

												else
													usr.Squad ="Eight"
													usr.Squadrank = "Member"
													usr.Squadlevel=1
													usr.Gotbonus0=0
													usr.Gotbonus1=0
													usr.Squadnexp=5000000
													usr.Bonus_Check()
													world << "<font color=green><b>Squad Info : <font color=red> <b>[usr] <font color=white><b>has joined Squad Eight!"
													usr.verbs += typesof(/mob/Squad_Verbs/verb)
													usr.insquad =1
													Squad8+=usr.name
													Squad8[usr.key]=list()
													saveSecurity("SquadEight")
													usr.selecting=0
											if("Cancel")
												usr.selecting=0
												return
									if("9")
										switch(ShowAlert(usr,"The 9th Division prevents information from leaking, as well as information being stolen. Their Soul Reaper work close with the 12th Division research facility, to protect it from outside influence.> > Level 1 Bonus:  AGI 75, MaxSTM 500, LCK 25, Hohou 10",list("Join","Cancel")))
											if("Join")
												if(CaptainNine.len==0)
													if(usr.Level >=500)
														usr.Squad = "Nine"
														//CaptainOne = usr.name
													//	Squad1+=usr.name
													//	Squad1[usr.key]=list()
														usr.Squadlevel=1
														usr.Gotbonus0=0
														usr.Gotbonus1=0
														usr.Squadnexp=5000000
														CaptainNine+=usr.key
														CaptainNine[usr.key]=list()
														usr.Squadrank = "Captain"
														world << "<font color=green><b>Squad Info : <font color=red> <b>[usr] <font color=white><b>is now the Captain of Squad Nine!"
														usr.Give_Squad_Verbs()
														usr.insquad = 1
														Squad9+=usr.key
														Squad9[usr.key]=list()
														saveSecurity("SquadNine")
														saveSecurity("Captain9")
														usr.selecting=0
													else
														usr.Squad ="Nine"
														usr.Squadrank = "Member"
														usr.Squadlevel=1
														usr.Gotbonus0=0
														usr.Gotbonus1=0
														usr.Squadnexp=5000000
														usr.Bonus_Check()
														world << "<font color=green><b>Squad Info : <font color=red> <b>[usr] <font color=white><b>has joined Squad Nine!"
														usr.verbs += typesof(/mob/Squad_Verbs/verb)
														usr.insquad =1
														Squad9+=usr.name
														Squad9[usr.key]=list()
														saveSecurity("SquadNine")
														usr.selecting=0
												else
													usr.Squad ="Nine"
													usr.Squadrank = "Member"
													usr.Squadlevel=1
													usr.Gotbonus0=0
													usr.Gotbonus1=0
													usr.Squadnexp=5000000
													usr.Bonus_Check()
													world << "<font color=green><b>Squad Info : <font color=red> <b>[usr] <font color=white><b>has joined Squad Nine!"
													usr.verbs += typesof(/mob/Squad_Verbs/verb)
													usr.insquad =1
													Squad9+=usr.name
													Squad9[usr.key]=list()
													saveSecurity("SquadNine")
													usr.selecting=0
											if("Cancel")
												usr.selecting=0
												return
									if("10")
										switch(ShowAlert(usr,"The 10th Division is in charge of planning, coordinating, and executing large missions. Everything is run through their division first, and if approved, the 10th Division gathers the required Soul Reaper from each division, assembles them, assigns duties, plans the attack, coordinate the Soul Reaper according to the mission, execute the attack, and then keep maintenance over it.> > Level 1 Bonus:  LCK 50, STR 25, MGC 25, MaxSTM 300, MaxREI 200",list("Join","Cancel")))
											if("Join")
												if(CaptainTen.len==0)
													if(usr.Level >=500)
														usr.Squad = "Ten"
														//CaptainOne = usr.name
													//	Squad1+=usr.name
													//	Squad1[usr.key]=list()
														usr.Squadlevel=1
														usr.Gotbonus0=0
														usr.Gotbonus1=0
														usr.Squadnexp=5000000
														CaptainTen+=usr.key
														CaptainTen[usr.key]=list()
														usr.Squadrank = "Captain"
														world << "<font color=green><b>Squad Info : <font color=red> <b>[usr] <font color=white><b>is now the Captain of Squad Ten!"
														usr.Give_Squad_Verbs()
														usr.insquad = 1
														Squad10+=usr.key
														Squad10[usr.key]=list()
														saveSecurity("SquadTen")
														saveSecurity("Captain10")
														usr.selecting=0
													else
														usr.Squad ="Ten"
														usr.Squadrank = "Member"
														usr.Squadlevel=1
														usr.Gotbonus0=0
														usr.Gotbonus1=0
														usr.Squadnexp=5000000
														usr.Bonus_Check()
														world << "<font color=green><b>Squad Info : <font color=red> <b>[usr] <font color=white><b>has joined Squad Ten!"
														usr.verbs += typesof(/mob/Squad_Verbs/verb)
														usr.insquad =1
														Squad10+=usr.name
														Squad10[usr.key]=list()
														saveSecurity("SquadTen")
														usr.selecting=0
												else
													usr.Squad ="Ten"
													usr.Squadrank = "Member"
													usr.Squadlevel=1
													usr.Gotbonus0=0
													usr.Gotbonus1=0
													usr.Squadnexp=5000000
													usr.Bonus_Check()
													world << "<font color=green><b>Squad Info : <font color=red> <b>[usr] <font color=white><b>has joined Squad Ten!"
													usr.verbs += typesof(/mob/Squad_Verbs/verb)
													usr.insquad =1
													Squad10+=usr.name
													Squad10[usr.key]=list()
													saveSecurity("SquadTen")
													usr.selecting=0
											if("Cancel")
												usr.selecting=0
												return
									if("11")
										switch(ShowAlert(usr,"The 11th Division is the frontlines. They are the most skilled in physical combat and work mainly with other divisions. They rarely work on their own since they currently lack much coordination.> > Level 1 Bonus:  STR 100, MaxSTM 500, Zanjutsu 10",list("Join","Cancel")))
											if("Join")
												if(CaptainEleven.len==0)
													if(usr.Level >=500)
														usr.Squad = "Eleven"
														//CaptainOne = usr.name
													//	Squad1+=usr.name
													//	Squad1[usr.key]=list()
														usr.Squadlevel=1
														usr.Gotbonus0=0
														usr.Gotbonus1=0
														usr.Squadnexp=5000000
														CaptainEleven+=usr.key
														CaptainEleven[usr.key]=list()
														usr.Squadrank = "Captain"
														world << "<font color=green><b>Squad Info : <font color=red> <b>[usr] <font color=white><b>is now the Captain of Squad Eleven!"
														usr.Give_Squad_Verbs()
														usr.insquad = 1
														Squad11+=usr.key
														Squad11[usr.key]=list()
														saveSecurity("SquadEleven")
														saveSecurity("Captain11")
														usr.selecting=0
													else
														usr.Squad ="Eleven"
														usr.Squadrank = "Member"
														usr.Squadlevel=1
														usr.Gotbonus0=0
														usr.Gotbonus1=0
														usr.Squadnexp=5000000
														usr.Bonus_Check()
														world << "<font color=green><b>Squad Info : <font color=red> <b>[usr] <font color=white><b>has joined Squad Eleven!"
														usr.verbs += typesof(/mob/Squad_Verbs/verb)
														usr.insquad =1
														Squad11+=usr.name
														Squad11[usr.key]=list()
														saveSecurity("SquadEleven")
														usr.selecting=0

												else
													usr.Squad ="Eleven"
													usr.Squadrank = "Member"
													usr.Squadlevel=1
													usr.Gotbonus0=0
													usr.Gotbonus1=0
													usr.Squadnexp=5000000
													usr.Bonus_Check()
													world << "<font color=green><b>Squad Info : <font color=red> <b>[usr] <font color=white><b>has joined Squad Eleven!"
													usr.verbs += typesof(/mob/Squad_Verbs/verb)
													usr.insquad =1
													Squad11+=usr.name
													Squad11[usr.key]=list()
													saveSecurity("SquadEleven")
													usr.selecting=0
											if("Cancel")
												usr.selecting=0
												return
									if("12")
										switch(ShowAlert(usr,"The 12th Division is in charge of gaining new information through experimentation. They research information that is sent to them from the third division before storing it.> > Level 1 Bonus:  LCK 50, VIT 25, MGCDEF 25, MaxSTM 250, MaxREI 250",list("Join","Cancel")))
											if("Join")
												if(CaptainTwelve.len==0)
													if(usr.Level >=500)
														usr.Squad = "Twelve"
														//CaptainOne = usr.name
													//	Squad1+=usr.name
													//	Squad1[usr.key]=list()
														usr.Squadlevel=1
														usr.Gotbonus0=0
														usr.Gotbonus1=0
														usr.Squadnexp=5000000
														CaptainTwelve+=usr.key
														CaptainTwelve[usr.key]=list()
														usr.Squadrank = "Captain"
														world << "<font color=green><b>Squad Info : <font color=red> <b>[usr] <font color=white><b>is now the Captain of Squad Twelve!"
														usr.Give_Squad_Verbs()
														usr.insquad = 1
														Squad12+=usr.key
														Squad12[usr.key]=list()
														saveSecurity("SquadTwelve")
														saveSecurity("Captain12")
														usr.selecting=0
													else
														usr.Squad ="Twelve"
														usr.Squadrank = "Member"
														usr.Squadlevel=1
														usr.Gotbonus0=0
														usr.Gotbonus1=0
														usr.Squadnexp=5000000
														usr.Bonus_Check()
														world << "<font color=green><b>Squad Info : <font color=red> <b>[usr] <font color=white><b>has joined Squad Twelve!"
														usr.verbs += typesof(/mob/Squad_Verbs/verb)
														usr.insquad =1
														Squad12+=usr.name
														Squad12[usr.key]=list()
														saveSecurity("SquadTwelve")
														usr.selecting=0
												else
													usr.Squad ="Twelve"
													usr.Squadrank = "Member"
													usr.Squadlevel=1
													usr.Gotbonus0=0
													usr.Gotbonus1=0
													usr.Squadnexp=5000000
													usr.Bonus_Check()
													world << "<font color=green><b>Squad Info : <font color=red> <b>[usr] <font color=white><b>has joined Squad Twelve!"
													usr.insquad =1
													usr.verbs += typesof(/mob/Squad_Verbs/verb)
													Squad12+=usr.name
													Squad12[usr.key]=list()
													saveSecurity("SquadTwelve")
													usr.selecting=0
											if("Cancel")
												usr.selecting=0
												return

									if("13")
										switch(ShowAlert(usr,"The 13th Division is the ones that actually send out patrols on a daily, frequent basis to survey Seireitei. If a threat occurs, they find and take care of it, sometimes with help from other divisions.> > Level 1 Bonus: VIT 50, MGCDEF 50, MaxSTM 250, MaxREI 250, ShieldBonus 5",list("Join","Cancel")))
											if("Join")
												if(CaptainThirteen.len==0)
													if(usr.Level >=500)
														usr.Squad = "Thirteen"
														//CaptainOne = usr.name
													//	Squad1+=usr.name
													//	Squad1[usr.key]=list()
														usr.Squadlevel=1
														usr.Gotbonus0=0
														usr.Gotbonus1=0
														usr.Squadnexp=5000000
														CaptainThirteen+=usr.key
														CaptainThirteen[usr.key]=list()
														usr.Squadrank = "Captain"
														world << "<font color=green><b>Squad Info : <font color=red> <b>[usr] <font color=white><b>is now the Captain of Squad Thirteen!"
														usr.Give_Squad_Verbs()
														usr.insquad = 1
														Squad13+=usr.key
														Squad13[usr.key]=list()
														saveSecurity("SquadThirteen")
														saveSecurity("Captain13")
														usr.selecting=0
													else
														usr.Squad ="Thirteen"
														usr.Squadrank = "Member"
														usr.Squadlevel=1
														usr.Gotbonus0=0
														usr.Gotbonus1=0
														usr.Squadnexp=5000000
														usr.Bonus_Check()
														world << "<font color=green><b>Squad Info : <font color=red> <b>[usr] <font color=white><b>has joined Squad Thirteen!"
														usr.insquad =1
														usr.verbs += typesof(/mob/Squad_Verbs/verb)
														Squad13+=usr.name
														Squad13[usr.key]=list()
														saveSecurity("SquadThirteen")
														usr.selecting=0

												else
													usr.Squad ="Thirteen"
													usr.Squadrank = "Member"
													usr.Squadlevel=1
													usr.Gotbonus0=0
													usr.Gotbonus1=0
													usr.Squadnexp=5000000
													usr.Bonus_Check()
													world << "<font color=green><b>Squad Info : <font color=red> <b>[usr] <font color=white><b>has joined Squad Thirteen!"
													usr.insquad =1
													usr.verbs += typesof(/mob/Squad_Verbs/verb)
													Squad13+=usr.name
													Squad13[usr.key]=list()
													saveSecurity("SquadThirteen")
													usr.selecting=0
											if("Cancel")
												usr.selecting=0
												return
									if("Cancel")
										usr.selecting=0
										return

							if("Spawn")
								if(usr.Squad=="Eleven")
									if(usr.Squadlevel==5)
										usr.loc=locate(79,89,25)
										usr.verbs+= /mob/Squad_House/verb/Squad_House_Leave
									else
										QuestShow(usr,"Your Squad either does not yet own a Squad House or you are not Squad level 5.")
										return
								if(usr.Squad=="Six")
									if(usr.Squadlevel==5)
										usr.loc=locate(79,89,26)
										usr.verbs+= /mob/Squad_House/verb/Squad_House_Leave
									else
										QuestShow(usr,"Your Squad either does not yet own a Squad House or you are not Squad level 5.")
										return
								if(usr.Squad=="Nine")
									if(usr.Squadlevel==12)
										usr.loc=locate(79,89,27)
										usr.verbs+= /mob/Squad_House/verb/Squad_House_Leave
									else
										QuestShow(usr,"Your Squad either does not yet own a Squad House or you are not Squad level 5.")
										return
								if(usr.Squad=="Five")
									if(usr.Squadlevel==12)
										usr.loc=locate(79,89,28)
										usr.verbs+= /mob/Squad_House/verb/Squad_House_Leave
									else
										QuestShow(usr,"Your Squad either does not yet own a Squad House or you are not Squad level 5.")
										return



							if("Cancel")
								usr.selecting=0
								return
					else
						if(usr.Class=="Quincy")
							switch(ShowAlert(usr,"The Quincy Brotherhood consists of a large number of Quincies which have banded together in order to preserve their lineage and combat hollows.",list("Join","Spawn","Cancel")))
								if("Join")
									if(usr.insquad == 1)
										usr.selecting=0
										ShowAlert(usr,"You are already in a Squad [usr.Squad] [usr.Squadrank].")
										return
									usr.selecting=1
									if(QuincyUno.len==0)
										if(usr.Level >=500)
											usr.Squad = "Quincy Brotherhood"
														//CaptainOne = usr.name
													//	Squad1+=usr.name
													//	Squad1[usr.key]=list()
											usr.Squadlevel=1
											usr.Gotbonus0=0
											usr.Gotbonus1=0
											usr.Squadnexp=5000000
											QuincyUno+=usr.key
											QuincyUno[usr.key]=list()
											usr.Squadrank = "Praetor"
											world << "<font color=green><b>Squad Info : <font color=red> <b>[usr] <font color=white><b>is now the Praetor of the Quincy Brotherhood!"
											usr.Give_Squad_Verbs()
											usr.insquad = 1
											Quincy1+=usr.key
											Quincy1[usr.key]=list()
											saveSecurity("QuincyBrotherhood")
											saveSecurity("Praetor")
											usr.selecting=0

														//saveSecurity("SquadOne")
										else
											usr.Squad ="Quincy Brotherhood"
											usr.Squadrank = "Member"
											usr.Squadlevel=1
											usr.Gotbonus0=0
											usr.Gotbonus1=0
											usr.Squadnexp=5000000
											usr.Bonus_Check()
											world << "<font color=green><b>Squad Info : <font color=red> <b>[usr] <font color=white><b>has joined the Quincy Brotherhood!"
											usr.verbs += typesof(/mob/Squad_Verbs/verb)
											usr.insquad =1
											Quincy1+=usr.key
											Quincy1[usr.key]=list()
											saveSecurity("QuincyBrotherhood")
											usr.selecting=0
									else
										usr.Squad ="Quincy Brotherhood"
										usr.Squadrank = "Member"
										usr.Squadlevel=1
										usr.Gotbonus0=0
										usr.Gotbonus1=0
										usr.Squadnexp=5000000
										usr.Bonus_Check()
										world << "<font color=green><b>Squad Info : <font color=red> <b>[usr] <font color=white><b>has joined the Quincy Brotherhood!"
										usr.verbs += typesof(/mob/Squad_Verbs/verb)
										usr.insquad =1
										Quincy1+=usr.key
										Quincy1[usr.key]=list()
										saveSecurity("QuincyBrotherhood")
										usr.selecting=0
								if("Spawn")
									if(usr.Squad=="Quincy Brotherhood")
										if(usr.Squadlevel==5)
											usr.loc=locate(79,89,29)
											usr.verbs+= /mob/Squad_House/verb/Squad_House_Leave
										else
											QuestShow(usr,"The Brotherhood either does not yet own a House or you are not Squad level 5.")
											return
								if("Cancel")
									usr.selecting=0
									return
							if("Cancel")
								usr.selecting=0
								return

mob/Squad_Captain
	verb
		Squad_Invite()
			set category = "Squad"
			var/list/Menu = list()
			for(var/mob/Player/M in world)
				if(M.Class == "Soul Reaper")
					if(M.Squad == "None")
						Menu.Add(M)
			var/mob/M = input("Who do you want to recruit?","Squad [usr.Squad]") as null | anything in Menu
			if(!M)return
			if(istype(M,/mob))
				switch(alert(M,"Do you want to join Squad [usr.Squad]?","","Yes","No"))
					if("Yes")
						M.Squad = usr.Squad
						M.Squadrank = "Member"
						M.Give_Squad_Verbs()
						world << "<b><font color = yellow>Squad Info: [M] has joined Squad [usr.Squad]!"
					if("No")
						usr << "[M] has declined!"
						return
		Squad_Mute()
			set category = "Squad"
			set name="Mute/Unmute Member"
			var/list/Menu = list()
			for(var/mob/Player/M in world)
				if(M.name != usr.name)
					if(M.insquad)
						if(M.Squad == usr.Squad)
							Menu.Add(M)
						if(M.Squadrank=="Captain"||M.Squadrank=="Praetor")
							Menu.Remove(M)
			var/mob/M = input("Which Squad member will you mute or unmute?","") as null | anything in Menu
			if(!M)return
			if(M)
				if(M.Squadmute==1)
					M.Squadmute=0
					M<<"<font color=yellow>[src]<font color=white> has restored your ability to speak on the Squad channel"
					src<<"<font color=yellow>You have squad UNmuted [M]"
				else
					M.Squadmute=1
					M<<"<font color=yellow>[src]<font color=white> has removed your ability to speak on the Squad channel"
					src<<"<font color=yellow>You have squad muted [M]"



		Custom_Rank()
			set category = "Squad"
			var/list/Menu = list()
			for(var/mob/Player/M in world)
				if(M.name != usr.name)
					if(M.insquad)
						if(M.Squad == usr.Squad)
							Menu.Add(M)
			var/mob/M = input("Whose rank would you like to modify?","") as null | anything in Menu
			if(!M)return
			if(istype(M,/mob))
				var/ID=input("What name would you like to set [M]'s Rank to?")as text
		  if(ID=="Captain"|| ID == "Praetor")
		  	usr<<"<font color=green><b>Squad Info: <font color=white><b>You can not make a new Leader rank."
		  	return
		  M.Squadrank=ID
		  M.CustomRank=ID
		  world <<"<font color=green><b>Squad Info: <font color=white><b>[M] is now a [M.Squadrank] in Squad [M.Squad]."
		  M.Save()

	/*	Squad_Dismiss()
			set category = "Squad"
			var/list/Menu = list()
			for(var/mob/M in world)
				if(!M.client) continue
				if(M.name != usr.name)
					if(M.Squad == usr.Squad)
						Menu.Add(M)
			var/mob/M = input("Who do you want to dismiss from the Squad?","Squad [usr.Squad]") as null | anything in Menu
			if(!M)return
			if(istype(M,/mob))
				if(M.Squadrank == "Captain")
					alert("You cannot dismiss the Captain!")
					return
				switch(alert("Are you sure that you want to dismiss [M] from Squad [usr.Squad]. Remember, this should not be used casually as it removes the Bonus gains for a player - if it is abused, you will be removed.?","","Yes","No"))
					if("Yes")
						world << "b><font color = green><b>Squad Info: <font color=white><b>[usr] has discharged [M] from Squad [usr.Squad]!"
						if(M.Squad=="One")
							M.Squadlevel=0
							M.Squad=""
							M.Squadexp=10
							M.Squadnexp=10
							M.Gotbonus0=0
							M.Gotbonus1=0
							Squad1.Remove(M.key)
							saveSecurity("SquadOne")
						if(M.Squad=="Two")
							M.Squadlevel=0
							M.Squad=""
							M.Squadexp=10
							M.Squadnexp=10
							M.Gotbonus0=0
							M.Gotbonus1=0
							Squad2.Remove(M.key)
							saveSecurity("SquadTwo")
						if(M.Squad=="Three")
							M.Squadlevel=0
							M.Squad=""
							M.Squadexp=10
							M.Squadnexp=10
							M.Gotbonus0=0
							M.Gotbonus1=0
							Squad3.Remove(M.key)
							saveSecurity("SquadThree")
						if(M.Squad=="Four")
							M.Squadlevel=0
							M.Squad=""
							M.Squadexp=10
							M.Squadnexp=10
							M.Gotbonus0=0
							M.Gotbonus1=0
							Squad4.Remove(M.key)
							saveSecurity("SquadFour")
						if(M.Squad=="Five")
							M.Squadlevel=0
							M.Squad=""
							M.Squadexp=10
							M.Squadnexp=10
							M.Gotbonus0=0
							M.Gotbonus1=0
							Squad5.Remove(M.key)
							saveSecurity("SquadFive")
						if(M.Squad=="Six")
							M.Squadlevel=0
							M.Squad=""
							M.Squadexp=10
							M.Squadnexp=10
							M.Gotbonus0=0
							M.Gotbonus1=0
							Squad6.Remove(M.key)
							saveSecurity("Squadsix")
						if(M.Squad=="Seven")
							M.Squadlevel=0
							M.Squad=""
							M.Squadexp=10
							M.Squadnexp=10
							M.Gotbonus0=0
							M.Gotbonus1=0
							Squad7.Remove(M.key)
							saveSecurity("SquadSeven")
						if(M.Squad=="Eight")
							M.Squadlevel=0
							M.Squad=""
							M.Squadexp=10
							M.Squadnexp=10
							M.Gotbonus0=0
							M.Gotbonus1=0
							Squad8.Remove(M.key)
							saveSecurity("SquadEight")
						if(M.Squad=="Nine")
							M.Squadlevel=0
							M.Squad=""
							M.Squadexp=10
							M.Squadnexp=10
							M.Gotbonus0=0
							M.Gotbonus1=0
							Squad9.Remove(M.key)
							saveSecurity("SquadNine")
						if(M.Squad=="Ten")
							M.Squadlevel=0
							M.Squad=""
							M.Squadexp=10
							M.Squadnexp=10
							M.Gotbonus0=0
							M.Gotbonus1=0
							Squad10.Remove(M.key)
							saveSecurity("SquadTen")
						if(M.Squad=="Eleven")
							M.Squadlevel=0
							M.Squad=""
							M.Squadexp=10
							M.Squadnexp=10
							M.Gotbonus0=0
							M.Gotbonus1=0
							Squad11.Remove(M.key)
							saveSecurity("SquadEleven")
						if(M.Squad=="Twelve")
							M.Squadlevel=0
							M.Squad=""
							M.Squadexp=10
							M.Squadnexp=10
							M.Gotbonus0=0
							M.Gotbonus1=0
							Squad12.Remove(M.key)
							saveSecurity("SquadTwelve")
						if(M.Squad=="Thirteen")
							M.Squadlevel=0
							M.Squad=""
							M.Squadexp=10
							M.Squadnexp=10
							M.Gotbonus0=0
							M.Gotbonus1=0
							Squad13.Remove(M.key)
							saveSecurity("SquadThirteen")
						leaveSquad(M)
					//	M.leaveSquad()
						M.Squad = ""
						M.Squadrank = ""
						M.insquad = 0
					if("No")
						return*/
		Squad_Promote()
			set category = "Squad"
			var/list/Menu = list()
			for(var/mob/M in world)
				if(!M.client) continue
				if(M.name != usr.name)
					if(M.Squad == usr.Squad)
						Menu.Add(M)
			var/mob/M = input("Who do you want to promote/demote?","[usr.Squad]") as null | anything in Menu
			if(!M)return
			if(istype(M,/mob))
			 switch(input("Do you want to promote or demote [M]?")in list("Promote","Demote","Cancel"))
					if("Promote")
						if(M.Squadrank == "Captain" || M.Squadrank == "Praetor")
							usr << "<font color=green><b>Squad Info: <font color=white><b>You can't promote the existing Leaders."
						else
							M.Squadrank = "Lieutenant"
							M.Lieu=1
							M.Give_Squad_Verbs()
							world <<"<font color=green><b>Squad Info: <font color=white><b>[M] is now a [M.Squadrank] in Squad [M.Squad]."
					if("Demote")
						if(M.Squadrank == "Captain" || M.Squadrank == "Praetor")
							usr << "<font color=green><b>Squad Info: <font color=white><b>You can't demote the Squad Leader."
						if(M.Squadrank == "Member")
							usr << "<font color=green><b>Squad Info: <font color=white><b>He is already a rank of Member and can't be demoted further."
						else
							M.Squadrank = "Member"
							M.Lieu=0
							world <<"<font color=green><b>Squad Info: <font color=white><b>[M] is now a [M.Squadrank] in Squad [M.Squad]."
							M.Give_Squad_Verbs()
				if("Cancel")
					return

		Squad_Announce(T as text)
			set category = "Squad"
			for(var/mob/X in world)
				if(X.Squad == usr.Squad)
					X << "<font size=2><font color = #CC9999><b><center>Squad Announcement by [usr.Squadrank] [usr.name]  :<center><br><font color=white><b>[T]"

mob/Squad_House
	verb
		Squad_House_Leave()
			set category = "Squad"
			set name="Leave Squad House"
			src.loc=locate(44,140,3)
			src.verbs-= /mob/Squad_House/verb/Squad_House_Leave

mob/Squad_Verbs
	verb
		Squad_Chat(T as text)
			set category = "Squad"
			if(usr.IsMuted())	return
			if(usr.Squadmute==1)
				usr<<"<b>You can not speak on Squad chat when you have been muted by a Squad officer."
				return
			if(lentext(T) > 1000)
				alert("Your message must be less than 1000 characters!")
				return
			for(var/mob/X in world)
				if(X.Squad == usr.Squad)
					X << "<b><font color =white size=2>.:<font color =#9999CC size=2>Squad Chat</font><b><font color =white size=2>:. - (<font color=#CC99FF>[src.Squadrank]</font>)-<font color=#9900FF>[src.name]: <font color=white><b>[T]"


		Squad_Who()
			set category = "Squad"
			SWhoProc()
		Squad_Leave()
			set category = "Squad"
			if(usr.Squadrank=="Captain")
				usr << "<b><font color=green><b>Squad Info: <font color=white><b>You are the Squad Captain, you can not leave the Squad"
				usr.selecting=0
				return
			if(usr.Squadrank=="Praetor")
				usr << "<b><font color=green><b>Squad Info: <font color=white><b>You are the Brotherhood Praetor, you can not leave it"
				usr.selecting=0
				return
			if(usr.Chalengee==1 || usr.Challenger ==1 ||usr.Challenged==1)
				usr.selecting=0
				usr<<"<font color=green><b>Squad Info: <font color=white><b>You can not leave a squad during a challenge."
				return
			switch(alert("Are you sure you wish to leave Squad [src.Squad]? If you do, your squad levels will be reset to 0 either manually or automatically.","","Yes","No"))
				if("Yes")
					if(src.VIP>=3)
						usr.selecting=0
						leaveSquadVIP(src)
					else
						world << "<b><font color = green><b>Squad Info: <font color=white><b>[usr] has quit Squad [usr.Squad]!"
						src.Squadrank = ""
						src.CustomRank=""
						src.insquad=0
						src.Squadexp=10
						src.Squadnexp=5000000
						src.Squadlevel=0
						src.Bonus_Removal()
						if(src.Squad=="One")
							for(var/x in Squad1)
								if(x==src.key)
									Squad1.Remove(x)
									src.Squad="none"
						saveSecurity("SquadOne")
						if(src.Squad=="Two")
							Squad2.Remove(src.key)
							src.Squad="none"
							saveSecurity("SquadTwo")
						if(src.Squad=="Three")
							Squad3.Remove(src.key)
							src.Squad="none"
							saveSecurity("SquadThree")
						if(src.Squad=="Four")
							Squad4.Remove(src.key)
							src.Squad="none"
							saveSecurity("SquadFour")
						if(src.Squad=="Five")
							Squad5.Remove(src.key)
							src.Squad="none"
							saveSecurity("SquadFive")
						if(src.Squad=="Six")
							Squad6.Remove(src.key)
							src.Squad="none"
							saveSecurity("SquadSix")
						if(src.Squad=="Seven")
							Squad7.Remove(src.key)
							src.Squad="none"
							saveSecurity("SquadSeven")
						if(src.Squad=="Eight")
							Squad8.Remove(src.key)
							src.Squad="none"
							saveSecurity("SquadEight")
						if(src.Squad=="Nine")
							Squad9.Remove(src.key)
							src.Squad="none"
							saveSecurity("SquadNine")
						if(src.Squad=="Ten")
							Squad10.Remove(src.key)
							src.Squad="none"
							saveSecurity("SquadTen")
						if(src.Squad=="Eleven")
							Squad11.Remove(src.key)
							src.Squad="none"
							saveSecurity("SquadEleven")
						if(src.Squad=="Twelve")
							Squad12.Remove(src.key)
							src.Squad="none"
							saveSecurity("SquadTwelve")
						if(src.Squad=="Thirteen")
							Squad13.Remove(src.key)
							src.Squad="none"
							saveSecurity("SquadThirteen")
						if(src.Squad=="Quincy Brotherhood")
							Quincy1.Remove(src.key)
							src.Squad="none"
							saveSecurity("QuincyBrotherhood")
						src.Gotbonus0=0
						src.Gotbonus1=0
						src.Gotbonus2=0
						src.Gotbonus3=0
						src.Gotbonus4=0
						leaveSquad(src)
						src.Respec()
						usr.selecting=0
				if("No")
					usr.selecting=0
					return

mob/Squad_Verbs/Special
	verb

		Squad1_Members()
			set category="Squad"
			set name="Squad Information/Members"
			var/HtmlText="<title>Squad One</title><body bgcolor=black>"
			HtmlText+="<center><table bgcolor=black bordercolor=yellow border=0>"
			HtmlText+="<tr><td><center><b><font color=green>"
			HtmlText+="<font color=green size=5><b>Members<br>"
			for(var/x in Squad1)
				HtmlText+="<tr><td><b><center><font color=White font size=3>[x]<br>"
			HtmlText+="</table>"
			usr<<browse(HtmlText,"window=GenericBrowser")

		Squad2_Members()
			set category="Squad"
			set name="Full Members List"
			var/HtmlText="<title>Squad Two  - Members</title><body bgcolor=black>"
			HtmlText+="<center><table bgcolor=black bordercolor=yellow border=0>"
			HtmlText+="<tr><td><center><b><font color=green>"
			HtmlText+="<font color=green size=5><b>Members<br>"
			for(var/x in Squad2)
				HtmlText+="<tr><td><b><center><font color=White font size=3>[x]<br>"
			HtmlText+="</table>"
			usr<<browse(HtmlText,"window=GenericBrowser")

		Squad3_Members()
			set category="Squad"
			set name="Full Members List"
			var/HtmlText="<title>Squad Three  - Members</title><body bgcolor=black>"
			HtmlText+="<center><table bgcolor=black bordercolor=yellow border=0>"
			HtmlText+="<tr><td><center><b><font color=green>"
			HtmlText+="<font color=green size=5><b>Members<br>"
			for(var/x in Squad3)
				HtmlText+="<tr><td><b><center><font color=White font size=3>[x]<br>"
			HtmlText+="</table>"
			usr<<browse(HtmlText,"window=GenericBrowser")

		Squad4_Members()
			set category="Squad"
			set name="Full Members List"
			var/HtmlText="<title>Squad Four  - Members</title><body bgcolor=black>"
			HtmlText+="<center><table bgcolor=black bordercolor=yellow border=0>"
			HtmlText+="<tr><td><center><b><font color=green>"
			HtmlText+="<font color=green size=5><b>Members<br>"
			for(var/x in Squad4)
				HtmlText+="<tr><td><b><center><font color=White font size=3>[x]<br>"
			HtmlText+="</table>"
			usr<<browse(HtmlText,"window=GenericBrowser")

		Squad5_Members()
			set category="Squad"
			set name="Full Members List"
			var/HtmlText="<title>Squad Five  - Members</title><body bgcolor=black>"
			HtmlText+="<center><table bgcolor=black bordercolor=yellow border=0>"
			HtmlText+="<tr><td><center><b><font color=green>"
			HtmlText+="<font color=green size=5><b>Members<br>"
			for(var/x in Squad5)
				HtmlText+="<tr><td><b><center><font color=White font size=3>[x]<br>"
			HtmlText+="</table>"
			usr<<browse(HtmlText,"window=GenericBrowser")

		Squad6_Members()
			set category="Squad"
			set name="Full Members List"
			var/HtmlText="<title>Squad Six  - Members</title><body bgcolor=black>"
			HtmlText+="<center><table bgcolor=black bordercolor=yellow border=0>"
			HtmlText+="<tr><td><center><b><font color=green>"
			HtmlText+="<font color=green size=5><b>Members<br>"
			for(var/x in Squad6)
				HtmlText+="<tr><td><b><center><font color=White font size=3>[x]<br>"
			HtmlText+="</table>"
			usr<<browse(HtmlText,"window=GenericBrowser")
		Squad7_Members()
			set category="Squad"
			set name="Full Members List"
			var/HtmlText="<title>Squad Seven  - Members</title><body bgcolor=black>"
			HtmlText+="<center><table bgcolor=black bordercolor=yellow border=0>"
			HtmlText+="<tr><td><center><b><font color=green>"
			HtmlText+="<font color=green size=5><b>Members<br>"
			for(var/x in Squad7)
				HtmlText+="<tr><td><b><center><font color=White font size=3>[x]<br>"
			HtmlText+="</table>"
			usr<<browse(HtmlText,"window=GenericBrowser")
		Squad8_Members()
			set category="Squad"
			set name="Full Members List"
			var/HtmlText="<title>Squad Eight  - Members</title><body bgcolor=black>"
			HtmlText+="<center><table bgcolor=black bordercolor=yellow border=0>"
			HtmlText+="<tr><td><center><b><font color=green>"
			HtmlText+="<font color=green size=5><b>Members<br>"
			for(var/x in Squad8)
				HtmlText+="<tr><td><b><center><font color=White font size=3>[x]<br>"
			HtmlText+="</table>"
			usr<<browse(HtmlText,"window=GenericBrowser")
		Squad9_Members()
			set category="Squad"
			set name="Full Members List"
			var/HtmlText="<title>Squad Nine  - Members</title><body bgcolor=black>"
			HtmlText+="<center><table bgcolor=black bordercolor=yellow border=0>"
			HtmlText+="<tr><td><center><b><font color=green>"
			HtmlText+="<font color=green size=5><b>Members<br>"
			for(var/x in Squad9)
				HtmlText+="<tr><td><b><center><font color=White font size=3>[x]<br>"
			HtmlText+="</table>"
			usr<<browse(HtmlText,"window=GenericBrowser")
		Squad10_Members()
			set category="Squad"
			set name="Full Members List"
			var/HtmlText="<title>Squad Ten  - Members</title><body bgcolor=black>"
			HtmlText+="<center><table bgcolor=black bordercolor=yellow border=0>"
			HtmlText+="<tr><td><center><b><font color=green>"
			HtmlText+="<font color=green size=5><b>Members<br>"
			for(var/x in Squad10)
				HtmlText+="<tr><td><b><center><font color=White font size=3>[x]<br>"
			HtmlText+="</table>"
			usr<<browse(HtmlText,"window=GenericBrowser")
		Squad11_Members()
			set category="Squad"
			set name="Full Members List"
			var/HtmlText="<title>Squad Eleven  - Members</title><body bgcolor=black>"
			HtmlText+="<center><table bgcolor=black bordercolor=yellow border=0>"
			HtmlText+="<tr><td><center><b><font color=green>"
			HtmlText+="<font color=green size=5><b>Members<br>"
			for(var/x in Squad11)
				HtmlText+="<tr><td><b><center><font color=White font size=3>[x]<br>"
			HtmlText+="</table>"
			usr<<browse(HtmlText,"window=GenericBrowser")
		Squad12_Members()
			set category="Squad"
			set name="Full Members List"
			var/HtmlText="<title>Squad Twelve  - Members</title><body bgcolor=black>"
			HtmlText+="<center><table bgcolor=black bordercolor=yellow border=0>"
			HtmlText+="<tr><td><center><b><font color=green>"
			HtmlText+="<font color=green size=5><b>Members<br>"
			for(var/x in Squad12)
				HtmlText+="<tr><td><b><center><font color=White font size=3>[x]<br>"
			HtmlText+="</table>"
			usr<<browse(HtmlText,"window=GenericBrowser")
		Squad13_Members()
			set category="Squad"
			set name="Full Members List"
			var/HtmlText="<title>Squad Thirteen  - Members</title><body bgcolor=black>"
			HtmlText+="<center><table bgcolor=black bordercolor=yellow border=0>"
			HtmlText+="<tr><td><center><b><font color=green>"
			HtmlText+="<font color=green size=5><b>Members<br>"
			for(var/x in Squad13)
				HtmlText+="<tr><td><b><center><font color=White font size=3>[x]<br>"
			HtmlText+="</table>"
			usr<<browse(HtmlText,"window=GenericBrowser")
		Quincy1_Members()
			set category="Squad"
			set name="Full Members List"
			var/HtmlText="<title>Quincy Brotherhood  - Members</title><body bgcolor=black>"
			HtmlText+="<center><table bgcolor=black bordercolor=yellow border=0>"
			HtmlText+="<tr><td><center><b><font color=green>"
			HtmlText+="<font color=green size=5><b>Members<br>"
			for(var/x in Quincy1)
				HtmlText+="<tr><td><b><center><font color=White font size=3>[x]<br>"
			HtmlText+="</table>"
			usr<<browse(HtmlText,"window=GenericBrowser")

mob
	proc
		Give_Squad_Verbs()
			if(src.Squadrank == "Captain" || src.Squadrank == "Praetor")
				src.verbs += typesof(/mob/Squad_Captain/verb)
				src.verbs += typesof(/mob/Squad_Verbs/verb)
				src.Bonus_Check()
				return
			if(src.Squadrank == "Lieutenant")
				//src.verbs += /mob/Squad_Captain/verb/Squad_Dismiss
				src.verbs += /mob/Squad_Captain/verb/Squad_Announce
				src.verbs += /mob/Squad_Captain/verb/Squad_Mute
				src.verbs += typesof(/mob/Squad_Verbs/verb)
				return
			if(src.insquad==1)
				src.verbs += typesof(/mob/Squad_Verbs/verb)

		leaveSquad()
			src.verbs -= typesof(/mob/Squad_Captain/verb)
			src.verbs -= typesof(/mob/Squad_Verbs/verb)
			src.verbs-= typesof(/mob/Squad_Verbs/Special/verb)
			if(src.VIP<=3)
				src.Squadexp=10
				src.Squadnexp=5000000
			src.Save()
		leaveSquad2()
			if(usr.Squadrank=="Captain"||usr.Squadrank=="Praetor")
				return
			world << "<b><font color = green><b>Squad Info: <font color=white><b>[usr] has quit Squad [usr.Squad]!"
			src.Squadrank = ""
			src.CustomRank=""
			src.insquad=0
			src.Squadexp=10
			src.Squadnexp=5000000
			src.Squadlevel=0
			src.Bonus_Removal()
			if(src.Squad=="One")
				for(var/x in Squad1)
					if(x==src.key)
						Squad1.Remove(x)
						src.Squad="none"
						saveSecurity("SquadOne")
			if(src.Squad=="Two")
				Squad2.Remove(src.key)
				src.Squad="none"
				saveSecurity("SquadTwo")
			if(src.Squad=="Three")
				Squad3.Remove(src.key)
				src.Squad="none"
				saveSecurity("SquadThree")
			if(src.Squad=="Four")
				Squad4.Remove(src.key)
				src.Squad="none"
				saveSecurity("SquadFour")
			if(src.Squad=="Five")
				Squad5.Remove(src.key)
				src.Squad="none"
				saveSecurity("SquadFive")
			if(src.Squad=="Six")
				Squad6.Remove(src.key)
				src.Squad="none"
				saveSecurity("SquadSix")
			if(src.Squad=="Seven")
				Squad7.Remove(src.key)
				src.Squad="none"
				saveSecurity("SquadSeven")
			if(src.Squad=="Eight")
				Squad8.Remove(src.key)
				src.Squad="none"
				saveSecurity("SquadEight")
			if(src.Squad=="Nine")
				Squad9.Remove(src.key)
				src.Squad="none"
				saveSecurity("SquadNine")
			if(src.Squad=="Ten")
				Squad10.Remove(src.key)
				src.Squad="none"
				saveSecurity("SquadTen")
			if(src.Squad=="Eleven")
				Squad11.Remove(src.key)
				src.Squad="none"
				saveSecurity("SquadEleven")
			if(src.Squad=="Twelve")
				Squad12.Remove(src.key)
				src.Squad="none"
				saveSecurity("SquadTwelve")
			if(src.Squad=="Thirteen")
				Squad13.Remove(src.key)
				src.Squad="none"
				saveSecurity("SquadThirteen")
			if(src.Squad=="Quincy Brotherhood")
				Quincy1.Remove(src.key)
				src.Squad="none"
				saveSecurity("QuincyBrotherhood")
			src.Gotbonus0=0
			src.Gotbonus1=0
			src.Gotbonus2=0
			src.Gotbonus3=0
			src.Gotbonus4=0
			leaveSquad(src)
			src.Respec()
			src.Save()

		leaveSquadVIP()
			if(usr.Squadrank=="Captain"||usr.Squadrank=="Praetor")
				return
			world << "<b><font color = green><b>Squad Info: <font color=white><b>[usr] has quit Squad [usr.Squad] using VIP benefits!"
			src.Squadrank = ""
			src.CustomRank=""
			src.insquad=0
			src.Squadlevel=0
			src.Bonus_Removal()
			if(src.Squad=="One")
				for(var/x in Squad1)
					if(x==src.key)
						Squad1.Remove(x)
						src.Squad="none"
						saveSecurity("SquadOne")
			if(src.Squad=="Two")
				Squad2.Remove(src.key)
				src.Squad="none"
				saveSecurity("SquadTwo")
			if(src.Squad=="Three")
				Squad3.Remove(src.key)
				src.Squad="none"
				saveSecurity("SquadThree")
			if(src.Squad=="Four")
				Squad4.Remove(src.key)
				src.Squad="none"
				saveSecurity("SquadFour")
			if(src.Squad=="Five")
				Squad5.Remove(src.key)
				src.Squad="none"
				saveSecurity("SquadFive")
			if(src.Squad=="Six")
				Squad6.Remove(src.key)
				src.Squad="none"
				saveSecurity("SquadSix")
			if(src.Squad=="Seven")
				Squad7.Remove(src.key)
				src.Squad="none"
				saveSecurity("SquadSeven")
			if(src.Squad=="Eight")
				Squad8.Remove(src.key)
				src.Squad="none"
				saveSecurity("SquadEight")
			if(src.Squad=="Nine")
				Squad9.Remove(src.key)
				src.Squad="none"
				saveSecurity("SquadNine")
			if(src.Squad=="Ten")
				Squad10.Remove(src.key)
				src.Squad="none"
				saveSecurity("SquadTen")
			if(src.Squad=="Eleven")
				Squad11.Remove(src.key)
				src.Squad="none"
				saveSecurity("SquadEleven")
			if(src.Squad=="Twelve")
				Squad12.Remove(src.key)
				src.Squad="none"
				saveSecurity("SquadTwelve")
			if(src.Squad=="Thirteen")
				Squad13.Remove(src.key)
				src.Squad="none"
				saveSecurity("SquadThirteen")
			if(src.Squad=="Quincy Brotherhood")
				Quincy1.Remove(src.key)
				src.Squad="none"
				saveSecurity("QuincyBrotherhood")
			leaveSquad(src)
			src.Respec()
			src.Save()




mob/verb/Gotei13_Captains()
		set category="Commands"
		set name="Captains and Quincy Leaders"
		CalculateCaptain()
		var/html="<html><body bgcolor=black><b><font color=black>"
		html+="<title><font size=4>Gotei 13</title>"
		html+="<center><table border=1 bgcolor=black bordercolor=gray>"
		html+="<tr><td colspan=6><center><b><font color=green size =5>Gotei 13 Captains"
		html+="<tr><td><font color=gray size=3><b>Squad 1  Captain-Commander :<font color = red size =3>  [One]</td></tr>\n"
		html+="<tr><td><font color=gray size=3><b>Squad 2  Captain :<font color = red size =3>  [Two]</td></tr>\n"
		html+="<tr><td><font color=gray size=3><b>Squad 3  Captain : <font color = red size =3> [Three]</td></tr>\n"
		html+="<tr><td><font color=gray size=3><b>Squad 4  Captain : <font color = red size =3> [Four]</td></tr>\n"
		html+="<tr><td><font color=gray size=3><b>Squad 5  Captain : <font color = red size =3> [Five]</td></tr>\n"
		html+="<tr><td><font color=gray size=3><b>Squad 6  Captain : <font color = red size =3> [Six]</td></tr>\n"
		html+="<tr><td><font color=gray size=3><b>Squad 7  Captain : <font color = red size =3> [Seven]</td></tr>\n"
		html+="<tr><td><font color=gray size=3><b>Squad 8  Captain : <font color = red size =3> [Eight]</td></tr>\n"
		html+="<tr><td><font color=gray size=3><b>Squad 9  Captain : <font color = red size =3> [Nine]</td></tr>\n"
		html+="<tr><td><font color=gray size=3><b>Squad 10 Captain : <font color = red size =3> [Ten]</td></tr>\n"
		html+="<tr><td><font color=gray size=3><b>Squad 11 Captain : <font color = red size =3> [Eleven]</td></tr>\n"
		html+="<tr><td><font color=gray size=3><b>Squad 12 Captain : <font color = red size =3> [Twelve]</td></tr>\n"
		html+="<tr><td><font color=gray size=3><b>Squad 13 Captain : <font color = red size =3> [Thirteen]</td></tr>\n"
		html+="<tr><td colspan=6><center><b><font color=green size =5>Quincy Leaders"
		html+="<tr><td><font color=gray size=3><b>Quincy Brotherhood Praetor : <font color = red size =3> [Uno]</td></tr>\n"
		usr<<browse("[html]","window=WhoBrowser")
		winset(usr,"WhoWindow","is-visible=true")
var/
	One="Noone"
	Two="Noone"
	Three="Noone"
	Four="Noone"
	Five="Noone"
	Six="Noone"
	Seven="Noone"
	Eight="Noone"
	Nine="Noone"
	Ten="Noone"
	Eleven="Noone"
	Twelve="Noone"
	Thirteen="Noone"
	Uno="Noone"

proc/CalculateCaptain()
	for(var/x in CaptainOne)
		if(x)
			One=x
	for(var/x in CaptainTwo)
		if(x)
			Two=x
	for(var/x in CaptainThree)
		if(x)
			Three=x
	for(var/x in CaptainFour)
		if(x)
			Four=x
	for(var/x in CaptainFive)
		if(x)
			Five=x
	for(var/x in CaptainSix)
		if(x)
			Six=x
	for(var/x in CaptainSeven)
		if(x)
			Seven=x
	for(var/x in CaptainEight)
		if(x)
			Eight=x
	for(var/x in CaptainNine)
		if(x)
			Nine=x
	for(var/x in CaptainTen)
		if(x)
			Ten=x
	for(var/x in CaptainEleven)
		if(x)
			Eleven=x
	for(var/x in CaptainTwelve)
		if(x)
			Twelve=x
	for(var/x in CaptainThirteen)
		if(x)
			Thirteen=x
	for(var/x in QuincyUno)
		if(x)
			Uno=x


mob/proc/SWhoProc(var/list/SortedPlayers)
	if(!SortedPlayers)
		var/list/AllPlayers=list();SortedPlayers=list()
		for(var/mob/Player/M in world)
			if(M.client && M.Squad==usr.Squad)	AllPlayers+=M
		while(AllPlayers.len>=1)
			var/HighestLevel=0;var/ThisMob
			for(var/mob/M in AllPlayers)
				if(M.Level>HighestLevel)	{HighestLevel=M.Level;ThisMob=M}
			AllPlayers-=ThisMob;SortedPlayers+=ThisMob
	var/LevelSort="<a href='?src=\ref[src];action=SortWho;SortBy=Level'>Level</a>"
	var/RankSort="<a href='?src=\ref[src];action=SortWho;SortBy=Squadrank'>Squad Rank</a>"
	var/TextList="<html><body bgcolor=gray><b><font color=black>"
	TextList+="<title>Squad [Squad] Members</title>"
	TextList+="<center><table border=1 bgcolor=black bordercolor=gray>"
	TextList+="<tr><td colspan=6><center><b><font color=green>Gotei 13: Division [Squad]"
	TextList+="<tr><td><b><font color=gray>Name<td><b><font color=gray>Key"
	TextList+="<td><b><font color=gray>[LevelSort]<td><b><font color=gray>Class"
	TextList+="<td colspan=2><b><font color=gray>[RankSort]"
	var/FM="<td align=center><b><font color=gray>"
	for(var/mob/M in SortedPlayers)
	//	var/Phours=round(M.PlayTime/60/60)
	//	var/Pminutes=round(M.PlayTime/60-(60*Phours))
		var/SubStar=""
		if(M.Subscriber)	SubStar="* "
		//var/Pseconds=round(M.PlayTime-(60*Pminutes)-(60*Phours*60))
		TextList+="<tr><td><b><font color=gray><a href='?src=\ref[src];CheckPlayer=\ref[M]'>[M.name]"
		TextList+="<td><b><font color=gray>[SubStar][M.key]"
		TextList+="<td><b><font color=gray><center>[M.Level]<td><b><font color=gray>[M.Class]"
		TextList+="[FM]<font color=red>[M.Squadrank]</font>"
	TextList+="<tr><td colspan=6><b><font color=yellow><center>[SortedPlayers.len] Squad Members Online"
	usr<<browse("[TextList]","window=WhoBrowser")
	winset(usr,"WhoWindow","is-visible=true")











///////////////////////NEW CODE//////////////
mob/proc/SquadCheck()
	if(src.sexp!=1)
		src.Squadexp=10
		src.Squadnexp=5000000
		src.Squadlevel=1
		src.sexp=1
		src.Save()
	if(src.key in CaptainOne)
		if(src.Class=="Soul Reaper")
			src.verbs += typesof(/mob/Squad_Captain/verb)
			src.verbs += typesof(/mob/Squad_Verbs/verb)
			src.verbs += /mob/Squad_Verbs/Special/verb/Squad1_Members
			src.insquad=1
			src.Squadrank="Captain - Commander"
			src.Squad="One"
			return
	if(src.key in CaptainTwo)
		if(src.Class=="Soul Reaper")
			src.verbs += typesof(/mob/Squad_Captain/verb)
			src.verbs += typesof(/mob/Squad_Verbs/verb)
			src.verbs += /mob/Squad_Verbs/Special/verb/Squad2_Members
			src.insquad=1
			src.Squadrank="Captain"
			src.Squad="Two"
			return
	if(src.key in CaptainThree)
		if(src.Class=="Soul Reaper")
			src.verbs += typesof(/mob/Squad_Captain/verb)
			src.verbs += typesof(/mob/Squad_Verbs/verb)
			src.verbs += /mob/Squad_Verbs/Special/verb/Squad3_Members
			src.insquad=1
			src.Squadrank="Captain"
			src.Squad="Three"
			return
	if(src.key in CaptainFour)
		if(src.Class=="Soul Reaper")
			src.verbs += typesof(/mob/Squad_Captain/verb)
			src.verbs += typesof(/mob/Squad_Verbs/verb)
			src.verbs += /mob/Squad_Verbs/Special/verb/Squad4_Members
			src.insquad=1
			src.Squadrank="Captain"
			src.Squad="Four"
			return
	if(src.key in CaptainFive)
		if(src.Class=="Soul Reaper")
			src.verbs += typesof(/mob/Squad_Captain/verb)
			src.verbs += typesof(/mob/Squad_Verbs/verb)
			src.verbs += /mob/Squad_Verbs/Special/verb/Squad5_Members
			src.insquad=1
			src.Squadrank="Captain"
			src.Squad="Five"
			return
	if(src.key in CaptainSix)
		if(src.Class=="Soul Reaper")
			src.verbs += typesof(/mob/Squad_Captain/verb)
			src.verbs += typesof(/mob/Squad_Verbs/verb)
			src.verbs += /mob/Squad_Verbs/Special/verb/Squad6_Members
			src.insquad=1
			src.Squadrank="Captain"
			src.Squad="Six"
			return
	if(src.key in CaptainSeven)
		if(src.Class=="Soul Reaper")
			src.verbs += typesof(/mob/Squad_Captain/verb)
			src.verbs += typesof(/mob/Squad_Verbs/verb)
			src.verbs += /mob/Squad_Verbs/Special/verb/Squad7_Members
			src.insquad=1
			src.Squad="Seven"
			src.Squadrank="Captain"
			return
	if(src.key in CaptainEight)
		if(src.Class=="Soul Reaper")
			src.verbs += typesof(/mob/Squad_Captain/verb)
			src.verbs += typesof(/mob/Squad_Verbs/verb)
			src.verbs += /mob/Squad_Verbs/Special/verb/Squad8_Members
			src.insquad=1
			src.Squadrank="Captain"
			src.Squad="Eight"
			return
	if(src.key in CaptainNine)
		if(src.Class=="Soul Reaper")
			src.verbs += typesof(/mob/Squad_Captain/verb)
			src.verbs += typesof(/mob/Squad_Verbs/verb)
			src.verbs += /mob/Squad_Verbs/Special/verb/Squad9_Members
			src.insquad=1
			src.Squadrank="Captain"
			src.Squad="Nine"
			return
	if(src.key in CaptainTen)
		if(src.Class=="Soul Reaper")
			src.verbs += typesof(/mob/Squad_Captain/verb)
			src.verbs += typesof(/mob/Squad_Verbs/verb)
			src.verbs += /mob/Squad_Verbs/Special/verb/Squad10_Members
			src.insquad=1
			src.Squadrank="Captain"
			src.Squad="Ten"
			return
	if(src.key in CaptainEleven)
		if(src.Class=="Soul Reaper")
			src.verbs += typesof(/mob/Squad_Captain/verb)
			src.verbs += typesof(/mob/Squad_Verbs/verb)
			src.verbs += /mob/Squad_Verbs/Special/verb/Squad11_Members
			src.insquad=1
			src.Squadrank="Captain"
			src.Squad="Eleven"
			return
	if(src.key in CaptainTwelve)
		if(src.Class=="Soul Reaper")
			src.verbs += typesof(/mob/Squad_Captain/verb)
			src.verbs += typesof(/mob/Squad_Verbs/verb)
			src.verbs += /mob/Squad_Verbs/Special/verb/Squad12_Members
			src.insquad=1
			src.Squadrank="Captain"
			src.Squad="Twelve"
			return
	if(src.key in CaptainThirteen)
		if(src.Class=="Soul Reaper")
			src.verbs += typesof(/mob/Squad_Captain/verb)
			src.verbs += typesof(/mob/Squad_Verbs/verb)
			src.verbs += /mob/Squad_Verbs/Special/verb/Squad13_Members
			src.insquad=1
			src.Squadrank="Captain"
			src.Squad="Thirteen"
			return
	if(src.key in QuincyUno)
		if(src.Class=="Quincy")
			src.verbs += typesof(/mob/Squad_Captain/verb)
			src.verbs += typesof(/mob/Squad_Verbs/verb)
			src.verbs += /mob/Squad_Verbs/Special/verb/Quincy1_Members
			src.insquad=1
			src.Squadrank="Praetor"
			src.Squad="Quincy Brotherhood"
			return
	if(src.Squadrank=="Captain"||src.Squadrank=="Praetor")
		src.verbs-=typesof(/mob/Squad_Verbs/Special/verb)
		src.verbs -= typesof(/mob/Squad_Captain/verb)
		src.Squadrank="Member"
	if(src.Lieu==1)
		src.Squadrank="Lieutenant"
		src.verbs += /mob/Squad_Captain/verb/Squad_Announce
		src.verbs += typesof(/mob/Squad_Verbs/verb)
	else
		src.verbs-=typesof(/mob/Squad_Verbs/Special/verb)
		src.verbs -= typesof(/mob/Squad_Captain/verb)
		src.Squadrank="Member"
	if(src.key in Squad1)
		if(src.Class=="Soul Reaper")
			src.verbs += typesof(/mob/Squad_Verbs/verb)
			//src.verbs += /mob/Squad_Verbs/Special/verb/Squad1_Members
			src.insquad=1
			src.Squad="One"
			src.Squadrank=src.CustomRank
			return
	if(src.key in Squad2)
		if(src.Class=="Soul Reaper")
			src.verbs += typesof(/mob/Squad_Verbs/verb)
			//src.verbs += typesof(/mob/Squad_Verbs/Special/verb/Squad2_Members)
			src.insquad=1
			src.Squad="Two"
			src.Squadrank=src.CustomRank
			return
	if(src.key in Squad3)
		if(src.Class=="Soul Reaper")
			src.verbs += typesof(/mob/Squad_Verbs/verb)
			//src.verbs += typesof(/mob/Squad_Verbs/Special/verb/Squad3_Members)
			src.insquad=1
			src.Squad="Three"
			src.Squadrank=src.CustomRank
			return
	if(src.key in Squad4)
		if(src.Class=="Soul Reaper")
			src.verbs += typesof(/mob/Squad_Verbs/verb)
			//src.verbs += typesof(/mob/Squad_Verbs/Special/verb/Squad4_Members)
			src.insquad=1
			src.Squad="Four"
			src.Squadrank=src.CustomRank
			return
	if(src.key in Squad5)
		if(src.Class=="Soul Reaper")
			src.verbs += typesof(/mob/Squad_Verbs/verb)
			//src.verbs += typesof(/mob/Squad_Verbs/Special/verb/Squad5_Members)
			src.insquad=1
			src.Squad="Five"
			src.Squadrank=src.CustomRank
			return
	if(src.key in Squad6)
		if(src.Class=="Soul Reaper")
			src.verbs += typesof(/mob/Squad_Verbs/verb)
			//src.verbs += typesof(/mob/Squad_Verbs/Special/verb/Squad6_Members)
			src.insquad=1
			src.Squad="Six"
			src.Squadrank=src.CustomRank
			return
	if(src.key in Squad7)
		if(src.Class=="Soul Reaper")
			src.verbs += typesof(/mob/Squad_Verbs/verb)
			//src.verbs += typesof(/mob/Squad_Verbs/Special/verb/Squad7_Members)
			src.insquad=1
			src.Squad="Seven"
			src.Squadrank=src.CustomRank
			return
	if(src.key in Squad8)
		if(src.Class=="Soul Reaper")
			src.verbs += typesof(/mob/Squad_Verbs/verb)
			//src.verbs += typesof(/mob/Squad_Verbs/Special/verb/Squad8_Members)
			src.insquad=1
			src.Squad="Eight"
			src.Squadrank=src.CustomRank
			return
	if(src.key in Squad9)
		if(src.Class=="Soul Reaper")
			src.verbs += typesof(/mob/Squad_Verbs/verb)
			//src.verbs += typesof(/mob/Squad_Verbs/Special/verb/Squad9_Members)
			src.insquad=1
			src.Squad="Nine"
			src.Squadrank=src.CustomRank
			return
	if(src.key in Squad10)
		if(src.Class=="Soul Reaper")
			src.verbs += typesof(/mob/Squad_Verbs/verb)
			//src.verbs += typesof(/mob/Squad_Verbs/Special/verb/Squad10_Members)
			src.insquad=1
			src.Squad="Ten"
			src.Squadrank=src.CustomRank
			return
	if(src.key in Squad11)
		if(src.Class=="Soul Reaper")
			src.verbs += typesof(/mob/Squad_Verbs/verb)
			//src.verbs += typesof(/mob/Squad_Verbs/Special/verb/Squad11_Members)
			src.insquad=1
			src.Squad="Eleven"
			src.Squadrank=src.CustomRank
			return
	if(src.key in Squad12)
		if(src.Class=="Soul Reaper")
			src.verbs += typesof(/mob/Squad_Verbs/verb)
			//src.verbs += typesof(/mob/Squad_Verbs/Special/verb/Squad12_Members)
			src.insquad=1
			src.Squad="Twelve"
			src.Squadrank=src.CustomRank
			return
	if(src.key in Squad13)
		if(src.Class=="Soul Reaper")
			src.verbs += typesof(/mob/Squad_Verbs/verb)
			//src.verbs += typesof(/mob/Squad_Verbs/Special/verb/Squad13_Members)
			src.insquad=1
			src.Squad="Thirteen"
			src.Squadrank=src.CustomRank
			return
	if(src.key in Quincy1)
		if(src.Class=="Quincy")
			src.verbs += typesof(/mob/Squad_Verbs/verb)
			//src.verbs += typesof(/mob/Squad_Verbs/Special/verb/Squad13_Members)
			src.insquad=1
			src.Squad="Quincy Brotherhood"
			src.Squadrank=src.CustomRank
			return


var/list/Squad1=list()
var/list/Squad2=list()
var/list/Squad3=list()
var/list/Squad4=list()
var/list/Squad5=list()
var/list/Squad6=list()
var/list/Squad7=list()
var/list/Squad8=list()
var/list/Squad9=list()
var/list/Squad10=list()
var/list/Squad11=list()
var/list/Squad12=list()
var/list/Squad13=list()
var/list/Quincy1=list()


////Squad Bonuses//

mob/proc/Bonus_Check()
	if(src.Squad=="Quincy Brotherhood" && !src.Gotbonus0)
		src.STR+=20;src.MGC+=150;src.MGCDEF+=100;src.VIT+=50;src.LCK+=30;src.AGI+=50;src.MaxSTM+=500;src.MaxREI+=1000
		src.Gotbonus0=1
		src<<"<font color=red>You have gained extra stats/traits for joining the Quincy Brotherhood"
	if(src.Squad=="Quincy Brotherhood")
		if(src.Squadlevel==2)
			if(src.Gotbonus1==0)
				src.STR+=40;src.MGC+=300;src.MGCDEF+=250;src.VIT+=150;src.LCK+=100;src.AGI+=150;src.MaxSTM+=800;src.MaxREI+=2000
				src.Gotbonus1=1
				src<<"<font color=red>You have gained more stats/traits from raising your personal Squad Level!(STR +40, MGC + 300, MGCDEF +250, VIT + 150, LCK +100, AGI +150, STM + 800, REI + 2000)"
	if(src.Squad=="Quincy Brotherhood")
		if(src.Squadlevel==3)
			if(src.Gotbonus2==0)
				src.STR+=80;src.MGC+=500;src.MGCDEF+=500;src.VIT+=300;src.LCK+=200;src.AGI+=250;src.MaxSTM+=1000;src.MaxREI+=3000;src.Zanjutsu+=50;src.Hakuda+=50;src.Hohou+=50;src.Kidou+=50
				src.Gotbonus2=1
				src<<"<font color=red>You have gained additional traits from raising your personal Squad Level!(STR +80, MGC +500, MGCDEF +500, VIT +300, LCK + 200, AGI +250, STM +1000, REI + 3000 , All Traits +50)"
				src.Gotbonus1=0
	if(src.Squad=="Quincy Brotherhood")
		if(src.Squadlevel==4)
			if(src.Gotbonus3==0)
				src.STR+=100;src.MGC+=500;src.MGCDEF+=500;src.VIT+=300;src.LCK+=200;src.AGI+=350;src.MaxSTM+=1000;src.MaxREI+=4000;src.Zanjutsu+=50;src.Hakuda+=50;src.Hohou+=50;src.Kidou+=50
				src.Gotbonus3=1
				src<<"<font color=red>You have gained more stats/traits from raising your personal Squad Level!(STR +100, MGC +500, MGCDEF +500, VIT +300, LCK + 200, AGI +350, STM +1000, REI + 4000 , All Traits +50)"
				src.Gotbonus1=0;src.Gotbonus2=0
	if(src.Squad=="Quincy Brotherhood")
		if(src.Squadlevel==5)
			if(src.Gotbonus4==0)
				src.STR+=150;src.MGC+=600;src.MGCDEF+=1000;src.VIT+=300;src.LCK+=300;src.AGI+=400;src.MaxSTM+=2000;src.MaxREI+=5000;src.Zanjutsu+=100;src.Hakuda+=100;src.Hohou+=100;src.Kidou+=100
				src.Gotbonus4=1
				src<<"<font color=red>You have gained more stats/traits from raising your personal Squad Level!(STR +150, MGC +600, MGCDEF +1000, VIT +300, LCK + 300, AGI +400, STM +2000, REI + 5000 , All Traits +100)"
				src.Gotbonus1=0;src.Gotbonus2=0;src.Gotbonus3=0
	if(src.Squad=="One" && !src.Gotbonus0)
		src.STR+=20;src.MGC+=20;src.MGCDEF+=20;src.VIT+=20;src.LCK+=10;src.AGI+=10;src.MaxSTM+=250;src.MaxREI+=250
		src.Gotbonus0=1
		src<<"<font color=red>You have gained extra stats/traits for joining a Squad"
	if(src.Squad=="One")
		if(src.Squadlevel==2)
			if(src.Gotbonus1==0)
				src.STR+=40;src.MGC+=40;src.MGCDEF+=40;src.VIT+=40;src.LCK+=20;src.AGI+=40;src.MaxSTM+=500;src.MaxREI+=500
				src.Gotbonus1=1
				src<<"<font color=red>You have gained more stats/traits from raising your personal Squad Level!(Stats +20,MGDEF +20,AGI/LCK +10, Health and MAgic +500)"
	if(src.Squad=="One")
		if(src.Squadlevel==3)
			if(src.Gotbonus2==0)
				src.STR+=80;src.MGC+=80;src.MGCDEF+=80;src.VIT+=80;src.LCK+=60;src.AGI+=80;src.MaxSTM+=500;src.MaxREI+=500;src.Zanjutsu+=5;src.Hakuda+=5;src.Hohou+=5;src.Kidou+=5
				src.Gotbonus2=1
				src<<"<font color=red>You have gained additional traits from raising your personal Squad Level!(All stats +40, All Traits +5)"
				src.Gotbonus1=0
	if(src.Squad=="One")
		if(src.Squadlevel==4)
			if(src.Gotbonus3==0)
				src.STR+=100;src.MGC+=100;src.MGCDEF+=100;src.VIT+=100;src.LCK+=80;src.AGI+=100;src.MaxSTM+=900;src.MaxREI+=900;src.Zanjutsu+=8;src.Hakuda+=8;src.Hohou+=8;src.Kidou+=8
				src.Gotbonus3=1
				src<<"<font color=red>You have gained more stats/traits from raising your personal Squad Level!(Stats/MgcDef +20,Health and Magic +400,Traits +3)"
				src.Gotbonus1=0;src.Gotbonus2=0
	if(src.Squad=="One")
		if(src.Squadlevel==5)
			if(src.Gotbonus4==0)
				src.STR+=150;src.MGC+=150;src.MGCDEF+=150;src.VIT+=150;src.LCK+=130;src.AGI+=150;src.MaxSTM+=1300;src.MaxREI+=1300;src.Zanjutsu+=15;src.Hakuda+=15;src.Hohou+=15;src.Kidou+=15
				src.Gotbonus4=1
				src<<"<font color=red>You have gained more stats/traits from raising your personal Squad Level!(Stats/MgcDef +50,Health and Magic +400,Traits +7)"
				src.Gotbonus1=0;src.Gotbonus2=0;src.Gotbonus3=0
	if(src.Squad=="Two"&&!src.Gotbonus0)
		src.AGI+=100;src.MaxSTM+=300;src.MaxREI+=200
		src.Gotbonus0=1
		src<<"<font color=red>You have gained extra stats/traits for joining a Squad"
	if(src.Squad=="Two")
		if(src.Squadlevel==2)
			if(src.Gotbonus1==0)
				src.AGI+=250;src.MaxSTM+=600;src.MaxREI+=400
				src.Gotbonus1=1
				src<<"<font color=red>You have gained more stats/traits from raising your personal Squad Level!(AGI +150, Health +300, Rei+ 200)"
	if(src.Squad=="Two")
		if(src.Squadlevel==3)
			if(src.Gotbonus2==0)
				src.AGI+=250;src.MaxSTM+=600;src.MaxREI+=400;src.Hohou+=10
				src.Gotbonus2=1
				src<<"<font color=red>You have gained more traits from raising your personal Squad Level!(Hohou +10)"
				src.Gotbonus1=0
	if(src.Squad=="Two")
		if(src.Squadlevel==4)
			if(src.Gotbonus3==0)
				src.AGI+=250;src.MaxSTM+=900;src.MaxREI+=900;src.Hohou+=25
				src.Gotbonus3=1
				src<<"<font color=red>You have gained more stats/traits from raising your personal Squad Level!(Health +300, Rei +500, Hohou +15)"
				src.Gotbonus1=0;src.Gotbonus2=0
	if(src.Squad=="Two")
		if(src.Squadlevel==5)
			if(src.Gotbonus4==0)
				src.AGI+=300;src.MaxSTM+=1600;src.MaxREI+=1400;src.Hohou+=40;src.Hakuda+=10
				src.Gotbonus4=1
				src<<"<font color=red>You have gained more stats/traits from raising your personal Squad Level!(Health +700, Rei +500, Hohou +25, Hakuda + 10, AGI +50)"
				src.Gotbonus1=0;src.Gotbonus2=0;src.Gotbonus3=0
	if(src.Squad=="Three"&&!src.Gotbonus0)
		src.AGI+=50;src.MaxSTM+=500;src.LCK+=50;src.CritBonus+=5
		src.Gotbonus0=1
		src<<"<font color=red>You have gained extra stats/traits for joining a Squad"
	if(src.Squad=="Three")
		if(src.Squadlevel==2)
			if(src.Gotbonus1==0)
				src.AGI+=125;src.MaxSTM+=1000;src.LCK+=125;src.CritBonus+=10
				src.Gotbonus1=1
				src<<"<font color=red>You have gained more stats/traits from raising your personal Squad Level!(AGI+75, Health+500, LCK +75, Critical Bonus +5)"
	if(src.Squad=="Three")
		if(src.Squadlevel==3)
			if(src.Gotbonus2==0)
				src.AGI+=150;src.MaxSTM+=1000;src.LCK+=150;src.CritBonus+=20;src.Hakuda+=10
				src.Gotbonus2=1
				src<<"<font color=red>You have gained more stats/traits from raising your personal Squad Level!(AGI+25,Critical Bonus +10, Hakuda +10)"
				src.Gotbonus1=0
	if(src.Squad=="Three")
		if(src.Squadlevel==4)
			if(src.Gotbonus3==0)
				src.AGI+=175;src.MaxSTM+=1500;src.LCK+=175;src.CritBonus+=25;src.Hakuda+=20
				src.Gotbonus3=1
				src<<"<font color=red>You have gained more stats/traits from raising your personal Squad Level!(AGI+25, Health+500, LCK +25, Critical Bonus +5, Hakuda +10)"
				src.Gotbonus1=0;src.Gotbonus2=0
	if(src.Squad=="Three")
		if(src.Squadlevel==5)
			if(src.Gotbonus4==0)
				src.AGI+=175;src.MaxSTM+=2000;src.LCK+=175;src.CritBonus+=30;src.Hakuda+=30
				src.Gotbonus4=1
				src<<"<font color=red>You have gained more stats/traits from raising your personal Squad Level!(Health+500, Crit Bonus +5, Hakuda +10)"
				src.Gotbonus1=0;src.Gotbonus2=0;src.Gotbonus3=0
	if(src.Squad=="Four"&&!src.Gotbonus0)
		src.MGC+=50;src.MGCDEF+=50;src.MaxSTM+=300;src.MaxREI+=400
		src.Gotbonus0=1
		src<<"<font color=red>You have gained extra stats/traits for joining a Squad"
	if(src.Squad=="Four")
		if(src.Squadlevel==2)
			if(src.Gotbonus1==0)
				src.MGC+=125;src.MGCDEF+=125;src.MaxREI+=800;src.MaxSTM+=600
				src.Gotbonus1=1
				src<<"<font color=red>You have gained more stats/traits from raising your personal Squad Level!(MGC +75, MGCDEF +75, REI+400, Health +300 )"
	if(src.Squad=="Four")
		if(src.Squadlevel==3)
			if(src.Gotbonus2==0)
				src.MGC+=175;src.MGCDEF+=175;src.MaxREI+=1500;src.MaxSTM+=900;src.Kidou+=10;src.Hohou+=10
				src.Gotbonus2=1
				src<<"<font color=red>You have gained more stats/traits from raising your personal Squad Level!(MGC +50, MGCDEF +50, REI+700, Health +300, Kidou +10, Hohou +10)"
				src.Gotbonus1=0
	if(src.Squad=="Four")
		if(src.Squadlevel==4)
			if(src.Gotbonus3==0)
				src.MGC+=200;src.MGCDEF+=200;src.MaxREI+=2000;src.MaxSTM+=900;src.Kidou+=20;src.Hohou+=20
				src.Gotbonus3=1
				src<<"<font color=red>You have gained more stats/traits from raising your personal Squad Level!(MGC +25, MGCDEF +25, REI+500,  Kidou +10, Hohou +10)"
				src.Gotbonus1=0;src.Gotbonus2=0
	if(src.Squad=="Four")
		if(src.Squadlevel==5)
			if(src.Gotbonus4==0)
				src.MGC+=250;src.MGCDEF+=250;src.MaxREI+=2000;src.MaxSTM+=1200;src.Kidou+=40;src.Hohou+=25
				src.Gotbonus4=1
				src<<"<font color=red>You have gained more stats/traits from raising your personal Squad Level!(MGC +50, MGCDEF +50, Health +300,  Kidou +20, Hohou +5)"
				src.Gotbonus1=0;src.Gotbonus2=0;src.Gotbonus3=0
	if(src.Squad=="Five"&&!src.Gotbonus0)
		src.MGC+=80;src.MGCDEF+=20;src.MaxREI+=500;src.Kidou+=10
		src.Gotbonus0=1
		src<<"<font color=red>You have gained extra stats/traits for joining a Squad"
	if(src.Squad=="Five")
		if(src.Squadlevel==2)
			if(src.Gotbonus1==0)
				src.MGC+=200;src.MaxREI+=1000;src.MGCDEF+=50;src.Kidou+=15
				src.Gotbonus1=1
				src<<"<font color=red>You have gained extra stats/traits for joining a Squad!(MGC +120,REI +500,MGCDEF +30,Kidou +5"
	if(src.Squad=="Five")
		if(src.Squadlevel==3)
			if(src.Gotbonus2==0)
				src.MGC+=200;src.MaxREI+=2000;src.MGCDEF+=100;src.Kidou+=30
				src.Gotbonus2=1
				src<<"<font color=red>You have gained extra stats/traits for joining a Squad!(REI +1000,MGCDEF +70,Kidou +15"
				src.Gotbonus1=0
	if(src.Squad=="Five")
		if(src.Squadlevel==4)
			if(src.Gotbonus3==0)
				src.MGC+=300;src.MaxREI+=2500;src.MGCDEF+=100;src.Kidou+=45
				src.Gotbonus3=1
				src<<"<font color=red>You have gained extra stats/traits for joining a Squad!(MGC +100, REI +500,Kidou +15"
				src.Gotbonus1=0;src.Gotbonus2=0
	if(src.Squad=="Five")
		if(src.Squadlevel==5)
			if(src.Gotbonus4==0)
				src.MGC+=400;src.MaxREI+=3000;src.MGCDEF+=100;src.Kidou+=60;src.Hohou+=10
				src.Gotbonus4=1
				src<<"<font color=red>You have gained extra stats/traits for joining a Squad!(MGC +100, REI +500,Kidou +15, Hohou +10"
				src.Gotbonus1=0;src.Gotbonus2=0;src.Gotbonus3=0
	if(src.Squad=="Six"&&!src.Gotbonus0)
		src.MGC+=50;src.STR+=50;src.MaxSTM+=250;src.MaxREI+=250
		src.Gotbonus0=1
		src<<"<font color=red>You have gained extra stats/traits for joining a Squad"
	if(src.Squad=="Six")
		if(src.Squadlevel==2)
			if(src.Gotbonus1==0)
				src.MGC+=125;src.MaxREI+=500;src.MaxSTM+=500;src.STR+=125
				src.Gotbonus1=1
				src<<"<font color=red>You have gained extra stats/traits for joining a Squad!(MGC +75, REI +250, Health +250, STR + 75"
	if(src.Squad=="Six")
		if(src.Squadlevel==3)
			if(src.Gotbonus2==0)
				src.MGC+=150;src.MaxREI+=900;src.MaxSTM+=900;src.STR+=150;src.Kidou+=8;src.Zanjutsu+=8
				src.Gotbonus2=1
				src<<"<font color=red>You have gained extra stats/traits for joining a Squad!(MGC +25, REI +400, Health +400, STR + 25, Kidou +8, Zanjutsu +8"
				src.Gotbonus1=0
	if(src.Squad=="Six")
		if(src.Squadlevel==4)
			if(src.Gotbonus3==0)
				src.MGC+=175;src.MaxREI+=1500;src.MaxSTM+=1500;src.STR+=175;src.Kidou+=16;src.Zanjutsu+=16
				src.Gotbonus3=1
				src<<"<font color=red>You have gained extra stats/traits for joining a Squad!(MGC +25, REI +600, Health +700, STR + 25, Kidou +8, Zanjutsu +8"
				src.Gotbonus1=0;src.Gotbonus2=0
	if(src.Squad=="Six")
		if(src.Squadlevel==5)
			if(src.Gotbonus4==0)
				src.MGC+=225;src.MaxREI+=2000;src.MaxSTM+=2000;src.STR+=225;src.Kidou+=20;src.Zanjutsu+=20
				src.Gotbonus4=1
				src<<"<font color=red>You have gained extra stats/traits for joining a Squad!(MGC +50, REI +500, Health +500, STR + 50, Kidou +4, Zanjutsu +4"
				src.Gotbonus1=0;src.Gotbonus2=0;src.Gotbonus3=0
	if(src.Squad=="Seven"&&!src.Gotbonus0)
		src.LCK+=100;src.MaxREI+=250;src.MaxSTM+=250;src.DodgeBonus+=5
		src.Gotbonus0=1
		src<<"<font color=red>You have gained extra stats/traits for joining a Squad"
	if(src.Squad=="Seven")
		if(src.Squadlevel==2)
			if(src.Gotbonus1==0)
				src.LCK+=250;src.MaxREI+=500;src.MaxSTM+=500;src.DodgeBonus+=15;src.CritBonus+=10;src.Zanjutsu+=10
				src.Gotbonus1=1
				src<<"<font color=red>You have gained extra stats/traits for joining a Squad!(LCK +150, REI +250, Health +250, Dodge Bonus + 10, Zanjutsu +10, Crit Bonus+10)"
	if(src.Squad=="Seven")
		if(src.Squadlevel==3)
			if(src.Gotbonus2==0)
				src.LCK+=350;src.MaxREI+=1000;src.MaxSTM+=1000;src.DodgeBonus+=20;src.CritBonus+=15;src.Zanjutsu+=15
				src.Gotbonus2=1
				src<<"<font color=red>You have gained extra stats/traits for joining a Squad!(LCK +100, REI +500, Health +500, Dodge Bonus + 5, Zanjutsu +5, Crit Bonus+5)"
				src.Gotbonus1=0
	if(src.Squad=="Seven")
		if(src.Squadlevel==4)
			if(src.Gotbonus3==0)
				src.LCK+=450;src.MaxREI+=2000;src.MaxSTM+=2000;src.DodgeBonus+=25;src.CritBonus+=20;src.Zanjutsu+=20
				src.Gotbonus3=1
				src<<"<font color=red>You have gained extra stats/traits for joining a Squad!(LCK +100, REI +1000, Health +1000, Dodge Bonus + 5, Zanjutsu +5, Crit Bonus+5)"
				src.Gotbonus1=0;src.Gotbonus2=0
	if(src.Squad=="Seven")
		if(src.Squadlevel==5)
			if(src.Gotbonus4==0)
				src.LCK+=550;src.MaxREI+=2500;src.MaxSTM+=2500;src.DodgeBonus+=30;src.CritBonus+=25;src.Zanjutsu+=25
				src.Gotbonus4=1
				src<<"<font color=red>You have gained extra stats/traits for joining a Squad!(LCK +100, REI +500, Health +500, Dodge Bonus + 5, Zanjutsu +5, Crit Bonus+5)"
				src.Gotbonus1=0;src.Gotbonus2=0;src.Gotbonus3=0
	if(src.Squad=="Eight"&&!src.Gotbonus0)
		src.MGC+=60;src.MaxREI+=300;src.MaxSTM+=200;src.MGCDEF+=40
		src.Gotbonus0=1
		src<<"<font color=red>You have gained extra stats/traits for joining a Squad"
	if(src.Squad=="Eight")
		if(src.Squadlevel==2)
			if(src.Gotbonus1==0)
				src.MGC+=140;src.MaxREI+=600;src.MaxSTM+=400;src.MGCDEF+=140
				src.Gotbonus1=1
				src<<"<font color=red>You have gained extra stats/traits for joining a Squad!(MGC +80, MGCDEF +80, REI +300, Health +200)"
	if(src.Squad=="Eight")
		if(src.Squadlevel==3)
			if(src.Gotbonus2==0)
				src.MGC+=220;src.MaxREI+=1000;src.MaxSTM+=800;src.MGCDEF+=220;src.DodgeBonus+=15;src.Kidou+=15
				src.Gotbonus2=1
				src<<"<font color=red>You have gained extra stats/traits for joining a Squad!(MGC +80, MGCDEF +80, REI +400, Health +400, Dodge Bonus +15, Kidou +15)"
				src.Gotbonus1=0
	if(src.Squad=="Eight")
		if(src.Squadlevel==4)
			if(src.Gotbonus3==0)
				src.MGC+=280;src.MaxREI+=1500;src.MaxSTM+=1000;src.MGCDEF+=280;src.DodgeBonus+=20;src.Kidou+=30
				src.Gotbonus3=1
				src<<"<font color=red>You have gained extra stats/traits for joining a Squad!(MGC +60, MGCDEF +60, REI +500, Health +200, Dodge Bonus +5, Kidou +15)"
				src.Gotbonus1=0;src.Gotbonus2=0
	if(src.Squad=="Eight")
		if(src.Squadlevel==5)
			if(src.Gotbonus4==0)
				src.MGC+=340;src.MaxREI+=2000;src.MaxSTM+=1500;src.MGCDEF+=340;src.DodgeBonus+=25;src.Kidou+=45
				src.Gotbonus4=1
				src<<"<font color=red>You have gained extra stats/traits for joining a Squad!(MGC +60, MGCDEF +60, REI +500, Health +500, Dodge Bonus +5, Kidou +15)"
				src.Gotbonus1=0;src.Gotbonus2=0;src.Gotbonus3=0
	if(src.Squad=="Nine"&&!src.Gotbonus0)
		src.AGI+=75;src.MaxSTM+=500;src.LCK+=25;src.Hohou+=10
		src.Gotbonus0=1
		src<<"<font color=red>You have gained extra stats/traits for joining a Squad"
	if(src.Squad=="Nine")
		if(src.Squadlevel==2)
			if(src.Gotbonus1==0)
				src.AGI+=150;src.MaxSTM+=1000;src.LCK+=50;src.Hohou+=15
				src.Gotbonus1=1
				src<<"<font color=red>You have gained extra stats/traits for joining a Squad!(AGI +75, Hohou +15, LCK +25, Health +500)"
	if(src.Squad=="Nine")
		if(src.Squadlevel==3)
			if(src.Gotbonus2==0)
				src.AGI+=300;src.MaxSTM+=2000;src.LCK+=100;src.Hohou+=30
				src.Gotbonus2=1
				src<<"<font color=red>You have gained extra stats/traits for joining a Squad!(AGI +150, Hohou +15, LCK +50, Health +1000)"
				src.Gotbonus1=0
	if(src.Squad=="Nine")
		if(src.Squadlevel==4)
			if(src.Gotbonus3==0)
				src.AGI+=450;src.MaxSTM+=3000;src.LCK+=150;src.Hohou+=45
				src.Gotbonus3=1
				src<<"<font color=red>You have gained extra stats/traits for joining a Squad!(AGI +150, Hohou +15, LCK +50, Health +1000)"
				src.Gotbonus1=0;src.Gotbonus2=0
	if(src.Squad=="Nine")
		if(src.Squadlevel==5)
			if(src.Gotbonus4==0)
				src.AGI+=550;src.MaxSTM+=3500;src.LCK+=200;src.Hohou+=70
				src.Gotbonus4=1
				src<<"<font color=red>You have gained extra stats/traits for joining a Squad!(AGI +100, Hohou +25, LCK +50, Health +500)"
				src.Gotbonus1=0;src.Gotbonus2=0;src.Gotbonus3=0
	if(src.Squad=="Ten"&&!src.Gotbonus0)
		src.LCK+=50;src.STR+=25;src.MGC+=25;src.MaxSTM+=300;src.MaxREI+=200
		src.Gotbonus0=1
		src<<"<font color=red>You have gained extra stats/traits for joining a Squad"
	if(src.Squad=="Ten")
		if(src.Squadlevel==2)
			if(src.Gotbonus1==0)
				src.LCK+=110;src.STR+=60;src.MGC+=60;src.MaxSTM+=600;src.MaxREI+=400
				src.Gotbonus1=1
				src<<"<font color=red>You have gained extra stats/traits for joining a Squad!(LCK +60, STR +35, MGC +35, Health +300, Rei +300)"
	if(src.Squad=="Ten")
		if(src.Squadlevel==3)
			if(src.Gotbonus2==0)
				src.LCK+=180;src.STR+=120;src.MGC+=120;src.MaxSTM+=1000;src.MaxREI+=800;src.Kidou+=10;src.Zanjutsu+=10
				src.Gotbonus2=1
				src<<"<font color=red>You have gained extra stats/traits for joining a Squad!(LCK +70, STR +60, MGC +60, Health +400, Rei +400, Zanjutsu +10, Kidou +10)"
				src.Gotbonus1=0
	if(src.Squad=="Ten")
		if(src.Squadlevel==4)
			if(src.Gotbonus3==0)
				src.LCK+=260;src.STR+=180;src.MGC+=180;src.MaxSTM+=1500;src.MaxREI+=1300;src.Kidou+=20;src.Zanjutsu+=20
				src.Gotbonus3=1
				src<<"<font color=red>You have gained extra stats/traits for joining a Squad!(LCK +80, STR +60, MGC +60, Health +500, Rei +500, Zanjutsu +10, Kidou +10)"
				src.Gotbonus1=0;src.Gotbonus2=0
	if(src.Squad=="Ten")
		if(src.Squadlevel==5)
			if(src.Gotbonus4==0)
				src.LCK+=320;src.STR+=240;src.MGC+=240;src.MaxSTM+=2000;src.MaxREI+=1800;src.Kidou+=35;src.Zanjutsu+=35
				src.Gotbonus4=1
				src<<"<font color=red>You have gained extra stats/traits for joining a Squad!(LCK +60, STR +60, MGC +60, Health +500, Rei +500, Zanjutsu +15, Kidou +15)"
				src.Gotbonus1=0;src.Gotbonus2=0;src.Gotbonus3=0
	if(src.Squad=="Eleven"&&!src.Gotbonus0)
		src.STR+=100;src.MaxSTM+=500;src.Zanjutsu+=10
		src.Gotbonus0=1
		src<<"<font color=red>You have gained extra stats/traits for joining a Squad"
	if(src.Squad=="Eleven")
		if(src.Squadlevel==2)
			if(src.Gotbonus1==0)
				src.STR+=250;src.MaxSTM+=1000;src.Zanjutsu+=15
				src.Gotbonus1=1
				src<<"<font color=red>You have gained extra stats/traits for joining a Squad!(STR +150, STM +500, Zanjutsu +5)"
	if(src.Squad=="Eleven")
		if(src.Squadlevel==3)
			if(src.Gotbonus2==0)
				src.STR+=350;src.MaxSTM+=2000;src.Zanjutsu+=25
				src.Gotbonus2=1
				src<<"<font color=red>You have gained extra stats/traits for joining a Squad!(STR +100, STM +1000, Zanjutsu +10)"
				src.Gotbonus1=0
	if(src.Squad=="Eleven")
		if(src.Squadlevel==4)
			if(src.Gotbonus3==0)
				src.STR+=450;src.MaxSTM+=3000;src.Zanjutsu+=40
				src.Gotbonus3=1
				src<<"<font color=red>You have gained extra stats/traits for joining a Squad!(STR +100, STM +1000, Zanjutsu +10)"
				src.Gotbonus1=0;src.Gotbonus2=0
	if(src.Squad=="Eleven")
		if(src.Squadlevel==5)
			if(src.Gotbonus4==0)
				src.STR+=550;src.MaxSTM+=3500;src.Zanjutsu+=70
				src.Gotbonus4=1
				src<<"<font color=red>You have gained extra stats/traits for joining a Squad!(STR +100, STM +500, Zanjutsu +30)"
				src.Gotbonus1=0;src.Gotbonus2=0;src.Gotbonus3=0
	if(src.Squad=="Twelve"&&!src.Gotbonus0)
		src.LCK+=50;src.VIT+=25;src.MGCDEF+=25;src.MaxSTM+=250;src.MaxREI+=250
		src.Gotbonus0=1
		src<<"<font color=red>You have gained extra stats/traits for joining a Squad"
	if(src.Squad=="Twelve")
		if(src.Squadlevel==2)
			if(src.Gotbonus1==0)
				src.LCK+=110;src.VIT+=60;src.MGCDEF+=60;src.MaxSTM+=500;src.MaxREI+=500
				src.Gotbonus1=1
	if(src.Squad=="Twelve")
		if(src.Squadlevel==3)
			if(src.Gotbonus2==0)
				src.LCK+=150;src.VIT+=120;src.MGCDEF+=120;src.MaxSTM+=1000;src.MaxREI+=1000;src.Hohou+=10;src.DodgeBonus+=10
				src.Gotbonus2=1
				src<<"<font color=red>You have gained extra stats/traits for joining a Squad!(LCK +40,VIT + 60, MGCDEF +60, STM +500, REI +500, Hohou +10, Dodge Bonus +10)"
				src.Gotbonus1=0
	if(src.Squad=="Twelve")
		if(src.Squadlevel==4)
			if(src.Gotbonus3==0)
				src.LCK+=200;src.VIT+=200;src.MGCDEF+=200;src.MaxSTM+=1500;src.MaxREI+=1500;src.Hohou+=20;src.DodgeBonus+=20
				src.Gotbonus3=1
				src<<"<font color=red>You have gained extra stats/traits for joining a Squad!(LCK +50,VIT + 80, MGCDEF +80, STM +500, REI +500, Hohou +10, Dodge Bonus +10)"
				src.Gotbonus1=0;src.Gotbonus2=0
	if(src.Squad=="Twelve")
		if(src.Squadlevel==5)
			if(src.Gotbonus4==0)
				src.LCK+=250;src.VIT+=280;src.MGCDEF+=280;src.MaxSTM+=2000;src.MaxREI+=2000;src.Hohou+=30;src.DodgeBonus+=30
				src.Gotbonus4=1
				src<<"<font color=red>You have gained extra stats/traits for joining a Squad!(LCK +50,VIT + 80, MGCDEF +80, STM +500, REI +500, Hohou +10, Dodge Bonus +10)"
				src.Gotbonus1=0;src.Gotbonus2=0;src.Gotbonus3=0
	if(src.Squad=="Thirteen"&&!src.Gotbonus0)
		src.VIT+=50;src.MGCDEF+=50;src.MaxSTM+=250;src.MaxREI+=250;src.ShieldBonus+=5
		src.Gotbonus0=1
		src<<"<font color=red>You have gained extra stats/traits for joining a Squad"
	if(src.Squad=="Thirteen")
		if(src.Squadlevel==2)
			if(src.Gotbonus1==0)
				src.VIT+=125;src.MGCDEF+=125;src.MaxSTM+=700;src.MaxREI+=700;src.ShieldBonus+=6
				src.Gotbonus1=1
				src<<"<font color=red>You have gained extra stats/traits for joining a Squad!(VIT + 75, MGCDEF +75, STM +450, REI +450, Shield Bonus +6)"
	if(src.Squad=="Thirteen")
		if(src.Squadlevel==3)
			if(src.Gotbonus2==0)
				src.VIT+=225;src.MGCDEF+=225;src.MaxSTM+=1200;src.MaxREI+=1200;src.ShieldBonus+=6;src.Hohou+=10
				src.Gotbonus2=1
				src<<"<font color=red>You have gained extra stats/traits for joining a Squad!(VIT + 100, MGCDEF +100, STM +500, REI +500, Hohou +10)"
				src.Gotbonus1=0
	if(src.Squad=="Thirteen")
		if(src.Squadlevel==4)
			if(src.Gotbonus3==0)
				src.VIT+=325;src.MGCDEF+=325;src.MaxSTM+=1700;src.MaxREI+=1700;src.ShieldBonus+=6;src.Hohou+=20
				src.Gotbonus3=1
				src<<"<font color=red>You have gained extra stats/traits for joining a Squad!(VIT + 100, MGCDEF +100, STM +500, REI +500, Hohou +10)"
				src.Gotbonus1=0;src.Gotbonus2=0
	if(src.Squad=="Thirteen")
		if(src.Squadlevel==5)
			if(src.Gotbonus4==0)
				src.VIT+=400;src.MGCDEF+=400;src.MaxSTM+=2200;src.MaxREI+=2200;src.ShieldBonus+=6;src.Hohou+=40
				src.Gotbonus4=1
				src<<"<font color=red>You have gained extra stats/traits for joining a Squad!(VIT + 100, MGCDEF +100, STM +500, REI +500, Hohou +20)"
				src.Gotbonus1=0;src.Gotbonus2=0;src.Gotbonus3=0

mob/proc/Bonus_Removal()
	if(src.Squad=="Quincy Brotherhood"&&src.Gotbonus0==1)
		src.STR-=20;src.MGC-=150;src.MGCDEF-=100;src.VIT-=50;src.LCK-=30;src.AGI-=50;src.MaxSTM-=500;src.MaxREI-=1000
	if(src.Squad=="Quincy Brotherhood"&&src.Gotbonus1==1)
		src.STR-=40;src.MGC-=300;src.MGCDEF-=250;src.VIT-=150;src.LCK-=100;src.AGI-=150;src.MaxSTM-=800;src.MaxREI-=2000
	if(src.Squad=="Quincy Brotherhood"&&src.Gotbonus2==1)
		src.STR-=80;src.MGC-=500;src.MGCDEF-=500;src.VIT-=300;src.LCK-=200;src.AGI-=250;src.MaxSTM-=1000;src.MaxREI-=3000;src.Zanjutsu-=50;src.Hakuda-=50;src.Hohou-=50;src.Kidou-=50
	if(src.Squad=="Quincy Brotherhood"&&src.Gotbonus3==1)
		src.STR-=100;src.MGC-=500;src.MGCDEF-=500;src.VIT-=300;src.LCK-=200;src.AGI-=350;src.MaxSTM-=1000;src.MaxREI-=4000;src.Zanjutsu-=50;src.Hakuda-=50;src.Hohou-=50;src.Kidou-=50
	if(src.Squad=="Quincy Brotherhood"&&src.Gotbonus4==1)
		src.STR-=150;src.MGC-=600;src.MGCDEF-=1000;src.VIT-=300;src.LCK-=300;src.AGI-=400;src.MaxSTM-=2000;src.MaxREI-=5000;src.Zanjutsu-=100;src.Hakuda-=100;src.Hohou-=100;src.Kidou-=100
	if(src.Squad=="One"&&src.Gotbonus0==1)
		src.STR-=20;src.MGC-=20;src.MGCDEF-=20;src.VIT-=20;src.LCK-=10;src.AGI-=10;src.MaxSTM-=250;src.MaxREI-=250
	if(src.Squad=="One"&&src.Gotbonus1==1)
		src.STR-=40;src.MGC-=40;src.MGCDEF-=40;src.VIT-=40;src.LCK-=20;src.AGI-=40;src.MaxSTM-=500;src.MaxREI-=500
	if(src.Squad=="One"&&src.Gotbonus2==1)
		src.STR-=80;src.MGC-=80;src.MGCDEF-=80;src.VIT-=80;src.LCK-=60;src.AGI-=80;src.MaxSTM-=500;src.MaxREI-=500;src.Zanjutsu-=5;src.Hakuda-=5;src.Hohou-=5;src.Kidou-=5
	if(src.Squad=="One"&&src.Gotbonus3==1)
		src.STR-=100;src.MGC-=100;src.MGCDEF-=100;src.VIT-=100;src.LCK-=80;src.AGI-=100;src.MaxSTM-=900;src.MaxREI-=900;src.Zanjutsu-=8;src.Hakuda-=8;src.Hohou-=8;src.Kidou-=8
	if(src.Squad=="One"&&src.Gotbonus4==1)
		src.STR-=150;src.MGC-=150;src.MGCDEF-=150;src.VIT-=150;src.LCK-=130;src.AGI-=150;src.MaxSTM-=1300;src.MaxREI-=1300;src.Zanjutsu-=15;src.Hakuda-=15;src.Hohou-=15;src.Kidou-=15
	if(src.Squad=="Two"&&src.Gotbonus0==1)
		src.AGI-=100;src.MaxSTM-=300;src.MaxREI-=200
	if(src.Squad=="Two"&&src.Gotbonus1==1)
		src.AGI-=250;src.MaxSTM-=600;src.MaxREI-=400
	if(src.Squad=="Two"&&src.Gotbonus2==1)
		src.AGI-=250;src.MaxSTM-=600;src.MaxREI-=400;src.Hohou-=10
	if(src.Squad=="Two"&&src.Gotbonus3==1)
		src.AGI-=250;src.MaxSTM-=900;src.MaxREI-=900;src.Hohou-=25
	if(src.Squad=="Two"&&src.Gotbonus4==1)
		src.AGI-=300;src.MaxSTM-=1600;src.MaxREI-=1400;src.Hohou-=40;src.Hakuda-=10
	if(src.Squad=="Three"&&src.Gotbonus0==1)
		src.AGI-=50;src.MaxSTM-=500;src.LCK-=50;src.CritBonus-=5
	if(src.Squad=="Three"&&src.Gotbonus1==1)
		src.AGI-=125;src.MaxSTM-=1000;src.LCK-=125;src.CritBonus-=10
	if(src.Squad=="Three"&&src.Gotbonus2==1)
		src.AGI-=150;src.MaxSTM-=1000;src.LCK-=150;src.CritBonus-=20;src.Hakuda-=10
	if(src.Squad=="Three"&&src.Gotbonus3==1)
		src.AGI-=175;src.MaxSTM-=1500;src.LCK-=175;src.CritBonus-=25;src.Hakuda-=20
	if(src.Squad=="Three"&&src.Gotbonus4==1)
		src.AGI-=175;src.MaxSTM-=2000;src.LCK-=175;src.CritBonus-=30;src.Hakuda-=30
	if(src.Squad=="Four"&&src.Gotbonus0==1)
		src.MGC-=50;src.MGCDEF-=50;src.MaxSTM-=100;src.MaxREI-=400
	if(src.Squad=="Four"&&src.Gotbonus1==1)
		src.MGC-=125;src.MGCDEF-=125;src.MaxREI-=800;src.MaxSTM-=200
	if(src.Squad=="Four"&&src.Gotbonus2==1)
		src.MGC-=175;src.MGCDEF-=175;src.MaxREI-=1500;src.MaxSTM-=900;src.Kidou-=10;src.Hohou-=10
	if(src.Squad=="Four"&&src.Gotbonus3==1)
		src.MGC-=200;src.MGCDEF-=200;src.MaxREI-=2000;src.MaxSTM-=900;src.Kidou-=20;src.Hohou-=20
	if(src.Squad=="Four"&&src.Gotbonus4==1)
		src.MGC-=250;src.MGCDEF-=250;src.MaxREI-=2000;src.MaxSTM-=1200;src.Kidou-=40;src.Hohou-=25
	if(src.Squad=="Five"&&src.Gotbonus0==1)
		src.MGC-=80;src.MGCDEF-=20;src.MaxREI-=500;src.Kidou-=10
	if(src.Squad=="Five"&&src.Gotbonus1==1)
		src.MGC-=200;src.MaxREI-=1000;src.MGCDEF-=50;src.Kidou-=15
	if(src.Squad=="Five"&&src.Gotbonus2==1)
		src.MGC-=200;src.MaxREI-=2000;src.MGCDEF-=100;src.Kidou-=30
	if(src.Squad=="Five"&&src.Gotbonus3==1)
		src.MGC-=300;src.MaxREI-=2500;src.MGCDEF-=100;src.Kidou-=45
	if(src.Squad=="Five"&&src.Gotbonus4==1)
		src.MGC-=400;src.MaxREI-=3000;src.MGCDEF-=100;src.Kidou-=60;src.Hohou-=10
	if(src.Squad=="Six"&&src.Gotbonus0==1)
		src.MGC-=50;src.STR-=50;src.MaxSTM-=250;src.MaxREI-=250
	if(src.Squad=="Six"&&src.Gotbonus1==1)
		src.MGC-=125;src.MaxREI-=500;src.MaxSTM-=500;src.STR-=125
	if(src.Squad=="Six"&&src.Gotbonus2==1)
		src.MGC-=150;src.MaxREI-=900;src.MaxSTM-=900;src.STR-=150;src.Kidou-=8;src.Zanjutsu-=8
	if(src.Squad=="Six"&&src.Gotbonus3==1)
		src.MGC-=175;src.MaxREI-=1500;src.MaxSTM-=1500;src.STR-=175;src.Kidou-=16;src.Zanjutsu-=16
	if(src.Squad=="Six"&&src.Gotbonus4==1)
		src.MGC-=225;src.MaxREI-=2000;src.MaxSTM-=2000;src.STR-=225;src.Kidou-=20;src.Zanjutsu-=20
	if(src.Squad=="Seven"&&src.Gotbonus0==1)
		src.LCK-=100;src.MaxREI-=250;src.MaxSTM-=250;src.DodgeBonus-=5
	if(src.Squad=="Seven"&&src.Gotbonus1==1)
		src.LCK-=250;src.MaxREI-=500;src.MaxSTM-=500;src.DodgeBonus-=6
	if(src.Squad=="Seven"&&src.Gotbonus2==1)
		src.LCK-=350;src.MaxREI-=1000;src.MaxSTM-=1000;src.DodgeBonus-=20;src.CritBonus-=15;src.Zanjutsu-=15
	if(src.Squad=="Seven"&&src.Gotbonus3==1)
		src.LCK-=450;src.MaxREI-=2000;src.MaxSTM-=2000;src.DodgeBonus-=25;src.CritBonus-=20;src.Zanjutsu-=20
	if(src.Squad=="Seven"&&src.Gotbonus4==1)
		src.LCK-=550;src.MaxREI-=2500;src.MaxSTM-=2500;src.DodgeBonus-=30;src.CritBonus-=25;src.Zanjutsu-=25
	if(src.Squad=="Eight"&&src.Gotbonus0==1)
		src.MGC-=60;src.MaxREI-=300;src.MaxSTM-=200;src.MGCDEF-=40
	if(src.Squad=="Eight"&&src.Gotbonus1==1)
		src.MGC-=120;src.MaxREI-=600;src.MaxSTM-=400;src.MGCDEF-=140
	if(src.Squad=="Eight"&&src.Gotbonus2==1)
		src.MGC-=220;src.MaxREI-=1000;src.MaxSTM-=800;src.MGCDEF-=220;src.DodgeBonus-=15;src.Kidou-=15
	if(src.Squad=="Eight"&&src.Gotbonus3==1)
		src.MGC-=280;src.MaxREI-=1500;src.MaxSTM-=1000;src.MGCDEF-=280;src.DodgeBonus-=20;src.Kidou-=30
	if(src.Squad=="Eight"&&src.Gotbonus4==1)
		src.MGC-=340;src.MaxREI-=2000;src.MaxSTM-=1500;src.MGCDEF-=340;src.DodgeBonus-=25;src.Kidou-=45
	if(src.Squad=="Nine"&&src.Gotbonus0==1)
		src.AGI-=75;src.MaxSTM-=500;src.LCK-=25;src.Hohou-=10
	if(src.Squad=="Nine"&&src.Gotbonus1==1)
		src.AGI-=150;src.MaxSTM-=1000;src.LCK-=50;src.Hohou-=15
	if(src.Squad=="Nine"&&src.Gotbonus2==1)
		src.AGI-=300;src.MaxSTM-=2000;src.LCK-=100;src.Hohou-=30
	if(src.Squad=="Nine"&&src.Gotbonus3==1)
		src.AGI-=450;src.MaxSTM-=3000;src.LCK-=150;src.Hohou-=45
	if(src.Squad=="Nine"&&src.Gotbonus4==1)
		src.AGI-=550;src.MaxSTM-=3500;src.LCK-=200;src.Hohou-=70
	if(src.Squad=="Ten"&&src.Gotbonus0==1)
		src.LCK-=50;src.STR-=25;src.MGC=-25;src.MaxSTM-=300;src.MaxREI-=200
	if(src.Squad=="Ten"&&src.Gotbonus1==1)
		src.LCK-=110;src.STR-=60;src.MGC=-60;src.MaxSTM-=600;src.MaxREI-=400
	if(src.Squad=="Ten"&&src.Gotbonus2==1)
		src.LCK-=180;src.STR-=120;src.MGC-=120;src.MaxSTM-=1000;src.MaxREI-=800;src.Kidou-=10;src.Zanjutsu-=10
	if(src.Squad=="Ten"&&src.Gotbonus3==1)
		src.LCK-=260;src.STR-=180;src.MGC-=180;src.MaxSTM-=1500;src.MaxREI-=1300;src.Kidou-=20;src.Zanjutsu-=20
	if(src.Squad=="Ten"&&src.Gotbonus4==1)
		src.LCK-=320;src.STR-=240;src.MGC-=240;src.MaxSTM-=2000;src.MaxREI-=1800;src.Kidou-=35;src.Zanjutsu-=35
	if(src.Squad=="Eleven"&&src.Gotbonus0==1)
		src.STR-=100;src.MaxSTM-=500;src.Zanjutsu-=10
	if(src.Squad=="Eleven"&&src.Gotbonus1==1)
		src.STR-=250;src.MaxSTM-=1000;src.Zanjutsu-=15
	if(src.Squad=="Eleven"&&src.Gotbonus2==1)
		src.STR-=350;src.MaxSTM-=2000;src.Zanjutsu-=25
	if(src.Squad=="Eleven"&&src.Gotbonus3==1)
		src.STR-=450;src.MaxSTM-=3000;src.Zanjutsu-=40
	if(src.Squad=="Eleven"&&src.Gotbonus4==1)
		src.STR-=550;src.MaxSTM-=3500;src.Zanjutsu-=70
	if(src.Squad=="Twelve"&&src.Gotbonus0==1)
		src.LCK-=50;src.VIT-=25;src.MGCDEF-=25;src.MaxSTM-=250;src.MaxREI-=250
	if(src.Squad=="Twelve"&&src.Gotbonus1==1)
		src.LCK-=110;src.VIT-=60;src.MGCDEF-=60;src.MaxSTM-=500;src.MaxREI-=500
	if(src.Squad=="Twelve"&&src.Gotbonus2==1)
		src.LCK-=150;src.VIT-=120;src.MGCDEF-=120;src.MaxSTM-=1000;src.MaxREI-=1000;src.Hohou-=10;src.DodgeBonus-=10
	if(src.Squad=="Twelve"&&src.Gotbonus3==1)
		src.LCK-=200;src.VIT-=200;src.MGCDEF-=200;src.MaxSTM-=1500;src.MaxREI-=1500;src.Hohou-=20;src.DodgeBonus-=20
	if(src.Squad=="Twelve"&&src.Gotbonus4==1)
		src.LCK-=250;src.VIT-=280;src.MGCDEF-=280;src.MaxSTM-=2000;src.MaxREI-=2000;src.Hohou-=30;src.DodgeBonus-=30
	if(src.Squad=="Thirteen"&&src.Gotbonus0==1)
		src.VIT-=50;src.MGCDEF-=50;src.MaxSTM-=250;src.MaxREI-=250;src.ShieldBonus-=5
	if(src.Squad=="Thirteen"&&src.Gotbonus1==1)
		src.VIT-=125;src.MGCDEF-=125;src.MaxSTM-=500;src.MaxREI-=500;src.ShieldBonus-=6
	if(src.Squad=="Thirteen"&&src.Gotbonus2==1)
		src.VIT-=225;src.MGCDEF-=225;src.MaxSTM-=1200;src.MaxREI-=1200;src.ShieldBonus-=6;src.Hohou-=10
	if(src.Squad=="Thirteen"&&src.Gotbonus3==1)
		src.VIT-=325;src.MGCDEF-=325;src.MaxSTM-=1700;src.MaxREI-=1700;src.ShieldBonus-=6;src.Hohou-=20
	if(src.Squad=="Thirteen"&&src.Gotbonus4==1)
		src.VIT-=400;src.MGCDEF-=400;src.MaxSTM-=2200;src.MaxREI-=2200;src.ShieldBonus-=6;src.Hohou-=40

mob/proc/Bonus_Removal2()
	if(src.Squad=="Quincy Brotherhood"&&src.Gotbonus1==1)
		src.STR-=40;src.MGC-=300;src.MGCDEF-=250;src.VIT-=150;src.LCK-=100;src.AGI-=150;src.MaxSTM-=800;src.MaxREI-=2000
	if(src.Squad=="Quincy Brotherhood"&&src.Gotbonus2==1)
		src.STR-=80;src.MGC-=500;src.MGCDEF-=500;src.VIT-=300;src.LCK-=200;src.AGI-=250;src.MaxSTM-=1000;src.MaxREI-=3000;src.Zanjutsu-=50;src.Hakuda-=50;src.Hohou-=50;src.Kidou-=50
	if(src.Squad=="Quincy Brotherhood"&&src.Gotbonus3==1)
		src.STR-=100;src.MGC-=500;src.MGCDEF-=500;src.VIT-=300;src.LCK-=200;src.AGI-=350;src.MaxSTM-=1000;src.MaxREI-=4000;src.Zanjutsu-=50;src.Hakuda-=50;src.Hohou-=50;src.Kidou-=50
	if(src.Squad=="Quincy Brotherhood"&&src.Gotbonus4==1)
		src.STR-=150;src.MGC-=600;src.MGCDEF-=1000;src.VIT-=300;src.LCK-=300;src.AGI-=400;src.MaxSTM-=2000;src.MaxREI-=5000;src.Zanjutsu-=100;src.Hakuda-=100;src.Hohou-=100;src.Kidou-=100
	if(src.Squad=="One"&&src.Gotbonus1==1)
		src.STR-=40;src.MGC-=40;src.MGCDEF-=40;src.VIT-=40;src.LCK-=20;src.AGI-=40;src.MaxSTM-=500;src.MaxREI-=500
	if(src.Squad=="One"&&src.Gotbonus2==1)
		src.STR-=80;src.MGC-=80;src.MGCDEF-=80;src.VIT-=80;src.LCK-=60;src.AGI-=80;src.MaxSTM-=500;src.MaxREI-=500;src.Zanjutsu-=5;src.Hakuda-=5;src.Hohou-=5;src.Kidou-=5
	if(src.Squad=="One"&&src.Gotbonus3==1)
		src.STR-=100;src.MGC-=100;src.MGCDEF-=100;src.VIT-=100;src.LCK-=80;src.AGI-=100;src.MaxSTM-=900;src.MaxREI-=900;src.Zanjutsu-=8;src.Hakuda-=8;src.Hohou-=8;src.Kidou-=8
	if(src.Squad=="One"&&src.Gotbonus4==1)
		src.STR-=150;src.MGC-=150;src.MGCDEF-=150;src.VIT-=150;src.LCK-=130;src.AGI-=150;src.MaxSTM-=1300;src.MaxREI-=1300;src.Zanjutsu-=15;src.Hakuda-=15;src.Hohou-=15;src.Kidou-=15
	if(src.Squad=="Two"&&src.Gotbonus1==1)
		src.AGI-=250;src.MaxSTM-=600;src.MaxREI-=400
	if(src.Squad=="Two"&&src.Gotbonus2==1)
		src.AGI-=250;src.MaxSTM-=600;src.MaxREI-=400;src.Hohou-=10
	if(src.Squad=="Two"&&src.Gotbonus3==1)
		src.AGI-=250;src.MaxSTM-=900;src.MaxREI-=900;src.Hohou-=25
	if(src.Squad=="Two"&&src.Gotbonus4==1)
		src.AGI-=300;src.MaxSTM-=1600;src.MaxREI-=1400;src.Hohou-=40;src.Hakuda-=10
	if(src.Squad=="Three"&&src.Gotbonus1==1)
		src.AGI-=125;src.MaxSTM-=1000;src.LCK-=125;src.CritBonus-=10
	if(src.Squad=="Three"&&src.Gotbonus2==1)
		src.AGI-=150;src.MaxSTM-=1000;src.LCK-=150;src.CritBonus-=20;src.Hakuda-=10
	if(src.Squad=="Three"&&src.Gotbonus3==1)
		src.AGI-=175;src.MaxSTM-=1500;src.LCK-=175;src.CritBonus-=25;src.Hakuda-=20
	if(src.Squad=="Three"&&src.Gotbonus4==1)
		src.AGI-=175;src.MaxSTM-=2000;src.LCK-=175;src.CritBonus-=30;src.Hakuda-=30
	if(src.Squad=="Four"&&src.Gotbonus1==1)
		src.MGC-=125;src.MGCDEF-=125;src.MaxREI-=800;src.MaxSTM-=200
	if(src.Squad=="Four"&&src.Gotbonus2==1)
		src.MGC-=175;src.MGCDEF-=175;src.MaxREI-=1500;src.MaxSTM-=900;src.Kidou-=10;src.Hohou-=10
	if(src.Squad=="Four"&&src.Gotbonus3==1)
		src.MGC-=200;src.MGCDEF-=200;src.MaxREI-=2000;src.MaxSTM-=900;src.Kidou-=20;src.Hohou-=20
	if(src.Squad=="Four"&&src.Gotbonus4==1)
		src.MGC-=250;src.MGCDEF-=250;src.MaxREI-=2000;src.MaxSTM-=1200;src.Kidou-=40;src.Hohou-=25
	if(src.Squad=="Five"&&src.Gotbonus1==1)
		src.MGC-=200;src.MaxREI-=1000;src.MGCDEF-=50;src.Kidou-=15
	if(src.Squad=="Five"&&src.Gotbonus2==1)
		src.MGC-=200;src.MaxREI-=2000;src.MGCDEF-=100;src.Kidou-=30
	if(src.Squad=="Five"&&src.Gotbonus3==1)
		src.MGC-=300;src.MaxREI-=2500;src.MGCDEF-=100;src.Kidou-=45
	if(src.Squad=="Five"&&src.Gotbonus4==1)
		src.MGC-=400;src.MaxREI-=3000;src.MGCDEF-=100;src.Kidou-=60;src.Hohou-=10
	if(src.Squad=="Six"&&src.Gotbonus1==1)
		src.MGC-=125;src.MaxREI-=500;src.MaxSTM-=500;src.STR-=125
	if(src.Squad=="Six"&&src.Gotbonus2==1)
		src.MGC-=150;src.MaxREI-=900;src.MaxSTM-=900;src.STR-=150;src.Kidou-=8;src.Zanjutsu-=8
	if(src.Squad=="Six"&&src.Gotbonus3==1)
		src.MGC-=175;src.MaxREI-=1500;src.MaxSTM-=1500;src.STR-=175;src.Kidou-=16;src.Zanjutsu-=16
	if(src.Squad=="Six"&&src.Gotbonus4==1)
		src.MGC-=225;src.MaxREI-=2000;src.MaxSTM-=2000;src.STR-=225;src.Kidou-=20;src.Zanjutsu-=20
	if(src.Squad=="Seven"&&src.Gotbonus1==1)
		src.LCK-=250;src.MaxREI-=500;src.MaxSTM-=500;src.DodgeBonus-=6
	if(src.Squad=="Seven"&&src.Gotbonus2==1)
		src.LCK-=350;src.MaxREI-=1000;src.MaxSTM-=1000;src.DodgeBonus-=20;src.CritBonus-=15;src.Zanjutsu-=15
	if(src.Squad=="Seven"&&src.Gotbonus3==1)
		src.LCK-=450;src.MaxREI-=2000;src.MaxSTM-=2000;src.DodgeBonus-=25;src.CritBonus-=20;src.Zanjutsu-=20
	if(src.Squad=="Seven"&&src.Gotbonus4==1)
		src.LCK-=550;src.MaxREI-=2500;src.MaxSTM-=2500;src.DodgeBonus-=30;src.CritBonus-=25;src.Zanjutsu-=25
	if(src.Squad=="Eight"&&src.Gotbonus1==1)
		src.MGC-=120;src.MaxREI-=600;src.MaxSTM-=400;src.MGCDEF-=140
	if(src.Squad=="Eight"&&src.Gotbonus2==1)
		src.MGC-=220;src.MaxREI-=1000;src.MaxSTM-=800;src.MGCDEF-=220;src.DodgeBonus-=15;src.Kidou-=15
	if(src.Squad=="Eight"&&src.Gotbonus3==1)
		src.MGC-=280;src.MaxREI-=1500;src.MaxSTM-=1000;src.MGCDEF-=280;src.DodgeBonus-=20;src.Kidou-=30
	if(src.Squad=="Eight"&&src.Gotbonus4==1)
		src.MGC-=340;src.MaxREI-=2000;src.MaxSTM-=1500;src.MGCDEF-=340;src.DodgeBonus-=25;src.Kidou-=45
	if(src.Squad=="Nine"&&src.Gotbonus1==1)
		src.AGI-=150;src.MaxSTM-=1000;src.LCK-=50;src.Hohou-=15
	if(src.Squad=="Nine"&&src.Gotbonus2==1)
		src.AGI-=300;src.MaxSTM-=2000;src.LCK-=100;src.Hohou-=30
	if(src.Squad=="Nine"&&src.Gotbonus3==1)
		src.AGI-=450;src.MaxSTM-=3000;src.LCK-=150;src.Hohou-=45
	if(src.Squad=="Nine"&&src.Gotbonus4==1)
		src.AGI-=550;src.MaxSTM-=3500;src.LCK-=200;src.Hohou-=70
	if(src.Squad=="Ten"&&src.Gotbonus1==1)
		src.LCK-=110;src.STR-=60;src.MGC=-60;src.MaxSTM-=600;src.MaxREI-=400
	if(src.Squad=="Ten"&&src.Gotbonus2==1)
		src.LCK-=180;src.STR-=120;src.MGC-=120;src.MaxSTM-=1000;src.MaxREI-=800;src.Kidou-=10;src.Zanjutsu-=10
	if(src.Squad=="Ten"&&src.Gotbonus3==1)
		src.LCK-=260;src.STR-=180;src.MGC-=180;src.MaxSTM-=1500;src.MaxREI-=1300;src.Kidou-=20;src.Zanjutsu-=20
	if(src.Squad=="Ten"&&src.Gotbonus4==1)
		src.LCK-=320;src.STR-=240;src.MGC-=240;src.MaxSTM-=2000;src.MaxREI-=1800;src.Kidou-=35;src.Zanjutsu-=35
	if(src.Squad=="Eleven"&&src.Gotbonus1==1)
		src.STR-=250;src.MaxSTM-=1000;src.Zanjutsu-=15
	if(src.Squad=="Eleven"&&src.Gotbonus2==1)
		src.STR-=350;src.MaxSTM-=2000;src.Zanjutsu-=25
	if(src.Squad=="Eleven"&&src.Gotbonus3==1)
		src.STR-=450;src.MaxSTM-=3000;src.Zanjutsu-=40
	if(src.Squad=="Eleven"&&src.Gotbonus4==1)
		src.STR-=550;src.MaxSTM-=3500;src.Zanjutsu-=70
	if(src.Squad=="Twelve"&&src.Gotbonus1==1)
		src.LCK-=110;src.VIT-=60;src.MGCDEF-=60;src.MaxSTM-=500;src.MaxREI-=500
	if(src.Squad=="Twelve"&&src.Gotbonus2==1)
		src.LCK-=150;src.VIT-=120;src.MGCDEF-=120;src.MaxSTM-=1000;src.MaxREI-=1000;src.Hohou-=10;src.DodgeBonus-=10
	if(src.Squad=="Twelve"&&src.Gotbonus3==1)
		src.LCK-=200;src.VIT-=200;src.MGCDEF-=200;src.MaxSTM-=1500;src.MaxREI-=1500;src.Hohou-=20;src.DodgeBonus-=20
	if(src.Squad=="Twelve"&&src.Gotbonus4==1)
		src.LCK-=250;src.VIT-=280;src.MGCDEF-=280;src.MaxSTM-=2000;src.MaxREI-=2000;src.Hohou-=30;src.DodgeBonus-=30
	if(src.Squad=="Thirteen"&&src.Gotbonus1==1)
		src.VIT-=125;src.MGCDEF-=125;src.MaxSTM-=500;src.MaxREI-=500;src.ShieldBonus-=6
	if(src.Squad=="Thirteen"&&src.Gotbonus2==1)
		src.VIT-=225;src.MGCDEF-=225;src.MaxSTM-=1200;src.MaxREI-=1200;src.ShieldBonus-=6;src.Hohou-=10
	if(src.Squad=="Thirteen"&&src.Gotbonus3==1)
		src.VIT-=325;src.MGCDEF-=325;src.MaxSTM-=1700;src.MaxREI-=1700;src.ShieldBonus-=6;src.Hohou-=20
	if(src.Squad=="Thirteen"&&src.Gotbonus4==1)
		src.VIT-=400;src.MGCDEF-=400;src.MaxSTM-=2200;src.MaxREI-=2200;src.ShieldBonus-=6;src.Hohou-=40