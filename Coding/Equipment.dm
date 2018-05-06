obj/Items
	Equipment
		HasUse=0
		var/Slot
		MaxStack=1
		var/list/StatBoosts=list()
		var/LvlReq=1
		var/IsEquipped=0
		var/STR
		var/VIT
		var/MGC
		var/MGCDEF
		var/AGI
		var/LCK
		var/IsMagic
		var/IsRare
		var/IsEpic
		var/IsLegendary
		var/list/Effects=list()
		proc/OnEquip(var/mob/M)	return
		proc/OnUnEquip(var/mob/M)	return
		proc/OnAttack(var/mob/M)	return
		proc/OnDefend(var/mob/M)	return
		proc/Equip(var/mob/M)
			M.Inventory[src.InvSlot]=null
			M.vars[src.Slot]=src
			PlayMenuSound(M,'Bow2.wav')
			M.EquipmentList+=src
			//for(var/Stat in src.StatBoosts)	M.vars["[Stat]"]+=src.StatBoosts[Stat]
			if(src.STR)
				M.STR+=src.STR
			if(src.VIT)
				M.VIT+=src.VIT
			if(src.MGC)
				M.MGC+=src.MGC
			if(src.MGCDEF)
				M.MGCDEF+=src.MGCDEF
			if(src.AGI)
				M.AGI+=src.AGI
			if(src.LCK)
				M.LCK+=src.LCK
			src.OnEquip(M)
		proc/UnEquip(var/mob/M)
			src.OnUnEquip(M)
			M.EquipmentList-=src
			if(src.STR)
				M.STR-=src.STR
			if(src.VIT)
				M.VIT-=src.VIT
			if(src.MGC)
				M.MGC-=src.MGC
			if(src.MGCDEF)
				M.MGCDEF-=src.MGCDEF
			if(src.AGI)
				M.AGI-=src.AGI
			if(src.LCK)
				M.LCK-=src.LCK
			//for(var/Stat in src.StatBoosts)	M.vars["[Stat]"]-=src.StatBoosts[Stat]
			M.vars[src.Slot]=null
		New()
			if(src.STR||src.VIT||src.MGC||src.MGCDEF||src.AGI||src.LCK)
				var/P = rand(1,100)
				if(P >= 45 && P < 75 )
					src.IsMagic = 1
					src.STR*=2
					src.VIT*=2
					src.MGC*=2
					src.MGCDEF*=2
					src.AGI*=2
					src.LCK*=2
					src.desc="> S|V|M|MD|A|L"
					src.desc+="> [src.STR]|[src.VIT]|[src.MGC]|[src.MGCDEF]|[src.AGI]|[src.LCK]"
				if(P>=75 && P < 90)
					src.IsRare = 1
					src.STR*=4
					src.VIT*=4
					src.MGC*=4
					src.MGCDEF*=4
					src.AGI*=4
					src.LCK*=4
					src.desc="> S|V|M|MD|A|L"
					src.desc+="> [src.STR]|[src.VIT]|[src.MGC]|[src.MGCDEF]|[src.AGI]|[src.LCK]"
				if(P>=90 && P < 100)
					src.IsEpic = 1
					src.STR*=6
					src.VIT*=6
					src.MGC*=6
					src.MGCDEF*=6
					src.AGI*=6
					src.LCK*=6
					src.desc="> S|V|M|MD|A|L"
					src.desc+="> [src.STR]|[src.VIT]|[src.MGC]|[src.MGCDEF]|[src.AGI]|[src.LCK]"
				if(P==100)
					src.IsLegendary= 1
					src.STR*=8
					src.VIT*=8
					src.MGC*=8
					src.MGCDEF*=8
					src.AGI*=8
					src.LCK*=8
					src.desc="> S|V|M|MD|A|L"
					src.desc+="> [src.STR]|[src.VIT]|[src.MGC]|[src.MGCDEF]|[src.AGI]|[src.LCK]"
				else src.desc="> S|V|M|MD|A|L";src.desc+="> [src.STR]|[src.VIT]|[src.MGC]|[src.MGCDEF]|[src.AGI]|[src.LCK]"


		Feet
			Slot="Feet"
			icon='Boots.dmi'
			Battle_Boots
				LvlReq=1;VIT=0;STR=0;MGC=0;MGCDEF=0;AGI=2;LCK=2
				icon_state="Battle Boots";mouse_drag_pointer="Battle Boots"
			Spike_Boots
				LvlReq=5;VIT=0;STR=0;MGC=0;MGCDEF=0;AGI=4;LCK=4
				icon_state="Spike Boots";mouse_drag_pointer="Spike Boots"
			Germinas_Boots
				LvlReq=10;VIT=0;STR=0;MGC=0;MGCDEF=0;AGI=6;LCK=6
				icon_state="Germinas Boots";mouse_drag_pointer="Germinas Boots"
			Rubber_Shoes
				LvlReq=15;VIT=0;STR=0;MGC=0;MGCDEF=0;AGI=8;LCK=8
				icon_state="Rubber Shoes";mouse_drag_pointer="Rubber Shoes"
			Feather_Boots
				LvlReq=20;VIT=0;STR=0;MGC=0;MGCDEF=0;AGI=10;LCK=10
				icon_state="Feather Boots";mouse_drag_pointer="Feather Boots"
			Sprint_Shoes
				LvlReq=25;VIT=0;STR=0;MGC=0;MGCDEF=0;AGI=12;LCK=12
				icon_state="Sprint Shoes";mouse_drag_pointer="Sprint Shoes"
			Red_Shoes
				LvlReq=30;VIT=0;STR=0;MGC=0;MGCDEF=0;AGI=14;LCK=14
				icon_state="Red Shoes";mouse_drag_pointer="Red Shoes"

		Back
			Slot="Back"
			icon='Capes.dmi'
			Crystal_Threaded_Cape
				LvlReq=50
				//StatBoosts=list("VIT"=25)
				STR=0;VIT=25;MGC=0;MGCDEF=0;AGI=0;LCK=0
				GoldValue=5;SilvValue=0;CoprValue=0
				desc="A bright red cape.  Threaded with Flaming Crystal fibers. > Increases VIT by 25"
				icon_state="Crystal Threaded Cape";mouse_drag_pointer="Crystal Threaded Cape"
		Head
			Slot="Head"
			icon='Helmets.dmi'
			Toy_Vizard_Mask
				name="Toy Visored Mask"
				icon='BlankVisoredMask.dmi'
				GoldValue=1;SilvValue=0;CoprValue=0
				desc="A paper mache Visored Mask"
				mouse_drag_pointer=""
				OnEquip(var/mob/M)
					M.overlays+=new/obj/EquipmentOverlays/BlankVisoredMask
				OnUnEquip(var/mob/M)
					for(var/x in M.overlays)	if(x:name=="BlankVisoredMask")	M.overlays-=x
			Leather_Helmet
				LvlReq=1;VIT=2;STR=0;MGC=0;MGCDEF=1;AGI=0;LCK=0
				icon_state="Leather Helmet";mouse_drag_pointer="Leather Helmet"
			Bronze_Helmet
				LvlReq=5;VIT=4;STR=0;MGC=0;MGCDEF=2;AGI=0;LCK=0
				icon_state="Bronze Helmet";mouse_drag_pointer="Bronze Helmet"
			Iron_Helmet
				LvlReq=10;VIT=6;STR=0;MGC=0;MGCDEF=3;AGI=0;LCK=0
				icon_state="Iron Helmet";mouse_drag_pointer="Iron Helmet"
			Barbuta
				LvlReq=15;VIT=8;STR=0;MGC=0;MGCDEF=4;AGI=0;LCK=0
				icon_state="Barbuta";mouse_drag_pointer="Barbuta"
			Mythril_Helmet
				LvlReq=20;VIT=10;STR=0;MGC=0;MGCDEF=5;AGI=0;LCK=0
				icon_state="Mythril Helmet";mouse_drag_pointer="Mythril Helmet"
			Gold_Helmet
				LvlReq=25;VIT=12;STR=0;MGC=0;MGCDEF=6;AGI=0;LCK=0
				icon_state="Gold Helmet";mouse_drag_pointer="Gold Helmet"
			Cross_Helmet
				LvlReq=30;VIT=14;STR=0;MGC=0;MGCDEF=7;AGI=0;LCK=0
				icon_state="Cross Helmet";mouse_drag_pointer="Cross Helmet"
			Diamond_Helmet
				LvlReq=35;VIT=16;STR=0;MGC=0;MGCDEF=8;AGI=0;LCK=0
				icon_state="Diamond Helmet";mouse_drag_pointer="Diamond Helmet"
			Platinum_Helmet
				LvlReq=40;VIT=18;STR=0;MGC=0;MGCDEF=9;AGI=0;LCK=0
				icon_state="Platinum Helmet";mouse_drag_pointer="Platinum Helmet"
			Circlet
				LvlReq=45;VIT=20;STR=0;MGC=0;MGCDEF=10;AGI=0;LCK=0
				icon_state="Circlet";mouse_drag_pointer="Circlet"
			Crystal_Helmet
				LvlReq=50;VIT=22;STR=0;MGC=0;MGCDEF=11;AGI=0;LCK=0
				icon_state="Crystal Helmet";mouse_drag_pointer="Crystal Helmet"
			Genji_Helmet
				LvlReq=55;VIT=24;STR=0;MGC=0;MGCDEF=12;AGI=0;LCK=0
				icon_state="Genji Helmet";mouse_drag_pointer="Genji Helmet"
			Grand_Helmet
				LvlReq=60;VIT=26;STR=0;MGC=0;MGCDEF=13;AGI=0;LCK=0
				icon_state="Grand Helmet";mouse_drag_pointer="Grand Helmet"

		Body
			Slot="Body"
			icon='Robes.dmi'
			Clothes
				LvlReq=1;VIT=1;STR=0;MGC=0;MGCDEF=1;AGI=0;LCK=0
				//StatBoosts=list("VIT"=1,"STR"=1,"MGC"=1)
				GoldValue=0;SilvValue=0;CoprValue=50
				desc="Some plain clothes."
				icon_state="Clothes";mouse_drag_pointer="Clothes"
			Mystic
				Cloth_Tunic
					VIT=2;STR=0;MGC=0;MGCDEF=4;AGI=0;LCK=0
					icon_state="Cloth Tunic";mouse_drag_pointer="Cloth Tunic"
					LvlReq=5
				Linen_Robe
					VIT=3;STR=0;MGC=0;MGCDEF=6;AGI=0;LCK=0
					icon_state="Linen Robe";mouse_drag_pointer="Linen Robe"
					LvlReq=10
				Linen_Jacket
					VIT=4;STR=0;MGC=0;MGCDEF=8;AGI=0;LCK=0
					icon_state="Linen Jacket";mouse_drag_pointer="Linen Jacket"
					LvlReq=15
				Silk_Robe
					VIT=5;STR=0;MGC=0;MGCDEF=10;AGI=0;LCK=0
					icon_state="Silk Robe";mouse_drag_pointer="Silk Robe"
					LvlReq=20

				Fire_Tunic
					VIT=6;STR=0;MGC=0;MGCDEF=12;AGI=0;LCK=0
					icon_state="Fire Tunic";mouse_drag_pointer="Fire Tunic"
					LvlReq=25
				Wizard_Robe
					VIT=7;STR=0;MGC=0;MGCDEF=14;AGI=0;LCK=0
					icon_state="Wizard Robe";mouse_drag_pointer="Wizard Robe"
					LvlReq=30

				Holy_Cloak
					VIT=8;STR=0;MGC=0;MGCDEF=16;AGI=0;LCK=0
					icon_state="Holy Cloak";mouse_drag_pointer="Holy Cloak"
					LvlReq=35

				Chameleon_Robe
					VIT=9;STR=0;MGC=0;MGCDEF=18;AGI=0;LCK=0
					icon_state="Chameleon Robe";mouse_drag_pointer="Chameleon Robe"
					LvlReq=40
				Clerics_Robe
					VIT=10;STR=0;MGC=0;MGCDEF=20;AGI=0;LCK=0
					icon_state="Clerics Robe";mouse_drag_pointer="Clerics Robe"
					LvlReq=45
				White_Robe
					icon_state="White Robe";mouse_drag_pointer="White Robe"
					LvlReq=50
					VIT=11;STR=0;MGC=0;MGCDEF=22;AGI=0;LCK=0
				Ceremonial_Uniform
					icon_state="Ceremonial Uniform";mouse_drag_pointer="Ceremonial Uniform"
					LvlReq=55
					VIT=12;STR=0;MGC=0;MGCDEF=24;AGI=0;LCK=0
				Black_Robe
					icon_state="Black Robe";mouse_drag_pointer="Black Robe"
					LvlReq=60
					VIT=13;STR=0;MGC=0;MGCDEF=26;AGI=0;LCK=0
				Golden_Dressings
					icon_state="Golden Dressings";mouse_drag_pointer="Golden Dressings"
					LvlReq=65
					VIT=14;STR=0;MGC=0;MGCDEF=28;AGI=0;LCK=0
				Light_Robe
					icon_state="Light Robe";mouse_drag_pointer="Light Robe"
					LvlReq=70
					VIT=15;STR=0;MGC=0;MGCDEF=30;AGI=0;LCK=0
				Wizard_Outfit
					icon_state="Wizard Outfit";mouse_drag_pointer="Wizard Outfit"
					LvlReq=75
					VIT=16;STR=0;MGC=0;MGCDEF=32;AGI=0;LCK=0
				Brigandine
					icon_state="Brigandine";mouse_drag_pointer="Brigandine"
					LvlReq=80
					VIT=17;STR=0;MGC=0;MGCDEF=34;AGI=0;LCK=0
				Power_Sleeve
					icon_state="Power Sleeve";mouse_drag_pointer="Power Sleeve"
					LvlReq=85
					VIT=18;STR=0;MGC=0;MGCDEF=36;AGI=0;LCK=0
				Earth_Clothes
					icon_state="Earth Clothes";mouse_drag_pointer="Earth Clothes"
					LvlReq=90
					VIT=19;STR=0;MGC=0;MGCDEF=38;AGI=0;LCK=0
				Secret_Clothes
					icon_state="Secret Clothes";mouse_drag_pointer="Secret Clothes"
					LvlReq=95
					VIT=20;STR=0;MGC=0;MGCDEF=40;AGI=0;LCK=0
				Black_Costume
					icon_state="Black Costume";mouse_drag_pointer="Black Costume"
					LvlReq=100
					VIT=21;STR=0;MGC=0;MGCDEF=42;AGI=0;LCK=0
				Rubber_Costume
					icon_state="Rubber Costume";mouse_drag_pointer="Rubber Costume"
					LvlReq=105
					VIT=22;STR=0;MGC=0;MGCDEF=44;AGI=0;LCK=0
				Grand_Cloak
					icon_state="Grand Cloak";mouse_drag_pointer="Grand Cloak"
					LvlReq=110
					VIT=23;STR=0;MGC=0;MGCDEF=46;AGI=0;LCK=0
				Robe_of_Lords
					icon_state="Robe of Lords";mouse_drag_pointer="Robe of Lords"
					LvlReq=115
					VIT=24;STR=0;MGC=0;MGCDEF=48;AGI=0;LCK=0
				Mystic_Plate_Mail
					icon_state="Mystic Plate Mail";mouse_drag_pointer="Mystic Plate Mail"
					LvlReq=120
					VIT=25;STR=0;MGC=0;MGCDEF=50;AGI=0;LCK=0
			Armor
				icon='Armor.dmi'
				Copper_Breastplate
					icon_state="Copper Breastplate";mouse_drag_pointer="Copper Breastplate"
					LvlReq=5
					VIT=4;STR=0;MGC=0;MGCDEF=2;AGI=0;LCK=0
				Leather_Armor
					icon_state="Leather Armor";mouse_drag_pointer="Leather Armor"
					LvlReq=10
					VIT=6;STR=0;MGC=0;MGCDEF=3;AGI=0;LCK=0
				Onyx_Armor
					icon_state="Onyx Armor";mouse_drag_pointer="Onyx Armor"
					LvlReq=15
					VIT=8;STR=0;MGC=0;MGCDEF=4;AGI=0;LCK=0
				Linen_Cuirass
					icon_state="Linen Cuirass";mouse_drag_pointer="Linen Cuirass"
					LvlReq=20
					VIT=10;STR=0;MGC=0;MGCDEF=5;AGI=0;LCK=0
				Iron_Mail
					icon_state="Iron Mail";mouse_drag_pointer="Iron Mail"
					LvlReq=25
					VIT=12;STR=0;MGC=0;MGCDEF=6;AGI=0;LCK=0
				Bronze_Armor
					icon_state="Bronze Armor";mouse_drag_pointer="Bronze Armor"
					LvlReq=30
					VIT=14;STR=0;MGC=0;MGCDEF=7;AGI=0;LCK=0
				Breaker_Gear
					icon_state="Breaker Gear";mouse_drag_pointer="Breaker Gear"
					LvlReq=35
					VIT=16;STR=0;MGC=0;MGCDEF=8;AGI=0;LCK=0
				Chain_Mail
					icon_state="Chain Mail";mouse_drag_pointer="Chain Mail"
					LvlReq=40
					VIT=18;STR=0;MGC=0;MGCDEF=9;AGI=0;LCK=0
				Jade_Encrusted_Armor
					icon_state="Jade Encrusted Armor";mouse_drag_pointer="Jade Encrusted Armor"
					LvlReq=45
					VIT=20;STR=0;MGC=0;MGCDEF=10;AGI=0;LCK=0
				Mythril_Armor
					icon_state="Mythril Armor";mouse_drag_pointer="Mythril Armor"
					LvlReq=50
					VIT=22;STR=0;MGC=0;MGCDEF=11;AGI=0;LCK=0
				Royal_Plate_Mail
					icon_state="Royal Plate Mail";mouse_drag_pointer="Royal Plate Mail"
					LvlReq=55
					VIT=24;STR=0;MGC=0;MGCDEF=12;AGI=0;LCK=0
				Plate_Mail
					icon_state="Plate Mail";mouse_drag_pointer="Plate Mail"
					LvlReq=60
					VIT=26;STR=0;MGC=0;MGCDEF=13;AGI=0;LCK=0
				Guardians_Uniform
					icon_state="Guardians Uniform";mouse_drag_pointer="Guardians Uniform"
					LvlReq=65
					VIT=28;STR=0;MGC=0;MGCDEF=14;AGI=0;LCK=0
				Gold_Armor
					icon_state="Gold Armor";mouse_drag_pointer="Gold Armor"
					LvlReq=70
					VIT=30;STR=0;MGC=0;MGCDEF=15;AGI=0;LCK=0
				Blackened_Breastplate
					icon_state="Blackened Breastplate";mouse_drag_pointer="Blackened Breastplate"
					LvlReq=75
					VIT=32;STR=0;MGC=0;MGCDEF=16;AGI=0;LCK=0
				Diamond_Armor
					icon_state="Diamond Armor";mouse_drag_pointer="Diamond Armor"
					LvlReq=80
					VIT=34;STR=0;MGC=0;MGCDEF=17;AGI=0;LCK=0
				Oblivions_Darkest
					icon_state="Oblivions Darkest";mouse_drag_pointer="Oblivions Darkest"
					LvlReq=85
					VIT=36;STR=0;MGC=0;MGCDEF=18;AGI=0;LCK=0
				Platinum_Armor
					icon_state="Platinum Armor";mouse_drag_pointer="Platinum Armor"
					LvlReq=90
					VIT=38;STR=0;MGC=0;MGCDEF=19;AGI=0;LCK=0
				Leather_Outfit
					icon_state="Leather Outfit";mouse_drag_pointer="Leather Outfit"
					LvlReq=95
					VIT=40;STR=0;MGC=0;MGCDEF=20;AGI=0;LCK=0
				Leather_Vest
					icon_state="Leather Vest";mouse_drag_pointer="Leather Vest"
					LvlReq=100
					VIT=42;STR=0;MGC=0;MGCDEF=21;AGI=0;LCK=0
				Chain_Vest
					icon_state="Chain Vest";mouse_drag_pointer="Chain Vest"
					LvlReq=105
					VIT=44;STR=0;MGC=0;MGCDEF=22;AGI=0;LCK=0
				Mythril_Vest
					icon_state="Mythril Vest";mouse_drag_pointer="Mythril Vest"
					LvlReq=110
					VIT=46;STR=0;MGC=0;MGCDEF=23;AGI=0;LCK=0
				Adamant_Vest
					icon_state="Adamant Vest";mouse_drag_pointer="Adamant Vest"
					LvlReq=115
					VIT=48;STR=0;MGC=0;MGCDEF=24;AGI=0;LCK=0
				Judo_Outfit
					icon_state="Judo Outfit";mouse_drag_pointer="Judo Outfit"
					LvlReq=120
					VIT=50;STR=0;MGC=0;MGCDEF=25;AGI=0;LCK=0
				Carbani_Armor
					icon_state="Carbani Armor";mouse_drag_pointer="Carbani Armor"
					LvlReq=125
					VIT=52;STR=0;MGC=0;MGCDEF=26;AGI=0;LCK=0

				Crystal_Mail
					icon_state="Crystal Mail";mouse_drag_pointer="Crystal Mail"
					LvlReq=130
					VIT=54;STR=0;MGC=0;MGCDEF=27;AGI=0;LCK=0

				Genji_Armor
					icon_state="Genji Armor";mouse_drag_pointer="Genji Armor"
					LvlReq=135
					VIT=56;STR=0;MGC=0;MGCDEF=28;AGI=0;LCK=0

				Reflect_Armor
					icon_state="Reflect Armor";mouse_drag_pointer="Reflect Armor"
					LvlReq=140
					VIT=58;STR=0;MGC=0;MGCDEF=29;AGI=0;LCK=0

				Maximillian
					icon_state="Maximillian";mouse_drag_pointer="Maximillian"
					LvlReq=145
					VIT=60;STR=0;MGC=0;MGCDEF=30;AGI=0;LCK=0
		Hand
			Slot="Hand"
			Weapons
				icon='Weapons.dmi'
				Sword
					//StatBoosts=list("STR"=1)
					LvlReq=1
					VIT=0;STR=2;MGC=0;MGCDEF=0;AGI=1;LCK=1
					GoldValue=0;SilvValue=1;CoprValue=50
					desc="A basic sword. > Increases STR by 1"
					icon_state="Sword";mouse_drag_pointer="Sword"
				Rapier
					//StatBoosts=list("STR"=2)
					LvlReq=5
					VIT=0;STR=4;MGC=0;MGCDEF=0;AGI=2;LCK=2
					GoldValue=0;SilvValue=3;CoprValue=0
					desc="A sharp sword, designed for stabbing. > Increases STR by 2"
					icon_state="Rapier";mouse_drag_pointer="Rapier"
				Golden_Blade
					LvlReq=10
					icon_state="Golden Blade";mouse_drag_pointer="Golden Blade"
					VIT=0;STR=6;MGC=0;MGCDEF=0;AGI=3;LCK=3
				Save_the_Queen
					LvlReq=15;VIT=0;STR=8;MGC=0;MGCDEF=0;AGI=4;LCK=4
					icon_state="Save the Queen";mouse_drag_pointer="Save the Queen"
				Falchion
					icon_state="Falchion";mouse_drag_pointer="Falchion"
					LvlReq=20;VIT=0;STR=10;MGC=0;MGCDEF=0;AGI=5;LCK=5
				Schimitar
					LvlReq=25;VIT=0;STR=12;MGC=0;MGCDEF=0;AGI=6;LCK=6
					icon_state="Schimitar";mouse_drag_pointer="Schimitar"
				Cross_Sword
					LvlReq=30;VIT=0;STR=14;MGC=0;MGCDEF=0;AGI=7;LCK=7
					icon_state="Cross Sword";mouse_drag_pointer="Cross Sword"
				Brightest_Night
					LvlReq=35;VIT=0;STR=16;MGC=0;MGCDEF=0;AGI=8;LCK=8
					icon_state="Brightest Night";mouse_drag_pointer="Brightest Night"
				Excalibur
					LvlReq=40;VIT=0;STR=18;MGC=0;MGCDEF=0;AGI=9;LCK=9
					icon_state="Excalibur";mouse_drag_pointer="Excalibur"
				Fairy_Club
					LvlReq=45;VIT=0;STR=20;MGC=0;MGCDEF=0;AGI=10;LCK=10
					icon_state="Fairy Club";mouse_drag_pointer="Fairy Club"
				Dirk_of_Despair
					LvlReq=50;VIT=0;STR=22;MGC=0;MGCDEF=0;AGI=11;LCK=11
					icon_state="Dirk of Despair";mouse_drag_pointer="Dirk of Despair"
				Black_Hearted_Dagger
					LvlReq=55;VIT=0;STR=24;MGC=0;MGCDEF=0;AGI=12;LCK=12
					icon_state="Black Hearted Dagger";mouse_drag_pointer="Black Hearted Dagger"
				Glove_of_Despair
					LvlReq=60;VIT=0;STR=26;MGC=0;MGCDEF=0;AGI=13;LCK=13
					icon_state="Glove of Despair";mouse_drag_pointer="Glove of Despair"
				Padded_Claws
					LvlReq=65;VIT=0;STR=28;MGC=0;MGCDEF=0;AGI=14;LCK=14
					icon_state="Padded Claws";mouse_drag_pointer="Padded Claws"
				Golden_Knuckles
					LvlReq=70;VIT=0;STR=30;MGC=0;MGCDEF=0;AGI=15;LCK=15
					icon_state="Golden Knuckles";mouse_drag_pointer="Golden Knuckles"
				Diamond_Knuckles
					LvlReq=75;VIT=0;STR=32;MGC=0;MGCDEF=0;AGI=16;LCK=16
					icon_state="Diamond Knuckles";mouse_drag_pointer="Diamond Knuckles"
				Dark_Scepter
					LvlReq=80;VIT=0;STR=34;MGC=0;MGCDEF=0;AGI=17;LCK=17
					icon_state="Dark Scepter";mouse_drag_pointer="Dark Scepter"
				Iron_Thorn_Whip
					LvlReq=85;VIT=0;STR=36;MGC=0;MGCDEF=0;AGI=18;LCK=18
					icon_state="Iron Thorn Whip";mouse_drag_pointer="Iron Thorn Whip"
				Chain_Whip
					LvlReq=90;VIT=0;STR=38;MGC=0;MGCDEF=0;AGI=19;LCK=19
					icon_state="Chain Whip";mouse_drag_pointer="Chain Whip"
				Silver_Tipped_Whip
					LvlReq=95;VIT=0;STR=40;MGC=0;MGCDEF=0;AGI=20;LCK=20
					icon_state="Silver Tipped Whip";mouse_drag_pointer="Silver Tipped Whip"
				Whip_Tail
					LvlReq=110;VIT=0;STR=44;MGC=0;MGCDEF=0;AGI=22;LCK=22
					icon_state="Whip Tail";mouse_drag_pointer="Whip Tail"
				Metalic_Whip
					LvlReq=115;VIT=0;STR=46;MGC=0;MGCDEF=0;AGI=23;LCK=23
					icon_state="Metalic Whip";mouse_drag_pointer="Metalic Whip"
				Leviathans_Tail
					LvlReq=120;VIT=0;STR=48;MGC=0;MGCDEF=0;AGI=24;LCK=24
					icon_state="Leviathans Tail";mouse_drag_pointer="Leviathans Tail"
				Serpents_Tongue
					LvlReq=125;VIT=0;STR=50;MGC=0;MGCDEF=0;AGI=25;LCK=25
					icon_state="Serpents Tongue";mouse_drag_pointer="Serpents Tongue"
				Boomerang
					LvlReq=130;VIT=0;STR=52;MGC=0;MGCDEF=0;AGI=26;LCK=26
					icon_state="Boomerang";mouse_drag_pointer="Boomerang"
				Seeker
					LvlReq=135;VIT=0;STR=54;MGC=0;MGCDEF=0;AGI=27;LCK=27
					icon_state="Seeker";mouse_drag_pointer="Seeker"
				Mystic_Boomerang
					LvlReq=140;VIT=0;STR=56;MGC=0;MGCDEF=0;AGI=28;LCK=28
					icon_state="Mystic Boomerang";mouse_drag_pointer="Mystic Boomerang"
				White_Whale
					LvlReq=145;VIT=0;STR=58;MGC=0;MGCDEF=0;AGI=29;LCK=29
					icon_state="White Whale";mouse_drag_pointer="White Whale"
				Wooden_Boomerang
					LvlReq=150;VIT=0;STR=60;MGC=0;MGCDEF=0;AGI=30;LCK=30
					icon_state="Wooden Boomerang";mouse_drag_pointer="Wooden Boomerang"
				Ax
					LvlReq=155;VIT=0;STR=62;MGC=0;MGCDEF=0;AGI=31;LCK=31
					icon_state="Ax";mouse_drag_pointer="Ax"
				Ice_Ax
					LvlReq=160;VIT=0;STR=64;MGC=0;MGCDEF=0;AGI=32;LCK=32
					icon_state="Ice Ax";mouse_drag_pointer="Ice Ax"
				Ax_of_Despair
					LvlReq=165;VIT=0;STR=66;MGC=0;MGCDEF=0;AGI=33;LCK=33
					icon_state="Ax of Despair";mouse_drag_pointer="Ax of Despair"
				Axe
					LvlReq=170;VIT=0;STR=68;MGC=0;MGCDEF=0;AGI=34;LCK=34
					icon_state="Axe";mouse_drag_pointer="Axe"
				Silver_Axe
					LvlReq=175;VIT=0;STR=70;MGC=0;MGCDEF=0;AGI=35;LCK=35
					icon_state="Silver Axe";mouse_drag_pointer="Silver Axe"
				Club
					LvlReq=180;VIT=0;STR=72;MGC=0;MGCDEF=0;AGI=36;LCK=36
					icon_state="Club";mouse_drag_pointer="Club"
				Spiked_Club
					LvlReq=185;VIT=0;STR=74;MGC=0;MGCDEF=0;AGI=37;LCK=37
					icon_state="Spiked Club";mouse_drag_pointer="Spiked Club"
				Ice_Club
					LvlReq=190;VIT=0;STR=76;MGC=0;MGCDEF=0;AGI=38;LCK=38
					icon_state="Ice Club";mouse_drag_pointer="Ice Club"
				Shuriken
					LvlReq=195;VIT=0;STR=78;MGC=0;MGCDEF=0;AGI=39;LCK=39
					icon_state="Shuriken";mouse_drag_pointer="Shuriken"
				Emperors_Mallet
					LvlReq=200;VIT=0;STR=80;MGC=0;MGCDEF=0;AGI=40;LCK=40
					icon_state="Emperors Mallet";mouse_drag_pointer="Emperors Mallet"
				Wand_of_Despair
					LvlReq=20;VIT=0;STR=0;MGC=8;MGCDEF=0;AGI=4;LCK=4
					icon_state="Wand of Despair";mouse_drag_pointer="Wand of Despair"
				Cane
					LvlReq=1;VIT=0;STR=0;MGC=2;MGCDEF=0;AGI=1;LCK=1
					//StatBoosts=list("MGC"=1)
					GoldValue=0;SilvValue=1;CoprValue=50
					desc="A basic cane."
					icon_state="Cane";mouse_drag_pointer="Cane"
				Metal_Cane
					LvlReq=5;VIT=0;STR=0;MGC=4;MGCDEF=0;AGI=2;LCK=2
					//StatBoosts=list("MGC"=2)
					GoldValue=0;SilvValue=3;CoprValue=0
					desc="A shiney metal cane."
					icon_state="Metal Cane";mouse_drag_pointer="Metal Cane"
				Hunters_Spear
					LvlReq=210;VIT=0;STR=82;MGC=0;MGCDEF=0;AGI=42;LCK=42
					icon_state="Hunters Spear";mouse_drag_pointer="Hunters Spear"
				Harpoon
					LvlReq=220;VIT=0;STR=84;MGC=0;MGCDEF=0;AGI=43;LCK=43
					icon_state="Harpoon";mouse_drag_pointer="Harpoon"
				Deepest_Dawn
					LvlReq=230;VIT=0;STR=86;MGC=0;MGCDEF=0;AGI=44;LCK=44
					icon_state="Deepest Dawn";mouse_drag_pointer="Deepest Dawn"