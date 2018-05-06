client //deano
	Del()
		/*for(var/I in src.images)	del I  ///these lines cause lag on player logout
		for(var/O in src.screen)
			if(!istype(O,/obj/Items))	del O*/
		if(src.mob)
			src.mob.Save()
			src.mob.LoggedOn=0
			src.mob.SaveLogonFile()
			src.mob.SavePlayerConfig()
			for(var/mob/Pets/P in src.mob.Pets)	del P
		return ..()

mob/var/LastX
mob/var/LastY
mob/var/LastZ

proc/FileExists(var/FE)
	if(fexists("Players/[copytext(ckey(FE),1,2)]/[FE].sav"))	return 1
	else	return 0
	//return	world.Export("byond://166.82.8.113:4440?FileExists[FE]")

mob/verb/SaveVerb()
	set hidden=1
	if(src.z==2)	return
	if(!usr.CanSave)
		usr<<"You can only save once every 5 Minutes."
		usr<<"The game will automaticaly save when you logout."
		return
	usr.CanSave=0
	usr.Save()
	usr<<"Game Saved"
	spawn(3000)	if(usr)	usr.CanSave=1

mob/verb/LogoutVerb()
	set hidden=1
	if(src.z==2)	return
	switch(input(src,"Are you certain you wish to logout from the game?.")in list("Yes","No"))
		if("Yes")
			src.Save()
			src<<"Game Saved"
			src<<"Logging out in 5 seconds"
			sleep(10)
			src<<"Logging out in 4 seconds"
			sleep(10)
			src<<"Logging out in 3 seconds"
			sleep(10)
			src<<"Logging out in 2 seconds"
			sleep(10)
			src<<"Thank you for playing Bleach Eternity: Zeus!"
			sleep(10)
			winset(usr, null, "command=.quit")
		if("No")
			return
mob/verb/ReconnectVerb()
	set hidden=1
	if(src.z==2)	return
	switch(input(src,"Are you certain you wish to reconnect the game?.")in list("Yes","No"))
		if("Yes")
			src.Save()
			src<<"Game Saved"
			src<<"Reconnecting in 5 seconds"
			sleep(10)
			src<<"Reconnecting in 4 seconds"
			sleep(10)
			src<<"Reconnecting in 3 seconds"
			sleep(10)
			src<<"Reconnecting in 2 seconds"
			sleep(10)
			src<<"Reconnecting in 1 seconds"
			sleep(10)
			winset(usr, null, "command=.reconnect")
		if("No")
			return


