#define NEWMONLVL round(E.Level*3.25)


obj/Mining

	OreMine
		icon='2Full.dmi'
		density=1
		var/Item

		DblClick()
			if(prob(20+usr.Mining_Level))
				usr.Mining_Exp ++
				usr.GetItem(new/obj/Items/EnemySpoils/Onyx)
				usr.Mining_Level_Check()


mob/proc/Mining_Level_Check()
	if(usr.Mining_Exp >= usr.Mining_Nexp)
		usr.Mining_Level++
		usr.Mining_Exp -= usr.Mining_Nexp
		usr.Mining_Nexp += 5





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

mob/proc/LevelShiftEnemy(var/mob/Enemy/E)
	//E.LevelShift(round((initial(E.Level)+src.Level)/2))
	if(src.Level>75 && E.Level>=70)	E.LevelShift(src.Level)
	else	E.LevelShift()

mob/Enemy
	MaxSTM=200
	MaxREI=200
	SpiritForm=1
	SightRange=9
	mouse_opacity=2
	ImmunityBonus=10
	var/IsChecked
	var/IsWeak
	var/IsStrong
	var/IsNormal
	var/mob/StartedBy
	var/mob/TauntedBy
	var/BEStart
	var/Pulling=0
	var/list/Spoils=list()
	var/list/EnemySkills=list("Attack")
	AttVoices=list('HollowVoice1.wav','HollowVoice2.wav','HollowVoice3.wav')
	HurtVoices=list('HollowVoice1.wav','HollowVoice2.wav','HollowVoice3.wav')
	New()

		var/P=rand(1,100)
		if(P <= 33)
			src.Level=initial(src.Level)-rand(1,2)
		if(P >= 67)
			src.Level =initial(src.Level)+rand(1,2)
		if(P >= 34 && P < 66)
			src.Level=initial(src.Level)
		src.dir=pick(1,2,4,8)
		src.LevelShift()
		//src.DamageIcon=src.icon+rgb(255,0,0)
		//src.GuardIcon=src.icon+rgb(155,155,155)
		src.Spoils+=new/datum/EnemySpoils("/obj/Items/Potions/Energy_Drink",10)
		src.Spoils+=new/datum/EnemySpoils("/obj/Items/Potions/Spirit_Dew",10)
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
		//step(src,src.dir)
		spawn(5)	src.EnemyCheck()
		return..()


	proc
		EnemyLoop()
			if(!src.StartedBy)
				src.EnemyCheck()
			spawn(10)	src.EnemyLoop()




		LevelShift(var/NewLevel)
			if(NewLevel)	src.Level=NewLevel
			if(src.z==8)	src.Level=NewLevel
			src.ApplyStats()
			if(src.Level >=1&&src.Level <=4)
				src.Spoils+=new/datum/EnemySpoils("/obj/Items/Equipment/Head/Leather_Helmet",20)
				src.Spoils+=new/datum/EnemySpoils("/obj/Items/Equipment/Feet/Battle_Boots",20)
				src.Spoils+=new/datum/EnemySpoils("/obj/Items/Equipment/Hand/Weapons/Sword",20)
				src.Spoils+=new/datum/EnemySpoils("/obj/Items/Equipment/Hand/Weapons/Cane",20)
				src.Spoils+=new/datum/EnemySpoils("/obj/Items/Equipment/Body/Clothes",20)
			if(src.Level >= 4 && src.Level <= 9)
				src.Spoils+=new/datum/EnemySpoils("/obj/Items/Equipment/Body/Mystic/Cloth_Tunic",20)
				src.Spoils+=new/datum/EnemySpoils("/obj/Items/Equipment/Head/Bronze_Helmet",20)
				src.Spoils+=new/datum/EnemySpoils("/obj/Items/Equipment/Feet/Spike_Boots",20)
				src.Spoils+=new/datum/EnemySpoils("/obj/Items/Equipment/Body/Armor/Copper_Breastplate",20)
				src.Spoils+=new/datum/EnemySpoils("/obj/Items/Equipment/Hand/Weapons/Rapier",20)
				src.Spoils+=new/datum/EnemySpoils("/obj/Items/Equipment/Hand/Weapons/Metal_Cane",20)
			if(src.Level >=9 && src.Level <= 14)
				src.Spoils+=new/datum/EnemySpoils("/obj/Items/Equipment/Body/Mystic/Linen_Robe",20)
				src.Spoils+=new/datum/EnemySpoils("/obj/Items/Equipment/Head/Iron_Helmet",20)
				src.Spoils+=new/datum/EnemySpoils("/obj/Items/Equipment/Feet/Germinas_Boots",20)
				src.Spoils+=new/datum/EnemySpoils("/obj/Items/Equipment/Body/Armor/Leather_Armor",20)
				src.Spoils+=new/datum/EnemySpoils("/obj/Items/Equipment/Hand/Weapons/Golden_Blade",20)

			if(src.Level>= 14 && src.Level <=19)
				src.Spoils+=new/datum/EnemySpoils("/obj/Items/Equipment/Body/Mystic/Linen_Jacket",20)
				src.Spoils+=new/datum/EnemySpoils("/obj/Items/Equipment/Head/Burbuta",20)
				src.Spoils+=new/datum/EnemySpoils("/obj/Items/Equipment/Feet/Rubber_Shoes",20)
				src.Spoils+=new/datum/EnemySpoils("/obj/Items/Equipment/Body/Armor/Onyx_Armor",20)
				src.Spoils+=new/datum/EnemySpoils("/obj/Items/Equipment/Hand/Weapons/Save_the_Queen",20)
				src.Spoils+=new/datum/EnemySpoils("/obj/Items/Equipment/Hand/Weapons/Wand_of_Despair",20)
			if(src.Level >=19 &&src.Level  <=24)
				src.Spoils+=new/datum/EnemySpoils("/obj/Items/Equipment/Body/Mystic/Silk_Robe",20)
				src.Spoils+=new/datum/EnemySpoils("/obj/Items/Equipment/Head/Mythril_Helmet",20)
				src.Spoils+=new/datum/EnemySpoils("/obj/Items/Equipment/Feet/Feather_Boots",20)
				src.Spoils+=new/datum/EnemySpoils("/obj/Items/Equipment/Body/Armor/Linen_Cuirass",20)
				src.Spoils+=new/datum/EnemySpoils("/obj/Items/Equipment/Hand/Weapons/Falchion",20)

			if( src.Level >=24 && src.Level <=29)
				src.Spoils+=new/datum/EnemySpoils("/obj/Items/Equipment/Body/Mystic/Fire_Tunic",20)
				src.Spoils+=new/datum/EnemySpoils("/obj/Items/Equipment/Head/Gold_Helmet",20)
				src.Spoils+=new/datum/EnemySpoils("/obj/Items/Equipment/Feet/Sprint_Shoes",20)
				src.Spoils+=new/datum/EnemySpoils("/obj/Items/Equipment/Body/Armor/Iron_Mail",20)
				src.Spoils+=new/datum/EnemySpoils("/obj/Items/Equipment/Hand/Weapons/Schimitar",20)



			if(src.Level >=29 &&src.Level <=34)
				src.Spoils+=new/datum/EnemySpoils("/obj/Items/Equipment/Body/Mystic/Wizard_Robe",20)
				src.Spoils+=new/datum/EnemySpoils("/obj/Items/Equipment/Head/Cross_Helmet",20)
				src.Spoils+=new/datum/EnemySpoils("/obj/Items/Equipment/Feet/Red_Shoes",20)
				src.Spoils+=new/datum/EnemySpoils("/obj/Items/Equipment/Body/Armor/Bronze_Armor",20)
				src.Spoils+=new/datum/EnemySpoils("/obj/Items/Equipment/Hand/Weapons/Cross_Sword",20)

			if(src.Level>= 34 && src.Level <=39)
				src.Spoils+=new/datum/EnemySpoils("/obj/Items/Equipment/Body/Mystic/Holy_Cloak",20)
				src.Spoils+=new/datum/EnemySpoils("/obj/Items/Equipment/Head/Diamond_Helmet",20)
				src.Spoils+=new/datum/EnemySpoils("/obj/Items/Equipment/Body/Armor/Breaker_Gear",20)
				src.Spoils+=new/datum/EnemySpoils("/obj/Items/Equipment/Hand/Weapons/Brightest_Night",20)

			if(src.Level >=39&&src.Level <=44)
				src.Spoils+=new/datum/EnemySpoils("/obj/Items/Equipment/Body/Armor/Chain_Mail",20)
				src.Spoils+=new/datum/EnemySpoils("/obj/Items/Equipment/Hand/Weapons/Excalibur",20)
				src.Spoils+=new/datum/EnemySpoils("/obj/Items/Equipment/Body/Mystic/Chameleon_Robe",20)
				src.Spoils+=new/datum/EnemySpoils("/obj/Items/Equipment/Head/Platinum_Helmet",20)
			if(src.Level >=44&& src.Level <=49)
				src.Spoils+=new/datum/EnemySpoils("/obj/Items/Equipment/Body/Armor/Jade_Encrusted_Armor",20)
				src.Spoils+=new/datum/EnemySpoils("/obj/Items/Equipment/Hand/Weapons/Fairy_Club",20)
				src.Spoils+=new/datum/EnemySpoils("/obj/Items/Equipment/Body/Mystic/Clerics_Robe",20)
				src.Spoils+=new/datum/EnemySpoils("/obj/Items/Equipment/Head/Circlet",20)
			if(src.Level>=49 &&src.Level<=54)
				src.Spoils+=new/datum/EnemySpoils("/obj/Items/Equipment/Head/Crystal_Helmet",20)
				src.Spoils+=new/datum/EnemySpoils("/obj/Items/Equipment/Body/Armor/Mythril_Armor",20)
				src.Spoils+=new/datum/EnemySpoils("/obj/Items/Equipment/Hand/Weapons/Dirk_of_Despair",20)
				src.Spoils+=new/datum/EnemySpoils("/obj/Items/Equipment/Body/Mystic/White_Robe",20)
			if(src.Level>=54&& src.Level<=59)
				src.Spoils+=new/datum/EnemySpoils("/obj/Items/Equipment/Head/Genji_Helmet",20)
				src.Spoils+=new/datum/EnemySpoils("/obj/Items/Equipment/Body/Armor/Royal_Plate_Mail",20)
				src.Spoils+=new/datum/EnemySpoils("/obj/Items/Equipment/Hand/Weapons/Black_Hearted_Dagger",20)
				src.Spoils+=new/datum/EnemySpoils("/obj/Items/Equipment/Body/Mystic/Ceremonial_Uniform",20)
			if(src.Level>=59&&src.Level <=64)
				src.Spoils+=new/datum/EnemySpoils("/obj/Items/Equipment/Head/Grand_Helmet",20)
				src.Spoils+=new/datum/EnemySpoils("/obj/Items/Equipment/Body/Armor/Plate_Mail",20)
				src.Spoils+=new/datum/EnemySpoils("/obj/Items/Equipment/Hand/Weapons/Glove_of_Despair",20)
				src.Spoils+=new/datum/EnemySpoils("/obj/Items/Equipment/Body/Mystic/Black_Robe",20)
			if(src.Level >=64&& src.Level<=69)
				src.Spoils+=new/datum/EnemySpoils("/obj/Items/Equipment/Body/Armor/Guardians_Uniform",20)
				src.Spoils+=new/datum/EnemySpoils("/obj/Items/Equipment/Hand/Weapons/Padded_Claws",20)
				src.Spoils+=new/datum/EnemySpoils("/obj/Items/Equipment/Body/Mystic/Golden_Dressings",20)
			if(src.Level >=69&& src.Level<=74)
				src.Spoils+=new/datum/EnemySpoils("/obj/Items/Equipment/Body/Armor/Gold_Armor",20)
				src.Spoils+=new/datum/EnemySpoils("/obj/Items/Equipment/Hand/Weapons/Golden_Knuckles",20)
				src.Spoils+=new/datum/EnemySpoils("/obj/Items/Equipment/Body/Mystic/Light_Robe",20)

			if(src.Level >=74&& src.Level<=79)
				src.Spoils+=new/datum/EnemySpoils("/obj/Items/Equipment/Body/Armor/Blackened_Breastplate",20)
				src.Spoils+=new/datum/EnemySpoils("/obj/Items/Equipment/Hand/Weapons/Diamond_Knuckles",20)
				src.Spoils+=new/datum/EnemySpoils("/obj/Items/Equipment/Body/Mystic/Wizard_Outfit",20)
