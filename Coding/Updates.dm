mob/verb
	ViewUpdates()
		set hidden=1
		src<<browse({"
			<body bgcolor=black><font color=white>
			Recent Updates - Most Recent at Top in red<br>
			<b>Help Keep the Game Running Smoothly<br>
			Post any Bugs you Find on the Forums</b><br>
			<a href="http://www.byond.com/members/Millamber/forum" target="Z">Report A Bug</a><p>
			<font color=aqua>





			-<b>Pre v2 Release.<br>
			<font color=red>
			**This will contain simple fixes necessary for the v2 release**<br>
			-<font  color=green size=2>Misc Changes<br>

			--<b><font color=yellow size=3>January 2014<br></font>

			-----<b><font color=red> Decimator can be traded.<br>
			-----<b><font color=red> Certain numbers like Deaths, etc should be readable now.<br>
			-----<b><font color=red> Squad houses added for 5,9, and Brotherhood (graphics will be messed up until I can be asked to fix em).<br>
			-----<b><font color=red> Fixed a bug where people could continuously join a squad.<br>
			-----<b><font color=red> Mystery Boxes updated and useless items removed. Buffed up rewards!.<br>
			-----<b><font color=red> Gift Boxes are in again until the 5th of January.<br>


			--<b><font color=yellow size=3>November 2013<br></font>
			-----<b>VIP 4 weapon can now be traded.<br>
			-----<b>VIP 4 weapon can now be traded.<br>
			-----<b>The Ark now costs 10000 badges.<br>
			-----<b>Added Currency Converter, the price per badge is set by Owner.<br>
			-----<b>Corrected a few typos that I found, especially the level 51 achievement.<br>
			-----<b>Added some VIP login messages.<br>
			-----<b>VIP 4 weapon should work properly now but your main target will only die when everything around it dies.<br>
			-----<b>Fixed a few map exits, entrances like Ice caverns, etc.<br>
			-----<b>Added more Divine Ore drops at an easier rate.<br>
			-----<b>Added Badge Lottery. Ends on the 15th of December.<br>
			-----<b>Hopefully found and fixed the logout lag bug.<br>
			-----<b>Added commodity ticket vendor again.<br>
			-----<b>Added Logout button, try to use that instead of pressing X<br>
			-----<b>MAPS work again, newer maps not included yet.</b></font><br>
			-----<b>Fixed a login bug with Deceiver still rendering people invisible.</b></font><br>
			-----<b>Increased exp boost for new players to level 50.</b></font><br>

			--<b><font color=yellow size=3>March 2013<br></font>

			-----<b> <font color=red size=2>Monster bash now has 3 level categories.</b></font><br>

			-----<b><font color=red size=2>VIP introduced</b></font><br>

			-----<b>VIP information under EDit->VIP information.<br>
			-----<b> More benefits will be added to each level of VIP in the next few days.<br>
			-----<b>The system will be polished and made prettier as well.<br><br>

			----- A bug which caused a refined item to disappear when giving it to another player, has been corrected.<br>
			----- You can now deposit Refined items into the bank.<br>
			----- Auctioning Refined items should work properly now.<br>




			--<b><font color=yellow size=3>February 2013<br></font>

			-----<b><font color=red size=2>Refining Added</b></font><br>

			----- Max Refine level for an item is 20<br>
			----- You can now Refine weapons at the Master Refiner.<br>
			----- Refining a weapon has a chance to fail and lower your refine level by 1. Fail rate is based on the current refine level of the item.<br>
			----- If Refined level goes into negative, the item will grant less power than its base indicated power.<br>
			----- Refine Protection scrolls will prevent downgrading of the current refine level of an item.<br>
			----- Refine Protection when used will be lost regardless of if an item fails to refine or not. So use them only when you need to.<br>
			----- You should now receive a popup window showing you what items you get when Salvaging.<br>
			----- Items that can not be salvaged are now prevented from being salvaged.<br>
			----- Requirements button added to Refining, it should tell you what commodities are needed to refine an item.<br>
			----- Refined Items can not be banked, they can be traded assuming the item was tradeable.<br>
			----- Divine Ores are a possible rare drop from monsters as well.<br>
			----- Higher level equipment require expensive comms but they provide bigger bonuses to their stats.<br>
			----- Lowered the price of Savage to 25k and Refine to 100k<br>
			----- Added a Sell commodities command under commands.<br>
			----- Salvaging results are now randomized, you will either get more or the base comms.<br>
			----- Each +1 grants approx +20% increase to each base stat of a weapon/armor.<br>
			----- +20 weapons do automatic AoE Damage to all mobs in sight.<br>
			----- Commodity Vendor in Arial for 2 days<br>
			----- Fixed Sell Commodities verb so that it now sells Divine Ores properly.<br>
			----- Fixed a bug with Respec/Restat when wielding a + item.<br>
			----- Corrected a bug with Restat/Retrait reducing certain stats.<br>


			-----<b><font color=red size=2>Major Changes to Items</b></font>

			----- Salvaging system added, find the NPC. Refining will be added tomorrow or so.<br>
			----- All equipment stats have been GREATLY reduces as the refining system will boost items instead<br>
			----- Some badge items have been increased in price by quite a lot.<br>
			----- A new Commodity tab was added and all salvaged comms will show there.<br>
			----- Divine Ores are the rarest of Ores gained from the rare world drops, upgrades and badge items.<br>
			----- Each item will require its own comms and quite a lot of them in order to be refined, so start saving!<br>
			----- More to come...<br>

		    ----- Staff can no longer target mobs while watching other players. <br>
			----- Depositing/withdrawing items in your bank is now logged.<br>
			----- World Drops were lowered a bit more.<br>
			----- Can no longer enter a Skilled Tournament with Inventory open.<br>
			----- <font color=red> Skill based Tournaments added under Custom (after setting min/max level).<br></font>
			----- Corrected a bug with Monsterbash that would reset player kill points if MB was stopped and restarted.<br>
			----- World drops made to drop a little better than before.<br>
			----- MonsterBash will now automatically grant the ability to lock and unlock XP(under commands).<br>
			----- Players under level 50 will automatically gain more experience per kill.<br><br>
			----- Added info about extra exp at Intro mob, and line when lvl 31 is reached that specifies end of extra exp.<br><br>


			--<b><font color=yellow>Old Changes<br>	</font>
			----- Your save files no longer save locally on the server, instead they now can be shared with any updated BE server.<br>
			----- Check shows your current Devoured souls.<br>
			----- Souls are needed for Decimator(new Decimator still in testing as it has a few bugs but will be released within the week) and as currency for Hollow Armor/Weapons and as an entrance fee for Boss Island<br>
			----- You now randomly gain Souls when killing mobs.<br><br>
			</font>

			-----Removed Name reservation, v2 has a better system<br>
			-----Players can no longer rename if they are muted<br>
			-----Corrected a rather nasty auction bug.<br>
				</font>

			-<font color=yellow size=2>GM Related fixes<br>
			-----Removed Admin status from Staff.<br>
			-----Demoting Captain/Quincy will now correctly demote them if they are online.<br>
			-----Added Co-owner, title is self explanatory..<br>
			-----Removed most teleport verbs from Mods, they have enough verbs to moderate now.<br>
			-----Removed some teleport verbs from GMs.<br></font>



			<br>
			<br>
			<br>
			-<b>Version 1.09<br>
			<font color=red size=2>
			-When you Retrait, any points invested in Training will now correctly deduct skill points.<br>
			-When you Retrait, any points invested in Prodigy will be deducated from your EXP. So if you had 500 exp of 1000 to level, you will end up with 500exp minus (points in prodigy * 100) eg I had 10 Prodigy so it would be 500xp - 1000, you would end up with negative exp until you worked it back up.<br>
			-Fixed a bug with the Volcano quest not rewarding on completion<br></font>
			-Fixed a bug with the Freeze Ring skill<br>
			-Fixed a rather nasty bug that would cause the server to freeze permanently without crashing.<br>
			-Added yet another quest chain in the Volcano<br>
			-Sell Badges verb reactivated<br>
			-You must now convert your Honor Badges into BOUND badges in order to purchase something from the Donator Vendor. Note that once you convert badges they become non tradeable.<br>
			-You will now receive badges when reaching levels 100, 200, 300, 400, 500 and 750.<br>
			-Buffed some bosses and made them able to use Cero and bala!<br>
			-Most mob skills now bypass player immunity<br>
			-Fix for the quest chain now showing an additional quest which should have followed the Turtle spiders<br>
			-Added a new quest chain somewhere, with nice rewards. 60+ only(This chain provides good armor and will have more quests in order to provide a full set)<br>
			-Added a few fixes for EZcheck.<br>
			-Added a few fixes for bugs that were possibly causing lag when the game tried to Autosave.<br>
			-It it now easier than it was before to receive an honor badge for winning a Tournament.<br>
			-Badge world drops are now more rewarding<br>
			-Fixed a few bugs (Quincy Brotherhood, Ezchecker, etc)<br>
			-Added a double confirmation when buying items from a shop until I change the shop system. I will no longer accept any excuses about misclicking etc etc.<br>
			-Upgrade Scrolls will now automatically upgrade the item. The upgrade list will list more items as I release them<br>
			-Zone replaced with Squad, the result of this should be obvious.<br>
			-Ezcheck has been changed, you will no longer be booted - instead you will not be able to gain experience, gold, honor, kills or items until a member of Staff removes the penalty<br>
			-Honor scrolls are available at the Item vendor (they were supposed to be in but somehow were forgotten).<br>
			-Fixed a bug with Race Changer and raised its price <br>
			-Supreme Exp orb now costs a whole lot more badges<br>
			-Honor scroll boost was reduced to 0.2 and Advanced Honor scroll price was changed to 20 badges<br>
			-Roots and Saplings can no longer be banked.<br>
			-The Ark now costs 1500 badges<br>
			-Honor bonus cap from scrolls is now 100<br>
			-GM's should no longer be able to teleport to spawns (except Admin)<br>
			-Bug with Quincies Squad Join was fixed.<br>
			-Custom Icon/Skill expires on the 31st(from mystery box) permanently, I decided coding new custom skills was too much trouble.First come first served basis<br>
			-Banker added in Arial<br>
			-Re-enabled MAPS for now.<br>
			-Added Squad spawns for Squads 11 and 6.<br>
			-Fixed a bug where Quincies could not chat on ooc unless they were in a Squad<br>
			-Added a fix for Banks which was causing items to be lost when using alts.<br>
			-Byakuya Bankai will be added soon for testing - please discuss how the petals should be controlled(mouse, keyboard etc) and how Scene of Massacre should work.Use forum, any in game chat will remain chat and I will likely forget or ignore it.<br>
			-Byakuya Petal stream has been modified a bit to make it somewhat more applicable in combat, you should now be able to move around when you use it<br>
			-Mystery boxes added to Donator Vendor<br>
			-Testing new stat allocation for mobs, for now Super Ultimas stats will scale according to player - if someone however uses a lowbie to reduce the stats of the Super Ultima - chances of receiving a reward are null<br>
			-You can now request tradeable exp orbs with a 10x XP multiplier. These cost 300 badges.<br>
			-Fixed a bug where VIT was being multiplied instead of being divided which resulted in players becoming immune to damage. This will probably affect melee damage quite a bit<br>
			-Squad mute added for officers and above<br>
			-The Quincy Brotherhood squad was added for Quincies and the bonuses are lovely<br>
			-Squads should no longer be key based unless you are of the same race.<br>
			-When using your alts, you will need to click on Withdraw in the bank (even if you dont withdraw anything) and then relog to see any items on your main account.<br>
			-You can now click on File->Reconnect to immediately relog (assuming you are a donator,otherwise you wait 60 seconds still)<br>
			-Easter Gift boxes are in for a couple of days<br>
			-Items that have cooldowns (like the roots) will now properly function and display time remaining until cooldown wears off.<br>
			-Badges should now display properly in the Server panel<br>
			-Banks now hold up to 100 items<br>
			-Banking is now key based, meaning you can access the same bank from every save slot<br>.
			-Few bugs were corrected<br>
			-Roots added to Donator vendor for a day<br>
			-Rebooting now also forces save files to back up<br>
			-Hymn of Invulnerability now costs gold instead of 1 badge<br>
			-Auctions now last longer to give people more time.<br>
			-You can convert Platinum to Gold at the Banker.<br>
			-Stat packs added to the Donator vendor prematurely, they disappear on Tuesday<br>
			-Fixed a bug with Darkness bane, it should now ask for gold and not badges.<br>
			-The gold received from Honor scroll is now randomized and no longer a static 500k.<br>
			-Increased the cost of honor per stat point greatly to allow for other methods to obtain stat points in V2.<br>
			-Removed scaling discounts when buying items from a store. Items will always have the same price from now on.<br>
			-Moved Badges to the Server Status screen - click on Server to see your amount<br>
			-Added new currency, Platinum. 1 Platinum equals 5 million gold.<br>
			-Bounts are now immune to most stuns.<br>
			-Bounto Pet stats have increased<br>
			-In order to test how Bounts would manage in PVP using skill+ pet, I have actived Kidou for Bountos to use<br>
			-Currently finalizing some pvp and chat issues - it won't be long folks (maybe I can take a year vacation after all this!)!<br>
			-Adding a few of the things suggested on the forums and will give credit where it is due.<br>
			-The existing guilds will remain in the game for vanity purposes.<br>
			-All save files have been backed up and should now be compatible with v2, therefore no need to pwipe<br>
			-Most of the old code has been replaced with the updated V2 code - in the next few days you will start seeing changes occur each shutdown - rather than me taking down the game for a day.<br>
			-Most maps have been added to the game but are currently locked out until the final release - there may be some additional lag for the time being.<br>
			-Role play has been disabled for now and until I return from my trip<br>
			-I have added a very basic Ignore system, it will your Ignoree's PM's and most forms of chat.<br>
			-Reward scrolls are now world drops, however Super ultimas have a higher chance to drop them.<br>
			-New characters now start with 30 in MGC, STR <br>
			-Exp over 550+ was dramatically boosted<br>
			-Exp during double exp was boosted<br></font>
			-Super Ultimas can now drop Reward scrolls based on luck.<br>
			-Fixed a Tournament bug<br>
			-Fixed a few items bugs<br>
			-Credit Auction was disabled.<br>
			-Removed font resizing from Bankai calls<br>
			-Most donator items have been moved to the Gear Vendor for gold values. Donator Vendor has the 30 badge set for now.<br>
			-Credits have been removed. Honor Badges are now in the game.Those with more than 500 credits will have their credits autoconverted, those with less will have the option of converting it to gold or Honor or if they gain monthly credits - those can be added up when that time of the month comes in order to make 1 full Badge.<br>
				-Honor Badges can be gained from drops, honor scrolls, Tournaments or by exhanging Honor at the Honor Prize NPC<br>
			-You can now properly RIGHT click items in your inventory to see detailed stats<br>
			-Certain items were boosted, if you have items with old stats, bank them and withdraw them to fix it.<br>
			-Left clicking on an item will now have a new command - SHOW. You can show another player the item info, stats.etc.<br>
			-I have changed the way items are shown in shops and inventory. You can LEFT click an item to see stats and buy etc.<br>However, you can RIGHT click to get a popup with more detailed information on the item.<br>
			-You can now LOOK at a player, same menu as CHECK. It will show you a basic list of their equipment<br>
			-Bala should do less damage than a Cero now<br>
			-Restored Zanjutsu and Kidou the its former levels<br>
			-Reduced the amount of immunity gained from the passive relative Skills<br>
			-Fixed a map bug which was preventing people from getting to light mobs<br>
			-MGCDEF was greatly buffed and VIT was slightly raised as well.<br>
			-WHO now shows if someone has their Global chat off or on.<br>
			-Reduced the nerf of Zanjutsu and Kidou a little<br>
			-Added A new map for higher levels until v2<br>
			-Removed Private spawns<br>
			-Added experience orbs, they boost exp - only one can be activated - they do not stack.<br>
			-If your inventory if full when buying something, it will simply not purchase the item.<br>
			-Added some stuff to the donator vendor.<br>
			-Added some SECRET stuff in preparation for v2.muahaha.<br>
			-Fixed a bug which would randomly cause you to lose stats if you received a race change.<br>
			-Max level is now 750.<br>
			-Arena now rewards Honor as well.<br>
			-Dark mobs level was raised to 100.<br>
			-Mobs that are higher level than the player will not longer drop down to the players level.<br>
			-HGM was replaced by the Admin position.<br>
			-I have reduced the effectiveness of traits. The higher your level the less bonus you get from traits.<br>
			 Before it worked like this, if your trait (e.g Kidou) would be divided by 100 and the result would be the bonus<br>
			 For example, if you are level 100 and you have 1000 kidou, you will get a 10% bonus to magic damage.<br>
			 But now, If you are level 200 and you have 1000 Kidou, you will get a 5% bonus.<br>
			-Added new new griding Map - go find it<br>
			-Corrected the Teleporter bug in New Haven<br>
			-Corrected a tournament bug which would auto enter you into the next tournament if the previous was cancelled.<br>
			-Bounto pets were beefed up even more.<br>
			-Added some restrictions to Name Changer concerning html and font.<br>
			-You can now Retrait at the Respeccer<br>
			-You will now be automatically respec'd if you quit a Squad.<br>
			-Cleaned out the code and removed the debugger - added a few fixes for loops and bugs in the actual code.<br>
			-Reduced the Shield bonus effects on all equipment. People were gaining over 100 which basically made them immortal.<br>
			-EZ checker was redone, it now requires the person to say something in world chat.<br>
			-You can no longer Flash Assault players that you can not see.<br>
			-Corrected a bug with the Zanpakuto Manager, you can also Cancel now.<br>
			-Tournament rewards are now based on level.<br>
			-Three new world drops added.Do not ask, you will find out!<br>
			-The cost of Respec and Restat has been increased.<br>
			-You can now Restat at the Respeccer.<br>
			-Corrected a few minor bugs.<br>
			-Fire Ring and Sword rise aoe skills now drain 1/10 of your REI instead of a fixed Rei amount.<br>
			-Reduce the animation of Gin Sword Rise skill and increased Global cooldowns for all skills.<br>
			-When a Tournament is over or when you leave it, you will be returned to the spot you were at when you joined it.<br>
			-Gin and Fire Dragon should no longer cause lag, hopefully. Lowered the Radius of Gins Sword Rise skill temporarily.<br>
			-Removed poison effects from Grand wasps<br>
			-If Tournaments have less than 2 players, they will be cancelled.<br>
			-Removed Dew and other useless items from enemy drops<br>
			-Fixed a few enemy skills which were either not working or simply never cast.<br>
			-For testing purposes. Barrage and Power shot for Quincies now calculate Kidou into their damage<br>
			-Cloak of Zeus stats were changed.<br>
			-Festive Items removed from vendor<br>
			-Xmas events over - no more giftboxes<br>
			-Players no longer need to speak to their bank manager to receive world drops.<br>
			-Bank will no longet try to withdraw items when bank is empty<br>
			-Corrected a bug with deleting characters<br>
			-Gift box drop rate increased for New Year Day <br>
			-All subs are automatically added by the game to the New Year jackpot.<br>
			-Player names will now be keybound - No other player can create a name that is already taken by another.<br>
			-Squad levels have been raised to 5.<br>
			-When you gain a Squad level, you will be informed what bonus you receive.<br>
			-Squad Custom Ranks now work.<br>
			-Giftboxes were removed from drops, Festive Items will remain for one more day.<br>
			-Fixed a few bugs.<br>
			-Added a simple EZ checker for GM's to use<br>
			-Custom Tournamnents will indicate the level range now<br>
			-Added the option to cancel depositing or withdrawing an item from the bank.<br>
			-Corrected a minor bug with gift box prizes. It was rewarding 100 credits to some players but they only received 50.<br>
			-Added a Roll random number thingie in Commands, do not spam it.Mute will prevent you from using it<br>
			-All items won from an auction follow the same inventory rules as everything else - in other words if your inv is full it goes to your bank.<br>
			-You can no longer use shops or bank if you are a bidder or someone who started an auction.<br>
			-When someone bids or starts an auction and if they log off during the auction - it will reset. However, if the bidder logged off, the auction should continue by simply resetting the bid.<br>
			-If jailed during world PVP or in general - you should no longer be able to attack inside the jail.<br>
			-Some Festive Equipment has been added to the Donator Vendor - These items are only available until the 25th and can only be bought once a year.<br>
			-Giftboxes will now drop from hollows - MErry Xmas! Event Lasts until the 26th<br>
			-You can now Lock or unlock your EXP, so you do not gain level while in MonsterBash(found under Commands)<br>
			-Corrected GM's not displaying on MB scores<br>
			-Corrected a bank bug<br>
			-Tweaked how you gain honor from 250+ mobs. If a mob is 20 levels or more below you - you will not receive honor - this is just a correctional measure to compensate for ranged people attacking mobs before they can switch to their level.<br>
			-Squad Lieutenants will now save properly<br>
			-If you purchase something from a vendor and have no space, the item will be banked.<br>
			-IF your inventory is full when you are given an item, the item will be sent to your bank.<br>
			-Corrected a bug that prevented the creation of Athanatos<br>
			-Purchasing honor stats has been changed. IF you are above 500 or above they will cost 5k honor(may change), below 500 they will remain at 2k<br>
			-Tweaked Honor Prizes to be a little more generous  - however if too generous it will be restored to what it was<br>
			-Fixed a bug concerning Squad level gains.<br>
			-Level lowered back to 500 until further notice,<b>
			-Levels 500+ do not gain any stat points or skill points - they gain 2 trait points instead of 1.<br>
			-Max level has been raised to 750, from 500 onwards the exp till next level is much more severe.<br>
			-You can no longer move when browsing Shop wares, there was a bug related to it.<br>
			-Corrected Respecc which was not allocating the appropriate Squad bonus.<br>
			-Corrected a bug which prevented your Squad level from being stored.<br>
			-Corrected a few bugs with Auto-Captaincy and respec<br>
			-Updated and fixed Gotei13 list<br>
			-If Squads are stble, max level will be boosted in a couple of days.<br>
			-Squads have been completely revamped functionwise. You can only join one Squad per byond key and your rank transfers between your accounts located on the same key.<br>
			-Squad members now gain Squad personal experience by killing hollows - There are currently 2 Squad levels, you start at level 1 and can reach level 2. Each level provides a different bonus<br>
			-If you quit a Squad - your Squad level resets to 1 and you lose all bonuses and experience gained, so think twice before quitting a Squad or joining one.<br>
			-You can no longer Challenge the Squad Captain directly - you will need to RP or Officially duel in front of Members - Only Staff can remove Captain status<br>
			-Captains now have a rought Full member list for convenience<br>
			-Bonuses are applied to all accounts on a key.<br>
			-CTRL-A has been added and acts as a shortcut for Squad chat instead of Guild-Chat. It has also been noted under Controls.<br>
			-You can now CHECK a player to see their Squad and Squad level.<br>
			-Immunity has been tweaked slightly to prevent 100% immunity.<br>
			-Personal Spawns: Since a few players seem to misunderstand that spawns were made for a private hunting place for a meagre 1000 credits and not to customize their prefs - I am now allowing spawn owners to upgrade their spawn with 2000 credits to allow for Custom Anything inside it, including who enters and such.<br>.
			-Added some protection for Staff Hierarcy<br>
			-Exoskeleton was given one more upgradeable form.<br>
			-Custom Item pack was made cheaper in the Donator Vendor, also it gives a choice between two scrollls now - remember it disappears on the 10th!<br><br>


			-<b>Version 1.08<br>
			-Last Gasp has a small chance of activating during in World PVP, instead of always activating.<br>
			-Spawn monsters are all level 500 now, this is for cpu purposes and may change<br>
			-Can no longer bug-summon into a spawn (hopefully:P)
			-"Paitence" Shikai has been fixed. When in Shikai tyour target will move much slower when struck and will be unable to flash step for a while, you will also receive much less damage from your target<br>
			-World PVP fixed. Everyone should be able to do damage now<br>
			-Implemented a few more fixes which may help in reducing overall lag during peak times.<br>
			-Corrected a few bugs which affected player inventory and monster spawn rates.<br>
			-Added a new system that logs player kills, item exchanges, items purchased etc in order for me to keep track of things<br>
			-Added a custom pack to donator vendor, valid until 10th of decembe and only 2 available. First come, first served basis..<br>
			-You can now check yours or other player honor bonuses using Check.<br>
			-Corrected a bug with honor when respec'n<br>
			-Fixed a bug with honor.<br>
			-Exoskeleton and Cloak of Shadows damage reduction has been nerfed - players could obtain 100% damage reduction<br>
			-Fixed a bug which would prevent players from logging in randomly or give read errors<br>
			-Added a few fixes for misc bugs.<br>
			-Tourneys now reward 1000 honor instead of 500.<br>
			-Added a new option in the tournament system. GM/Mods can now set the min and max levels for a tournament.<br>
			-Added a new NPC - Honor Prize Exchanger. This NPc will take a set amount of not and reward you a ticket which when used will give you a random rare item, credits, gold or even stat bonuses like +honor per kill<br>
			-NERF: Reduced the effectiveness of STATS for testing purposes, this will be changed again so bear with it..<br>
			-Fixed a few map bugs I was made aware of and some misc bugs.<br>
			-You shouldn't be able to toggle PVP flag in jail now<br>
			-Exoskeleton honor bonus reduced to +2, or +5 if upgraded with an Upgrade scroll.<br>
			-You can now purchase Honor scroll from Gear vendor at 999k gold for 0.5 permanent increase(these work regardless of level)<br>
			-You can now purchase Advanced_Honor scroll from Donator vendor at 1500 credits for 1 permanent increase.(these work regardless of level)<br>
			-Fixed a bug with Jailed people attacking each other during world pvp<br>
			-Added a lower level Monsterbash<br>
			-Added an increased gold drop event.<br>
			-Hollows level 50 and above have been buffed.<br>
			-Two new maps added, only Shinigami can be teleported to them by a certain NPC they need to find.These maps are not the V2 SS, but an alternate "past" map for tranining<br>
			-Some more bug fixes added<br>
			-Evolved_Hollows are slightly stronger now.<br>
			-You will gain more more gold if you are in a party now(compared to solo), you should also gain decent exp.<br>
			-Bounto pets were buffed quite a bit more<br>
			-Mobs must be level 250+ in order for players to receive Honor.<br>
			-Players must now be 250+ in order to gain honor from killing hollows<br>
			-Players can no longer create Guilds<br>
			-It is now possible to receive a 100 credit world drop as well.<br>
			-It now costs 2000 Honor per stat at the honor exchanger.<br>
			-You can now change your Vaizard mask at the Honor exchanger for 1000 honor and it is random what you receive.<br>
			-You can no longer buy honor with gold<br>
			-Removed the normal masks that drop from NPC's(cracked etc), will add other more interesting things.<br>
			-Ultima and Super Ultima's will no longer spawn in Arena battles <br>
			-God spear and the rest of the skills linked to that Shini have been buffed and now calculate STr and ZAN as well<br>
			-The Equipment upgrade scroll has a VERY RARE chance to drop and is soulbound (can not be traded).It can be used to grade any weapon to the next level, for example ExoSkeleton can gain a chance for instant death kills.<br>
			-An alternate Soul society map for training will be added in a few days - courtesy of Steffix.<br>
			-Fixed a bug with Staff list, removing Mods should update properly now.<br>
			-Fixed a bug which allowed players to duplicate items.
			-Due to the previous difficulty of obtaining Full hollow form, I have made the mask pieces world drops.You need four of them to permanently receive the form and skills.<br>
			-Cero and Bala now factor in strength as well as magic, kidou AND zanjutsu.<br>
			-Power strike and Shockwave were made stronger<br>
			-Fixed AFK messages which were only affecting GM's<br>
			-Removed Automatic auction resets.<br>
			-Fixed a bug where people with periods in their keys would not be able to receive PM's<br>
			-Corrected a bug with AFK being permanent on a few players<br>
			-Under options, Exp display has been changed to Onscreen Msgs and option NONE will stop the displaying of Items and exp acquired in combat which should reduce your lag.<br>
			-A Staff List has been added. Due to this all GM/Mods have been reset and need to be reinstated.<br>
			-LCK now boosts criticals even more<br>
			-Spawn Mobs no longer drop useless items.<br>
			-Updated gold sale prices on the revised weapon/armor drops <br>
			-Updated the old weapons and armors like Nemesis and Vermillion etc to be more powerful. If you have the old version, I suggest you sell them to the shops.<br>
			-Fixed a rather serious bug which caused CPU to skyrocket.<br>
			-GM's can remove Captains and update the list.
			-GM's can Rename players that abuse names.<br>
			-GM's can now enable/Disable World PVP<br>
			-Vote Mute can be toggled by Staff.<br>
			-Vit was nerfed a bit. Before it was reducing melee damage based on your VIT * 2. So if you had 2k VIT it would reduce 2k from the total melee damage you received. Too Overpowered obviously.<br>
			-MGCDEF now works the same as VIT but for Magic damage.<br>
			-AGI was nerfed even more, it may be changed again depending on test results.<br>
			-Upped the prices for Honor exchange for coming release.<br>
			-Exoskeleton will now grant +5 honor only to the person who bought it and their alts, it is an account passive bonus and you do not need to trade the weapon between your characters<br>
			-Added SQL backup functionality for your save files.<br>
			-Removed some features which were useless.<br>
			-Upgraded World PVP  - A new PVP map Team vs Team will be available before 1.9 to test its functionality<br>
			-Teleporting to a House/Spawn has a 10 second timer.<br>
			-Added an equipment upgrade scroll for donators<br>
			-Upgraded the Exoskeleton to be more up to par with its price<br>
			-Removed experience display when killing mobs in private spawns<br>
			-Removed Monster Kills from displaying when clicking EXP ORB<br>
			-Added 3 rare scroll drops needed to upgrade the Devourer of Souls, these items are world drops <br>
			-The sale price of Cloak of Zeus was updated<br>
			-The exoskeleton's price was reduced and immunity was added to it as well<br>
			-You can no longer Challenge a Captain whilst the Captain is in their spawn<br>
			-GM's can no longer summon or teleport during a World PVP event<br>
			-Added a few death messages for flavour.<br>
			-Added World PVP. Can be toggled on and off by me<br>
			-Fixed a few miscellaneous bugs<br>
			-You will now only lose 1 honor if you kill someone lower than you.<br>
			-Moderators and above now have the ability to ban a user from Auctioning<br>
			-When a user logs out after starting an auction, the auctions will be reset and the user will be penalized.<br>
			-New Armor in Sub vendor<br>
			-Fixed a bug concerning squads and save files.<br>
			-Fixed a bug concerning Jail and spawn owners. <br>
			-Fixed a bug concerning squad 12 and 13 Captain<br>
			-When World drops happen they will be accompanied by a nasty surprise.<br>
			-VIT should now properly reduce damage for all types of attack.<br>
			-Increased the effectiveness of Agility a bit.<br>
			-Fixed a bug with Auction that was causing people to relog in order to be able to use the Auction.<br>
			-Don't invest points in Training Trait, I will be changing its use to something else<br>
			-Few more urgent bug fixes<br>
			-buggedy bug fixes<br>
			-Corrected Tournament levels so 250+ can enter properly and boosted rewards a tiny bit<br>
			-Made Full hollow a tad easier to occur<br>
			-Added something to the Gear Vendor<br>
			-Levelling is a tad more difficult, it was too easy before<br>
			-You can no longer summon players into your spawn nor can players or GM's teleport to you.<br>
			-The effect of VIT has been boosted.<br>
			-The effect of the stat AGI has been reduced - this may change as required in the future<br>
			-Corrected a few variables that were affecting save files casuing them to become corrupted.<br>
			-Misc Fixes that were causing issues with the new content.<br>
			-Mobs will once again change level at 40.<br>
			-You can no longer enter the Level up screen while invisible<br>
			-Income trait is a bit more effective now<br>
			-One of the new Cloaks is available at the Gear Vendor  - hope you have gold!:P <br>
			-You can no longer exchange honor for gold. However, you can buy honor with gold.<br>
			-All monsters have a chance to drop a credit package either 100 or 200 to the lucky player.<br>
			-You can now buy phoenix feathers for gold at the Gear Vendor<br>
			-All special bonuses and such for ALL classes are available at 400+<br>
			-As a result of levels being unlocked - Full hollow form is available at its predetermined level - mind you it requires specific conditions to activate and you have no control over it until you complete certain requirements<br>
			-Unlocked max level to give you all a headstart - max level 500.<br>
			-Levelling has been made easier - but it will probably only be felt by those above 200<br>
			-Monster levels start shifting from level 70 mobs and above now. <br>
			-Content has been added but not yet accessible by players (testing it myself while under load and live). <br>
			-You can no longer sell junk or quest items on Auction.<br>
			-Save system prepared for SQL functionality to work across servers.<br>
			-Monsters will now properly ignore invisible players, however they will still move about when attacked.<br>
			-Entering a tournament no longer strips you of your invisibility.<br>
			-You will no longer be locked in combat if you are wearing Deceiver.<br>






			"},"window=News;size=600x600")