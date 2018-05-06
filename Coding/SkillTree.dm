mob/proc/LoadSkillTree()
	for(var/obj/HUD/UnLearned_Skill/O in src.client.screen)	del O
	src.WriteLine(9,0,19,12,"SkillPoints","Skill Points: [src.SkillPoints]",1)
	src.ButtonGlow()
	var/turf/T=usr.client.eye
	for(var/obj/Skills/S in view(src.client.eye,10))
		for(var/obj/Skills/X in src.Skills)
			if(S.name==X.name)
				if(S.MaxLevel>1)
					var/obj/NO=new/obj/HUD/UnLearned_Skill(S.x-T.x+10,S.y-T.y+10)
					if(X.MaxLevel == 200)
						NO.icon_state="Level[round(X.Level/40)]"
						src.client.screen+=NO
					if(X.MaxLevel == 100)
						NO.icon_state="Level[round(X.Level/20)]"
						src.client.screen+=NO
					else
						NO.icon_state="Level[round(X.Level/10)]"
						src.client.screen+=NO
				goto AlreadyLearned
		var/obj/NO=new/obj/HUD/UnLearned_Skill(S.x-T.x+10,S.y-T.y+10)
		src.client.screen+=NO
		if(src.SkillPoints>=1)
			for(var/obj/SkillTree/Arrow/A in oview(1,S))
				if(A.dir==get_dir(A,S))
					var/turf/NS=get_step(A,get_dir(S,A))
					for(var/obj/Skills/X in NS)
						for(var/obj/Skills/Y in src.Skills)
							if(Y.name==X.name)	{NO.icon_state="Learnable";break}
		AlreadyLearned

mob/proc/LoadComboTree()
	for(var/obj/HUD/UnLearned_Skill/O in src.client.screen)	del O
	src.WriteLine(9,0,19,12,"SkillPoints","Skill Points: [src.SkillPoints]",1)
	src.ButtonGlow()
	for(var/obj/SkillTree/Combos/Combo/S in view(src.client.eye,10))
		if(S.name in src.ComboList)
		else
			var/turf/T=usr.client.eye
			var/obj/NO=new/obj/HUD/UnLearned_Skill(S.x-T.x+10,S.y-T.y+10)
			src.client.screen+=NO
			if(src.SkillPoints>=1)
				for(var/obj/SkillTree/Arrow/A in oview(1,S))
					if(A.dir==get_dir(A,S))
						for(var/obj/SkillTree/Combos/C in get_step(A,get_dir(S,A)))
							if(!ListCheck(C.name,src.ComboList))	goto NotLearnable
				if(S.ThisNum>=4)
					for(var/obj/Skills/SoulReaper/Combo/C in src.Skills)
						if(C.Level+3>=S.ThisNum)	NO.icon_state="Learnable"
				else	NO.icon_state="Learnable"
			NotLearnable

mob/proc/LoadKidouTree()
	for(var/obj/HUD/UnLearned_Skill/O in src.client.screen)	del O
	src.WriteLine(9,0,19,12,"SkillPoints","Skill Points: [src.SkillPoints]",1)
	src.ButtonGlow()
	var/turf/T=usr.client.eye
	for(var/obj/Kidous/S in view(src.client.eye,10))
		for(var/obj/Kidous/X in src.Kidous)
			if(S.name==X.name)
				if(S.MaxLevel>1)
					var/obj/NO=new/obj/HUD/UnLearned_Skill(S.x-T.x+10,S.y-T.y+10)
					if(X.MaxLevel == 200)
						NO.icon_state="Level[round(X.Level/40)]"
						src.client.screen+=NO
					if(X.MaxLevel == 100)
						NO.icon_state="Level[round(X.Level/20)]"
						src.client.screen+=NO
					else
						NO.icon_state="Level[round(X.Level/10)]"
						src.client.screen+=NO
				goto AlreadyLearned
		var/obj/NO=new/obj/HUD/UnLearned_Skill(S.x-T.x+10,S.y-T.y+10)
		src.client.screen+=NO
		if(src.SkillPoints>=1)
			if((round((S.KidouRank-10)/10)+1)*2<=src.Kidou)
				NO.icon_state="Learnable"
		AlreadyLearned

