mob/proc/UpdateStatusEffects()
	if(!src.client)	return
	for(var/obj/StatusEffectDisplay/S in src.client.screen)	del S
	var/counter=0
	for(var/datum/StatusEffects/E in src.StatusEffects)
		var/obj/StatusEffectDisplay/S=new()
		if(E.name == "Shikai Boost")
			S.icon_state = E.name
		S.RelatedEffect=E
		S.icon_state=E.name;S.screen_loc="[6+round(counter/2)]:[(counter*24)-(round(counter/2)*32)],[17-round(counter/10)]:8"
		S.mouse_over_pointer="MouseOver";src.client.screen+=S;counter+=1

obj/StatusEffectDisplay
	layer=19;icon='StatusEffects.dmi'
	var/datum/StatusEffects/RelatedEffect
	Click()
		if(usr.Chatting)	return
		if(!src.RelatedEffect)	return
		var/list/OList=list("Dispell","Close")
		var/datum/StatusEffects/RE=src.RelatedEffect
		if(!(RE in usr.StatusEffects) || RE.Abnormal)	OList-="Dispell"
		var/TimeRemaining="[round(RE.Duration/60)]m [RE.Duration-(round(RE.Duration/60)*60)]s"
		if(!RE.Duration)	TimeRemaining="Infinite"
		var/CompMsg="[RE.name] > > [RE.desc] > Source: [RE.CastBy] > Time Remaining: [TimeRemaining]"
		if(CustAlert(usr,CompMsg,OList,5,13,13,16)=="Dispell")	RE.RemovalProc(usr)

obj/Supplemental
	OrbitFront
		icon='Effects.dmi'
		layer=6
	OrbitBack
		icon='Effects.dmi'
		layer=MOB_LAYER-1

var/list/AllStatusEffects=list()
var/list/AllStatusEffectsNames=list()
datum/StatusEffects
	var/name="Unknown"
	var/desc="Unknown Effect"
	var/CastBy="Unknown Caster"
	var/Abnormal=0	//determines if good, or bad (can be dispelled or not)
	var/Duration=0	//in seconds, loops only get executed once per second on effects
	var/Stat2Boost
	var/Stat2Boost2
	var/Stat2Boost3
	var/Stat2Boost4
	var/Stat2Boost5
	var/Stat2Boost6
	var/Amt2Boost
	New(var/Durate,var/CastedBy)
		if(!isnum(Durate))	return
		src.Duration=Durate;src.CastBy="[CastedBy]"
	proc/Execute(var/mob/M)	return
	proc/AddProc(var/mob/M,var/ShowMsg=1)
		if(src.Stat2Boost)	M.vars[src.Stat2Boost]+=src.Amt2Boost
		if(src.Stat2Boost2)	M.vars[src.Stat2Boost2]+=src.Amt2Boost
		if(src.Stat2Boost3)	M.vars[src.Stat2Boost3]+=src.Amt2Boost
		if(src.Stat2Boost4)	M.vars[src.Stat2Boost4]+=src.Amt2Boost
		if(src.Stat2Boost5)	M.vars[src.Stat2Boost5]+=src.Amt2Boost
		if(src.Stat2Boost6)	M.vars[src.Stat2Boost6]+=src.Amt2Boost
		//if(src.Stat2Boost=="MaxSTM"||src.Stat2Boost=="MaxREI")	M.HUDRefresh()
		//if(src.Stat2Boost=="Training")
		if(ShowMsg)	QuestShow(M,"Effect Gained: [src.name]")
		M.StatusEffects+=src;src.Execute(M)
		M.UpdateStatusEffects()
	proc/RemovalProc(var/mob/M,var/ShowMsg=1)
		if(src.Stat2Boost)	M.vars[src.Stat2Boost]-=src.Amt2Boost
		if(src.Stat2Boost2)	M.vars[src.Stat2Boost2]-=src.Amt2Boost
		if(src.Stat2Boost3)	M.vars[src.Stat2Boost3]-=src.Amt2Boost
		if(src.Stat2Boost4)	M.vars[src.Stat2Boost4]-=src.Amt2Boost
		if(src.Stat2Boost5)	M.vars[src.Stat2Boost5]-=src.Amt2Boost
		if(src.Stat2Boost6)	M.vars[src.Stat2Boost6]-=src.Amt2Boost
		if(M.Visored && src.name == "Visored Boost"||"Visored" in M.ToggledSkills && src.name == "Visored Boost")
			if(M.VisoredMask == "Horned")
				M.overlays-=new/obj/EquipmentOverlays/HornedVisoredMask
				MyFlick("Mask Break",M)
				M.ToggledSkills-="Visored"
			if(M.VisoredMask == "Dank")
				M.overlays-=new/obj/EquipmentOverlays/DANKVisoredMask
				MyFlick("Mask Break",M)
				M.ToggledSkills-="Visored"
			else
				M.overlays-=new/obj/EquipmentOverlays/BlankVisoredMask
				MyFlick("Mask Break",M)
				M.ToggledSkills-="Visored"

		if(src.Stat2Boost=="MaxSTM")	{M.STM=min(M.STM,M.MaxSTM);M.StmBar()}
		if(src.Stat2Boost=="MaxREI")	{M.REI=min(M.REI,M.MaxREI);M.ReiBar()}
		if(src.Stat2Boost=="MaxSTM"||src.Stat2Boost=="MaxREI")	M.HUDRefresh()
		//if(M.VisoredMask in M.overlays && src.name=="Visored Boost") M.overlays-=M.VisoredMask
		if(ShowMsg)	QuestShow(M,"Effect Fades: [src.name]")
		M.StatusEffects-=src;M.UpdateStatusEffects()
		del src;return
	Regen
		name="Regen";desc="Stamina will recover even during combat"

	Invincibles
		Last_Gasp
			name="Last Gasp"
			Duration=2;desc="Temporarily Prevents Damage after Last Gasp Activates"
		Quincy_Pride
			name="Quincy Pride"
			Duration=2;desc="Temporarily Prevents Damage after Quincy Pride Activates"
	StatBooster
		New(var/Name,var/Stat,var/Amt,var/Dur,var/Desc,var/CastedBy)
			src.name=Name;src.desc=Desc;src.Duration=Dur;src.CastBy="[CastedBy]"
			src.Stat2Boost=Stat;src.Amt2Boost=Amt