mob/proc
	SaveLogonFile()
		if(fexists("Logons/[ckey(src.key)].txt"))
			fdel("Logons/[ckey(src.key)].txt")
		var/savefile/F = new("Logons/[ckey(src.key)].txt")
		F["LoggedOn"]<<src.LoggedOn
	LoadLogonFile()
		if(fexists("Configs/[ckey(src.key)].txt"))
			var/savefile/F = new("Logons/[ckey(src.key)].txt")
			F["LoggedOn"]>>src.LoggedOn
		else
			src.SaveLogonFile()

	SavePlayerConfig()
		if(fexists("Configs/[ckey(src.key)].txt"))
			fdel("Configs/[ckey(src.key)].txt")
		var/savefile/F = new("Configs/[ckey(src.key)].txt")
		F["MusicVol"]<<src.MusicVol
		F["EffectVol"]<<src.EffectVol
		F["VoiceVol"]<<src.VoiceVol
		F["MenuVol"]<<src.MenuVol
		F["PMVol"]<<src.PMVol
		F["ExpDisplay"]<<src.ExpDisplay
		F["FontColor"]<<src.FontColor
		F["NameColor"]<<src.NameColor
		F["Bankaimsg"]<<src.Bankaimsg
		F["FontFace"]<<src.FontFace
		F["LoopMusic"]<<src.LoopMusic
		F["AllowPMs"]<<src.AllowPMs
		F["IgnoreList"]<<src.IgnoreList
	LoadPlayerConfig()
		if(fexists("Configs/[ckey(src.key)].txt"))
			var/savefile/F = new("Configs/[ckey(src.key)].txt")
			F["MusicVol"]>>src.MusicVol
			F["EffectVol"]>>src.EffectVol
			F["VoiceVol"]>>src.VoiceVol
			F["MenuVol"]>>src.MenuVol
			F["PMVol"]>>src.PMVol
			F["ExpDisplay"]>>src.ExpDisplay
			F["FontColor"]>>src.FontColor
			F["FontFace"]>>src.FontFace
			F["NameColor"]>>src.NameColor
			F["Bankaimsg"]>>src.Bankaimsg
			F["LoopMusic"]>>src.LoopMusic
			F["AllowPMs"]>>src.AllowPMs
			F["IgnoreList"]>>src.IgnoreList
			if(src.AllowPMs==null)	src.AllowPMs=1
			if(src.MenuVol==null)	src.MenuVol=100
			if(src.VoiceVol==null)	src.VoiceVol=100
			if(src.PMVol==null)	src.PMVol=100
			if(!src.FontColor)	src.FontColor=initial(src.FontColor)
			if(!src.FontFace)	src.FontFace=initial(src.FontFace)
			if(!src.NameColor)	src.NameColor=initial(src.NameColor)
		else
			//spawn()	ShowAlert(src,"Welcome, [src.name]! > > We hope you enjoy your experience here on Bleach Eternity: Reborn",list("Click"))
			src.SavePlayerConfig()

	Save()
		if(src.z==2)	return
		if(src.x==0 || src.y==0 || src.z==0)	src.loc=locate(169,32,3)
		for(var/obj/Skills/S in src.Skills)	S.overlays=initial(S.overlays)
		for(var/obj/Kidous/K in src.Kidous)	K.overlays=initial(K.overlays)
		for(var/obj/Spells/S in src.Spells)	S.overlays=initial(S.overlays)
		for(var/obj/I in src.Inventory)	I.overlays=initial(I.overlays)
		//Hack Detection
		/*var/Hacks=0
		if(LHD!=round((src.Level*3+7)/6))	Hacks+=1
		if(src.Nexp<100*src.Level)	Hacks+=1	//bugged with prodigy probably
		if(src.MaxSTM>300+100*src.Level)	Hacks+=1
		if(src.MaxREI>200+100*src.Level)	Hacks+=1
		if(src.STR>10*src.Level)	Hacks+=1
		if(src.STR>10*src.Level)	Hacks+=1
		if(src.STR>10*src.Level)	Hacks+=1
		if(src.STR>10*src.Level)	Hacks+=1
		if(Hacks!=0)
			world.log<<"[src.key]'s Character [src.name] has been Marked for Character Altering"
			src<<"Character Alterations Detected.  Character will not be Saved!";return*/
		if(fexists("Players/[copytext(ckey(src.key),1,2)]/[ckey(src.key)][src.SaveSlot].sav"))
			fdel("Players/[copytext(ckey(src.key),1,2)]/[ckey(src.key)][src.SaveSlot].sav")
		var/savefile/F = new("Players/[copytext(ckey(src.key),1,2)]/[ckey(src.key)][src.SaveSlot].sav")
		F["SaveVersion"]<<GameVersion
		F["LastX"]<<src.x
		F["LastY"]<<src.y
		F["LastZ"]<<src.z
		F["HairR"]<<src.HairR
		F["HairG"]<<src.HairG
		F["HairB"]<<src.HairB
		F["name"]<<src.name
		F["Level"]<<src.Level
		F["REI"]<<src.REI
		F["MaxREI"]<<src.MaxREI
		F["STM"]<<src.STM
		F["MaxSTM"]<<src.MaxSTM
		F["STR"]<<src.STR
		F["VIT"]<<src.VIT
		F["MGC"]<<src.MGC
		F["banked"]<<src.banked
		F["MGCDEF"]<<src.MGCDEF
		F["AGI"]<<src.AGI
		F["LCK"]<<src.LCK
		F["Gold"]<<src.Gold
		F["Platinum"]<<src.Platinum
		F["Rootie"]<<src.Rootie
		F["Silver"]<<src.Silver
		F["Copper"]<<src.Copper
		F["Exp"]<<src.Exp
		F["Credits"]<<src.Credits
		F["Converted"]<<src.Converted
		F["Badges"]<<src.Badges
		F["bBadges"]<<src.bBadges
		F["Credited"]<<src.Credited
		F["Nexp"]<<src.Nexp
		F["lvl51"]<<src.lvl51
		F["Deaths"]<<src.Deaths
		F["Kills"]<<src.Kills
		F["Expboost"]<<Expboost
		F["Leather"]<<src.Leather
		F["Iron"]<<src.Iron
		F["Thread"]<<src.Thread
		F["Adhesive"]<<src.Adhesive
		F["min"]<<src.min
		F["max"]<<src.max
		F["Bones"]<<src.Bones
		F["Mithril"]<<src.Mithril
		F["EnchatedOre"]<<src.EnchantedOre
		F["Gems"]<<src.Gems
		F["MeteorFragment"]<<src.MeteorFragment
		F["DivineOre"]<<src.DivineOre
		F["got20"]<<got20
		F["got40"]<<got40
		F["got60"]<<got60
		F["got80"]<<got80
		F["got100"]<<got100
		F["KillPoints"]<<src.KillPoints
		F["Honor"]<<src.Honor
		F["HonorBonus"]<<src.HonorBonus
		F["HonorSet"]<<src.HonorSet
		F["PvpKills"]<<src.PvpKills
		F["PvpDeaths"]<<src.PvpDeaths
		F["Class"]<<src.Class
		F["ClassLevel"]<<src.ClassLevel
		F["Skills"]<<src.Skills
		F["Kidous"]<<src.Kidous
		F["Spells"]<<src.Spells
		F["KillReset"]<<src.KillReset
		//F["GM"]<<src.GM
		F["ComboList"]<<src.ComboList
		F["StatPoints"]<<src.StatPoints
		F["TraitPoints"]<<src.TraitPoints
		F["SkillPoints"]<<src.SkillPoints
		F["StatusEffects"]<<src.StatusEffects
		F["HairStyle"]<<src.HairStyle
		F["guild_name"]<< guild_name
		F["guild_leader"]<<guild_leader
		F["guild_co_leader"]<<guild_co_leader
		F["guild_meber"]<<guild_member
		F["guild_rank"]<<guild_rank
		F["Squad"]<<src.Squad
		F["Squadrank"]<<src.Squadrank
		F["Lieu"]<<src.Lieu
		F["sexp"]<<sexp
		F["insquad"]<<src.insquad
		F["gotGift"]<<src.gotGift
		F["CustomRank"]<<src.CustomRank
		F["in_guild"]<<in_guild
		F["TutLevel"]<<src.TutLevel
		F["GainedSun"]<<src.GainedSun
		F["GainedEvoSun"]<<src.GainedEvoSun
		F["DodgeBonus"]<<src.DodgeBonus
		F["CritBonus"]<<src.CritBonus
		F["StmRegenBonus"]<<src.StmRegenBonus
		F["ReiRegenBonus"]<<src.ReiRegenBonus
		F["StmRegenCost"]<<src.StmRegenCost
		F["ImmunityBonus"]<<src.ImmunityBonus
		F["ArrCreateSpd"]<<src.ArrCreateSpd
		F["DistChargeSpd"]<<src.DistChargeSpd
		F["GuardBonus"]<<src.GuardBonus
		F["CounterBonus"]<<src.CounterBonus
		F["DoubleStrikeBonus"]<<src.DoubleStrikeBonus
		F["ShieldBonus"]<<src.ShieldBonus
		F["RespawnX"]<<src.RespawnX
		F["RespawnY"]<<src.RespawnY
		F["RespawnZ"]<<src.RespawnZ
		F["Zanjutsu"]<<src.Zanjutsu
		F["Hakuda"]<<src.Hakuda
		F["Kidou"]<<src.Kidou
		F["Hohou"]<<src.Hohou
		F["ezcheck2"]<<src.ezcheck2
		F["Prodigy"]<<src.Prodigy
		F["Training"]<<src.Training
		F["Manual"]<<src.Manual
		F["Income"]<<src.Income
		F["ChestList"]<<src.ChestList
		F["Dir"]<<src.dir
		F["Quests"]<<src.Quests
		F["CompletedQuests"]<<src.CompletedQuests
		F["VaiMask"]<<src.VaiMask
		F["CurSkill"]<<src.CurSkill
		F["ArrowType"]<<src.ArrowType
		F["SkillDmg"]<<src.SkillDmg
		F["SkillRei"]<<src.SkillRei
		F["HotKeys"]<<src.HotKeys
		F["VoiceSet"]<<src.VoiceSet
		F["Beastiary"]<<src.Beastiary
		F["PlayTime"]<<src.PlayTime
		F["Inventory"]<<src.Inventory
		//F["items"]<<src.bank
		F["ArenaRound"]<<src.ArenaRound
		F["ArenaBonus"]<<src.ArenaBonus
		F["RespecUses"]<<src.RespecUses
		F["BarberUses"]<<src.BarberUses
		F["Itemfixed"]<<src.Itemfixed
		F["hassafe"]<<src.hassafe
		F["VIPnow"]<<src.VIPnow
		F["VIP"]<<src.VIP
		F["Head"]<<src.Head
		F["Body"]<<src.Body
		F["Hand"]<<src.Hand
		F["Back"]<<src.Back
		F["Feet"]<<src.Feet
		F["Devour"]<<src.Devour
		F["ClothesR"]<<src.ClothesR
		F["ClothesG"]<<src.ClothesG
		F["ClothesB"]<<src.ClothesB
		F["LevelLog"]<<src.LevelLog
		F["jailed"]<<src.jailed
		F["MaxArrowCharges"]<<src.MaxArrowCharges
		F["AutoTargetFace"]<<src.AutoTargetFace
		F["AutoAttackFace"]<<src.AutoAttackFace
		F["AutoSkillFace"]<<src.AutoSkillFace
		F["Gotbonus0"]<<Gotbonus0
		F["Gotbonus1"]<<Gotbonus1
		F["Gotbonus2"]<<Gotbonus2
		F["Gotbonus3"]<<Gotbonus3
		F["Gotbonus4"]<<Gotbonus4
		F["badge100"]<<badge100
		F["badge200"]<<badge200
		F["badge300"]<<badge300
		F["badge400"]<<badge400
		F["badge500"]<<badge500
		F["badge750"]<<badge750
		F["boughtSTR"]<<boughtSTR
		F["boughtAGI"]<<boughtAGI
		F["boughtVIT"]<<boughtVIT
		F["boughtLCK"]<<boughtLCK
		F["boughtMGCDEF"]<<boughtMGCDEF
		F["boughtMGC"]<<boughtMGC
		F["boughtstats"]<<boughtstats
		F["Auctionban"]<<Auctionban
		F["onscreen"]<<src.onscreen
		F["Tickets"]<<src.Tickets
		for(var/mob/Pets/P in src.Pets)	P.overlays=null
		F["Pets"]<<src.Pets
		for(var/mob/Pets/P in src.Pets)
			P.AddName();P.StmBar();P.ReiBar()
		F["TransLocs"]<<src.TransLocs
		F["Squadlevel"]<<Squadlevel
		F["Squadexp"]<<Squadexp
		F["Squadnexp"]<<Squadnexp
		if(src.client.eye!=locate(67,10,2))	F["Zanpakuto"]<<src.Zanpakuto
		F["ZanpakutoOverlays"]<<src.ZanpakutoOverlays
		fcopy(F,"PlayersBackup/[copytext(ckey(src.key),1,2)]/[ckey(src.key)][src.SaveSlot].sav")
		src.SaveBank()
		//Used for Global Save
		/*src<<"Saving Game..."
		if(world.Export("byond://166.82.8.113:4440?[ckey(src.key)][src.SaveSlot]",F))	src<<"Game Saved"
		else	src<<"<b><font color=red>Error Contacting Save Server!"
		fdel("Players/[copytext(ckey(src.key),1,2)]/[ckey(src.key)][src.SaveSlot].sav")*/

