datum/DamageKeeper
	var/mob/Dealer
	var/TotalDamage=0

mob/proc
	TrackDamage(var/mob/M,var/Damage)
		for(var/datum/DamageKeeper/K in src.Damagers)
			if(K.Dealer==M)
				K.TotalDamage+=Damage;return
		var/datum/DamageKeeper/K=new()
		K.Dealer=M;K.TotalDamage=Damage
		src.Damagers+=K
	FindMaxDamager()
		var/MaxDamage=0
		var/mob/MaxDamager
		for(var/datum/DamageKeeper/K in src.Damagers)
			if(K.TotalDamage>=MaxDamage && K.Dealer)
				MaxDamager=K.Dealer;MaxDamage=K.TotalDamage
		return MaxDamager

datum/EnemySpoils
	var/ItemPath="/obj/Items/Potions/Energy_Drink"
	var/DropRate=10
	var/Quest
	New(var/NewPath,var/NewDropRate,var/NewQuest)
		if(NewPath)	src.ItemPath=NewPath
		if(NewDropRate) src.DropRate=NewDropRate
		if(NewQuest) src.Quest=NewQuest
datum/EnemyRares
	var/ItemPath="/obj/Items/Potions/Energy_Drink"
	var/DropRate=1
	var/Quest
	New(var/NewPath,var/NewDropRate,var/NewQuest)
		if(NewPath)	src.ItemPath=NewPath
		if(NewDropRate) src.DropRate=NewDropRate
		if(NewQuest) src.Quest=NewQuest
mob/proc/LevelShiftEnemy(var/mob/Enemy/E)
	//E.LevelShift(round((initial(E.Level)+src.Level)/2))
	//if(E.name=="Supreme Grand Wasp") return
	if(src.Level>E.Level)
		if(src.Level>70 && E.Level>=40)
			E.LevelShift(src.Level)
		else
			E.LevelShift()
		if(istype(E,/mob/Enemy/Special_Bosses/Super_Ultima))
			E.MaxSTM=src.MaxSTM*100;E.STM=src.MaxSTM*100;E.MaxREI=src.MaxREI*50;E.REI=src.MaxREI*50;E.STR=src.STR*1.5;E.MGC=src.MGC*1.5;E.MGCDEF=src.MGCDEF*2;E.AGI=src.AGI*1.5;E.Kidou=src.Kidou*1.5;E.Zanjutsu=src.Zanjutsu*1.5;E.Hohou=src.Hohou*1.5;E.Hakuda=src.Hakuda*1.5;E.VIT=src.VIT*5;E.LCK=src.LCK*1.5;E.ShieldBonus=src.ShieldBonus
		if(istype(E,/mob/Enemy/Special_Bosses/Wild_Beast))
			if(src.Level>500)
				E.MaxSTM=src.MaxSTM*70;E.STM=src.MaxSTM*70;E.MaxREI=src.MaxREI*50;E.REI=src.MaxREI*50;E.STR=src.STR*2;E.MGC=src.MGC*2;E.MGCDEF=src.MGC*1.7;E.AGI=src.AGI/1.2;E.Kidou=src.Kidou;E.Zanjutsu=src.Zanjutsu*1.2;E.Hohou=src.Hohou/1.1;E.Hakuda=src.Hakuda/2;E.VIT=src.VIT*1.5;E.LCK=src.LCK*1.5;E.ShieldBonus=src.ShieldBonus
			else
				E.MaxSTM=src.MaxSTM*15;E.STM=src.MaxSTM*15;E.MaxREI=src.MaxREI*50;E.REI=src.MaxREI*50;E.STR=src.STR*2;E.MGC=src.MGC*2;E.MGCDEF=src.MGC*1.7;E.AGI=src.AGI/1.2;E.Kidou=src.Kidou;E.Zanjutsu=src.Zanjutsu*1.2;E.Hohou=src.Hohou/1.1;E.Hakuda=src.Hakuda/2;E.VIT=src.VIT*1.5;E.LCK=src.LCK*1.5;E.ShieldBonus=src.ShieldBonus
		if(istype(E,/mob/Enemy/Special_Bosses/Flame_Eater))
			if(src.Level>500)
				E.MaxSTM=src.MaxSTM*70;E.STM=src.MaxSTM*70;E.MaxREI=src.MaxREI*50;E.REI=src.MaxREI*50;E.STR=src.STR*2.5;E.MGC=src.MGC*2;E.MGCDEF=src.MGC*1.7;E.AGI=src.AGI/1.2;E.Kidou=src.Kidou;E.Zanjutsu=src.Zanjutsu*1.2;E.Hohou=src.Hohou/1.1;E.Hakuda=src.Hakuda/2;E.VIT=src.VIT*1.5;E.LCK=src.LCK*1.5;E.ShieldBonus=src.ShieldBonus
			else
				E.MaxSTM=src.MaxSTM*20;E.STM=src.MaxSTM*20;E.MaxREI=src.MaxREI*50;E.REI=src.MaxREI*50;E.STR=src.STR*2.5;E.MGC=src.MGC*2;E.MGCDEF=src.MGC*1.7;E.AGI=src.AGI/1.2;E.Kidou=src.Kidou;E.Zanjutsu=src.Zanjutsu*1.5;E.Hohou=src.Hohou/1.1;E.Hakuda=src.Hakuda/2;E.VIT=src.VIT*1.5;E.LCK=src.LCK*1.5;E.ShieldBonus=src.ShieldBonus