/*



	ShikaiBoost
		New(var/Name,var/Stat,var/Amt,var/Dur,var/CastedBy,var/Stat2,var/Stat3,var/Stat4,var/Stat5,var/Stat6,var/Desc,)
			src.name=Name
			src.desc=Desc
			src.Duration=Dur
			src.CastBy="[CastedBy]"
			src.Stat2Boost=Stat
			src.Amt2Boost=Amt
			src.Stat2Boost2=Stat2
			src.Stat2Boost3=Stat3
			src.Stat2Boost4=Stat4
			src.Stat2Boost5=Stat5
			src.Stat2Boost6=Stat6

	BankaiBoost
		New(var/Name,var/Stat,var/Amt,var/Dur,var/CastedBy,var/Stat2,var/Stat3,var/Stat4,var/Stat5,var/Stat6,var/Desc,)
			src.name=Name
			src.desc=Desc
			src.Duration=Dur
			src.CastBy="[CastedBy]"
			src.Stat2Boost=Stat
			src.Amt2Boost=Amt
			src.Stat2Boost2=Stat2
			src.Stat2Boost3=Stat3
			src.Stat2Boost4=Stat4
			src.Stat2Boost5=Stat5
			src.Stat2Boost6=Stat6


	VisoredBoost
		New(var/Name,var/Stat,var/Amt,var/Dur,var/CastedBy,var/Stat2,var/Stat3,var/Stat4,var/Stat5,var/Stat6,var/Mask,var/Desc)
			src.name=Name
			src.desc=Desc
			src.Duration=Dur
			src.CastBy="[CastedBy]"
			src.Stat2Boost=Stat
			src.Amt2Boost=Amt
			src.Stat2Boost2=Stat2
			src.Stat2Boost3=Stat3
			src.Stat2Boost4=Stat4
			src.Stat2Boost5=Stat5
			src.Stat2Boost6=Stat6
			if(usr.VisoredMask == "Horned")
				usr.overlays+=new/obj/EquipmentOverlays/HornedVisoredMask
			if(usr.VisoredMask == "Dank")
				usr.overlays+=new/obj/EquipmentOverlays/DANKVisoredMask
			if(usr.VisoredMask == "Blank")
				usr.overlays+=new/obj/EquipmentOverlays/BlankVisoredMask

*/

	Visored
		var/Icon=null
		var/ReiCost=0

		proc/AddOverlays(var/mob/M)
			M.overlays-=src.Icon
			if(src.name == "Visored")
				if(M.VisoredMask == "Horned")
					src.Icon =new/obj/EquipmentOverlays/HornedVisoredMask
					M.overlays+=src.Icon
					return
				if(M.VisoredMask == "Dank")
					src.Icon =new/obj/EquipmentOverlays/DANKVisoredMask
					M.overlays+=src.Icon
					return
				if(M.VisoredMask == "Blank")
					src.Icon =new/obj/EquipmentOverlays/BlankVisoredMask
					M.overlays+=src.Icon
					return
			else	M.overlays+=src.Icon

		New(var/Name,var/Durate,var/CastedBy,var/Stat,var/Stat2,var/Stat3,var/Stat4,var/Stat5,var/Stat6,var/Amt,var/Cost,var/Desc)
			if(!isnum(Durate))	return
			src.name=Name;src.Duration=Durate;src.CastBy="[CastedBy]";src.desc=Desc
			src.Amt2Boost=Amt;src.ReiCost=Cost;src.Stat2Boost=Stat;src.Stat2Boost2=Stat2
			src.Stat2Boost3=Stat3;src.Stat2Boost4=Stat4;src.Stat2Boost5=Stat5;src.Stat2Boost6=Stat6

		AddProc(var/mob/M,var/ShowMsg=1)
			src.AddOverlays(M)
			return ..(M,ShowMsg)

		RemovalProc(var/mob/M,var/ShowMsg=1)
			if(src.name == "Visored")
				M.Visored = 0
				M.ToggledSkills -= "Visored"
				M.overlays-=src.Icon
				MyFlick("Mask Break",M)
				return ..(M,ShowMsg)
			else
				M.overlays-=src.Icon
				return ..(M,ShowMsg)

		Execute(var/mob/M)
			if(src.ReiCost && M.REI<src.ReiCost)
				src.RemovalProc(M);return
			M.REI-=src.ReiCost;M.ReiBar()




	Bankai
		var/Icon=null
		var/ReiCost=0

		proc/AddOverlays(var/mob/M)
			M.overlays-=src.Icon
			if(M.Zanpakuto.SpiritType=="Ghost")
				M.MovementSpeed=1
				M.icon='bankai.dmi'
				M.RemoveZanOvers()
				M.RefreshClothes()
				//M.DamageIcon=M.icon+rgb(255,0,0)
				//M.GuardIcon=M.icon+rgb(155,155,155)
				M.AddHair(M.HairStyle,"Bankai")
				M.AddName()
				ShowEffect(M,'Effects.dmi',"Energy","",30,1)
				PlayTimedSound(view(M,9),'Energy.wav',30)
				sleep(30)
				if(!M.SpiritForm){M.CanMove=1;M.Transforming=0;return}
				MyFlick("Combo",M)
				PlayVoice(view(M,M.SightRange),'DinsFire.wav')
				return
			if(M.Zanpakuto.SpiritType=="Dragon")
				M.icon_state="";M.AddIceWings()
				return
			//if(M.Zanpakuto.SpiritType=="Beast")	M.ChainStart();return
			if(M.Zanpakuto.SpiritType=="Petals")
				M.overlays+=new/obj/SkillSups/PetalShikai;return


		New(var/Name,var/Durate,var/CastedBy,var/Stat,var/Stat2,var/Stat3,var/Stat4,var/Stat5,var/Stat6,var/Amt,var/Cost,var/Desc)
			if(!isnum(Durate))	return
			src.name=Name;src.Duration=Durate;src.CastBy="[CastedBy]";src.desc=Desc
			src.Amt2Boost=Amt;src.ReiCost=Cost;src.Stat2Boost=Stat;src.Stat2Boost2=Stat2
			src.Stat2Boost3=Stat3;src.Stat2Boost4=Stat4;src.Stat2Boost5=Stat5;src.Stat2Boost6=Stat6

		AddProc(var/mob/M,var/ShowMsg=1)
			src.AddOverlays(M)
			return ..(M,ShowMsg)

		RemovalProc(var/mob/M,var/ShowMsg=1)
			M.Bankai = 0
			M.ToggledSkills -= "Bankai"
			if(M.Zanpakuto.SpiritType=="Dragon") M.RemoveIceWings()
			M.overlays-=src.Icon
			return ..(M,ShowMsg)

		Execute(var/mob/M)
			if(src.ReiCost && M.REI<src.ReiCost)
				src.RemovalProc(M);return
			M.REI-=src.ReiCost;M.ReiBar()




	Shikai
		var/Icon=null
		var/ReiCost=0

		proc/AddOverlays(var/mob/M)
			if(usr.Zanpakuto.SpiritType=="Kira")
				usr.icon = 'SoulReaperKira.dmi'
			//	var/obj/Bankai/IceWings/Zanpakuto_West/F=new()
			//	var/obj/Bankai/IceWings/Zanpakuto_South/S=new()
			//	F.pixel_y+=2
			//	S.pixel_y-=15
			//	F.pixel_x-=21
			//	S.pixel_x-=6
			//	usr.overlays += F
			//	usr.overlays += S



		New(var/Name,var/Durate,var/CastedBy,var/Stat,var/Stat2,var/Stat3,var/Stat4,var/Stat5,var/Stat6,var/Amt,var/Cost,var/Desc)
			if(!isnum(Durate))	return
			src.name=Name;src.Duration=Durate;src.CastBy="[CastedBy]";src.desc=Desc
			src.Amt2Boost=Amt;src.ReiCost=Cost;src.Stat2Boost=Stat;src.Stat2Boost2=Stat2
			src.Stat2Boost3=Stat3;src.Stat2Boost4=Stat4;src.Stat2Boost5=Stat5;src.Stat2Boost6=Stat6

		AddProc(var/mob/M,var/ShowMsg=1)
			src.AddOverlays(M)
			return ..(M,ShowMsg)

		RemovalProc(var/mob/M,var/ShowMsg=1)
			M.Shikai=0
			M.ToggledSkills-="Shikai"
			if("Scatter" in M.ToggledSkills)
				M.ToggledSkills-="Scatter"
			if(usr.Zanpakuto.SpiritType=="Kira")	usr.icon = 'SoulReaper.dmi'
			M.overlays-=src.Icon
			return ..(M,ShowMsg)

		Execute(var/mob/M)
			if(src.ReiCost && M.REI<src.ReiCost)
				src.RemovalProc(M);return
			M.REI-=src.ReiCost;M.ReiBar()



	ItemStatBooster
		New(var/obj/Items/StatBoosters/S,var/CastedBy)
			if(!istype(S,/obj/Items/StatBoosters))	return
			src.name=S.name;src.desc=S.desc;src.Duration=S.Duration;src.CastBy="[CastedBy]"
			src.Stat2Boost=S.Stat2Boost;src.Amt2Boost=S.Amt2Boost
	Berserk
		var/AtkBoost=0
		var/DefDown=0
		New(var/Nam,var/Atk,var/Def,var/Dur,var/CastedBy)
			src.name=Nam;src.AtkBoost=Atk;src.DefDown=Def
			var/DefTag="";if(src.DefDown)	DefTag=" > Increases Damage Taken by [src.DefDown]"
			src.desc="Increases Damage Dealt by [src.AtkBoost]%[DefTag]"
			src.Duration=Dur;src.CastBy="[CastedBy]"
	RadialEffects
		var/obj/Supplemental/OrbitFront/FrontObj=new
		var/obj/Supplemental/OrbitBack/BackObj=new
		var/FrontIS="BlueBallFront"
		var/BackIS="BlueBallBack"
		var/EffectRange=0
		var/ReiCost=0
		proc/AddOverlays(var/mob/M)
			M.overlays-=src.FrontObj;M.overlays-=src.BackObj
			src.FrontObj.icon_state="[src.FrontIS]"
			src.BackObj.icon_state="[src.BackIS]"
			M.overlays+=src.FrontObj;M.overlays+=src.BackObj
		New(var/Name,var/Durate,var/CastedBy,var/Stat2,var/Amt2,var/Desc,FIS,BIS,var/Range,var/Cost)
			if(!isnum(Durate))	return
			src.FrontIS=FIS;src.BackIS=BIS
			src.name=Name;src.desc=Desc
			src.Duration=Durate;src.CastBy="[CastedBy]"
			src.Stat2Boost=Stat2;src.Amt2Boost=Amt2
			src.EffectRange=Range;src.ReiCost=Cost
		AddProc(var/mob/M,var/ShowMsg=1)
			src.AddOverlays(M)
			return ..(M,ShowMsg)
		RemovalProc(var/mob/M,var/ShowMsg=1)
			M.overlays-=src.FrontObj;M.overlays-=src.BackObj
			return ..(M,ShowMsg)
		Execute(var/mob/M)
			if(src.ReiCost && M.REI<src.ReiCost)
				src.RemovalProc(M);return
			M.REI-=src.ReiCost;M.ReiBar()
			if(src.EffectRange && src.CastBy=="[M]" && !M.invisibility)
				for(var/mob/N in oview(src.EffectRange,M))	if(!M.CanPVP(N))
					N.AddEffect(new/datum/StatusEffects/RadialEffects(src.name,2,M,src.Stat2Boost,src.Amt2Boost,src.desc,\
						src.FrontIS,src.BackIS,0,0))
	PoisonTypes
		Abnormal=1
		New(var/Durate,var/CastedBy,var/Damage=10,var/Desc)
			if(!isnum(Durate))	return
			src.Duration=Durate;src.CastBy="[CastedBy]"
			src.Amt2Boost=Damage;src.desc=Desc
		Execute(var/mob/M)
			if(M.STM>1)
				DamageShow(M,src.Amt2Boost)
				M.STM=max(1,M.STM-src.Amt2Boost);M.StmBar()
		Poison
			name="Poison"
		Bleed
			name="Bleed"
		Burn
			name="Burn"

	AoEDoT
		var/Range
		Abnormal=1
		New(var/Durate,var/CastedBy,var/Damage,var/Range,var/Desc)
			if(!isnum(Durate))	return
			src.Duration=Durate;src.CastBy="[CastedBy]"
			src.Amt2Boost=Damage;src.desc=Desc;src.Range=Range

		Execute(var/mob/M)
			//
			for(M in oview(src.Range,usr))
				if(istype(M,/mob/Enemy))
					var/N = src.Amt2Boost-M.MGCDEF
					if(N <=0)
						N=0
					M.STM-=N
					DamageShow(M,N)
					M.STM=max(0,M.STM-N);M.StmBar();M.DeathCheck(usr)
					if(usr.Zanpakuto.SpiritType=="Endless Flames")
						ShowEffect(M.loc,'Effects.dmi',"FireSpark")
						if(usr.Bankai)
							M.AddEffect(new/datum/StatusEffects/StatBooster("MGCDEF Debuff","MGCDEF",-(round(usr.MGC/2)),src.Duration,"Flame Ring",usr))
							M.AddEffect(new/datum/StatusEffects/StatBooster("VIT Debuff","VIT",-(round(usr.MGC/2)),src.Duration,"Flame Ring",usr))

					if(usr.Zanpakuto.SpiritType=="Rukia")
						ShowEffect(M.loc,'Effects.dmi',"IceSpark")
						if(usr.Bankai)
							if(M in view(2,usr))
								M.StunProc(15,"Freeze",usr)
				if(usr.PVP&&M.PVP||usr.PVPingAgainst==M && M.PVPingAgainst==usr)
					for(M in oview(src.Range,usr))
						var/N = src.Amt2Boost-M.MGCDEF
						if(N <=0)
							N=0
						M.STM-=N
						DamageShow(M,N)
						M.STM=max(0,M.STM-N);M.StmBar();M.DeathCheck(usr)
						if(usr.Zanpakuto.SpiritType=="Endless Flames")
							ShowEffect(M.loc,'Effects.dmi',"FireSpark")
							if(usr.Bankai)
								M.AddEffect(new/datum/StatusEffects/StatBooster("MGCDEF Debuff","MGCDEF",-(round(usr.MGC/2)),src.Duration,"Flame Ring",usr))
								M.AddEffect(new/datum/StatusEffects/StatBooster("VIT Debuff","VIT",-(round(usr.MGC/2)),src.Duration,"Flame Ring",usr))

						if(usr.Zanpakuto.SpiritType=="Rukia")
							ShowEffect(M.loc,'Effects.dmi',"IceSpark")
							if(usr.Bankai)
								if(M in view(1))
									M.StunProc(10,"Freeze",usr)

mob/var/list/StatusEffects=list()

mob/proc/AddEffect(var/datum/StatusEffects/N)
	var/ShowMsg=1
	for(var/datum/StatusEffects/E in src.StatusEffects)	if(E.name==N.name)
		if(E.Duration && E.Duration<=N.Duration && E.Amt2Boost<=N.Amt2Boost)
			ShowMsg=0;E.RemovalProc(src,ShowMsg);break
		else	{del N;return}
	N.AddProc(src,ShowMsg)

mob/proc/FindEffect(var/Effect2Find)
	for(var/datum/StatusEffects/E in src.StatusEffects)
		if(E.name==Effect2Find)	return max(1,E.Duration)
	return 0

mob/proc/StatusDuration()
	for(var/datum/StatusEffects/E in src.StatusEffects)
		E.Execute(src);if(!E)	continue
		if(!E.Duration)	continue
		E.Duration-=1;if(E.Duration<=0)	E.RemovalProc(src)