mob/proc
	Load(var/savefile/F)
		//Used for Global Save
		/*if(!F)
			src<<"Loading Game..."
			F=world.Export("byond://166.82.8.113:4440?Load[ckey(src.key)][src.SaveSlot]")
			return*/

		F = new("Players/[copytext(ckey(src.key),1,2)]/[ckey(src.key)][src.SaveSlot].sav")
		F["SaveVersion"]>>src.SaveVersion
		if(src.SaveVersion< 1.00)
			src<<"Your Save file is Too Far out of Date. Please Create a new Character"
			return

		F["LastX"]>>src.LastX
		F["LastY"]>>src.LastY
		F["LastZ"]>>src.LastZ
		F["HairR"]>>src.HairR
		F["HairG"]>>src.HairG
		F["HairB"]>>src.HairB
		F["name"]>>src.name
		F["Level"]>>src.Level
		F["REI"]>>src.REI
		F["MaxREI"]>>src.MaxREI
		F["STM"]>>src.STM
		F["MaxSTM"]>>src.MaxSTM
		F["STR"]>>src.STR
		F["VIT"]>>src.VIT
		F["MGC"]>>src.MGC
		F["MGCDEF"]>>src.MGCDEF
		F["AGI"]>>src.AGI
		F["LCK"]>>src.LCK
		F["Gold"]>>src.Gold
		F["banked"]>>src.banked
		F["Platinum"]>>src.Platinum
		F["Rootie"]>>src.Rootie
		F["Silver"]>>src.Silver
		F["Copper"]>>src.Copper
		F["Exp"]>>src.Exp
		F["Nexp"]>>src.Nexp
		F["min"]>>src.min
		F["max"]>>src.max
		F["Deaths"]>>src.Deaths
		F["Kills"]>>src.Kills
		F["Honor"]>>src.Honor
		F["Devour"]>>src.Devour
		F["HonorBonus"]>>src.HonorBonus
		F["HonorSet"]>>src.HonorSet
		F["PvpKills"]>>src.PvpKills
		F["PvpDeaths"]>>src.PvpDeaths
		F["Class"]>>src.Class
		F["ClassLevel"]>>src.ClassLevel
		F["Skills"]>>src.Skills
		F["Kidous"]>>src.Kidous
		F["Spells"]>>src.Spells
		//F["GM"]>>src.GM
		F["ezcheck2"]>>src.ezcheck2
		F["KillPoints"]>>src.KillPoints
		F["Credits"]>>src.Credits
		F["Converted"]>>src.Converted
		F["Badges"]>>src.Badges
		F["bBadges"]>>src.bBadges
		F["lvl51"]>>src.lvl51
		F["Credited"]>>src.Credited
		F["ComboList"]>>src.ComboList
		F["StatPoints"]>>src.StatPoints
		F["TraitPoints"]>>src.TraitPoints
		F["SkillPoints"]>>src.SkillPoints
		F["StatusEffects"]>>src.StatusEffects
		F["HairStyle"]>>src.HairStyle
		F["TutLevel"]>>src.TutLevel
		F["DodgeBonus"]>>src.DodgeBonus
		F["Dir"]>>src.dir
		F["CustomRank"]>>src.CustomRank
		F["gotGift"]>>src.gotGift
		F["Quests"]>>src.Quests
		F["guild_name"]>> guild_name
		F["guild_leader"]>>guild_leader
		F["guild_co_leader"]>>guild_co_leader
		F["guild_meber"]>>guild_member
		F["guild_rank"]>>guild_rank
		F["in_guild"]>>in_guild
		F["Squad"]>>src.Squad
		F["Squadrank"]>>src.Squadrank
		F["Lieu"]>>src.Lieu
		F["insquad"]>>src.insquad
		F["Expboost"]>>Expboost
		F["VIPnow"]>>src.VIPnow
		F["VIP"]>>src.VIP
		F["got20"]>>got20
		F["got40"]>>got40
		F["got60"]>>got60
		F["got80"]>>got80
		F["got100"]>>got100
		F["Itemfixed"]>>src.Itemfixed
		F["hassafe"]>>src.hassafe
		F["GainedSun"]>>src.GainedSun
		F["GainedEvoSun"]>>src.GainedEvoSun
		F["DodgeBonus"]>>src.DodgeBonus
		F["CritBonus"]>>src.CritBonus
		F["StmRegenBonus"]>>src.StmRegenBonus
		F["ReiRegenBonus"]>>src.ReiRegenBonus
		F["StmRegenCost"]>>src.StmRegenCost
		F["ImmunityBonus"]>>src.ImmunityBonus
		F["ArrCreateSpd"]>>src.ArrCreateSpd
		F["DistChargeSpd"]>>src.DistChargeSpd
		F["GuardBonus"]>>src.GuardBonus
		F["CounterBonus"]>>src.CounterBonus
		F["DoubleStrikeBonus"]>>src.DoubleStrikeBonus
		F["ShieldBonus"]>>src.ShieldBonus
		F["RespawnX"]>>src.RespawnX
		F["RespawnY"]>>src.RespawnY
		F["RespawnZ"]>>src.RespawnZ
		F["Zanjutsu"]>>src.Zanjutsu
		F["Hakuda"]>>src.Hakuda
		F["Hohou"]>>src.Hohou
		F["Kidou"]>>src.Kidou
		F["Prodigy"]>>src.Prodigy
		F["KillReset"]>>src.KillReset
		F["Training"]>>src.Training
		F["Manual"]>>src.Manual
		F["Income"]>>src.Income
		F["ChestList"]>>src.ChestList
		F["CompletedQuests"]>>src.CompletedQuests
		F["VaiMask"]>>src.VaiMask
		F["ZanpakutoOverlays"]>>src.ZanpakutoOverlays
		F["CurSkill"]>>src.CurSkill
		F["ArrowType"]>>src.ArrowType
		F["SkillDmg"]>>src.SkillDmg
		F["SkillRei"]>>src.SkillRei
		F["Zanpakuto"]>>src.Zanpakuto
		F["HotKeys"]>>src.HotKeys
		F["VoiceSet"]>>src.VoiceSet
		F["Gotbonus0"]>>Gotbonus0
		F["Gotbonus1"]>>Gotbonus1
		F["Gotbonus2"]>>Gotbonus2
		F["Gotbonus3"]>>Gotbonus3
		F["Gotbonus4"]>>Gotbonus4
		F["Leather"]>>src.Leather
		F["Iron"]>>src.Iron
		F["Thread"]>>src.Thread
		F["Adhesive"]>>src.Adhesive
		F["Bones"]>>src.Bones
		F["Mithril"]>>src.Mithril
		F["EnchatedOre"]>>src.EnchantedOre
		F["Gems"]>>src.Gems
		F["MeteorFragment"]>>src.MeteorFragment
		F["DivineOre"]>>src.DivineOre
		F["boughtSTR"]>>boughtSTR
		F["boughtAGI"]>>boughtAGI
		F["boughtVIT"]>>boughtVIT
		F["boughtLCK"]>>boughtLCK
		F["boughtMGCDEF"]>>boughtMGCDEF
		F["boughtMGC"]>>boughtMGC
		F["boughtstats"]>>boughtstats
		F["Beastiary"]>>src.Beastiary
		F["PlayTime"]>>src.PlayTime
		F["Inventory"]>>src.Inventory
		F["items"]>>src.bank
		F["ArenaBonus"]>>src.ArenaBonus
		F["ArenaRound"]>>src.ArenaRound
		F["RespecUses"]>>src.RespecUses
		F["BarberUses"]>>src.BarberUses
		F["jailed"]>>src.jailed
		F["Head"]>>src.Head
		F["Body"]>>src.Body
		F["Hand"]>>src.Hand
		F["Back"]>>src.Back
		F["Feet"]>>src.Feet
		src.EquipmentList+=Head
		src.EquipmentList+=Body;src.EquipmentList+=Hand
		src.EquipmentList+=Back;src.EquipmentList+=Feet
		F["ClothesR"]>>src.ClothesR
		F["ClothesG"]>>src.ClothesG
		F["ClothesB"]>>src.ClothesB
		F["LevelLog"]>>src.LevelLog
		F["MaxArrowCharges"]>>src.MaxArrowCharges
		F["Pets"]>>src.Pets
		F["TransLocs"]>>src.TransLocs
		F["AutoTargetFace"]>>src.AutoTargetFace
		F["AutoAttackFace"]>>src.AutoAttackFace
		F["AutoSkillFace"]>>src.AutoSkillFace
		F["Auctionban"]>>Auctionban
		F["onscreen"]>>src.onscreen
		F["Squadlevel"]>>Squadlevel
		F["Squadexp"]>>Squadexp
		F["Squadnexp"]>>Squadnexp
		F["sexp"]>>sexp
		F["badge100"]>>badge100
		F["badge200"]>>badge200
		F["badge300"]>>badge300
		F["badge400"]>>badge400
		F["badge500"]>>badge500
		F["badge750"]>>badge750
		F["Tickets"]>>src.Tickets
		src.LoadBank()
		src.SubExpirationCheck()
		src.icon='school.dmi'
		if(!usr.Giftcd)
			usr.Giftcd=0
		if(!src.banked)
			src.banked=0
		if(!usr.bank)
			usr.bank = new/BankClass
		if(src.gender==FEMALE)	src.icon='SchoolFemale.dmi'
		src.LHD=round((src.Level*3+7)/6)
		src.GM=0
		//src.DamageIcon=src.icon+rgb(255,0,0)
		//src.GuardIcon=src.icon+rgb(155,155,155)
		//src.Check_GM()
		if(src.key=="Nikorayu")
			src.GM=3
		if(src.key=="Millamber" || src.key=="Oreldwin")
			src.GM=4
		if(src.Squadreset!=1)
			src.insquad=0
			src.Squadrank=""
			src.Squad=""
			src.Squadreset=1
		src.staffCheck()
		src.SquadCheck()
		if(src.insquad)	src.Give_Squad_Verbs();src.Bonus_Check()
		src.Give_Guild_Verbs()
		src.AddName()
		src.LoadVoiceSet()
		src.AddHair(src.HairStyle)
		for(var/obj/Items/Equipment/E in src.EquipmentList)	E.OnEquip(src)
		for(var/datum/StatusEffects/RadialEffects/E in src.StatusEffects)	E.AddOverlays(src)
		src.HUD()
		src.QuestRefresh()
		src.RefreshClothes()
		src.loc=locate(src.LastX,src.LastY,src.LastZ)
		src.invisibility=0
		if(src.onscreen==null)
			src.onscreen=0
		if(src.KillReset!=MBround)
			src.KillPoints=0
			src.KillReset = MBround
		if(src.Converted<1)
			src.Badges+=(src.Credits/500)
			src.Converted=1