mob/Enemy
	MaxSTM=200
	MaxREI=200
	SpiritForm=1
	MovementSpeed=2
	SightRange=9
	mouse_opacity=2
	ImmunityBonus=30
	var/mob/StartedBy
	var/mob/TauntedBy
	var/Pulling=0
	var/list/Spoils=list()
	var/list/EnemySkills=list("Attack")
	AttVoices=list('HollowVoice1.wav','HollowVoice2.wav','HollowVoice3.wav')
	HurtVoices=list('HollowVoice1.wav','HollowVoice2.wav','HollowVoice3.wav')
	New()
		src.dir=pick(1,2,4,8)
		src.LevelShift(initial(src.Level))
		//src.DamageIcon=src.icon+rgb(255,0,0)
		//src.GuardIcon=src.icon+rgb(155,155,155)
		//src.Spoils+=new/datum/EnemySpoils("/obj/Items/Potions/Energy_Drink",10)
		//src.Spoils+=new/datum/EnemySpoils("/obj/Items/Potions/Spirit_Dew",10)
		src.Kidous=AllSpecials
		src.Skills=AllSpecials
		src.Spells=AllSpecials
		src.RespawnX=src.x
		src.RespawnY=src.y
		src.RespawnZ=src.z
		src.x+=rand(-1,1)
		src.y+=rand(-1,1)
		src.StmBar()
		src.AddName()
		src.AddLevel(" ([src.Level])")
		//src.EnemySecondLoop()
		return ..()
	proc
		//EnemySecondLoop()
			//spawn(10)	if(src)	src.EnemySecondLoop()
		LevelShift(var/NewLevel)
			//if(src.MultiCore)	src=src.MultiCore
			/*if(NewLevel>initial(src.Level))	src.Level=min(initial(src.Level)+1,NewLevel)	//was +3
			else	src.Level=max(initial(src.Level)-1,NewLevel)*/
			if(NewLevel)	src.Level=NewLevel
			if(src.z==8)	src.Level=NewLevel
			src.ApplyStats()
			src.Damagers=list()
			src.AddLevel(" ([src.Level])")
		EnemyCheck()
			//if(src.MultiCore)	src=src.MultiCore
			for(var/mob/Player/M in oview(EnemyHuntRange,src))
				if(M.client)
					src.TargetMob(M)
					src.StartedBy=M
					M.LevelShiftEnemy(src)
					spawn()	src.EnemyAI()
					return
		EnemyAI()
			//if(src.MultiCore)	src=src.MultiCore
			while(src.StartedBy)
				while(src.Stunned||!src.CanMove)	sleep(5)
				if(!src.Target)
					src.TauntedBy=null;src.StartedBy=null
				else
					if(src.Target.STM<=0)	src.TargetMob(null)
					if(src.Target && src.Target.invisibility)	src.TargetMob(null)
				if(src.TauntedBy && MyGetDist(src,src.TauntedBy)<=15)	src.Target=src.TauntedBy
				var/CurDistance=MyGetDist(src,src.Target)
				if(CurDistance && CurDistance<=src.SightRange)
					if(CurDistance==1)
						src.dir=get_dir(src,src.Target)
						MyFlick("PullBack",src)
						src.Pulling=1
						var/image/I=image('Effects.dmi',src,"CounterStep",src.layer-1,SOUTH)
						if(src.Target.client)	src.Target.client<<I
						sleep(5)
						if(I)	del I
						src.Pulling=0
						MyFlick("Attack",src)
						var/Action2Take="Attack"
						if(rand(1,3)==2)	Action2Take=pick(src.EnemySkills)
						if(Action2Take=="Attack")	src.Attack(rand(1,3))
						else	call(src,"[Action2Take]")()
						spawn(3)	src.dir=get_dir(src,src.Target)
					else
						if(!step_to(src,src.Target,1) && src.z!=8)	src.TargetMob(null)
				else	src.TargetMob(null)
				sleep(src.MovementSpeed+5)
			if(src.z==8)	{del src;return}
			src.TargetMob(null)
			if(src.z==src.RespawnZ)
				src.LevelShift(initial(src.Level))
				src.loc=locate(src.RespawnX+rand(-1,1),src.RespawnY+rand(-1,1),src.RespawnZ)
				//src.EnemyCheck()	//aggro after losing target
	Soul_Reapers
		New()
			src.Spoils+=new/datum/EnemySpoils("/obj/Items/Other/Hollow_Bait",10)
			src.Spoils+=new/datum/EnemySpoils("/obj/Items/EnemySpoils/Onyx",90)
			var/obj/HO=new/obj/HairOver
			HO.icon=pick('ichigo.dmi','toshiro.dmi','urahara.dmi','uryu.dmi','renji.dmi','Byakuya.dmi','Kenpachi.dmi','Izuru.dmi','Maki.dmi','Yoruichi.dmi')
			HO.icon=MyRGB(HO.icon,rgb(rand(0,100),rand(0,100),rand(0,55)))
			src.overlays+=HO
			return ..()
		Students
			icon='SoulReaperEnemy.dmi'
			First_Year_Student
				Level=3
		Rogue
			icon='SoulReaperEnemy.dmi'
			Weak_Rogue_Shinigami
				Level=55
				Rogue
			icon='SoulReaperEnemy.dmi'
			Normal_Rogue_Shinigami
			icon='SoulReaperEnemy.dmi'
			EnemySkills=list("Black Coffin")
			Level=125
		Cursed_Shinigami
			Level=350
			icon='CursedShinigami.dmi'
			Element="Dark";ElemStrength=list("Dark");ElemWeakness=list("Light")
			New()
				src.Spoils+=new/datum/EnemySpoils("/obj/Items/SteffixSpecials/Cursed_Seal",10)
				return ..()
		Drunk_Shinigami
			Level=350
			icon='SoulReaperEnemy.dmi'
		Unseated_Shinigami
			Level=375
			icon='SoulReaperEnemy.dmi'
			EnemySkills=list("Red_Flame_Cannon","Obstruction,Conquer")
		Shinigami_Patrol
			Level=400
			icon='SoulReaperEnemy.dmi'
			EnemySkills=list("Incinerating_Flame","Binding_Light")
		Shinigami_Ninja
			Level=425
			icon='SoulReaperEnemy.dmi'
			EnemySkills=list("Flash_Step","Binding_Light")
		Shinigami_Guard
			Level=450
			icon='SoulReaperEnemy.dmi'
			EnemySkills=list("Red_Flame_Cannon","Binding_Light","Incinerating_Flame")


	Ghosts
		Shinigami_Ghost
			Level=300
			icon='ShinigamiGhost.dmi'
			Element="Dark";ElemStrength=list("Dark");ElemWeakness=list("Light")
			New()
				src.Spoils+=new/datum/EnemySpoils("/obj/Items/Equipment/Cross_Sword",10)
				src.Spoils+=new/datum/EnemySpoils("/obj/Items/EnemySpoils/Broken_Zanpaktou",90)
				src.Spoils+=new/datum/EnemySpoils("/obj/Items/EnemySpoils/Broken_Zanpaktou2",90)
				return ..()





	Hollows
		/*New()
			/*src.Spoils+=new/datum/EnemySpoils("/obj/Items/EnemySpoils/Hollow_Mask",10)
			src.Spoils+=new/datum/EnemySpoils("/obj/Items/EnemySpoils/Cracked_Hollow_Mask",10)
			src.Spoils+=new/datum/EnemySpoils("/obj/Items/EnemySpoils/Shattered_Hollow_Mask",10)*/ //Enemy loot disabled
			return ..()*/
		Flyte
			Level=1
			icon='FlyingHollow.dmi'
		Pounder
			Level=1
			icon='GroundHollow.dmi'
		Flying_Hollow
			Level=2
			icon='FlyingAntiHollow.dmi'
			EnemySkills=list("Woosh")
		Ground_Hollow
			Level=2
			icon='GroundAntiHollow.dmi'
			EnemySkills=list("Slam")
		//arial outpost
		Spyder
			Level=4
			icon='SpiderHollow.dmi'
			New()
				src.Spoils+=new/datum/EnemySpoils("/obj/Items/EnemySpoils/Spider_Legs",90)
				return ..()
		Mantaur
			Level=5
			icon='MantisHollow.dmi'
		Treezer
			Level=6
			icon='Treezer.dmi'
		Slithar
			Level=7
			icon='SerpentHollow.dmi'
		Sea_Spine
			Level=8
			icon='SeaSpine.dmi'
		Spire_Gull
			Level=9
			icon='SpireGull.dmi'
			EnemySkills=list("Woosh")
		Tadite
			Level=10
			icon='TadPoleHollow.dmi'
			EnemySkills=list("Cry for Help")
		Frogling
			Level=11
			icon='FrogHollow.dmi'
		Wulf
			Level=12
			icon='WolfHollow.dmi'
		Howler
			Level=13
			icon='HowlerHollow.dmi'
		Growler
			Level=14
			icon='GrowlerHollow.dmi'
		Squishy
			Level=15
			icon='SquishyHollow.dmi'
			EnemySkills=list("Cry for Help")
		//sewers
		Gator
			Level=16
			icon='Gator.dmi'
			Element="Water";ElemStrength=list("Water");ElemWeakness=list("Lightning")
		Ratt
			Level=17
			icon='Ratt.dmi'
			EnemySkills=list("Cry for Help")
		Sewer_Bat
			Level=18
			icon='SewerBat.dmi'
			EnemySkills=list("Woosh")
			Element="Wind";ElemStrength=list("Wind");ElemWeakness=list("Earth")
			New()
				src.Spoils+=new/datum/EnemySpoils("/obj/Items/EnemySpoils/Bat_Guano",90)
				return ..()
		Sewer_Spider
			Level=19
			icon='SewerSpider.dmi'
		Gekko
			Level=20
			icon='Gekko.dmi'
		Giant_Lizard
			Level=21
			icon='PlaceHolderEnemy.dmi'
		Lost_Hobo
			Level=22
			icon='PlaceHolderEnemy.dmi'
			New()
				src.Spoils+=new/datum/EnemySpoils("/obj/Items/EnemySpoils/Ham_Sandwich",90)
				return ..()
		Walking_Corpse
			Level=23
			icon='PlaceHolderEnemy.dmi'
		Skeleton_Brute
			Level=24
			icon='SkeletonBrute.dmi'
		Skeletal_Knight
			Level=25
			icon='PlaceHolderEnemy.dmi'
		Goblin
			Level=26
			icon='PlaceHolderEnemy.dmi'
			EnemySkills=list("Cry for Help")
		Goblin_Raider
			Level=27
			icon='PlaceHolderEnemy.dmi'
			EnemySkills=list("Cry for Help")
		Slime
			Level=28
			icon='PlaceHolderEnemy.dmi'
		Sludge
			Level=29
			icon='PlaceHolderEnemy.dmi'
		Roach_Coach
			Level=30
			icon='PlaceHolderEnemy.dmi'
		//karkura
		Deady_Teddy
			Level=31
			icon='BearHollow.dmi'
			Element="Earth";ElemStrength=list("Earth");ElemWeakness=list("Wind")
		Skorepeon
			Level=32
			icon='ScorpionHollow.dmi'
			Element="Earth";ElemStrength=list("Earth");ElemWeakness=list("Wind")
		//ice cavern
		Freezer
			Level=33
			icon='Freezer.dmi'
			Element="Ice";ElemStrength=list("Ice");ElemWeakness=list("Fire")
		Arctic_Wulf
			Level=34
			icon='ArcticWulf.dmi'
			Element="Ice";ElemStrength=list("Ice");ElemWeakness=list("Fire")
		Shivering_Flame
			Level=35
			icon='ShiveringFlame.dmi'
			Element="Ice";ElemStrength=list("Ice");ElemWeakness=list("Fire")
		Icicle_Knight
			Level=36
			icon='IcicleKnight.dmi'
			Element="Ice";ElemStrength=list("Ice");ElemWeakness=list("Fire")
		//ever forest
		Treen
			icon='Treen.dmi'
			Element="Earth";ElemStrength=list("Earth");ElemWeakness=list("Wind")
			Level=37
			New()
				src.Spoils+=new/datum/EnemySpoils("/obj/Items/EnemySpoils/Treen_Arms",90)
				return ..()
		Fly_Snap
			Level=38
			icon='FlyTrap.dmi'
			Element="Wind";ElemStrength=list("Wind");ElemWeakness=list("Earth")
		Lost_Vines
			Level=39
			icon='VineBall.dmi'
			Element="Wind";ElemStrength=list("Wind");ElemWeakness=list("Earth")
			New()
				src.Spoils+=new/datum/EnemySpoils("/obj/Items/EnemySpoils/Tangled_Vine",90)
				return ..()
		Scruffy
			Level=40
			icon='Scruffy.dmi'
		Beast
			Level=41
			icon='Beast.dmi'
		Shroom
			Level=42
			icon='Mushroom.dmi'
			EnemySkills=list("Poison Cloud","Cry for Help")
			Element="Earth";ElemStrength=list("Earth","Water");ElemWeakness=list("Fire")

		Turtle_Spider
			Level=43
			icon='TurtleSpider.dmi'
			Element="Water";ElemStrength=list("Water");ElemWeakness=list("Lightning")
		Forest_Snail
			Level=44
			icon='TreeSnail.dmi'
			Element="Earth";ElemStrength=list("Earth");ElemWeakness=list("Wind","Ice")
		Forest_Bat
			Level=45
			icon='BrownBat.dmi'
			EnemySkills=list("Woosh")
			Element="Wind";ElemStrength=list("Wind");ElemWeakness=list("Earth")

		Gorilla
			Level=46
			icon='PlaceHolderEnemy.dmi'
			Element="Earth";ElemStrength=list("Earth");ElemWeakness=list("Wind")
		Crocogator
			Level=47
			icon='PlaceHolderEnemy.dmi'
			Element="Water";ElemStrength=list("Water");ElemWeakness=list("Lightning")

		Giant_Croc
			Level=48
			icon='PlaceHolderEnemy.dmi'
			Element="Water";ElemStrength=list("Water");ElemWeakness=list("Lightning")
		Grand_Wasp
			Level=49
			icon='PlaceHolderEnemy.dmi'
			//EnemySkills=list("Woosh","Sting")
			see_invisible=1
			Element="Wind";ElemStrength=list("Wind");ElemWeakness=list("Earth")

	Midlevel
		Emerald_Beetle
			Level=50
			icon='PlaceHolderEnemy.dmi'
			Element="Earth";ElemStrength=list("Earth");ElemWeakness=list("Wind","Lightning")

		Forest_Critter
			Level=51
			icon='PlaceHolderEnemy.dmi'
		Luminous_Wasp
			Level=500
			icon='FlyingAntiHollow.dmi'
			Element="Light";ElemStrength=list("Light");ElemWeakness=list("Dark")
		Luminous_Gator
			Level=500
			icon='Gator.dmi'
			Element="Light";ElemStrength=list("Light");ElemWeakness=list("Dark")
		Luminous_Pokie
			Level=500
			icon='SeaSpine.dmi'
			Element="Light";ElemStrength=list("Light");ElemWeakness=list("Dark")
		Wild_Mongoose
			Level=52
			icon='PlaceHolderEnemy.dmi'
		Luminous_Fly_Snap
			Level=500
			icon='FlyTrap.dmi'
			Element="Light";ElemStrength=list("Light");ElemWeakness=list("Dark")
		Tree_Frog
			Level=53
			icon='PlaceHolderEnemy.dmi'
			Element="Earth";ElemStrength=list("Earth");ElemWeakness=list("Wind","Water","Fire")
		Dark_Bat
			Level=100
			icon='DarkBat.dmi'
			Element="Dark";ElemStrength=list("Dark");ElemWeakness=list("Light")
		Dark_Beast
			Level=100
			icon='DarkBeast.dmi'
			Element="Dark";ElemStrength=list("Dark");ElemWeakness=list("Light")
		Darkicle_Knight
			Level=100
			icon='DarkKnight.dmi'
			Element="Dark";ElemStrength=list("Dark");ElemWeakness=list("Light")
		Dark_Vines
			Level=100
			icon='DarkVineBall.dmi'
			Element="Dark";ElemStrength=list("Dark");ElemWeakness=list("Light")
		Dark_Skorepeon
			Level=100
			icon='DarkScorpionHollow.dmi'
			Element="Dark";ElemStrength=list("Dark");ElemWeakness=list("Light")
		Dark_Wulf
			Level=100
			icon='DarkWolfHollow.dmi'
			Element="Dark";ElemStrength=list("Dark");ElemWeakness=list("Light")
		//volcanic enclave
		Lava_Ball
			Level=54
			icon='LavaBall.dmi'
			Element="Fire";ElemStrength=list("Fire");ElemWeakness=list("Ice")
			New()
				src.Spoils+=new/datum/EnemySpoils("/obj/Items/EnemySpoils/Flaming_Crystal",90)
				return ..()
		Fire_Walker
			Level=55
			icon='FireWalker.dmi'
			Element="Fire";ElemStrength=list("Fire");ElemWeakness=list("Ice")
			New()
				src.Spoils+=new/datum/EnemySpoils("/obj/Items/EnemySpoils/Flaming_Crystal",90)
				return ..()
		Burning_Blob
			Level=56
			icon='BurningBlob.dmi'
			Element="Fire";ElemStrength=list("Fire");ElemWeakness=list("Ice")
			New()
				src.Spoils+=new/datum/EnemySpoils("/obj/Items/EnemySpoils/Flaming_Crystal",90)
				return ..()
		Fire_Bat
			Level=57
			icon='FireBat.dmi'
			EnemySkills=list("Woosh")
			Element="Wind";ElemStrength=list("Wind","Fire");ElemWeakness=list("Earth","Ice")
			New()
				src.Spoils+=new/datum/EnemySpoils("/obj/Items/EnemySpoils/Flaming_Crystal",90)
				return ..()
		Heated_Stinger
			Level=58
			icon='HeatedStinger.dmi'
			EnemySkills=list("Sting")
			Element="Earth";ElemStrength=list("Earth","Fire");ElemWeakness=list("Wind","Ice")
			New()
				src.Spoils+=new/datum/EnemySpoils("/obj/Items/EnemySpoils/Flaming_Crystal",90)
				return ..()
		Rock_Lava
			Level=59
			icon='RockLava.dmi'
			EnemySkills=list("Slam")
			Element="Earth";ElemStrength=list("Fire","Earth");ElemWeakness=list("Ice","Wind")
			New()
				src.Spoils+=new/datum/EnemySpoils("/obj/Items/EnemySpoils/Flaming_Crystal",90)
				return ..()
		Salamander
			Level=60
			icon='PlaceHolderEnemy.dmi'
			Element="Earth";ElemStrength=list("Earth");ElemWeakness=list("Wind")
		Ember_Dragon
			Level=61
			icon='PlaceHolderEnemy.dmi'
			EnemySkills=list("Woosh")
			Element="Fire";ElemStrength=list("Fire");ElemWeakness=list("Ice")
			New()
				src.Spoils+=new/datum/EnemySpoils("/obj/Items/EnemySpoils/Flaming_Crystal",90)
				return ..()
		Crested_Turtle
			Level=62
			icon='PlaceHolderEnemy.dmi'
			Element="Earth";ElemStrength=list("Earth");ElemWeakness=list("Wind")
		Porcupine
			Level=63
			icon='PlaceHolderEnemy.dmi'
			EnemySkills=list("Cry for Help")
			Element="Earth";ElemStrength=list("Earth");ElemWeakness=list("Wind")
		Volcanite
			Level=64
			icon='PlaceHolderEnemy.dmi'
			Element="Fire";ElemStrength=list("Earth","Fire");ElemWeakness=list("Wind","Ice")
			New()
				src.Spoils+=new/datum/EnemySpoils("/obj/Items/EnemySpoils/Flaming_Crystal",90)
				return ..()
		Crimson_Crystal
			Level=65
			icon='PlaceHolderEnemy.dmi'
			Element="Fire";ElemStrength=list("Fire");ElemWeakness=list("Ice")
			New()
				src.Spoils+=new/datum/EnemySpoils("/obj/Items/EnemySpoils/Flaming_Crystal",90)
				return ..()
		Flaming_Boar
			Level=66
			icon='PlaceHolderEnemy.dmi'
			Element="Fire";ElemStrength=list("Fire");ElemWeakness=list("Ice")
			New()
				src.Spoils+=new/datum/EnemySpoils("/obj/Items/EnemySpoils/Flaming_Crystal",90)
				return ..()
		Hellz_Hopper
			Level=67
			icon='PlaceHolderEnemy.dmi'
			EnemySkills=list("Cry for Help")
			Element="Fire";ElemStrength=list("Fire");ElemWeakness=list("Ice")
			New()
				src.Spoils+=new/datum/EnemySpoils("/obj/Items/EnemySpoils/Flaming_Crystal",90)
				return ..()
		Lava_Bubble
			Level=68
			icon='PlaceHolderEnemy.dmi'
			Element="Fire";ElemStrength=list("Fire");ElemWeakness=list("Ice")
			New()
				src.Spoils+=new/datum/EnemySpoils("/obj/Items/EnemySpoils/Flaming_Crystal",90)
				return ..()
		Molten_Man
			Level=69
			icon='PlaceHolderEnemy.dmi'
			Element="Fire";ElemStrength=list("Fire");ElemWeakness=list("Ice")
			New()
				src.Spoils+=new/datum/EnemySpoils("/obj/Items/EnemySpoils/Flaming_Crystal",90)
				return ..()
		Molten_Slug
			Level=70
			icon='PlaceHolderEnemy.dmi'
			Element="Fire";ElemStrength=list("Fire");ElemWeakness=list("Ice")
			New()
				src.Spoils+=new/datum/EnemySpoils("/obj/Items/EnemySpoils/Flaming_Crystal",90)
				return ..()
		Lava_Puddle
			Level=71
			icon='PlaceHolderEnemy.dmi'
			Element="Fire";ElemStrength=list("Fire");ElemWeakness=list("Ice")
			New()
				src.Spoils+=new/datum/EnemySpoils("/obj/Items/EnemySpoils/Flaming_Crystal",90)
				return ..()
		Hellion_Harpy
			Level=72
			icon='PlaceHolderEnemy.dmi'
			EnemySkills=list("Woosh")
			Element="Wind";ElemStrength=list("Wind","Fire");ElemWeakness=list("Ice","Earth")
		Eruptor
			Level=73
			icon='PlaceHolderEnemy.dmi'
			Element="Fire";ElemStrength=list("Fire");ElemWeakness=list("Ice")
			New()
				src.Spoils+=new/datum/EnemySpoils("/obj/Items/EnemySpoils/Flaming_Crystal",90)
				return ..()
		Solidified_Golem
			Level=74
			icon='PlaceHolderEnemy.dmi'
			Element="Earth";ElemStrength=list("Earth","Fire");ElemWeakness=list("Wind","Ice")
		//un-used
		Cyclops
			Level=75
			EnemySkills=list("Slam")
			icon='PlaceHolderEnemy.dmi'
		Cyclops_Eye
			Level=76
			icon='PlaceHolderEnemy.dmi'
			Element="Earth";ElemStrength=list("Earth");ElemWeakness=list("Wind")

	Evolved_Hollows

		Evolved_Sea_Spine
			Level=220
			icon='SeaSpine.dmi'
			Element="Water";ElemStrength=list("Water","Fire");ElemWeakness=list("Lightning")
		Evolved_Lost_Vines
			Level=230
			icon='VineBall.dmi'
			Element="Wind";ElemStrength=list("Wind");ElemWeakness=list("Earth")
		Evolved_Forest_Snail
			Level=235
			icon='TreeSnail.dmi'
			EnemySkills=list("Black Coffin")
			Element="Earth";ElemStrength=list("Earth");ElemWeakness=list("Wind","Ice")
		Evolved_Flying_Hollow
			Level=210
			icon='FlyingAntiHollow.dmi'
			EnemySkills=list("Woosh")
		Evolved_Gator
			Level=240
			icon='Gator.dmi'
			EnemySkills=list("Black Coffin")
			Element="Water";ElemStrength=list("Water","Dark");ElemWeakness=list("Lightning")

	Bosses
		ImmunityBonus=100
		EnemySkills=list("Mob Spirit Blast")
		Frawg
			Vaizard=1
			Class="Hollow"
			EnemySkills=list("Attack","Bala")
			icon='Frawg.dmi'
			Level=15
		Urahara
			icon='NPCUrahara.dmi'
			Level=20
		Roach_Lord
			icon='PlaceHolderEnemy.dmi'
			Level=30
		Ice_Golem
			Vaizard=1
			Class="Hollow"
			Element="Ice";ElemStrength=list("Ice");ElemWeakness=list("Fire")
			EnemySkills=list("Mob Spirit Blast","Freeze Ring","Cero")
			icon='IceGolem.dmi'
			Level=35
		Zanpakuto_Spirit
			icon='ZanSpirit.dmi'
			Level=50
			MovementSpeed=1
		Evolved_Sun_Flower
			icon='BountPlantPet3.dmi'
			Level=50
			MovementSpeed=1
		Kenyan_Mangrove_Crab
			icon='KenyanMangroveCrab.dmi'
			Level=55
		Phoenix
			Level=75
			icon='PlaceHolderEnemy.dmi'
			Element="Fire";ElemStrength=list("Fire");ElemWeakness=list("Ice")
		Inner_Hollow
			Level=125
			Vaizard=1
			Class="Hollow"
			icon='InnerHollow.dmi'
			EnemySkills=list("Black Coffin","Cero","Mob Spirit Blast")
			Element="Dark";ElemStrength=list("Dark","Fire");ElemWeakness=list("Light")
		Rogue_Boss
			Level=150
			Vaizard=1
			Class="Hollow"
			icon='SoulReaperEnemy.dmi'
			EnemySkills=list("Mob Spirit Blast","Bala")


	Special_Bosses

		Ultima
			Level= 150
			MovementSpeed=1
			Vaizard=1
			Class="Hollow"
			VIT=500
			AGI=500
			MaxSTM=50000
			icon='ultima.dmi'
			Element="Dark";ElemStrength=list("Dark","Fire");ElemWeakness=list("Light")
			EnemySkills=list("Black Coffin","Freeze Ring","Cero","Bala")
		Super_Ultima
			Level= 500
			Vaizard=1
			Class="Hollow"
			MovementSpeed=1
			VIT=2000
			AGI=3000
			MGCDEF=3000
			Hohou=3000
			Hakuda=4000
			Zanjutsu=2000
			Kidou=3000
			icon='ultima.dmi'
			ImmunityBonus=100
			Element="Dark";ElemStrength=list("Dark","Fire","Ice","Light")
			EnemySkills=list("Black Coffin","Freeze Ring","Cero","Bala")
		Wild_Beast
			Level= 100
			Vaizard=1
			Class="Hollow"
			MovementSpeed=1
			VIT=300
			AGI=300
			MGCDEF=3000
			Hohou=3000
			Hakuda=4000
			Zanjutsu=2000
			Kidou=3000
			icon='WildBeast.dmi'
			ImmunityBonus=200
			Element="Dark";ElemStrength=list("Dark","Fire","Ice","Light")
			EnemySkills=list("Cero","Bala","Mob Spirit Blast")
		Flame_Eater
			Level= 130
			Vaizard=1
			Class="Hollow"
			MovementSpeed=1
			VIT=300
			AGI=300
			MGCDEF=3000
			Hohou=3000
			Hakuda=4000
			Zanjutsu=2000
			Kidou=3000
			icon='FlameEater.dmi'
			ImmunityBonus=200
			Element="Dark";ElemStrength=list("Dark","Fire","Light")
			EnemySkills=list("Cero","Bala","Mob Spirit Blast")

	Epics
		ImmunityBonus=100
