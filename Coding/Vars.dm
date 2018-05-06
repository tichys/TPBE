var
	list/MonsterScores = list()
	list/Players=list()
	PlayerCount=0
	PlayerLimit=99
	EnemyHuntRange=4
	WorldPVP=0
	IsRouted
	CanMultiKey="Disable"
	MOTD="<html><body bgcolor=black><font color=yellow><b><center>Welcome to Bleach Eternity"
	list/ChargeableSkills=list("Spirit Charge","Getsuga Tenshou","White Lightning","Petal Stream",\
		"Roaring Thunder Burn","Black Getsuga Tenshou","Syphon Health","Fire Blast","Vine Impale")
	list/AllSpecials=list()
	list/ShikaiSkillNames=list()
	list/BankaiSkillNames=list()
	list/VaizardSkillNames=list()
	list/HollowTypes=list()
	GameVersion= 1.09
	StatusNote
	RebootTime	//auto reboot setting
	Serverxp = 0
	BadgeCost=250000
	Rebooting
	PlayerInfoTag="<b><font size=1><font color=blue>Player Info:</font> "
	VoteInfoTag="<b><font color=yellow>Vote Info:</font></b> "
	ServerInfoTag="<b><font color=green>Server Info:</font> "
	PveDam=2	//PVE Damage Multiplier
	PveArrDam=1
	LoggedIPs=""
	NoAnn=0
	KillEvent=0
	GoldEvent=1
	Mapsoff=0
	MBround=0
	SkillTour=0
	DisableMute = 0
	LoggedIPCount=0
	Map/Squadspawn
	list/MapNames=list("1"="Sewers","3"="Arial Outpost","4"="Karakura","5"="Soul Society",\
		"6"="Training Grounds","7"="Ice Caverns","8"="Arena","9"="Ever Forest","10"="Volvanic Enclave",\
		"11"="Mountainside")

atom/var
	var/HairStyle="Bald"
	var/obj/HairOver
	HairR=0
	HairG=0
	HairB=0

obj/var/desc2
obj/var/nobank = 0
obj/var/enc = 0
obj/var/noenchant = 0
obj/var/nosalvage =0
obj/var/oname

mob/var/tmp
	//other vars
	AFK=0
	LoggedOn=0
	OnLevelScreen=0
	ezcheck=0
	Giftcd=0
	QuestClear=1
	MonsterWho=0
	InventoryOpen=0
	obj/NPC/Shops/Shopping
	obj/NPC/Shops/Selling
	list/ExpLog=list()
	obj/Supplemental/Arena/Arena
	ArenaRound=0
	ArenaBonus=0
	list/TransLocs=list()
	list/Tickets=list()
	checked = 0
	Locked = 0
	selecting = 0
	connection = "Offline"
	//icon/DamageIcon
	//icon/GuardIcon
	icon/PlayerIcon//displayed in Local Chat
	ComboCount=0
	ComboStopper=0
	list/ComboList=list()
	ComboReady=1
	mob/Owner
	mob/Target
	mob/LastClicked
	TutLevel=0
	list/QuestDisplay=list()
	QDC=0//Quest Display Counter
	Beastiary=""
	ExtendedHotKeys=1
	ChatMode="Global"
	TextCapture="..."
	LevelLog=""
	MusicMode=0
	PlayTime=0
	SaveSlot
	SpiritForm=0
	Slowed=0
	CanMove=1
	CanSave=1
	TurnMode=0
	CanShunpo=0
	Expboost=1
	got20=0
	got40=0
	got60=0
	got80=0
	got100=0
	Firing=0
	Casting=0
	RegenWait=0
	ReiRegenWait=0
	PVPWait=0
	SightRange=9
	Shunpo=0
	Stunned=0
	Blocking=0
	AttackHeight=0
	Chatting=0
	SaveVersion=0
	SavedTyping=""
	Shikai=0
	Bankai=0
	Vaizard=0
	FinalForm=0
	PVP=0
	GM = 0
	KillPoints=0
	KillReset=0
	trading=0
	Chosen
	list/Followers=list()
	list/ZanpakutoOverlays=list()
	datum/ZanOvers/CurZanOver
	ChestList=""
	list/Cache=list()
	list/DeathCache=list()
	list/ToggledSkills=list()
	mob/PVPingAgainst
	obj/PVPFlag
	AutoTargetFace=1
	AutoAttackFace=1
	AutoSkillFace=1
	Transforming=0
	boughtMGC = 0
	boughtSTR =0
	boughtAGI = 0
	boughtVIT = 0
	boughtLCK = 0
	boughtMGCDEF = 0
	boughtstats = 0
