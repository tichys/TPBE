atom/var/PreDensity=null
obj/Supplemental
	SummonNotice
		layer=21
		screen_loc="1,13"
		icon='Hud.dmi';icon_state="SummonNotice"
		var/mob/InvitedBy
		New(var/mob/M,var/mob/L)
			src.loc=L.contents
			src.InvitedBy=M;return ..()
		Click()
			if(usr.Chatting)	return
			if(!usr.TeleportCheck())	return
			PlayMenuSound(usr,'OOT_MainMenu_Select.wav')
			usr.WriteLine(1,1,1,1,"SummonNotice","",1);usr.client.screen-=src
			if(!src.InvitedBy)	{QuestShow(usr,"Player has gone Offline");goto DelSrc}
			if(CustAlert(usr,"[src.InvitedBy.name] wants to Summon you",list("Accept","Decline"),0,10,5,12)=="Accept")
				if(!usr || !src.InvitedBy)	goto DelSrc
				if(src.InvitedBy.z==16 || src.InvitedBy.z==19 || src.InvitedBy.z==20 || src.InvitedBy.z==23 || src.InvitedBy.z==26 || src.InvitedBy.z==25) goto DelSrc
				if(usr.Chatting || usr.Stunned)	goto DelSrc
				if(usr.TurnMode || !usr.CanMove)	goto DelSrc
				if(!usr.TeleportCheck() || !src.InvitedBy.TeleportCheck())	goto DelSrc
				if(usr.client.eye!=usr || src.InvitedBy.client.eye!=src.InvitedBy)	goto DelSrc
				ShowEffect(usr,'Effects.dmi',"PortalFull","",10)
				sleep(5);if(usr && src.InvitedBy)	usr.loc=src.InvitedBy.loc
			DelSrc;del src
	TeleportNotice
		layer=21
		screen_loc="1,13"
		icon='Hud.dmi';icon_state="TeleportNotice"
		var/mob/InvitedBy
		New(var/mob/M,var/mob/L)
			src.loc=L.contents
			src.InvitedBy=M;return ..()
		Click()
			if(usr.Chatting)	return
			if(!usr.TeleportCheck())	return
			PlayMenuSound(usr,'OOT_MainMenu_Select.wav')
			usr.WriteLine(1,1,1,1,"TeleportNotice","",1);usr.client.screen-=src
			if(!src.InvitedBy)	{QuestShow(usr,"Player has gone Offline");goto DelSrc}
			if(CustAlert(usr,"[src.InvitedBy.name] wants to Teleport to you",list("Accept","Decline"),0,10,5,12)=="Accept")
				if(!usr || !src.InvitedBy)	goto DelSrc
				if(usr.z==16 || usr.z==19 || usr.z==20 || usr.z==23 || usr.z==25 || usr.z==26) goto DelSrc
				if(src.InvitedBy.Chatting || src.InvitedBy.Stunned)	goto DelSrc
				if(src.InvitedBy.TurnMode || !src.InvitedBy.CanMove)	goto DelSrc
				if(!usr.TeleportCheck() || !src.InvitedBy.TeleportCheck())	goto DelSrc
				if(usr.client.eye!=usr || src.InvitedBy.client.eye!=src.InvitedBy)	goto DelSrc
				ShowEffect(src.InvitedBy,'Effects.dmi',"PortalFull","",10)
				sleep(5);if(usr && src.InvitedBy)	src.InvitedBy.loc=usr.loc
			DelSrc;del src
	Mirror_Gate
		density=1
		icon='Effects.dmi';icon_state="Mirror Gate"
		New(var/turf/T)
			if(T.PreDensity==null)	T.PreDensity=T.density
			src.loc=T;T.density=1
			return ..()
		Del()
			src.loc.density=src.loc.PreDensity
			return ..()
	Freeze_Ring
		layer=TURF_LAYER+1;mouse_opacity=0
		icon='Effects.dmi';icon_state="Ice"
	Fire_Ring
		layer=TURF_LAYER+1;mouse_opacity=0
		icon='Effects.dmi';icon_state="Fire"
	God_Spear
		layer=TURF_LAYER+1;mouse_opacity=0
		icon='GodSpear.dmi';icon_state="RisingSword"
	Suzume_Destroy
		layer=TURF_LAYER+1;mouse_opacity=0
		icon='Hornet.dmi';icon_state="Destroy"

mob/proc
	UseRei(var/ReiAmt)
		if(src.Blocking||!src.CanMove||src.Stunned)	return
		if(src.REI<ReiAmt)	{QuestShow(src,"[ReiAmt] Reiatsu Required");return}
		src.ReiRegenWait=10;src.REI-=ReiAmt;src.ReiBar();return 1