mob/proc/LoadSpellTree()
	for(var/obj/HUD/UnLearned_Skill/O in src.client.screen)	del O
	src.WriteLine(9,0,19,12,"SkillPoints","Skill Points: [src.SkillPoints]",1)
	src.ButtonGlow()
	var/turf/T=usr.client.eye
	for(var/obj/Spells/S in view(src.client.eye,10))
		for(var/obj/Spells/X in src.Spells)
			if(S.name==X.name)
				if(S.MaxLevel>1)
					var/obj/NO=new/obj/HUD/UnLearned_Skill(S.x-T.x+10,S.y-T.y+10)
					if(X.MaxLevel == 200)
						NO.icon_state="Level[round(X.Level/40)]"
						src.client.screen+=NO
					if(X.MaxLevel == 100)
						NO.icon_state="Level[round(X.Level/20)]"
						src.client.screen+=NO
					else
						NO.icon_state="Level[round(X.Level/10)]"
						src.client.screen+=NO
				goto AlreadyLearned
		var/obj/NO=new/obj/HUD/UnLearned_Skill(S.x-T.x+10,S.y-T.y+10)
		src.client.screen+=NO
		if(src.SkillPoints>=1)
			var/ArrowCount=0
			for(var/obj/SkillTree/Arrow/A in oview(1,S))
				if(A.dir==get_dir(A,S))
					ArrowCount+=1
					var/turf/NS=get_step(A,get_dir(S,A))
					for(var/obj/Spells/X in NS)
						for(var/obj/Spells/Y in src.Spells)
							if(Y.name==X.name)	{NO.icon_state="Learnable";break}
			if(!ArrowCount)
				for(var/obj/Spells/X in src.Spells)
					if(S.name==X.name)	{del NO;break}
				if(NO)	NO.icon_state="Learnable"
		AlreadyLearned


turf/SkillTreeBGs
	BaseBG
		icon='BasePng.png'
	SoulReaperBG
		icon='SoulReaper.png'
	Quincy
		icon='Quincy.png'
	Kidou
		icon='Kidou.png'
	Combo
		icon='Combo.png'
	Trait
		icon='Trait.png'