atom/movable/var
	random

mob/var
	//Service Uses
	RespecUses=0
	BarberUses=0
	Itemfixed=0
	min= 0
	max =0
	hassafe=0
	Badges = 0
	bBadges = 0
	lvl51 = 0
	Credited = 0
	Credits = 0
	Converted = 0
	ezcheck2 = 0
	banked=0
	gotGift=0
	Globaloff = 0
	Lieu = 0
	Rootie = 0
	Devour = 0
	Bones=0
	Leather=0
	Thread=0
	Iron=0
	Mithril=0
	EnchantedOre=0
	Adhesive=0
	MeteorFragment=0
	Gems=0
	DivineOre=0
	HonorBonus=0
	CustomRank="Member"
	HonorSet = 0
	Squadlevel=1
	Squadexp=10
	Squadnexp=5000000
	sexp=0
	//Pet Stuff
	list/Pets=list()
	mob/Pets/CurPet
	datum/Gambits/GambitHolder/CurGambit
	PetOut=0
	PetType
	GainedSun=0
	GainedEvoSun=0
	Fused=0
	jailed=0
	onscreen=0
	Auctionban=0
	Gotbonus0=0
	Gotbonus1=0
	Gotbonus2=0
	Gotbonus3=0
	Gotbonus4=0
	badge100=0
	badge200=0
	badge300=0
	badge400=0
	badge500=0
	badge750=0
	Squadreset=0
	Squadmute=0
	lastticket=0

	//stat/skill vars
	Level=1
	REI=200//reiatsu
	MaxREI=200
	STM=300
	MaxSTM=300
	STR=1
	VIT=1
	MGC=1
	MGCDEF=1
	AGI=1
	LCK=1
	Platinum=0
	Gold=0
	Silver=0
	Copper=0
	Exp=0
	Nexp=100
	Kills=0
	Deaths=0
	Honor=0
	PvpKills=0
	PvpDeaths=0
	Class
	ClassLevel=1
	ArrowCharges=0
	MaxArrowCharges=1
	SkillPoints=0
	StatPoints=0
	TraitPoints=0
	list/Kidous=list()
	list/Skills=list()
	list/Spells=list()
	list/ShikaiSkills=list()
	list/BankaiSkills=list()
	list/VaizardSkills=list()
	list/FinalFormSkills=list()
	ArrowStr=0
	ArrowDist=0
	VaiMask="None"
	CurSkill="Selected Skill"
	SkillDmg=0
	SkillRei=0
	SkillBeingCharged
	ChargedPower=0
	ArrowType="Spirit Arrow"
	obj/Zanpakuto/Zanpakuto
	list/HotKeys=list()
	list/Damagers=list()

	//bonus/boost vars
	DodgeBonus=0
	CritBonus=0
	StmRegenBonus=1
	ReiRegenBonus=1
	StmRegenCost=10
	ArrCreateSpd=0
	DistChargeSpd=0
	GuardBonus=0
	CounterBonus=0
	DoubleStrikeBonus=0
	ShieldBonus=0
	ImmunityBonus=0
	Element=null
	list/ElemWeakness=list()
	list/ElemStrength=list()
	list/Immunities=list()

	//hack detection vars
	LHD=0

	//trait vars
	Zanjutsu=0
	Hakuda=0
	Hohou=0
	Kidou=0
	Prodigy=0
	Training=0
	Manual=0
	Income=0

	//Equipment
	list/EquipmentList=list()
	obj/Items/Equipment
		Head
		Body
		Hand
		Back
		Feet

	//option vars
	ExpDisplay="Both"
	MusicVol=100
	EffectVol=100
	MenuVol=100
	VoiceVol=100
	PMVol=100
	LoopMusic=0

	//quest vars
	list/Quests=list()
	list/CompletedQuests=list()

	//PM system vars
	MyKey
	list/Messages=list()
	list/NewMessages=list()
	list/IgnoreList=list()
	AllowPMs=1

	//HUD vars
	obj/StmBar
	obj/ReiBar
	InputVariable="Test Input"

	//Respawn Vars
	RespawnX=50
	RespawnY=88
	RespawnZ=1

	//Voice System Vars
	VoiceSet="Ichigo"
	list/AttVoices=list()
	list/HurtVoices=list()

	//CD Vars
	tmp/StatsShown=0

	//Admin Vars
	PVPAll=0