//		for(var/obj/Items/Equipment/Head/The_Deceiver/S in src.EquipmentList)
//			if(S)
//				src.invisibility=1
//				src.see_invisible=1
		//src.EnemyStart(EnemyHuntRange,src.loc)
		for(var/obj/Skills/Universal/Flash_Step/S in src.Skills)	src.CanShunpo=1
		for(var/obj/Skills/SoulReaper/Shikai/S in src.Skills)
			if(!src.Zanpakuto)	src.ZanCreation()
		for(var/obj/Skills/Shikais/S in src.Skills)	src.ShikaiSkills+=S
		for(var/obj/Skills/Bankais/S in src.Skills)	src.BankaiSkills+=S
		for(var/obj/Skills/FinalForm/S in src.Skills)	src.FinalFormSkills+=S
		for(var/obj/Items/I in src.Inventory)	I.UpdateCount()
		for(var/mob/Pets/P in src.Pets)
			P.Owner=src;P.AddName()
		src.CreatePlayerIcon()
		src<<"Load Complete"
		src.SaveFixes()
		src.checkvip()
		if(src.SaveVersion<0.99)	return
		while(src && src.invisibility)	sleep(1)
		if(src.ArenaRound)
			src.ArenaRound-=1
			src.ArenaBonus-=1*src.ArenaRound
			spawn()	src.StartArena()
			src<<"Resuming Arena Match..."
		for(var/datum/StatusEffects/RadialEffects2/E in src.StatusEffects)
			if(E.name=="Battlefield Layout" && E.CastBy=="[src]")
				E.RemovalProc(src)
		if(src.Squadlevel=="0" || src.Squadlevel==null)
			src.Squadlevel=1
		if(src.Expboost<1)
			src.Expboost=1
		if(src.z==25 || src.z==26)
			src.verbs+= /mob/Squad_House/verb/Squad_House_Leave
		SkillTour=0
		src.ItemFixes()
		SaveConfig()