obj
	SkillTree
		icon='Skills.dmi'
		icon_state="Blue"
		var/SkillType="Combo"
		Arrow
			name=""
			icon_state="Arrow"
		StatLeveling
			Level_Button
				icon_state="MaxSTM"
				var/Amt2Level=10
				Click(location,control,params)
					if(usr.StatPoints>=1)
						var/listy[]=params2list(params)
						var/Amt2Add=1
						if(listy["shift"])
							Amt2Add=min(10,usr.StatPoints)
							if(Amt2Add!=min(10,usr.StatPoints))	return
						if(listy["ctrl"])
							Amt2Add=input("How many Points you Want to use?","Level [src.name]")as num
							if(Amt2Add!=min(Amt2Add,usr.StatPoints))	return
						for(var/obj/HUD/ButtonFlick/B in usr.client.screen)
							B.screen_loc=src.screen_loc;MyFlick("GetStat",B)
						usr.StatPoints-=Amt2Add
						usr.vars[src.icon_state]+=src.Amt2Level*Amt2Add
						usr.WriteStatScreen()
						usr.ReiBar()
						usr.StmBar()
						PlayMenuSound(usr,'OOT_MainMenu_Letter.wav')
						usr.HUDRefresh()
						usr.LevelOrbGlow()
			TraitUp
				icon_state="BlankBox"
				var/list/Stats2Level=list("MaxSTM")
				Click(location,control,params)
					if(usr.TraitPoints>=1)
						var/listy[]=params2list(params)
						var/Amt2Add=1

						if(listy["shift"])

							//if(src.name =="Training"&&!usr.Training+10 <= usr.TrainingCap)return
							//if(src.name =="Prodigy"&&!usr.Prodigy+10 <= usr.ProdigyCap)return
							Amt2Add=min(10,usr.TraitPoints)
							if(Amt2Add!=min(10,usr.TraitPoints))	return
						if(listy["ctrl"])
							Amt2Add=input("How many Points you Want to use?","Level [src.name]")as num
							//if(src.name =="Training"&&!usr.Training+Amt2Add <= usr.TrainingCap)return
							//if(src.name =="Prodigy"&&!usr.Prodigy+Amt2Add <= usr.ProdigyCap)return
							if(Amt2Add!=min(Amt2Add,usr.TraitPoints))	return
						for(var/obj/HUD/ButtonFlick/B in usr.client.screen)
							B.screen_loc=src.screen_loc;MyFlick("GetStat",B)
						//if(src.name =="Training"&&!usr.Training+Amt2Add <= usr.TrainingCap)return
						//if(src.name =="Prodigy"&&!usr.Prodigy+Amt2Add <= usr.ProdigyCap)return
						usr.TraitPoints-=Amt2Add
						usr.vars[src.name]+=Amt2Add
						var/FirstAmt=Amt2Add
						for(var/X in src.Stats2Level)
							Amt2Add=FirstAmt
							if(X=="MaxSTM"||X=="MaxREI")	Amt2Add*=10
							if(X=="Points")	Amt2Add=0
							usr.vars[X]+=Amt2Add
						usr.WriteTraitScreen()
						usr.ReiBar()
						usr.StmBar()
						PlayMenuSound(usr,'OOT_MainMenu_Letter.wav')
						usr.LevelCheck()
						usr.HUDRefresh()
						usr.LevelOrbGlow()
						usr.ButtonGlow()
		Combo_Button
			//CombosButton - skill tree tab
			icon_state="ComboButton"
			Click()
				if(usr.Class=="Bount")
					PlayMenuSound(usr,'Menu.wav')
					usr.client.eye=locate(67,124,2)
					usr.ClearHUD()
				else
					ShowAlert(usr,"Combo Tab Currently Obsolette Level up Combat Mastery for Extra Combos")
//				if(usr.Chatting)	return
//				if(usr.Class=="Soul Reaper" || usr.Class=="Hollow" || usr.Class=="Arrancar")
//					PlayMenuSound(usr,'Menu.wav')
//					usr.client.eye=locate(48,48,2)
//					usr.ClearHUD()
//					usr.LoadComboTree()
//				else	if(usr.Class=="Bount")
//					PlayMenuSound(usr,'Menu.wav')
//					usr.client.eye=locate(67,124,2)
//					usr.ClearHUD()
//				else	QuestShow(usr,"Combos not available to your Class")
		Skill_Button
			icon_state="Skills"
			Click()
				if(usr.Chatting)	return
				PlayMenuSound(usr,'Menu.wav')
				if(usr.Class=="Quincy")	usr.client.eye=locate(10,29,2)
				if(usr.Class=="Bount")	usr.client.eye=locate(48,124,2)
				if(usr.Class=="Soul Reaper")	usr.client.eye=locate(29,29,2)
				if(usr.Class=="Hollow"||usr.Class=="Arrancar")	usr.client.eye=locate(29,143,2)
				//if(usr.Class=="Arrancar")	usr.client.eye=locate(10,143,2)
				usr.ClearHUD()
				usr.LoadSkillTree()
		Trait_Button
			icon_state="Traits"
			Click()
				if(usr.Chatting)	return
				PlayMenuSound(usr,'Menu.wav')
				usr.client.eye=locate(29,48,2)
				usr.ClearHUD()
				usr.WriteTraitScreen()
		Stat_Button
			icon_state="Stats"
			Click()
				if(usr.Chatting)	return
				PlayMenuSound(usr,'Menu.wav')
				usr.client.eye=locate(10,48,2)
				usr.ClearHUD()
				usr.WriteStatScreen()
		Arts_Button
			icon_state="Arts"
			Click()
				if(usr.Chatting)	return
				PlayMenuSound(usr,'Menu.wav')
				usr.client.eye=locate(67,29,2)
				usr.ClearHUD()
				usr.LoadSkillTree()
		Kidou_Button
			icon='kidous.dmi'
			Click()
				if(usr.Chatting)	return
				if(usr.Class=="Soul Reaper")
					PlayMenuSound(usr,'Menu.wav')
					usr.client.eye=locate(67,48,2)
					usr.ClearHUD()
					usr.LoadKidouTree()
				else	QuestShow(usr,"Kidous not available to your Class")
		Silver_Tube_Button
			icon='SilverTube.dmi'
			Click()
				if(usr.Chatting)	return
				if(usr.Class=="Quincy")
					QuestShow(usr,"Silver Tube Still Under Construction")
				else	QuestShow(usr,"Silver Tube not available to your Class")
		Spells_Button
			icon='Spells.dmi'
			Click()
				if(usr.Chatting)	return
				PlayMenuSound(usr,'Menu.wav')
				usr.client.eye=locate(48,29,2)
				usr.ClearHUD()
				usr.LoadSpellTree()
		Combos
			Combo
				icon_state="Combo"
				SkillType="Combo"
				var/ThisKey="F"
				var/ThisNum=1