/*			if(79>= <=84)
				src.Spoils+=new/datum/EnemySpoils("/obj/Items/Equipment/Body/Armor/Bronze_Armor",20)
				src.Spoils+=new/datum/EnemySpoils("/obj/Items/Equipment/Hand/Weapons/Cross_Sword",20)
				src.Spoils+=new/datum/EnemySpoils("/obj/Items/Equipment/Body/Mystic/Wizard_Robe",20)
			if(84>= <=89)
				src.Spoils+=new/datum/EnemySpoils("/obj/Items/Equipment/Body/Armor/Bronze_Armor",20)
				src.Spoils+=new/datum/EnemySpoils("/obj/Items/Equipment/Hand/Weapons/Cross_Sword",20)
				src.Spoils+=new/datum/EnemySpoils("/obj/Items/Equipment/Body/Mystic/Wizard_Robe",20)
			if(89>= <=94)
				src.Spoils+=new/datum/EnemySpoils("/obj/Items/Equipment/Body/Armor/Bronze_Armor",20)
				src.Spoils+=new/datum/EnemySpoils("/obj/Items/Equipment/Hand/Weapons/Cross_Sword",20)
				src.Spoils+=new/datum/EnemySpoils("/obj/Items/Equipment/Body/Mystic/Wizard_Robe",20)
			if(94>= <=99)
				src.Spoils+=new/datum/EnemySpoils("/obj/Items/Equipment/Body/Armor/Bronze_Armor",20)
				src.Spoils+=new/datum/EnemySpoils("/obj/Items/Equipment/Hand/Weapons/Cross_Sword",20)
				src.Spoils+=new/datum/EnemySpoils("/obj/Items/Equipment/Body/Mystic/Wizard_Robe",20)
			if(99>= <=104)
				src.Spoils+=new/datum/EnemySpoils("/obj/Items/Equipment/Body/Armor/Bronze_Armor",20)
				src.Spoils+=new/datum/EnemySpoils("/obj/Items/Equipment/Hand/Weapons/Cross_Sword",20)
				src.Spoils+=new/datum/EnemySpoils("/obj/Items/Equipment/Body/Mystic/Wizard_Robe",20)
			if(104>= <=109)
				src.Spoils+=new/datum/EnemySpoils("/obj/Items/Equipment/Body/Armor/Bronze_Armor",20)
				src.Spoils+=new/datum/EnemySpoils("/obj/Items/Equipment/Hand/Weapons/Cross_Sword",20)
				src.Spoils+=new/datum/EnemySpoils("/obj/Items/Equipment/Body/Mystic/Wizard_Robe",20)
			if(109>= <=114)
				src.Spoils+=new/datum/EnemySpoils("/obj/Items/Equipment/Body/Armor/Bronze_Armor",20)
				src.Spoils+=new/datum/EnemySpoils("/obj/Items/Equipment/Hand/Weapons/Cross_Sword",20)
				src.Spoils+=new/datum/EnemySpoils("/obj/Items/Equipment/Body/Mystic/Wizard_Robe",20)
			if(114>= <=119)
				src.Spoils+=new/datum/EnemySpoils("/obj/Items/Equipment/Body/Armor/Bronze_Armor",20)
				src.Spoils+=new/datum/EnemySpoils("/obj/Items/Equipment/Hand/Weapons/Cross_Sword",20)
				src.Spoils+=new/datum/EnemySpoils("/obj/Items/Equipment/Body/Mystic/Wizard_Robe",20)
			if(119>= <=124)
				src.Spoils+=new/datum/EnemySpoils("/obj/Items/Equipment/Body/Armor/Bronze_Armor",20)
				src.Spoils+=new/datum/EnemySpoils("/obj/Items/Equipment/Hand/Weapons/Cross_Sword",20)
				src.Spoils+=new/datum/EnemySpoils("/obj/Items/Equipment/Body/Mystic/Wizard_Robe",20)
			if(124>= <=129)
				src.Spoils+=new/datum/EnemySpoils("/obj/Items/Equipment/Body/Armor/Bronze_Armor",20)
				src.Spoils+=new/datum/EnemySpoils("/obj/Items/Equipment/Hand/Weapons/Cross_Sword",20)
				src.Spoils+=new/datum/EnemySpoils("/obj/Items/Equipment/Body/Mystic/Wizard_Robe",20)
			if(129>= <=134)
				src.Spoils+=new/datum/EnemySpoils("/obj/Items/Equipment/Body/Armor/Bronze_Armor",20)
				src.Spoils+=new/datum/EnemySpoils("/obj/Items/Equipment/Hand/Weapons/Cross_Sword",20)
				src.Spoils+=new/datum/EnemySpoils("/obj/Items/Equipment/Body/Mystic/Wizard_Robe",20)
			if(134>= <=139)
				src.Spoils+=new/datum/EnemySpoils("/obj/Items/Equipment/Body/Armor/Bronze_Armor",20)
				src.Spoils+=new/datum/EnemySpoils("/obj/Items/Equipment/Hand/Weapons/Cross_Sword",20)
				src.Spoils+=new/datum/EnemySpoils("/obj/Items/Equipment/Body/Mystic/Wizard_Robe",20)
			if(139>= <=144)
				src.Spoils+=new/datum/EnemySpoils("/obj/Items/Equipment/Body/Armor/Bronze_Armor",20)
				src.Spoils+=new/datum/EnemySpoils("/obj/Items/Equipment/Hand/Weapons/Cross_Sword",20)
				src.Spoils+=new/datum/EnemySpoils("/obj/Items/Equipment/Body/Mystic/Wizard_Robe",20)
			if(144>= <=149)
				src.Spoils+=new/datum/EnemySpoils("/obj/Items/Equipment/Body/Armor/Bronze_Armor",20)
				src.Spoils+=new/datum/EnemySpoils("/obj/Items/Equipment/Hand/Weapons/Cross_Sword",20)
				src.Spoils+=new/datum/EnemySpoils("/obj/Items/Equipment/Body/Mystic/Wizard_Robe",20)
			if(149>= <=154)
				src.Spoils+=new/datum/EnemySpoils("/obj/Items/Equipment/Body/Armor/Bronze_Armor",20)
				src.Spoils+=new/datum/EnemySpoils("/obj/Items/Equipment/Hand/Weapons/Cross_Sword",20)
				src.Spoils+=new/datum/EnemySpoils("/obj/Items/Equipment/Body/Mystic/Wizard_Robe",20)
*/

			src.Damagers=list()
			src.AddLevel(" ([src.Level])")


		EnemyCheck()
			//if(src.MultiCore)	src=src.MultiCore
			for(var/mob/Player/M in oview(EnemyHuntRange,src))
				if(M.client)
					src.TargetMob(M)
					src.StartedBy=M
					//M.LevelShiftEnemy(src)
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
				sleep(5)
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
				Level=9


	Hollows
		New()
			src.Spoils+=new/datum/EnemySpoils("/obj/Items/EnemySpoils/Hollow_Mask",10)
			src.Spoils+=new/datum/EnemySpoils("/obj/Items/EnemySpoils/Cracked_Hollow_Mask",10)
			src.Spoils+=new/datum/EnemySpoils("/obj/Items/EnemySpoils/Shattered_Hollow_Mask",10)
			if(src.name == "Aizen")
				src.AddHair("Aizen")
			return ..()



		Flyte
			Level=3
			icon='FlyingHollow.dmi'
		Pounder
			Level=3
			icon='GroundHollow.dmi'
		Flying_Hollow
			Level=6
			icon='FlyingAntiHollow.dmi'
			EnemySkills=list("Woosh")
		Ground_Hollow
			Level=6
			icon='GroundAntiHollow.dmi'
			EnemySkills=list("Slam")
		//arial outpost
		Spyder
			Level=12
			icon='SpiderHollow.dmi'
			New()
				src.Spoils+=new/datum/EnemySpoils("/obj/Items/EnemySpoils/Spider_Legs",90)
				return ..()
		Mantaur
			Level=15
			icon='MantisHollow.dmi'
		Treezer
			Level=18
			icon='Treezer.dmi'
		Slithar
			Level=21
			icon='SerpentHollow.dmi'
		Sea_Spine
			Level=24
			icon='SeaSpine.dmi'
		Spire_Gull
			Level=27
			icon='SpireGull.dmi'
			EnemySkills=list("Woosh")
		Tadite
			Level=30
			icon='TadPoleHollow.dmi'
			EnemySkills=list("Cry for Help")
		Frogling
			Level=33
			icon='FrogHollow.dmi'
		Wulf
			Level=36
			icon='WolfHollow.dmi'
		Howler
			Level=39
			icon='HowlerHollow.dmi'
		Growler
			Level=42
			icon='GrowlerHollow.dmi'
		Squishy
			Level=45
			icon='SquishyHollow.dmi'
			EnemySkills=list("Cry for Help")
		//sewers
		Gator
			Level=48
			icon='Gator.dmi'
			Element="Water";ElemStrength=list("Water");ElemWeakness=list("Lightning")
		Ratt
			Level=51
			icon='Ratt.dmi'
			EnemySkills=list("Cry for Help")
		Forest_Bat
			Level=54
			icon='SewerBat.dmi'
			EnemySkills=list("Woosh")
			Element="Wind";ElemStrength=list("Wind");ElemWeakness=list("Earth")
			New()
				src.Spoils+=new/datum/EnemySpoils("/obj/Items/EnemySpoils/Bat_Guano",90)
				return ..()
		Forest_Spider
			Level=57
			icon='SewerSpider.dmi'
		Gekko
			Level=60
			icon='Gekko.dmi'
		Giant_Lizard
			Level=63
			icon='GaintLizard.dmi'
		Lost_Hobo
			Level=66
			icon='PlaceHolderEnemy.dmi'
			New()
				src.Spoils+=new/datum/EnemySpoils("/obj/Items/EnemySpoils/Ham_Sandwich",90)
				return ..()
		Walking_Corpse
			Level=69
			icon='PlaceHolderEnemy.dmi'
		Skeleton_Brute
			Level=72
			icon='SkeletonBrute.dmi'
		Skeletal_Knight
			Level=75
			icon='PlaceHolderEnemy.dmi'
		Goblin
			Level=78
			icon='PlaceHolderEnemy.dmi'
			EnemySkills=list("Cry for Help")
		Goblin_Raider
			Level=81
			icon='PlaceHolderEnemy.dmi'
			EnemySkills=list("Cry for Help")
		Slime
			Level=84
			icon='PlaceHolderEnemy.dmi'
		Sludge
			Level=87
			icon='PlaceHolderEnemy.dmi'
		Roach_Coach
			Level=90
			icon='PlaceHolderEnemy.dmi'
		//karkura
		Deady_Teddy
			Level=93
			icon='BearHollow.dmi'
			Element="Earth";ElemStrength=list("Earth");ElemWeakness=list("Wind")
		Skorepeon
			Level=96
			icon='ScorpionHollow.dmi'
			Element="Earth";ElemStrength=list("Earth");ElemWeakness=list("Wind")
		//ice cavern
		Freezer
			Level=99
			icon='Freezer.dmi'
			Element="Ice";ElemStrength=list("Ice");ElemWeakness=list("Fire")
		Arctic_Wulf
			Level=102
			icon='ArcticWulf.dmi'
			Element="Ice";ElemStrength=list("Ice");ElemWeakness=list("Fire")
		Shivering_Flame
			Level=105
			icon='ShiveringFlame.dmi'
			Element="Ice";ElemStrength=list("Ice");ElemWeakness=list("Fire")
		Icicle_Knight
			Level=108
			icon='IcicleKnight.dmi'
			Element="Ice";ElemStrength=list("Ice");ElemWeakness=list("Fire")
		//ever forest
		Treen
			icon='Treen.dmi'
			Element="Earth";ElemStrength=list("Earth");ElemWeakness=list("Wind")
			Level=111
			New()
				src.Spoils+=new/datum/EnemySpoils("/obj/Items/EnemySpoils/Treen_Arms",90)
				return ..()
		Fly_Snap
			Level=114
			icon='FlyTrap.dmi'
			Element="Wind";ElemStrength=list("Wind");ElemWeakness=list("Earth")
		Lost_Vines
			Level=117
			icon='VineBall.dmi'
			Element="Wind";ElemStrength=list("Wind");ElemWeakness=list("Earth")
			New()
				src.Spoils+=new/datum/EnemySpoils("/obj/Items/EnemySpoils/Tangled_Vine",90)
				return ..()
		Scruffy
			Level=120
			icon='Scruffy.dmi'
		Beast
			Level=123
			icon='Beast.dmi'
		Shroom
			Level=126
			icon='Mushroom.dmi'
			EnemySkills=list("Poison Cloud","Cry for Help")
			Element="Earth";ElemStrength=list("Earth","Water");ElemWeakness=list("Fire")
		Turtle_Spider
			Level=129
			icon='TurtleSpider.dmi'
			Element="Water";ElemStrength=list("Water");ElemWeakness=list("Lightning")
		Forest_Snail
			Level=132
			icon='TreeSnail.dmi'
			Element="Earth";ElemStrength=list("Earth");ElemWeakness=list("Wind","Ice")
		Forest_Bat
			Level=135
			icon='BrownBat.dmi'
			EnemySkills=list("Woosh")
			Element="Wind";ElemStrength=list("Wind");ElemWeakness=list("Earth")
		Gorilla
			Level=138
			icon='PlaceHolderEnemy.dmi'
			Element="Earth";ElemStrength=list("Earth");ElemWeakness=list("Wind")
		Crocogator
			Level=141
			icon='PlaceHolderEnemy.dmi'
			Element="Water";ElemStrength=list("Water");ElemWeakness=list("Lightning")
		Giant_Croc
			Level=144
			icon='PlaceHolderEnemy.dmi'
			Element="Water";ElemStrength=list("Water");ElemWeakness=list("Lightning")
		Grand_Wasp
			Level=147
			icon='PlaceHolderEnemy.dmi'
			EnemySkills=list("Woosh","Sting")
			Element="Wind";ElemStrength=list("Wind");ElemWeakness=list("Earth")
		Emerald_Beetle
			Level=150
			icon='PlaceHolderEnemy.dmi'
			Element="Earth";ElemStrength=list("Earth");ElemWeakness=list("Wind","Lightning")
		Forest_Critter
			Level=153
			icon='PlaceHolderEnemy.dmi'
		Wild_Mongoose
			Level=156
			icon='PlaceHolderEnemy.dmi'
		Tree_Frog
			Level=159
			icon='PlaceHolderEnemy.dmi'
			Element="Earth";ElemStrength=list("Earth");ElemWeakness=list("Wind","Water","Fire")
		//volcanic enclave
		Lava_Ball
			Level=162
			icon='LavaBall.dmi'
			Element="Fire";ElemStrength=list("Fire");ElemWeakness=list("Ice")
			New()
				src.Spoils+=new/datum/EnemySpoils("/obj/Items/EnemySpoils/Flaming_Crystal",90)
				return ..()
		Fire_Walker
			Level=165
			icon='FireWalker.dmi'
			Element="Fire";ElemStrength=list("Fire");ElemWeakness=list("Ice")
			New()
				src.Spoils+=new/datum/EnemySpoils("/obj/Items/EnemySpoils/Flaming_Crystal",90)
				return ..()
		Burning_Blob
			Level=168
			icon='BurningBlob.dmi'
			Element="Fire";ElemStrength=list("Fire");ElemWeakness=list("Ice")
			New()
				src.Spoils+=new/datum/EnemySpoils("/obj/Items/EnemySpoils/Flaming_Crystal",90)
				return ..()
		Fire_Bat
			Level=171
			icon='FireBat.dmi'
			EnemySkills=list("Woosh")
			Element="Wind";ElemStrength=list("Wind","Fire");ElemWeakness=list("Earth","Ice")
			New()
				src.Spoils+=new/datum/EnemySpoils("/obj/Items/EnemySpoils/Flaming_Crystal",90)
				return ..()
		Heated_Stinger
			Level=174
			icon='HeatedStinger.dmi'
			EnemySkills=list("Sting")
			Element="Earth";ElemStrength=list("Earth","Fire");ElemWeakness=list("Wind","Ice")
			New()
				src.Spoils+=new/datum/EnemySpoils("/obj/Items/EnemySpoils/Flaming_Crystal",90)
				return ..()
		Rock_Lava
			Level=177
			icon='RockLava.dmi'
			EnemySkills=list("Slam")
			Element="Earth";ElemStrength=list("Fire","Earth");ElemWeakness=list("Ice","Wind")
			New()
				src.Spoils+=new/datum/EnemySpoils("/obj/Items/EnemySpoils/Flaming_Crystal",90)
				return ..()
		Salamander
			Level=180
			icon='PlaceHolderEnemy.dmi'
			Element="Earth";ElemStrength=list("Earth");ElemWeakness=list("Wind")
		Ember_Dragon
			Level=183
			icon='PlaceHolderEnemy.dmi'
			EnemySkills=list("Woosh")
			Element="Fire";ElemStrength=list("Fire");ElemWeakness=list("Ice")
			New()
				src.Spoils+=new/datum/EnemySpoils("/obj/Items/EnemySpoils/Flaming_Crystal",90)
				return ..()
		Crested_Turtle
			Level=186
			icon='PlaceHolderEnemy.dmi'
			Element="Earth";ElemStrength=list("Earth");ElemWeakness=list("Wind")
		Porcupine
			Level=189
			icon='PlaceHolderEnemy.dmi'
			EnemySkills=list("Cry for Help")
			Element="Earth";ElemStrength=list("Earth");ElemWeakness=list("Wind")
		Volcanite
			Level=192
			icon='PlaceHolderEnemy.dmi'
			Element="Fire";ElemStrength=list("Earth","Fire");ElemWeakness=list("Wind","Ice")
			New()
				src.Spoils+=new/datum/EnemySpoils("/obj/Items/EnemySpoils/Flaming_Crystal",90)
				return ..()
		Crimson_Crystal
			Level=195
			icon='PlaceHolderEnemy.dmi'
			Element="Fire";ElemStrength=list("Fire");ElemWeakness=list("Ice")
			New()
				src.Spoils+=new/datum/EnemySpoils("/obj/Items/EnemySpoils/Flaming_Crystal",90)
				return ..()
		Flaming_Boar
			Level=198
			icon='PlaceHolderEnemy.dmi'
			Element="Fire";ElemStrength=list("Fire");ElemWeakness=list("Ice")
			New()
				src.Spoils+=new/datum/EnemySpoils("/obj/Items/EnemySpoils/Flaming_Crystal",90)
				return ..()
		Hellz_Hopper
			Level=201
			icon='PlaceHolderEnemy.dmi'
			EnemySkills=list("Cry for Help")
			Element="Fire";ElemStrength=list("Fire");ElemWeakness=list("Ice")
			New()
				src.Spoils+=new/datum/EnemySpoils("/obj/Items/EnemySpoils/Flaming_Crystal",90)
				return ..()
		Lava_Bubble
			Level=204
			icon='PlaceHolderEnemy.dmi'
			Element="Fire";ElemStrength=list("Fire");ElemWeakness=list("Ice")
			New()
				src.Spoils+=new/datum/EnemySpoils("/obj/Items/EnemySpoils/Flaming_Crystal",90)
				return ..()
		Molten_Man
			Level=207
			icon='PlaceHolderEnemy.dmi'
			Element="Fire";ElemStrength=list("Fire");ElemWeakness=list("Ice")
			New()
				src.Spoils+=new/datum/EnemySpoils("/obj/Items/EnemySpoils/Flaming_Crystal",90)
				return ..()
		Molten_Slug
			Level=210
			icon='PlaceHolderEnemy.dmi'
			Element="Fire";ElemStrength=list("Fire");ElemWeakness=list("Ice")
			New()
				src.Spoils+=new/datum/EnemySpoils("/obj/Items/EnemySpoils/Flaming_Crystal",90)
				return ..()
		Lava_Puddle
			Level=213
			icon='PlaceHolderEnemy.dmi'
			Element="Fire";ElemStrength=list("Fire");ElemWeakness=list("Ice")
			New()
				src.Spoils+=new/datum/EnemySpoils("/obj/Items/EnemySpoils/Flaming_Crystal",90)
				return ..()
		Hellion_Harpy
			Level=216
			icon='PlaceHolderEnemy.dmi'
			EnemySkills=list("Woosh")
			Element="Wind";ElemStrength=list("Wind","Fire");ElemWeakness=list("Ice","Earth")
		Eruptor
			Level=219
			icon='PlaceHolderEnemy.dmi'
			Element="Fire";ElemStrength=list("Fire");ElemWeakness=list("Ice")
			New()
				src.Spoils+=new/datum/EnemySpoils("/obj/Items/EnemySpoils/Flaming_Crystal",90)
				return ..()
		Solidified_Golem
			Level=222
			icon='PlaceHolderEnemy.dmi'
			Element="Earth";ElemStrength=list("Earth","Fire");ElemWeakness=list("Wind","Ice")
		//un-used
		Cyclops
			Level=225
			EnemySkills=list("Slam")
			icon='PlaceHolderEnemy.dmi'
		Cyclops_Eye
			Level=228
			icon='PlaceHolderEnemy.dmi'
			Element="Earth";ElemStrength=list("Earth");ElemWeakness=list("Wind")

		Shini_Killer_1
			icon='PlaceHolderEnemy.dmi'
			Level=250
		Shini_Killer_2
			icon='PlaceHolderEnemy.dmi'
			Level=300
		Shini_Killer_3
			icon='PlaceHolderEnemy.dmi'
			Level=400
		Shini_Killer_4
			icon='PlaceHolderEnemy.dmi'
			Level=600
		Shini_Killer_5
			icon='PlaceHolderEnemy.dmi'
			Level=850
		Shini_Killer_6
			icon='PlaceHolderEnemy.dmi'
			Level=1150
		Shini_Killer_7
			icon='PlaceHolderEnemy.dmi'
			Level=1400
		Shini_Killer_8
			icon='PlaceHolderEnemy.dmi'
			Level=1800
		Shini_Killer_9
			icon='PlaceHolderEnemy.dmi'
			Level=2300
		Shini_Killer_10
			icon='PlaceHolderEnemy.dmi'
			Level=3000
		Shini_Killer_11
			icon='PlaceHolderEnemy.dmi'
			Level=5000




	Bosses
		ImmunityBonus=100
		EnemySkills=list("Spirit Blast")
		Frawg
			EnemySkills=list("Attack")
			icon='Frawg.dmi'
			Level=45
		Urahara
			icon='NPCUrahara.dmi'
			Level=60
		Roach_Lord
			icon='PlaceHolderEnemy.dmi'
			Level=90
		Ice_Golem
			Element="Ice";ElemStrength=list("Ice");ElemWeakness=list("Fire")
			EnemySkills=list("Freeze Ring")
			icon='IceGolem.dmi'
			Level=105
		Zanpakuto_Spirit
			icon='ZanSpirit.dmi'
			Level=150
		Inner_Hollow
			icon='Arrancar3.dmi'
			Level=300
		Kenyan_Mangrove_Crab
			icon='KenyanMangroveCrab.dmi'
			Level=165
		Phoenix
			Level=225
			icon='PlaceHolderEnemy.dmi'
			Element="Fire";ElemStrength=list("Fire");ElemWeakness=list("Ice")
		Aizen
			Level=150
			icon ='SoulReaperEnemy.dmi'


	Epics
		ImmunityBonus=100