mob/proc/SaveFixes()
	if(!src.TransLocs)	src.TransLocs=list()
	if(!usr.selecting) usr.selecting=0
	if(!src.Tickets)	src.Tickets=list()
	if(src.SaveVersion<=0.99 && src.Pets)	while(src.Pets.len>=2)
		for(var/mob/Pets/P in src.Pets)
			src.Pets-=P;del P;break
	if(src.SaveVersion<0.99 && src.RespawnZ!=1)
		src.RespawnX=169
		src.RespawnY=32
		src.RespawnZ=3
		src<<"<b><font color=red>Your Respawn Location has been Reset due to a Recent Update"
	if(src.SaveVersion<0.99)
		for(var/mob/Pets/P in src.Pets)	P.ApplyStats()
	if(src.SaveVersion<0.99)	//Respec
		src.Respec();src.OnLevelScreen=1
		src.ClearHUD()
		if(src.Class=="Quincy")	src.client.eye=locate(10,29,2)
		if(src.Class=="Bount")	src.client.eye=locate(48,124,2)
		if(src.Class=="Soul Reaper")	src.client.eye=locate(29,29,2)
		src.invisibility=1;src.LoadSkillTree()
		ShowAlert(src,"Your Character has been Respecced due to a Recent Update. > Use this time to ReAllocate your Points. \
			> > Note: If you hold Shift when distributing Stat and/or Trait points you can use up to 10 points at once.")
	if(src.AutoTargetFace==null)
		src.AutoTargetFace=1
		src.AutoAttackFace=1
		src.AutoSkillFace=1
	if(src.SaveVersion<0.99)
		src.PvpKills=0;src.PvpDeaths=0;src.Honor=0
		src<<"<b><font color=red>Your PVP Stats have been Reset due to a Recent Update"
	if(src.Gold<0||src.Silver<0||src.Copper<0)
		world.log<<"Gold Fix / [src.key] / [src.Gold]g [src.Silver]s [src.Copper]c"
		if(src.Gold<0)	src.Gold=0
		if(src.Silver<0)	src.Silver=0
		if(src.Copper<0)	src.Copper=0
	if(src.VIP<0)
		src.VIP=0
	if(src.RespawnZ!=1)	src.TutLevel=5
	if(!src.MaxArrowCharges)	src.MaxArrowCharges=1

mob/proc/ItemFixes()
	if(src.Itemfixed<=0)
		src.Itemfixed=1
		for(var/obj/Items/Equipment/R in src.EquipmentList)
			R.UnEquip(src)
			src.GetItem2(R)
		for(var/obj/Items/Equipment/S in src.Inventory)
			var/obj/Items/X = new S.type
			for(var/obj/Items/N in usr.Inventory)
				if(S==N)
					N.Discard(1)
			src.GetItem2(X)
		src<<"Your items were out of date, new ones have been deposited in your bank"


mob/proc/CreatePlayerIcon()
	var/icon/I='SoulReaper.dmi'
	if(src.Class=="Quincy")	I='Quincy.dmi'
	if(src.Class=="Bount")
		if(src.gender!="female")	I='School.dmi'
		else	I='SchoolFemale.dmi'
	src.PlayerIcon=new(I,icon_state="",dir=SOUTH);src.PlayerIcon.Shift(SOUTH,9,0)
	var/icon/I2
	if(src.HairOver)	I2=new(src.HairOver.icon,icon_state="",dir=SOUTH)
	src.PlayerIcon.Blend(I2,ICON_OVERLAY)