//				Click()
//					if(ShowAlert(usr,"[src.name] - [src.SkillType] > > [src.desc]",list("Learn","Close"))=="Learn")
//						if(usr.SkillPoints>=1)
//							usr.SkillPoints-=1
//							if(usr.Class=="Soul Reaper"||usr.Class=="Arrancar")
//								usr.ComboList+="F[src.Level+5]"
//							if(usr.Class=="Hollow")
//								usr.ComboList+="F[src.Level+3]"
//							else
//								usr.ComboList+="F[src.Level]"
//							PlayMenuSound(usr,'OOT_MainMenu_Select.wav')
//							usr.LoadComboTree()
//							usr.LevelOrbGlow()



				//New()
/*					if(src.x == 41  && src.y == 55 )
						src.ThisNum = 1
					if(src.x == 41  && src.y == 53 )
						src.ThisNum = 2
					if(src.x == 41  && src.y == 51)
						src.ThisNum = 3
					if(src.x == 41  && src.y == 49 )
						src.ThisNum = 4
					if(src.x == 41  && src.y == 47 )
						src.ThisNum = 5
					if(src.x == 41  && src.y == 45 )
						src.ThisNum = 6
					if(src.x == 41  && src.y == 43 )
						src.ThisNum = 7
					if(src.x == 43  && src.y == 43 )
						src.ThisNum = 8
					if(src.x == 43  && src.y == 45 )
						src.ThisNum = 9
					if(src.x == 43  && src.y == 47 )
						src.ThisNum = 10
					if(src.x == 43  && src.y == 49 )
						src.ThisNum = 11
					if(src.x == 43  && src.y == 51 )
						src.ThisNum = 12
					if(src.x == 43  && src.y == 53 )
						src.ThisNum = 13
					if(src.x == 43  && src.y == 55 )
						src.ThisNum = 14
					if(src.x == 45  && src.y == 55 )
						src.ThisNum = 15
					if(src.x == 45  && src.y == 53 )
						src.ThisNum = 16
					if(src.x == 45  && src.y == 51 )
						src.ThisNum = 17
					if(src.x == 45  && src.y == 49 )
						src.ThisNum = 18
					if(src.x == 45  && src.y == 47 )
						src.ThisNum = 19
					if(src.x == 45  && src.y == 45 )
						src.ThisNum = 20
					if(src.x == 45  && src.y == 43 )
						src.ThisNum = 21
					if(src.x == 47  && src.y == 43 )
						src.ThisNum = 22
					if(src.x == 47  && src.y == 45 )
						src.ThisNum = 23
					if(src.x == 47  && src.y == 47 )
						src.ThisNum = 24
					if(src.x == 47  && src.y == 49 )
						src.ThisNum = 25
					if(src.x == 47  && src.y == 51 )
						src.ThisNum = 26
					if(src.x == 47  && src.y == 53 )
						src.ThisNum = 27
					if(src.x == 47  && src.y == 55 )
						src.ThisNum = 28
					if(src.x == 49  && src.y == 55 )
						src.ThisNum = 29
					if(src.x == 49  && src.y == 53 )
						src.ThisNum = 30
					if(src.x == 49  && src.y == 51 )
						src.ThisNum = 31
					if(src.x == 49  && src.y == 49 )
						src.ThisNum = 32
					if(src.x == 49  && src.y == 47 )
						src.ThisNum = 33
					if(src.x == 49  && src.y == 45 )
						src.ThisNum = 34
					if(src.x == 49  && src.y == 43 )
						src.ThisNum = 35
					if(src.x == 51  && src.y == 43 )
						src.ThisNum = 36
					if(src.x == 51  && src.y == 45 )
						src.ThisNum = 37
					if(src.x == 51  && src.y == 47 )
						src.ThisNum = 38
					if(src.x == 51  && src.y == 49 )
						src.ThisNum = 39
					if(src.x == 51  && src.y == 51 )
						src.ThisNum = 40
					if(src.x == 51  && src.y == 53 )
						src.ThisNum = 41
					if(src.x == 51  && src.y == 55 )
						src.ThisNum = 42
					if(src.x == 53  && src.y == 55 )
						src.ThisNum = 43
					if(src.x == 53  && src.y == 53 )
						src.ThisNum = 44
					if(src.x == 53  && src.y == 51 )
						src.ThisNum = 45
					if(src.x == 53  && src.y == 49 )
						src.ThisNum = 46
					if(src.x == 53  && src.y == 47 )
						src.ThisNum = 47
					if(src.x == 53  && src.y == 45 )
						src.ThisNum = 48
					if(src.x == 53  && src.y == 43 )
						src.ThisNum = 49
					if(src.x == 55  && src.y == 43 )
						src.ThisNum = 50
					if(src.x == 55  && src.y == 45 )
						src.ThisNum = 51
					if(src.x == 55  && src.y == 47 )
						src.ThisNum = 52
					if(src.x == 55  && src.y == 49 )
						src.ThisNum = 53
					if(src.x == 55  && src.y == 51)
						src.ThisNum = 54
					if(src.x == 55  && src.y == 53 )
						src.ThisNum = 55
					//else
					//	src.ThisNum+=(src.x-41)/2-0.5
					src.name="[src.ThisKey][src.ThisNum]"
					var/obj/NO=new/obj();NO.icon='skills.dmi';NO.icon_state=src.ThisKey
					src.overlays+=NO
					if(src.ThisNum<=55)	src.desc="Extends [src.ThisKey] Key's Combo Chain to [src.ThisNum]"
					else	{SkillType="Finsher";src.desc="[src.ThisKey] Key's Deadly Chain Finisher"}
					return ..()

				Click()
					var/Learnable=0
					if(usr.SkillPoints>=1)
						for(var/obj/SkillTree/Arrow/A in oview(1,src))
							if(A.dir==get_dir(A,src))
								for(var/obj/SkillTree/Combos/C in get_step(A,get_dir(src,A)))
									if(!ListCheck(C.name,usr.ComboList))	goto NotLearnable
						if(src.ThisNum>=1)
							Learnable=1
							//for(var/obj/Skills/SoulReaper/Combat_Mastery/C in usr.Skills)
							//	if(C.Level>=src.ThisNum)	Learnable=1
						else	Learnable=1
					NotLearnable
					if(ListCheck(src.name,usr.ComboList) || usr.SkillPoints<=0)	Learnable=0
					if(Learnable==0)
						ShowAlert(usr,"[src.name] - [src.SkillType] > > [src.desc]",list("Close"))
					else
						if(ShowAlert(usr,"[src.name] - [src.SkillType] > > [src.desc]",list("Learn","Close"))=="Learn")
							if(usr.SkillPoints>=1)
								usr.SkillPoints-=1
								usr.ComboList+=src.name
								PlayMenuSound(usr,'OOT_MainMenu_Select.wav')
								usr.LoadComboTree()
								usr.LevelOrbGlow()
						*/