mob/proc/GetAlly()
	var/mob/ThisTarget=src
	if(src.Target && MyGetDist(src,src.Target)<=src.SightRange && (!istype(src.Target,/mob/Enemy)))
		if(!src.CanPVP(src.Target))	ThisTarget=src.Target
	return ThisTarget

mob/proc/TeleportCheck(/**/)
	if(src.RegenWait>=0)	{QuestShow(src,"Cannot be Activated During Combat");return}
	if(src.z==8)	{QuestShow(src,"Cannot be Activated inside the Arena");return}
	return 1

mob/proc
	//healing
	Soul_Glow()
		if(!src.UseRei(50))	return
		var/Heal=0;for(var/obj/Spells/Healing/Soul_Glow/S in src.Spells)
			Heal=(50+src.MGC)*((0.25*(S.Level-1))+1);Heal=round(Heal)
		MyFlick("Blast",src)
		var/mob/ThisTarget=src.GetAlly()
		ShowEffect(ThisTarget,'Effects.dmi',"Soul Glow","",10,0,1)
		ThisTarget.STM=min(ThisTarget.MaxSTM,ThisTarget.STM+Heal)
		ThisTarget.StmBar();DamageShow(ThisTarget,Heal,'HealNums.dmi')
	Regen()
		if(!src.UseRei(100))	return
		var/Durate=0;for(var/obj/Spells/Healing/Regen/S in src.Spells)
			Durate=300+(30*(S.Level-1))
		MyFlick("Blast",src)
		var/mob/ThisTarget=src.GetAlly()
		ShowEffect(ThisTarget,'Effects.dmi',"Soul Glow","",10,0,1)
		ThisTarget.AddEffect(new/datum/StatusEffects/Regen(Durate,src.name))
	Brightest_Light()
		if(!src.UseRei(100))	return
		var/Heal=0;for(var/obj/Spells/Healing/Brightest_Light/S in src.Spells)
			Heal=(50+src.MGC)*((0.25*(S.Level-1))+1);Heal=round(Heal)
		MyFlick("Blast",src)
		for(var/mob/M in view(src.SightRange,src))
			if(!istype(M,/mob/Enemy))
				if(src.CanPVP(M))	continue
				M.STM=min(M.MaxSTM,M.STM+Heal)
				M.StmBar();DamageShow(M,Heal,'HealNums.dmi')
				ShowEffect(M,'Effects.dmi',"Soul Glow","",10,0,1)
	Cleanse()
		if(!src.UseRei(75))	return
		MyFlick("Blast",src)
		var/mob/ThisTarget=src.GetAlly()
		ShowEffect(ThisTarget,'Effects.dmi',"Cleanse","",10,0,1)
		for(var/datum/StatusEffects/E in ThisTarget.StatusEffects)
			if(E.Abnormal)	E.RemovalProc(ThisTarget)
	//Augmentation
	Jog()
		if(!src.UseRei(50))	return
		var/Durate=0;for(var/obj/Spells/Augmentation/Jog/S in src.Spells)
			Durate=300+(30*(S.Level-1))
		MyFlick("Blast",src)
		var/mob/ThisTarget=src.GetAlly()
		//ShowEffect(ThisTarget,'Effects.dmi',"Soul Glow","",10,0,1)
		ThisTarget.AddEffect(new/datum/StatusEffects/StatBooster("Jog","MovementSpeed",-1,Durate,"Increases Movement Speed by 1",src))
	Run()
		if(!src.UseRei(50))	return
		var/Durate=0;for(var/obj/Spells/Augmentation/Run/S in src.Spells)
			Durate=300+(30*(S.Level-1))
		MyFlick("Blast",src)
		var/mob/ThisTarget=src.GetAlly()
		//ShowEffect(ThisTarget,'Effects.dmi',"Soul Glow","",10,0,1)
		ThisTarget.AddEffect(new/datum/StatusEffects/StatBooster("Run","MovementSpeed",-1,Durate,"Increases Movement Speed by 1",src))
	//Teleportation
	Travel()
		if(!src.TeleportCheck())	return
		if(src.jailed==1)	{QuestShow(src,"Cannot do that while Jailed");return}
		if(!src.UseRei(200))	return
		var/list/listy=list()
		for(var/obj/NPC/Shopish/Transporter/M in world)
			if(M.Place in src.TransLocs)	listy+="[M.Place]"
		var/mob/M=input("Select a Location to Travel to","Travel") as null|anything in listy
		if(M)
			if(!src.TeleportCheck())	return
			for(var/obj/NPC/Shopish/Transporter/T in world)	if(T.Place==M)
				MyFlick("Blast",src)
				ShowEffect(src,'Effects.dmi',"PortalFull","",10)
				sleep(5);if(src)	src.loc=get_step(T,T.dir)
	Teleport()
		if(!src.TeleportCheck())	return
		if(!src.UseRei(200))	return
		if(src.jailed==1)	{QuestShow(src,"Cannot do that while Jailed");return}
		var/list/listy=list()
		for(var/mob/Player/M in world)
			if(M.client)
				listy+=M
			if(M.key=="Millamber")
				listy-=M
		var/mob/M=input("Select a Player to Teleport to","Teleport") as null|anything in listy
		if(M)
			if(!src.TeleportCheck())	return
			if(M.TutLevel<5)	{QuestShow(src,"Cannot Teleport to Players until they Complete the Tutorial");return}
			if(M.z==8)	{QuestShow(src,"Cannot Teleport into the Arena");return}
			if(M.z==16 || M.z==19 || M.z==20 || M.z==23 || M.z==25 || M.z==26)	{QuestShow(src,"Cannot Teleport to a Spawn");return}
			if(M.jailed==1)	{QuestShow(src,"Cannot Teleport to a Jailed player");return}
			MyFlick("Blast",src)
			M.PendingRequest=new/obj/Supplemental/TeleportNotice(src,M)
			M.client.screen+=M.PendingRequest;M.WriteLine(2,0,13,8,"TeleportNotice","[src.name] wants to Teleport to You",1)
	Portal()
		if(!src.TeleportCheck())	return
		if(!src.UseRei(200))	return
		if(src.jailed==1)	{QuestShow(src,"Cannot do that while Jailed");return}
		var/list/listy=list()
		for(var/obj/NPC/Shopish/Transporter/M in world)
			if(M.Place in src.TransLocs)	listy+="[M.Place]"
		var/mob/M=input("Select a Location to open a Portal to","Portal") as null|anything in listy
		if(M)
			if(!src.TeleportCheck())	return
			for(var/obj/NPC/Other/Portal/P in src.Cache)	del P
			MyFlick("Blast",src)
			var/obj/NPC/Other/Portal/P=new(get_step(src,src.dir))
			P.Owner=src;P.PortalTo=M;src.Cache+=P
	Summon()
		if(!src.TeleportCheck())	return
		if(!src.UseRei(200))	return
		var/list/listy=list()
		for(var/mob/Player/M in world)
			if(M.client)
				listy+=M
			if(M.key=="Millamber")
				listy-=M
		var/mob/M=input("Select a Player to Summon","Summon") as null|anything in listy
		spawn()
			if(!src || !M)	return
			if(!src.TeleportCheck())	return
			if(M.TutLevel<5)	{QuestShow(src,"Cannot Summon Players until they Complete the Tutorial");return}
			if(M.PendingRequest)	{QuestShow(src,"[M] already Pending an Invite");return}
			if(src.z==13)	{QuestShow(src,"Cannot be Activated inside the Tournament Arena");return}
			if(src.z==16 ||src.z==19 || src.z==20 || src.z==23 || src.z==25 || src.z==26)	{QuestShow(src,"Cannot summon someone here");return}
			if(M.jailed==1)	{QuestShow(src,"Cannot summon a player that has been Jailed");return}
			if(src.jailed==1)	{QuestShow(src,"Cannot summon a player while Jailed");return}
			if(M.Chatting)	{QuestShow(src,"[M] is not Currently Available");return}
			MyFlick("Blast",src)
			M.PendingRequest=new/obj/Supplemental/SummonNotice(src,M)
			M.client.screen+=M.PendingRequest;M.WriteLine(2,0,13,8,"SummonNotice","[src.name] wants to Summon You",1)
	Recall()
		if(src.RegenWait>=0)	{QuestShow(src,"Cannot be Activated During Combat");return}
		if(src.z==8)	{QuestShow(src,"Cannot be Activated inside the Arena");return}
		if(src.z==13)	{QuestShow(src,"Cannot be Activated inside the Tournament Arena");return}
		if(src.jailed==1)	{QuestShow(src,"Cannot recall when Jailed");return}
		MyFlick("Blast",src)
		ShowEffect(src,'Effects.dmi',"PortalFull","",10)
		sleep(5);if(src)	src.loc=locate(src.RespawnX,src.RespawnY,src.RespawnZ)
	//other
	White_Prostration()
		MyFlick("Blast",src)
		for(var/obj/Spells/Mysticism/White_Prostration/K in src.Spells)	src.FreezeKidou(src.Target,K)
	Mirror_Gate()
		QuestShow(usr,"Mirror Gate is Temporarily Disabled");return
		var/Clearing=0
		for(var/obj/Supplemental/Mirror_Gate/M in src.DeathCache)
			del M;Clearing=1
		if(Clearing)	{MyFlick("Blast",src);return}
		if(!src.UseRei(150))	return
		MyFlick("Blast",src)
		for(var/mob/M in oview(1,src))	step_away(M,src)
		for(var/turf/T in oview(1,src))
			if(!T.density && MyGetDist(src,T))
				var/obj/Supplemental/Mirror_Gate/M=new(T)
				M.dir=get_dir(src,M);src.DeathCache+=M