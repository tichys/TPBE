#define NExpGet round((src.Level*1000)*1.0015)


var
	list/BossList=list()
	list/Players=list()
	PlayerCount=0
	PlayerLimit=99
	EnemyHuntRange=4
	HourlyExpBoost=0
	ScaryMode = 0
	IsRouted
	CanMultiKey="Disable"
	MOTD="<html><body bgcolor=black><font color=yellow><b><center>Welcome to Bleach Eternity \
		<br> Current Changes are As Follows <br> Server Exp Rate <br> Hourly Double Exp		<br>\
	Hollow Class with About 5 Transformastions <br> Visored Stat and Verb (Not Sure if it works 100%)\
					<br>New Mobs<br> Lv.250 <br> Lv. 300 <br> Lv.400 <br> \
Lv.600 <br> Lv.850 <br> Lv. 1150 <br> Lv.1400 <br> Lv.1800 <br> Lv.2300 <br> Lv.3000 <br> Lv.5000\
<br> New Aizen Hair	 <br>Petals Bankai Has Larger Scatter<br>Petals Shikai has a Projetile based Attack now too\
	<br><font color=white>Currently Working On<br>Arrancar icon base<br>Maybe some Renji Bankai Abilities<br>	"
	list/ChargeableSkills=list("Spirit Charge","Getsuga Tenshou","White Lightning","Petal Stream",\
		"Roaring Thunder Burn","Black Getsuga Tenshou","Syphon Health")
	list/AllSpecials=list()
	list/ShikaiSkillNames=list()
	list/BankaiSkillNames=list()
	list/HollowTypes=list()
	GameVersion=11.3
	StatusNote
	RebootTime  	//auto reboot setting
	Rebooting
	PlayerInfoTag="<b><font size=1><font color=blue>Player Info:</font> "
	VoteInfoTag="<b><font color=yellow>Vote Info:</font></b> "
	ServerInfoTag="<b><font color=green>Server Info:</font> "
	PveDam=2	//PVE Damage Multiplier
	PveArrDam=1
	LoggedIPs=""
	ServerExpRate=1
	list/MonsterTypes=list()
	LoggedIPCount=0
	ChosenHollowBase
	list/MapNames=list("1"="Sewers","3"="Arial Outpost","4"="Karakura","5"="Soul Society",\
		"6"="Training Grounds","7"="Ice Caverns","8"="Arena","9"="Ever Forest","10"="Volvanic Enclave",\
		"11"="Mountainside")



atom/var
	var/HairStyle="Bald"
	var/obj/HairOver
	HairR=0
	HairG=0
	HairB=0

mob/var/tmp
	//other vars
	AFK=0
	LoggedOn=0
	OnLevelScreen=0
	QuestClear=1
	InventoryOpen=0
	obj/NPC/Shops/Shopping
	obj/NPC/Shops/Selling
	list/ExpLog=list()
	obj/Supplemental/Arena/Arena
	ArenaRound=0
	ArenaBonus=0
	list/TransLocs=list()
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
	CanMove=1
	CanSave=1
	TurnMode=0
	CanShunpo=0
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
	Visored=0
	FinalForm=0
	PVP=0
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

mob/var
	//Service Uses
	RespecUses=0
	BarberUses=0

	//Pet Stuff
	list/Pets=list()
	mob/Pets/CurPet
	datum/Gambits/GambitHolder/CurGambit

	//stat/skill vars
	GottenSkillPoints=0
	UsedTraining=0
	UsedProdigy=0

	Mining_Level=0
	Mining_Exp=0
	Mining_Nexp=10




	Level=1
	Prestige=0
	REI=1000//reiatsu
	MaxREI=1000
	STM=1000
	MaxSTM=1000
	STR=5
	VIT=5
	MGC=5
	MGCDEF=5
	AGI=5
	LCK=5
	Gold=0
	Silver=0
	Copper=0
	Exp=0
	Nexp=1000
	Kills=0
	Deaths=0
	Honor=0
	PvpKills=0
	PvpDeaths=0
	GM=0
	Class
	ClassLevel=1
	ArrowCharges=0
	MaxArrowCharges=1
	SkillPoints=5
	StatPoints=5
	TraitPoints=5
	VisoredMask
	ArrancarMask
	list/Kidous=list()
	list/Skills=list()
	list/Spells=list()
	list/ShikaiSkills=list()
	list/BankaiSkills=list()
	list/FinalFormSkills=list()
	MaxCombo=5
	ArrowStr=0
	ArrowDist=0
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
	ZanjutsuCap=300
	Hakuda=0
	HakudaCap=300
	Hohou=0
	HohouCap=300
	Kidou=0
	KidouCap=300
	Prodigy=0
	ProdigyCap=100
	Training=0
	TrainingCap=175
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