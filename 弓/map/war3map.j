globals
//globals from YDTriggerSaveLoadSystem:
constant boolean LIBRARY_YDTriggerSaveLoadSystem=true
hashtable YDHT
hashtable YDLOC
//endglobals from YDTriggerSaveLoadSystem
//globals from YDWEBase:
constant boolean LIBRARY_YDWEBase=true
//»´ÔøΩ÷πÔøΩœ£ÔøΩÔøΩ 
string bj_AllString=".................................!.#$%&'()*+,-./0123456789:;<=>.@ABCDEFGHIJKLMNOPQRSTUVWXYZ[.]^_`abcdefghijklmnopqrstuvwxyz{|}~................................................................................................................................"
//ÂÖ®Â±ÄÁ≥ªÁªüÂèòÈáè
unit bj_lastAbilityCastingUnit=null
unit bj_lastAbilityTargetUnit=null
unit bj_lastPoolAbstractedUnit=null
unitpool bj_lastCreatedUnitPool=null
item bj_lastPoolAbstractedItem=null
itempool bj_lastCreatedItemPool=null
attacktype bj_lastSetAttackType= ATTACK_TYPE_NORMAL
damagetype bj_lastSetDamageType= DAMAGE_TYPE_NORMAL
weapontype bj_lastSetWeaponType= WEAPON_TYPE_WHOKNOWS
real yd_MapMaxX= 0
real yd_MapMinX= 0
real yd_MapMaxY= 0
real yd_MapMinY= 0
string array YDWEBase__yd_PlayerColor
trigger array YDWEBase__AbilityCastingOverEventQueue
integer array YDWEBase__AbilityCastingOverEventType
integer YDWEBase__AbilityCastingOverEventNumber= 0
//endglobals from YDWEBase
//globals from YDWEGetUnitsInRangeOfLocMatchingNull:
constant boolean LIBRARY_YDWEGetUnitsInRangeOfLocMatchingNull=true
group yd_NullTempGroup
//endglobals from YDWEGetUnitsInRangeOfLocMatchingNull
//globals from YDWETriggerEvent:
constant boolean LIBRARY_YDWETriggerEvent=true
trigger yd_DamageEventTrigger= null
trigger array YDWETriggerEvent__DamageEventQueue
integer YDWETriggerEvent__DamageEventNumber= 0
	
item bj_lastMovedItemInItemSlot= null
	
trigger YDWETriggerEvent__MoveItemEventTrigger= null
trigger array YDWETriggerEvent__MoveItemEventQueue
integer YDWETriggerEvent__MoveItemEventNumber= 0
//endglobals from YDWETriggerEvent
//globals from YDWETimerSystem:
constant boolean LIBRARY_YDWETimerSystem=true
integer YDWETimerSystem__CurrentTime
integer YDWETimerSystem__CurrentIndex
integer YDWETimerSystem__TaskListHead
integer YDWETimerSystem__TaskListIdleHead
integer YDWETimerSystem__TaskListIdleMax
integer array YDWETimerSystem__TaskListIdle
integer array YDWETimerSystem__TaskListNext
integer array YDWETimerSystem__TaskListTime
trigger array YDWETimerSystem__TaskListProc
trigger YDWETimerSystem__fnRemoveUnit
trigger YDWETimerSystem__fnDestroyTimer
trigger YDWETimerSystem__fnRemoveItem
trigger YDWETimerSystem__fnDestroyEffect
trigger YDWETimerSystem__fnDestroyLightning
trigger YDWETimerSystem__fnRunTrigger
timer YDWETimerSystem__Timer
integer YDWETimerSystem__TimerHandle
integer YDWETimerSystem__TimerSystem_RunIndex= 0
//endglobals from YDWETimerSystem
    // User-defined
unit udg_player= null
integer udg_sum= 0
location udg_spot= null
    // Generated
trigger gg_trg___________________u= null
trigger gg_trg_Q____________u= null
trigger gg_trg_______________________u= null
trigger gg_trg_____________u= null
trigger gg_trg_____________JQ= null

trigger l__library_init

//JASSHelper struct globals:

endglobals


//library YDTriggerSaveLoadSystem:
    function YDTriggerSaveLoadSystem__Init takes nothing returns nothing
            set YDHT=InitHashtable()
        set YDLOC=InitHashtable()
    endfunction

//library YDTriggerSaveLoadSystem ends
//library YDWEBase:
//===========================================================================
//HashTable
//===========================================================================
//===========================================================================
//Return bug
//===========================================================================
function YDWEH2I takes handle h returns integer
    return GetHandleId(h)
endfunction
//ÔøΩÔøΩÔøΩÔøΩ
function YDWEFlushAllData takes nothing returns nothing
    call FlushParentHashtable(YDHT)
endfunction
function YDWEFlushMissionByInteger takes integer i returns nothing
    call FlushChildHashtable(YDHT, i)
endfunction
function YDWEFlushMissionByString takes string s returns nothing
    call FlushChildHashtable(YDHT, StringHash(s))
endfunction
function YDWEFlushStoredIntegerByInteger takes integer i,integer j returns nothing
    call RemoveSavedInteger(YDHT, i, j)
endfunction
function YDWEFlushStoredIntegerByString takes string s1,string s2 returns nothing
    call RemoveSavedInteger(YDHT, StringHash(s1), StringHash(s2))
endfunction
function YDWEHaveSavedIntegerByInteger takes integer i,integer j returns boolean
    return HaveSavedInteger(YDHT, i, j)
endfunction
function YDWEHaveSavedIntegerByString takes string s1,string s2 returns boolean
    return HaveSavedInteger(YDHT, StringHash(s1), StringHash(s2))
endfunction
//store and get integer
function YDWESaveIntegerByInteger takes integer pTable,integer pKey,integer i returns nothing
    call SaveInteger(YDHT, pTable, pKey, i)
endfunction
function YDWESaveIntegerByString takes string pTable,string pKey,integer i returns nothing
    call SaveInteger(YDHT, StringHash(pTable), StringHash(pKey), i)
endfunction
function YDWEGetIntegerByInteger takes integer pTable,integer pKey returns integer
    return LoadInteger(YDHT, pTable, pKey)
endfunction
function YDWEGetIntegerByString takes string pTable,string pKey returns integer
    return LoadInteger(YDHT, StringHash(pTable), StringHash(pKey))
endfunction
//store and get real
function YDWESaveRealByInteger takes integer pTable,integer pKey,real r returns nothing
    call SaveReal(YDHT, pTable, pKey, r)
endfunction
function YDWESaveRealByString takes string pTable,string pKey,real r returns nothing
    call SaveReal(YDHT, StringHash(pTable), StringHash(pKey), r)
endfunction
function YDWEGetRealByInteger takes integer pTable,integer pKey returns real
    return LoadReal(YDHT, pTable, pKey)
endfunction
function YDWEGetRealByString takes string pTable,string pKey returns real
    return LoadReal(YDHT, StringHash(pTable), StringHash(pKey))
endfunction
//store and get string
function YDWESaveStringByInteger takes integer pTable,integer pKey,string s returns nothing
    call SaveStr(YDHT, pTable, pKey, s)
endfunction
function YDWESaveStringByString takes string pTable,string pKey,string s returns nothing
    call SaveStr(YDHT, StringHash(pTable), StringHash(pKey), s)
endfunction
function YDWEGetStringByInteger takes integer pTable,integer pKey returns string
    return LoadStr(YDHT, pTable, pKey)
endfunction
function YDWEGetStringByString takes string pTable,string pKey returns string
    return LoadStr(YDHT, StringHash(pTable), StringHash(pKey))
endfunction
//store and get boolean
function YDWESaveBooleanByInteger takes integer pTable,integer pKey,boolean b returns nothing
    call SaveBoolean(YDHT, pTable, pKey, b)
endfunction
function YDWESaveBooleanByString takes string pTable,string pKey,boolean b returns nothing
    call SaveBoolean(YDHT, StringHash(pTable), StringHash(pKey), b)
endfunction
function YDWEGetBooleanByInteger takes integer pTable,integer pKey returns boolean
    return LoadBoolean(YDHT, pTable, pKey)
endfunction
function YDWEGetBooleanByString takes string pTable,string pKey returns boolean
    return LoadBoolean(YDHT, StringHash(pTable), StringHash(pKey))
endfunction
//Covert Unit
function YDWESaveUnitByInteger takes integer pTable,integer pKey,unit u returns nothing
    call SaveUnitHandle(YDHT, pTable, pKey, u)
endfunction
function YDWESaveUnitByString takes string pTable,string pKey,unit u returns nothing
    call SaveUnitHandle(YDHT, StringHash(pTable), StringHash(pKey), u)
endfunction
function YDWEGetUnitByInteger takes integer pTable,integer pKey returns unit
    return LoadUnitHandle(YDHT, pTable, pKey)
endfunction
function YDWEGetUnitByString takes string pTable,string pKey returns unit
    return LoadUnitHandle(YDHT, StringHash(pTable), StringHash(pKey))
endfunction
//Covert UnitID
function YDWESaveUnitIDByInteger takes integer pTable,integer pKey,integer uid returns nothing
    call SaveInteger(YDHT, pTable, pKey, uid)
endfunction
function YDWESaveUnitIDByString takes string pTable,string pKey,integer uid returns nothing
    call SaveInteger(YDHT, StringHash(pTable), StringHash(pKey), uid)
endfunction
function YDWEGetUnitIDByInteger takes integer pTable,integer pKey returns integer
    return LoadInteger(YDHT, pTable, pKey)
endfunction
function YDWEGetUnitIDByString takes string pTable,string pKey returns integer
    return LoadInteger(YDHT, StringHash(pTable), StringHash(pKey))
endfunction
//Covert AbilityID
function YDWESaveAbilityIDByInteger takes integer pTable,integer pKey,integer abid returns nothing
    call SaveInteger(YDHT, pTable, pKey, abid)
endfunction
function YDWESaveAbilityIDByString takes string pTable,string pKey,integer abid returns nothing
    call SaveInteger(YDHT, StringHash(pTable), StringHash(pKey), abid)
endfunction
function YDWEGetAbilityIDByInteger takes integer pTable,integer pKey returns integer
    return LoadInteger(YDHT, pTable, pKey)
endfunction
function YDWEGetAbilityIDByString takes string pTable,string pKey returns integer
    return LoadInteger(YDHT, StringHash(pTable), StringHash(pKey))
endfunction
//Covert Player
function YDWESavePlayerByInteger takes integer pTable,integer pKey,player p returns nothing
    call SavePlayerHandle(YDHT, pTable, pKey, p)
endfunction
function YDWESavePlayerByString takes string pTable,string pKey,player p returns nothing
    call SavePlayerHandle(YDHT, StringHash(pTable), StringHash(pKey), p)
endfunction
function YDWEGetPlayerByInteger takes integer pTable,integer pKey returns player
    return LoadPlayerHandle(YDHT, pTable, pKey)
endfunction
function YDWEGetPlayerByString takes string pTable,string pKey returns player
    return LoadPlayerHandle(YDHT, StringHash(pTable), StringHash(pKey))
endfunction
//Covert Item
function YDWESaveItemByInteger takes integer pTable,integer pKey,item it returns nothing
    call SaveItemHandle(YDHT, pTable, pKey, it)
endfunction
function YDWESaveItemByString takes string pTable,string pKey,item it returns nothing
    call SaveItemHandle(YDHT, StringHash(pTable), StringHash(pKey), it)
endfunction
function YDWEGetItemByInteger takes integer pTable,integer pKey returns item
    return LoadItemHandle(YDHT, pTable, pKey)
endfunction
function YDWEGetItemByString takes string pTable,string pKey returns item
    return LoadItemHandle(YDHT, StringHash(pTable), StringHash(pKey))
endfunction
//Covert ItemID
function YDWESaveItemIDByInteger takes integer pTable,integer pKey,integer itid returns nothing
    call SaveInteger(YDHT, pTable, pKey, itid)
endfunction
function YDWESaveItemIDByString takes string pTable,string pKey,integer itid returns nothing
    call SaveInteger(YDHT, StringHash(pTable), StringHash(pKey), itid)
endfunction
function YDWEGetItemIDByInteger takes integer pTable,integer pKey returns integer
    return LoadInteger(YDHT, pTable, pKey)
endfunction
function YDWEGetItemIDByString takes string pTable,string pKey returns integer
    return LoadInteger(YDHT, StringHash(pTable), StringHash(pKey))
endfunction
//Covert Timer
function YDWESaveTimerByInteger takes integer pTable,integer pKey,timer t returns nothing
    call SaveTimerHandle(YDHT, pTable, pKey, t)
endfunction
function YDWESaveTimerByString takes string pTable,string pKey,timer t returns nothing
    call SaveTimerHandle(YDHT, StringHash(pTable), StringHash(pKey), t)
endfunction
function YDWEGetTimerByInteger takes integer pTable,integer pKey returns timer
    return LoadTimerHandle(YDHT, pTable, pKey)
endfunction
function YDWEGetTimerByString takes string pTable,string pKey returns timer
    return LoadTimerHandle(YDHT, StringHash(pTable), StringHash(pKey))
endfunction
//Covert Trigger
function YDWESaveTriggerByInteger takes integer pTable,integer pKey,trigger trg returns nothing
    call SaveTriggerHandle(YDHT, pTable, pKey, trg)
endfunction
function YDWESaveTriggerByString takes string pTable,string pKey,trigger trg returns nothing
    call SaveTriggerHandle(YDHT, StringHash(pTable), StringHash(pKey), trg)
endfunction
function YDWEGetTriggerByInteger takes integer pTable,integer pKey returns trigger
    return LoadTriggerHandle(YDHT, pTable, pKey)
endfunction
function YDWEGetTriggerByString takes string pTable,string pKey returns trigger
    return LoadTriggerHandle(YDHT, StringHash(pTable), StringHash(pKey))
endfunction
//Covert Location
function YDWESaveLocationByInteger takes integer pTable,integer pKey,location pt returns nothing
    call SaveLocationHandle(YDHT, pTable, pKey, pt)
endfunction
function YDWESaveLocationByString takes string pTable,string pKey,location pt returns nothing
    call SaveLocationHandle(YDHT, StringHash(pTable), StringHash(pKey), pt)
endfunction
function YDWEGetLocationByInteger takes integer pTable,integer pKey returns location
    return LoadLocationHandle(YDHT, pTable, pKey)
endfunction
function YDWEGetLocationByString takes string pTable,string pKey returns location
    return LoadLocationHandle(YDHT, StringHash(pTable), StringHash(pKey))
endfunction
//Covert Group
function YDWESaveGroupByInteger takes integer pTable,integer pKey,group g returns nothing
    call SaveGroupHandle(YDHT, pTable, pKey, g)
endfunction
function YDWESaveGroupByString takes string pTable,string pKey,group g returns nothing
    call SaveGroupHandle(YDHT, StringHash(pTable), StringHash(pKey), g)
endfunction
function YDWEGetGroupByInteger takes integer pTable,integer pKey returns group
    return LoadGroupHandle(YDHT, pTable, pKey)
endfunction
function YDWEGetGroupByString takes string pTable,string pKey returns group
    return LoadGroupHandle(YDHT, StringHash(pTable), StringHash(pKey))
endfunction
//Covert Multiboard
function YDWESaveMultiboardByInteger takes integer pTable,integer pKey,multiboard m returns nothing
    call SaveMultiboardHandle(YDHT, pTable, pKey, m)
endfunction
function YDWESaveMultiboardByString takes string pTable,string pKey,multiboard m returns nothing
    call SaveMultiboardHandle(YDHT, StringHash(pTable), StringHash(pKey), m)
endfunction
function YDWEGetMultiboardByInteger takes integer pTable,integer pKey returns multiboard
    return LoadMultiboardHandle(YDHT, pTable, pKey)
endfunction
function YDWEGetMultiboardByString takes string pTable,string pKey returns multiboard
    return LoadMultiboardHandle(YDHT, StringHash(pTable), StringHash(pKey))
endfunction
//Covert MultiboardItem
function YDWESaveMultiboardItemByInteger takes integer pTable,integer pKey,multiboarditem mt returns nothing
    call SaveMultiboardItemHandle(YDHT, pTable, pKey, mt)
endfunction
function YDWESaveMultiboardItemByString takes string pTable,string pKey,multiboarditem mt returns nothing
    call SaveMultiboardItemHandle(YDHT, StringHash(pTable), StringHash(pKey), mt)
endfunction
function YDWEGetMultiboardItemByInteger takes integer pTable,integer pKey returns multiboarditem
    return LoadMultiboardItemHandle(YDHT, pTable, pKey)
endfunction
function YDWEGetMultiboardItemByString takes string pTable,string pKey returns multiboarditem
    return LoadMultiboardItemHandle(YDHT, StringHash(pTable), StringHash(pKey))
endfunction
//Covert TextTag
function YDWESaveTextTagByInteger takes integer pTable,integer pKey,texttag tt returns nothing
    call SaveTextTagHandle(YDHT, pTable, pKey, tt)
endfunction
function YDWESaveTextTagByString takes string pTable,string pKey,texttag tt returns nothing
    call SaveTextTagHandle(YDHT, StringHash(pTable), StringHash(pKey), tt)
endfunction
function YDWEGetTextTagByInteger takes integer pTable,integer pKey returns texttag
    return LoadTextTagHandle(YDHT, pTable, pKey)
endfunction
function YDWEGetTextTagByString takes string pTable,string pKey returns texttag
    return LoadTextTagHandle(YDHT, StringHash(pTable), StringHash(pKey))
endfunction
//Covert Lightning
function YDWESaveLightningByInteger takes integer pTable,integer pKey,lightning ln returns nothing
    call SaveLightningHandle(YDHT, pTable, pKey, ln)
endfunction
function YDWESaveLightningByString takes string pTable,string pKey,lightning ln returns nothing
    call SaveLightningHandle(YDHT, StringHash(pTable), StringHash(pKey), ln)
endfunction
function YDWEGetLightningByInteger takes integer pTable,integer pKey returns lightning
    return LoadLightningHandle(YDHT, pTable, pKey)
endfunction
function YDWEGetLightningByString takes string pTable,string pKey returns lightning
    return LoadLightningHandle(YDHT, StringHash(pTable), StringHash(pKey))
endfunction
//Covert Region
function YDWESaveRegionByInteger takes integer pTable,integer pKey,region rn returns nothing
    call SaveRegionHandle(YDHT, pTable, pKey, rn)
endfunction
function YDWESaveRegionByString takes string pTable,string pKey,region rt returns nothing
    call SaveRegionHandle(YDHT, StringHash(pTable), StringHash(pKey), rt)
endfunction
function YDWEGetRegionByInteger takes integer pTable,integer pKey returns region
    return LoadRegionHandle(YDHT, pTable, pKey)
endfunction
function YDWEGetRegionByString takes string pTable,string pKey returns region
    return LoadRegionHandle(YDHT, StringHash(pTable), StringHash(pKey))
endfunction
//Covert Rect
function YDWESaveRectByInteger takes integer pTable,integer pKey,rect rn returns nothing
    call SaveRectHandle(YDHT, pTable, pKey, rn)
endfunction
function YDWESaveRectByString takes string pTable,string pKey,rect rt returns nothing
    call SaveRectHandle(YDHT, StringHash(pTable), StringHash(pKey), rt)
endfunction
function YDWEGetRectByInteger takes integer pTable,integer pKey returns rect
    return LoadRectHandle(YDHT, pTable, pKey)
endfunction
function YDWEGetRectByString takes string pTable,string pKey returns rect
    return LoadRectHandle(YDHT, StringHash(pTable), StringHash(pKey))
endfunction
//Covert Leaderboard
function YDWESaveLeaderboardByInteger takes integer pTable,integer pKey,leaderboard lb returns nothing
    call SaveLeaderboardHandle(YDHT, pTable, pKey, lb)
endfunction
function YDWESaveLeaderboardByString takes string pTable,string pKey,leaderboard lb returns nothing
    call SaveLeaderboardHandle(YDHT, StringHash(pTable), StringHash(pKey), lb)
endfunction
function YDWEGetLeaderboardByInteger takes integer pTable,integer pKey returns leaderboard
    return LoadLeaderboardHandle(YDHT, pTable, pKey)
endfunction
function YDWEGetLeaderboardByString takes string pTable,string pKey returns leaderboard
    return LoadLeaderboardHandle(YDHT, StringHash(pTable), StringHash(pKey))
endfunction
//Covert Effect
function YDWESaveEffectByInteger takes integer pTable,integer pKey,effect e returns nothing
    call SaveEffectHandle(YDHT, pTable, pKey, e)
endfunction
function YDWESaveEffectByString takes string pTable,string pKey,effect e returns nothing
    call SaveEffectHandle(YDHT, StringHash(pTable), StringHash(pKey), e)
endfunction
function YDWEGetEffectByInteger takes integer pTable,integer pKey returns effect
    return LoadEffectHandle(YDHT, pTable, pKey)
endfunction
function YDWEGetEffectByString takes string pTable,string pKey returns effect
    return LoadEffectHandle(YDHT, StringHash(pTable), StringHash(pKey))
endfunction
//Covert Destructable
function YDWESaveDestructableByInteger takes integer pTable,integer pKey,destructable da returns nothing
    call SaveDestructableHandle(YDHT, pTable, pKey, da)
endfunction
function YDWESaveDestructableByString takes string pTable,string pKey,destructable da returns nothing
    call SaveDestructableHandle(YDHT, StringHash(pTable), StringHash(pKey), da)
endfunction
function YDWEGetDestructableByInteger takes integer pTable,integer pKey returns destructable
    return LoadDestructableHandle(YDHT, pTable, pKey)
endfunction
function YDWEGetDestructableByString takes string pTable,string pKey returns destructable
    return LoadDestructableHandle(YDHT, StringHash(pTable), StringHash(pKey))
endfunction
//Covert triggercondition
function YDWESaveTriggerConditionByInteger takes integer pTable,integer pKey,triggercondition tc returns nothing
    call SaveTriggerConditionHandle(YDHT, pTable, pKey, tc)
endfunction
function YDWESaveTriggerConditionByString takes string pTable,string pKey,triggercondition tc returns nothing
    call SaveTriggerConditionHandle(YDHT, StringHash(pTable), StringHash(pKey), tc)
endfunction
function YDWEGetTriggerConditionByInteger takes integer pTable,integer pKey returns triggercondition
    return LoadTriggerConditionHandle(YDHT, pTable, pKey)
endfunction
function YDWEGetTriggerConditionByString takes string pTable,string pKey returns triggercondition
    return LoadTriggerConditionHandle(YDHT, StringHash(pTable), StringHash(pKey))
endfunction
//Covert triggeraction
function YDWESaveTriggerActionByInteger takes integer pTable,integer pKey,triggeraction ta returns nothing
    call SaveTriggerActionHandle(YDHT, pTable, pKey, ta)
endfunction
function YDWESaveTriggerActionByString takes string pTable,string pKey,triggeraction ta returns nothing
    call SaveTriggerActionHandle(YDHT, StringHash(pTable), StringHash(pKey), ta)
endfunction
function YDWEGetTriggerActionByInteger takes integer pTable,integer pKey returns triggeraction
    return LoadTriggerActionHandle(YDHT, pTable, pKey)
endfunction
function YDWEGetTriggerActionByString takes string pTable,string pKey returns triggeraction
    return LoadTriggerActionHandle(YDHT, StringHash(pTable), StringHash(pKey))
endfunction
//Covert event
function YDWESaveTriggerEventByInteger takes integer pTable,integer pKey,event et returns nothing
    call SaveTriggerEventHandle(YDHT, pTable, pKey, et)
endfunction
function YDWESaveTriggerEventByString takes string pTable,string pKey,event et returns nothing
    call SaveTriggerEventHandle(YDHT, StringHash(pTable), StringHash(pKey), et)
endfunction
function YDWEGetTriggerEventByInteger takes integer pTable,integer pKey returns event
    return LoadTriggerEventHandle(YDHT, pTable, pKey)
endfunction
function YDWEGetTriggerEventByString takes string pTable,string pKey returns event
    return LoadTriggerEventHandle(YDHT, StringHash(pTable), StringHash(pKey))
endfunction
//Covert force
function YDWESaveForceByInteger takes integer pTable,integer pKey,force fc returns nothing
    call SaveForceHandle(YDHT, pTable, pKey, fc)
endfunction
function YDWESaveForceByString takes string pTable,string pKey,force fc returns nothing
    call SaveForceHandle(YDHT, StringHash(pTable), StringHash(pKey), fc)
endfunction
function YDWEGetForceByInteger takes integer pTable,integer pKey returns force
    return LoadForceHandle(YDHT, pTable, pKey)
endfunction
function YDWEGetForceByString takes string pTable,string pKey returns force
    return LoadForceHandle(YDHT, StringHash(pTable), StringHash(pKey))
endfunction
//Covert boolexpr
function YDWESaveBoolexprByInteger takes integer pTable,integer pKey,boolexpr be returns nothing
    call SaveBooleanExprHandle(YDHT, pTable, pKey, be)
endfunction
function YDWESaveBoolexprByString takes string pTable,string pKey,boolexpr be returns nothing
    call SaveBooleanExprHandle(YDHT, StringHash(pTable), StringHash(pKey), be)
endfunction
function YDWEGetBoolexprByInteger takes integer pTable,integer pKey returns boolexpr
    return LoadBooleanExprHandle(YDHT, pTable, pKey)
endfunction
function YDWEGetBoolexprByString takes string pTable,string pKey returns boolexpr
    return LoadBooleanExprHandle(YDHT, StringHash(pTable), StringHash(pKey))
endfunction
//Covert sound
function YDWESaveSoundByInteger takes integer pTable,integer pKey,sound sd returns nothing
    call SaveSoundHandle(YDHT, pTable, pKey, sd)
endfunction
function YDWESaveSoundByString takes string pTable,string pKey,sound sd returns nothing
    call SaveSoundHandle(YDHT, StringHash(pTable), StringHash(pKey), sd)
endfunction
function YDWEGetSoundByInteger takes integer pTable,integer pKey returns sound
    return LoadSoundHandle(YDHT, pTable, pKey)
endfunction
function YDWEGetSoundByString takes string pTable,string pKey returns sound
    return LoadSoundHandle(YDHT, StringHash(pTable), StringHash(pKey))
endfunction
//Covert timerdialog
function YDWESaveTimerDialogByInteger takes integer pTable,integer pKey,timerdialog td returns nothing
    call SaveTimerDialogHandle(YDHT, pTable, pKey, td)
endfunction
function YDWESaveTimerDialogByString takes string pTable,string pKey,timerdialog td returns nothing
    call SaveTimerDialogHandle(YDHT, StringHash(pTable), StringHash(pKey), td)
endfunction
function YDWEGetTimerDialogByInteger takes integer pTable,integer pKey returns timerdialog
    return LoadTimerDialogHandle(YDHT, pTable, pKey)
endfunction
function YDWEGetTimerDialogByString takes string pTable,string pKey returns timerdialog
    return LoadTimerDialogHandle(YDHT, StringHash(pTable), StringHash(pKey))
endfunction
//Covert trackable
function YDWESaveTrackableByInteger takes integer pTable,integer pKey,trackable ta returns nothing
    call SaveTrackableHandle(YDHT, pTable, pKey, ta)
endfunction
function YDWESaveTrackableByString takes string pTable,string pKey,trackable ta returns nothing
    call SaveTrackableHandle(YDHT, StringHash(pTable), StringHash(pKey), ta)
endfunction
function YDWEGetTrackableByInteger takes integer pTable,integer pKey returns trackable
    return LoadTrackableHandle(YDHT, pTable, pKey)
endfunction
function YDWEGetTrackableByString takes string pTable,string pKey returns trackable
    return LoadTrackableHandle(YDHT, StringHash(pTable), StringHash(pKey))
endfunction
//Covert dialog
function YDWESaveDialogByInteger takes integer pTable,integer pKey,dialog d returns nothing
    call SaveDialogHandle(YDHT, pTable, pKey, d)
endfunction
function YDWESaveDialogByString takes string pTable,string pKey,dialog d returns nothing
    call SaveDialogHandle(YDHT, StringHash(pTable), StringHash(pKey), d)
endfunction
function YDWEGetDialogByInteger takes integer pTable,integer pKey returns dialog
    return LoadDialogHandle(YDHT, pTable, pKey)
endfunction
function YDWEGetDialogByString takes string pTable,string pKey returns dialog
    return LoadDialogHandle(YDHT, StringHash(pTable), StringHash(pKey))
endfunction
//Covert button
function YDWESaveButtonByInteger takes integer pTable,integer pKey,button bt returns nothing
    call SaveButtonHandle(YDHT, pTable, pKey, bt)
endfunction
function YDWESaveButtonByString takes string pTable,string pKey,button bt returns nothing
    call SaveButtonHandle(YDHT, StringHash(pTable), StringHash(pKey), bt)
endfunction
function YDWEGetButtonByInteger takes integer pTable,integer pKey returns button
    return LoadButtonHandle(YDHT, pTable, pKey)
endfunction
function YDWEGetButtonByString takes string pTable,string pKey returns button
    return LoadButtonHandle(YDHT, StringHash(pTable), StringHash(pKey))
endfunction
//Covert quest
function YDWESaveQuestByInteger takes integer pTable,integer pKey,quest qt returns nothing
    call SaveQuestHandle(YDHT, pTable, pKey, qt)
endfunction
function YDWESaveQuestByString takes string pTable,string pKey,quest qt returns nothing
    call SaveQuestHandle(YDHT, StringHash(pTable), StringHash(pKey), qt)
endfunction
function YDWEGetQuestByInteger takes integer pTable,integer pKey returns quest
    return LoadQuestHandle(YDHT, pTable, pKey)
endfunction
function YDWEGetQuestByString takes string pTable,string pKey returns quest
    return LoadQuestHandle(YDHT, StringHash(pTable), StringHash(pKey))
endfunction
//Covert questitem
function YDWESaveQuestItemByInteger takes integer pTable,integer pKey,questitem qi returns nothing
    call SaveQuestItemHandle(YDHT, pTable, pKey, qi)
endfunction
function YDWESaveQuestItemByString takes string pTable,string pKey,questitem qi returns nothing
    call SaveQuestItemHandle(YDHT, StringHash(pTable), StringHash(pKey), qi)
endfunction
function YDWEGetQuestItemByInteger takes integer pTable,integer pKey returns questitem
    return LoadQuestItemHandle(YDHT, pTable, pKey)
endfunction
function YDWEGetQuestItemByString takes string pTable,string pKey returns questitem
    return LoadQuestItemHandle(YDHT, StringHash(pTable), StringHash(pKey))
endfunction
function YDWES2I takes string s returns integer
    return StringHash(s)
endfunction
function YDWESaveAbilityHandleBJ takes integer AbilityID,integer key,integer missionKey,hashtable table returns nothing
    call SaveInteger(table, missionKey, key, AbilityID)
endfunction
function YDWESaveAbilityHandle takes hashtable table,integer parentKey,integer childKey,integer AbilityID returns nothing
    call SaveInteger(table, parentKey, childKey, AbilityID)
endfunction
function YDWELoadAbilityHandleBJ takes integer key,integer missionKey,hashtable table returns integer
    return LoadInteger(table, missionKey, key)
endfunction
function YDWELoadAbilityHandle takes hashtable table,integer parentKey,integer childKey returns integer
    return LoadInteger(table, parentKey, childKey)
endfunction
//===========================================================================
//ËøîÂõûÂèÇÊï∞
//===========================================================================
//Âú∞ÂõæËæπÁïåÂà§Êñ≠
function YDWECoordinateX takes real x returns real
    return RMinBJ(RMaxBJ(x, yd_MapMinX), yd_MapMaxX)
endfunction
function YDWECoordinateY takes real y returns real
    return RMinBJ(RMaxBJ(y, yd_MapMinY), yd_MapMaxY)
endfunction
function YDWEDistanceBetweenUnitAndPoint takes unit a,location b returns real
    local real x= GetUnitX(a) - GetLocationX(b)
    local real y= GetUnitY(a) - GetLocationY(b)
    return SquareRoot(x * x + y * y)
endfunction
function YDWEAngleBetweenUnitAndPoint takes unit a,location b returns real
    return bj_RADTODEG * Atan2(GetLocationY(b) - GetUnitY(a), GetLocationX(b) - GetUnitX(a))
endfunction
function YDWEDistanceBetweenUnits takes unit a,unit b returns real
    local real x= GetUnitX(a) - GetUnitX(b)
    local real y= GetUnitY(a) - GetUnitY(b)
    return SquareRoot(x * x + y * y)
endfunction
function YDWEAngleBetweenUnits takes unit a,unit b returns real
    return bj_RADTODEG * Atan2(GetUnitY(b) - GetUnitY(a), GetUnitX(b) - GetUnitX(a))
endfunction
//ÁîüÊàêÂå∫Âüü
function YDWEGetRect takes real x,real y,real width,real height returns rect
    return Rect(x - width * 0.5, y - height * 0.5, x + width * 0.5, y + height * 0.5)
endfunction
//===========================================================================
//ËÆæÁΩÆÂçï‰ΩçÂèØ‰ª•È£ûË°å
//===========================================================================
function YDWEFlyEnable takes unit u returns nothing
    call UnitAddAbility(u, 'Amrf')
    call UnitRemoveAbility(u, 'Amrf')
endfunction
//===========================================================================
//Â≠óÁ¨¶Á™ú‰∏éIDËΩ¨Êç¢
//===========================================================================
function YDWEId2S takes integer value returns string
    local string charMap=bj_AllString
    local string result= ""
    local integer remainingValue= value
    local integer charValue
    local integer byteno
    set byteno=0
    loop
        set charValue=ModuloInteger(remainingValue, 256)
        set remainingValue=remainingValue / 256
        set result=SubString(charMap, charValue, charValue + 1) + result
        set byteno=byteno + 1
        exitwhen byteno == 4
    endloop
    return result
endfunction
function YDWES2Id takes string targetstr returns integer
    local string originstr=bj_AllString
    local integer strlength=StringLength(targetstr)
    local integer a=0
local integer b=0
local integer numx=1
local integer result=0
    loop
    exitwhen b > strlength - 1
        set numx=R2I(Pow(256, strlength - 1 - b))
        set a=1
        loop
            exitwhen a > 255
            if SubString(targetstr, b, b + 1) == SubString(originstr, a, a + 1) then
                set result=result + a * numx
                set a=256
            endif
            set a=a + 1
        endloop
        set b=b + 1
    endloop
    return result
endfunction
function YDWES2UnitId takes string targetstr returns integer
    return YDWES2Id(targetstr)
endfunction
function YDWES2ItemId takes string targetstr returns integer
    return YDWES2Id(targetstr)
endfunction
function GetLastAbilityCastingUnit takes nothing returns unit
    return bj_lastAbilityCastingUnit
endfunction
function GetLastAbilityTargetUnit takes nothing returns unit
    return bj_lastAbilityTargetUnit
endfunction
function YDWESetMapLimitCoordinate takes real MinX,real MaxX,real MinY,real MaxY returns nothing
    set yd_MapMaxX=MaxX
    set yd_MapMinX=MinX
    set yd_MapMaxY=MaxY
    set yd_MapMinY=MinY
endfunction
//===========================================================================
//===========================================================================
//Âú∞ÂõæÂàùÂßãÂåñ
//===========================================================================
//YDWEÁâπÊÆäÊäÄËÉΩÁªìÊùü‰∫ã‰ª∂ 
function YDWESyStemAbilityCastingOverTriggerAction takes unit hero,integer index returns nothing
 local integer i= 0
    loop
        exitwhen i >= YDWEBase__AbilityCastingOverEventNumber
        if YDWEBase__AbilityCastingOverEventType[i] == index then
            set bj_lastAbilityCastingUnit=hero
			if YDWEBase__AbilityCastingOverEventQueue[i] != null and TriggerEvaluate(YDWEBase__AbilityCastingOverEventQueue[i]) and IsTriggerEnabled(YDWEBase__AbilityCastingOverEventQueue[i]) then
				call TriggerExecute(YDWEBase__AbilityCastingOverEventQueue[i])
			endif
		endif
        set i=i + 1
    endloop
endfunction
//===========================================================================  
//YDWEÊäÄËÉΩÊçïÊçâ‰∫ã‰ª∂ 
//===========================================================================  
function YDWESyStemAbilityCastingOverRegistTrigger takes trigger trg,integer index returns nothing
	set YDWEBase__AbilityCastingOverEventQueue[YDWEBase__AbilityCastingOverEventNumber]=trg
	set YDWEBase__AbilityCastingOverEventType[YDWEBase__AbilityCastingOverEventNumber]=index
	set YDWEBase__AbilityCastingOverEventNumber=YDWEBase__AbilityCastingOverEventNumber + 1
endfunction 
//===========================================================================
//Á≥ªÁªüÂáΩÊï∞ÂÆåÂñÑ
//===========================================================================
function YDWECreateUnitPool takes nothing returns nothing
    set bj_lastCreatedUnitPool=CreateUnitPool()
endfunction
function YDWEPlaceRandomUnit takes unitpool up,player p,real x,real y,real face returns nothing
set bj_lastPoolAbstractedUnit=PlaceRandomUnit(up, p, x, y, face)
endfunction
function YDWEGetLastUnitPool takes nothing returns unitpool
    return bj_lastCreatedUnitPool
endfunction
function YDWEGetLastPoolAbstractedUnit takes nothing returns unit
    return bj_lastPoolAbstractedUnit
endfunction
function YDWECreateItemPool takes nothing returns nothing
    set bj_lastCreatedItemPool=CreateItemPool()
endfunction
function YDWEPlaceRandomItem takes itempool ip,real x,real y returns nothing
set bj_lastPoolAbstractedItem=PlaceRandomItem(ip, x, y)
endfunction
function YDWEGetLastItemPool takes nothing returns itempool
    return bj_lastCreatedItemPool
endfunction
function YDWEGetLastPoolAbstractedItem takes nothing returns item
    return bj_lastPoolAbstractedItem
endfunction
function YDWESetAttackDamageWeaponType takes attacktype at,damagetype dt,weapontype wt returns nothing
    set bj_lastSetAttackType=at
    set bj_lastSetDamageType=dt
    set bj_lastSetWeaponType=wt
endfunction
//unitpool bj_lastCreatedPool=null
//unit bj_lastPoolAbstractedUnit=null
function YDWEGetPlayerColorString takes player p,string s returns string
    return YDWEBase__yd_PlayerColor[GetHandleId(GetPlayerColor(p))] + s + "|r"
endfunction
//===========================================================================
//===========================================================================
//Á≥ªÁªüÂáΩÊï∞Ë°•ÂÖÖ
//===========================================================================
//===========================================================================
function YDWEGetUnitItemSoftId takes unit hero,item it returns integer
    local integer i= 0
    loop
         exitwhen i > 5
         if UnitItemInSlot(hero, i) == it then
            return i + 1
         endif
         set i=i + 1
    endloop
    return 0
endfunction
//===========================================================================
//===========================================================================
//Âú∞ÂõæÂàùÂßãÂåñ
//===========================================================================
//===========================================================================
//ÊòæÁ§∫ÁâàÊú¨
function YDWEVersion_Display takes nothing returns boolean
    call DisplayTimedTextToPlayer(GetTriggerPlayer(), 0, 0, 30, "|cFF1E90FFÂΩìÂâçÁºñËæëÂô®ÁâàÊú¨‰∏∫Ôºö |r|cFF00FF00YDWE 1.32.11.180820")
    return false
endfunction
function YDWEVersion_Init takes nothing returns nothing
    local trigger t= CreateTrigger()
    local integer i= 0
    loop
        exitwhen i == 12
        call TriggerRegisterPlayerChatEvent(t, Player(i), "YDWE Version", true)
        set i=i + 1
    endloop
    call TriggerAddCondition(t, Condition(function YDWEVersion_Display))
    set t=null
endfunction
function InitializeYD takes nothing returns nothing
     set YDHT=InitHashtable()
	//=================ËÆæÁΩÆÂèòÈáè=====================
	set yd_MapMinX=GetCameraBoundMinX() - GetCameraMargin(CAMERA_MARGIN_LEFT)
	set yd_MapMinY=GetCameraBoundMinY() - GetCameraMargin(CAMERA_MARGIN_BOTTOM)
	set yd_MapMaxX=GetCameraBoundMaxX() + GetCameraMargin(CAMERA_MARGIN_RIGHT)
	set yd_MapMaxY=GetCameraBoundMaxY() + GetCameraMargin(CAMERA_MARGIN_TOP)
	
    set YDWEBase__yd_PlayerColor[0]="|cFFFF0303"
    set YDWEBase__yd_PlayerColor[1]="|cFF0042FF"
    set YDWEBase__yd_PlayerColor[2]="|cFF1CE6B9"
    set YDWEBase__yd_PlayerColor[3]="|cFF540081"
    set YDWEBase__yd_PlayerColor[4]="|cFFFFFC01"
    set YDWEBase__yd_PlayerColor[5]="|cFFFE8A0E"
    set YDWEBase__yd_PlayerColor[6]="|cFF20C000"
    set YDWEBase__yd_PlayerColor[7]="|cFFE55BB0"
    set YDWEBase__yd_PlayerColor[8]="|cFF959697"
    set YDWEBase__yd_PlayerColor[9]="|cFF7EBFF1"
    set YDWEBase__yd_PlayerColor[10]="|cFF106246"
    set YDWEBase__yd_PlayerColor[11]="|cFF4E2A04"
    set YDWEBase__yd_PlayerColor[12]="|cFF282828"
    set YDWEBase__yd_PlayerColor[13]="|cFF282828"
    set YDWEBase__yd_PlayerColor[14]="|cFF282828"
    set YDWEBase__yd_PlayerColor[15]="|cFF282828"
    //=================ÊòæÁ§∫ÁâàÊú¨=====================
    call YDWEVersion_Init()
endfunction

//library YDWEBase ends
//library YDWEGetUnitsInRangeOfLocMatchingNull:
function YDWEGetUnitsInRangeOfLocMatchingNull takes real radius,location whichLocation,boolexpr filter returns group
    local group g= CreateGroup()
    call GroupEnumUnitsInRangeOfLoc(g, whichLocation, radius, filter)
    call DestroyBoolExpr(filter)
    set yd_NullTempGroup=g
    set g=null
    return yd_NullTempGroup
endfunction

//library YDWEGetUnitsInRangeOfLocMatchingNull ends
//library YDWETriggerEvent:
	
//===========================================================================  
//»Œ“‚µ•Œª…À∫¶ ¬º˛ 
//===========================================================================
function YDWEAnyUnitDamagedTriggerAction takes nothing returns nothing
    local integer i= 0
    
    loop
        exitwhen i >= YDWETriggerEvent__DamageEventNumber
        if YDWETriggerEvent__DamageEventQueue[i] != null and IsTriggerEnabled(YDWETriggerEvent__DamageEventQueue[i]) and TriggerEvaluate(YDWETriggerEvent__DamageEventQueue[i]) then
            call TriggerExecute(YDWETriggerEvent__DamageEventQueue[i])
        endif
        set i=i + 1
    endloop
endfunction
function YDWEAnyUnitDamagedFilter takes nothing returns boolean
    if GetUnitAbilityLevel(GetFilterUnit(), 'Aloc') <= 0 then
        call TriggerRegisterUnitEvent(yd_DamageEventTrigger, GetFilterUnit(), EVENT_UNIT_DAMAGED)
    endif
    return false
endfunction
function YDWEAnyUnitDamagedEnumUnit takes nothing returns nothing
    local trigger t= CreateTrigger()
    local region r= CreateRegion()
    local group g= CreateGroup()
    call RegionAddRect(r, GetWorldBounds())
    call TriggerRegisterEnterRegion(t, r, Condition(function YDWEAnyUnitDamagedFilter))
    call GroupEnumUnitsInRect(g, GetWorldBounds(), Condition(function YDWEAnyUnitDamagedFilter))
    call DestroyGroup(g)
    set r=null
    set t=null
    set g=null
endfunction
	
function YDWESyStemAnyUnitDamagedRegistTrigger takes trigger trg returns nothing
    if trg == null then
        return
    endif
        
    if YDWETriggerEvent__DamageEventNumber == 0 then
        set yd_DamageEventTrigger=CreateTrigger()
        call TriggerAddAction(yd_DamageEventTrigger, function YDWEAnyUnitDamagedTriggerAction)
        call YDWEAnyUnitDamagedEnumUnit()
    endif
    
    set YDWETriggerEvent__DamageEventQueue[YDWETriggerEvent__DamageEventNumber]=trg
    set YDWETriggerEvent__DamageEventNumber=YDWETriggerEvent__DamageEventNumber + 1
endfunction
//===========================================================================  
//“∆∂ØŒÔ∆∑ ¬º˛ 
//===========================================================================  
function YDWESyStemItemUnmovableTriggerAction takes nothing returns nothing
    local integer i= 0
    
    if GetIssuedOrderId() >= 852002 and GetIssuedOrderId() <= 852007 then
		set bj_lastMovedItemInItemSlot=GetOrderTargetItem()
    	loop
        	exitwhen i >= YDWETriggerEvent__MoveItemEventNumber
        	if YDWETriggerEvent__MoveItemEventQueue[i] != null and IsTriggerEnabled(YDWETriggerEvent__MoveItemEventQueue[i]) and TriggerEvaluate(YDWETriggerEvent__MoveItemEventQueue[i]) then
        	    call TriggerExecute(YDWETriggerEvent__MoveItemEventQueue[i])
        	endif
        	set i=i + 1
    	endloop
	endif
endfunction
function YDWESyStemItemUnmovableRegistTrigger takes trigger trg returns nothing
    if trg == null then
        return
    endif
        
    if YDWETriggerEvent__MoveItemEventNumber == 0 then
        set YDWETriggerEvent__MoveItemEventTrigger=CreateTrigger()
        call TriggerAddAction(YDWETriggerEvent__MoveItemEventTrigger, function YDWESyStemItemUnmovableTriggerAction)
        call TriggerRegisterAnyUnitEventBJ(YDWETriggerEvent__MoveItemEventTrigger, EVENT_PLAYER_UNIT_ISSUED_TARGET_ORDER)
    endif
    
    set YDWETriggerEvent__MoveItemEventQueue[YDWETriggerEvent__MoveItemEventNumber]=trg
    set YDWETriggerEvent__MoveItemEventNumber=YDWETriggerEvent__MoveItemEventNumber + 1
endfunction
function GetLastMovedItemInItemSlot takes nothing returns item
    return bj_lastMovedItemInItemSlot
endfunction

//library YDWETriggerEvent ends
//library YDWETimerSystem:
function YDWETimerSystem__NewTaskIndex takes nothing returns integer
 local integer h= YDWETimerSystem__TaskListIdleHead
	if YDWETimerSystem__TaskListIdleHead < 0 then
		if YDWETimerSystem__TaskListIdleMax >= 8000 then
			return 8100
		else
			set YDWETimerSystem__TaskListIdleMax=YDWETimerSystem__TaskListIdleMax + 1
			return YDWETimerSystem__TaskListIdleMax
		endif
	endif
	set YDWETimerSystem__TaskListIdleHead=YDWETimerSystem__TaskListIdle[h]
	return h
endfunction
function YDWETimerSystem__DeleteTaskIndex takes integer index returns nothing
	set YDWETimerSystem__TaskListIdle[index]=YDWETimerSystem__TaskListIdleHead
	set YDWETimerSystem__TaskListIdleHead=index
endfunction
//∏√∫Ø ˝–Ú¡–¥¶¿Ì
function YDWETimerSystem__NewTask takes real time,trigger proc returns integer
 local integer index= YDWETimerSystem__NewTaskIndex()
 local integer h= YDWETimerSystem__TaskListHead
 local integer t= R2I(100. * time) + YDWETimerSystem__CurrentTime
 local integer p
	set YDWETimerSystem__TaskListProc[index]=proc
	set YDWETimerSystem__TaskListTime[index]=t
	loop
		set p=YDWETimerSystem__TaskListNext[h]
		if p < 0 or YDWETimerSystem__TaskListTime[p] >= t then
		//	call BJDebugMsg("NewTask:"+I2S(index))
			set YDWETimerSystem__TaskListNext[h]=index
			set YDWETimerSystem__TaskListNext[index]=p
			return index
		endif
		set h=p
	endloop
	return index
endfunction
function YDWETimerSystemNewTask takes real time,trigger proc returns integer
	return YDWETimerSystem__NewTask(time , proc)
endfunction
function YDWETimerSystemGetCurrentTask takes nothing returns integer
	return YDWETimerSystem__CurrentIndex
endfunction
//…æ≥˝µ•Œª
function YDWETimerSystem__RemoveUnit_CallBack takes nothing returns nothing
    call RemoveUnit(LoadUnitHandle(YDHT, YDWETimerSystem__TimerHandle, YDWETimerSystem__CurrentIndex))
    call RemoveSavedHandle(YDHT, YDWETimerSystem__TimerHandle, YDWETimerSystem__CurrentIndex)
endfunction
function YDWETimerRemoveUnit takes real time,unit u returns nothing
    call SaveUnitHandle(YDHT, YDWETimerSystem__TimerHandle, YDWETimerSystem__NewTask(time , YDWETimerSystem__fnRemoveUnit), u)
endfunction
//¥›ªŸº∆ ±∆˜
function YDWETimerSystem__DestroyTimer_CallBack takes nothing returns nothing
    call DestroyTimer(LoadTimerHandle(YDHT, YDWETimerSystem__TimerHandle, YDWETimerSystem__CurrentIndex))
    call RemoveSavedHandle(YDHT, YDWETimerSystem__TimerHandle, YDWETimerSystem__CurrentIndex)
endfunction
function YDWETimerDestroyTimer takes real time,timer t returns nothing
    call SaveTimerHandle(YDHT, YDWETimerSystem__TimerHandle, YDWETimerSystem__NewTask(time , YDWETimerSystem__fnDestroyTimer), t)
endfunction
//…æ≥˝ŒÔ∆∑
function YDWETimerSystem__RemoveItem_CallBack takes nothing returns nothing
    call RemoveItem(LoadItemHandle(YDHT, YDWETimerSystem__TimerHandle, YDWETimerSystem__CurrentIndex))
    call RemoveSavedHandle(YDHT, YDWETimerSystem__TimerHandle, YDWETimerSystem__CurrentIndex)
endfunction
function YDWETimerRemoveItem takes real time,item it returns nothing
    call SaveItemHandle(YDHT, YDWETimerSystem__TimerHandle, YDWETimerSystem__NewTask(time , YDWETimerSystem__fnRemoveItem), it)
endfunction
//…æ≥˝Ãÿ–ß
function YDWETimerSystem__DestroyEffect_CallBack takes nothing returns nothing
    call DestroyEffect(LoadEffectHandle(YDHT, YDWETimerSystem__TimerHandle, YDWETimerSystem__CurrentIndex))
    call RemoveSavedHandle(YDHT, YDWETimerSystem__TimerHandle, YDWETimerSystem__CurrentIndex)
endfunction
function YDWETimerDestroyEffect takes real time,effect e returns nothing
    call SaveEffectHandle(YDHT, YDWETimerSystem__TimerHandle, YDWETimerSystem__NewTask(time , YDWETimerSystem__fnDestroyEffect), e)
endfunction
//…æ≥˝…¡µÁÃÿ–ß
function YDWETimerSystem__DestroyLightning_CallBack takes nothing returns nothing
    call DestroyLightning(LoadLightningHandle(YDHT, YDWETimerSystem__TimerHandle, YDWETimerSystem__CurrentIndex))
    call RemoveSavedHandle(YDHT, YDWETimerSystem__TimerHandle, YDWETimerSystem__CurrentIndex)
endfunction
function YDWETimerDestroyLightning takes real time,lightning lt returns nothing
 local integer i= YDWETimerSystem__NewTask(time , YDWETimerSystem__fnDestroyLightning)
    call SaveLightningHandle(YDHT, YDWETimerSystem__TimerHandle, i, lt)
endfunction
//‘À––¥•∑¢∆˜
function YDWETimerSystem__RunTrigger_CallBack takes nothing returns nothing
    call TriggerExecute(LoadTriggerHandle(YDHT, YDWETimerSystem__TimerHandle, YDWETimerSystem__CurrentIndex))
    call RemoveSavedHandle(YDHT, YDWETimerSystem__TimerHandle, YDWETimerSystem__CurrentIndex)
endfunction
function YDWETimerRunTrigger takes real time,trigger trg returns nothing
    call SaveTriggerHandle(YDHT, YDWETimerSystem__TimerHandle, YDWETimerSystem__NewTask(time , YDWETimerSystem__fnRunTrigger), trg)
endfunction
//…æ≥˝∆Ø∏°Œƒ◊÷
function YDWETimerDestroyTextTag takes real time,texttag tt returns nothing
    local integer N=0
    local integer i=0
    if time <= 0 then
        set time=0.01
    endif
    call SetTextTagPermanent(tt, false)
    call SetTextTagLifespan(tt, time)
    call SetTextTagFadepoint(tt, time)
endfunction
//÷––ƒº∆ ±∆˜÷˜∫Ø ˝
function YDWETimerSystem__Main takes nothing returns nothing
 local integer h= YDWETimerSystem__TaskListHead
 local integer p
	loop
		set YDWETimerSystem__CurrentIndex=YDWETimerSystem__TaskListNext[h]
		exitwhen YDWETimerSystem__CurrentIndex < 0 or YDWETimerSystem__CurrentTime < YDWETimerSystem__TaskListTime[YDWETimerSystem__CurrentIndex]
		//call BJDebugMsg("Task:"+I2S(CurrentIndex))
		call TriggerEvaluate(YDWETimerSystem__TaskListProc[YDWETimerSystem__CurrentIndex])
		call YDWETimerSystem__DeleteTaskIndex(YDWETimerSystem__CurrentIndex)
		set YDWETimerSystem__TaskListNext[h]=YDWETimerSystem__TaskListNext[YDWETimerSystem__CurrentIndex]
	endloop
	set YDWETimerSystem__CurrentTime=YDWETimerSystem__CurrentTime + 1
endfunction
//≥ı ºªØ∫Ø ˝
function YDWETimerSystem__Init takes nothing returns nothing
    set YDWETimerSystem__Timer=CreateTimer()
	set YDWETimerSystem__TimerHandle=GetHandleId(YDWETimerSystem__Timer)
	set YDWETimerSystem__CurrentTime=0
	set YDWETimerSystem__TaskListHead=0
	set YDWETimerSystem__TaskListNext[0]=- 1
	set YDWETimerSystem__TaskListIdleHead=1
	set YDWETimerSystem__TaskListIdleMax=1
	set YDWETimerSystem__TaskListIdle[1]=- 1
	
	set YDWETimerSystem__fnRemoveUnit=CreateTrigger()
	set YDWETimerSystem__fnDestroyTimer=CreateTrigger()
	set YDWETimerSystem__fnRemoveItem=CreateTrigger()
	set YDWETimerSystem__fnDestroyEffect=CreateTrigger()
	set YDWETimerSystem__fnDestroyLightning=CreateTrigger()
	set YDWETimerSystem__fnRunTrigger=CreateTrigger()
	call TriggerAddCondition(YDWETimerSystem__fnRemoveUnit, Condition(function YDWETimerSystem__RemoveUnit_CallBack))
	call TriggerAddCondition(YDWETimerSystem__fnDestroyTimer, Condition(function YDWETimerSystem__DestroyTimer_CallBack))
	call TriggerAddCondition(YDWETimerSystem__fnRemoveItem, Condition(function YDWETimerSystem__RemoveItem_CallBack))
	call TriggerAddCondition(YDWETimerSystem__fnDestroyEffect, Condition(function YDWETimerSystem__DestroyEffect_CallBack))
	call TriggerAddCondition(YDWETimerSystem__fnDestroyLightning, Condition(function YDWETimerSystem__DestroyLightning_CallBack))
	call TriggerAddCondition(YDWETimerSystem__fnRunTrigger, Condition(function YDWETimerSystem__RunTrigger_CallBack))
	
    call TimerStart(YDWETimerSystem__Timer, 0.01, true, function YDWETimerSystem__Main)
endfunction
//—≠ª∑¿‡»‘”√∂¿¡¢º∆ ±∆˜
function YDWETimerSystemGetRunIndex takes nothing returns integer
    return YDWETimerSystem__TimerSystem_RunIndex
endfunction
function YDWETimerSystem__RunPeriodicTriggerFunction takes nothing returns nothing
    local integer tid= GetHandleId(GetExpiredTimer())
    local trigger trg= LoadTriggerHandle(YDHT, tid, $D0001)
	call SaveInteger(YDHT, StringHash(I2S(GetHandleId(trg))), StringHash("RunIndex"), LoadInteger(YDHT, tid, $D0002))
    if TriggerEvaluate(trg) then
        call TriggerExecute(trg)
    endif
    set trg=null
endfunction
function YDWETimerSystem__RunPeriodicTriggerFunctionByTimes takes nothing returns nothing
    local integer tid= GetHandleId(GetExpiredTimer())
    local trigger trg= LoadTriggerHandle(YDHT, tid, $D0001)
    local integer times= LoadInteger(YDHT, tid, $D0003)
	call SaveInteger(YDHT, StringHash(I2S(GetHandleId(trg))), StringHash("RunIndex"), LoadInteger(YDHT, tid, $D0002))
    if TriggerEvaluate(trg) then
        call TriggerExecute(trg)
    endif
    set times=times - 1
    if times > 0 then
		call SaveInteger(YDHT, tid, $D0003, times)
      else
        call DestroyTimer(GetExpiredTimer())
        call FlushChildHashtable(YDHT, tid)
    endif
    set trg=null
endfunction
function YDWETimerRunPeriodicTrigger takes real timeout,trigger trg,boolean b,integer times,integer data returns nothing
    local timer t
    local integer tid
    local integer index= 0
    if timeout < 0 then
        return
      else
        set t=CreateTimer()
		set tid=GetHandleId(t)
    endif
    set YDWETimerSystem__TimerSystem_RunIndex=YDWETimerSystem__TimerSystem_RunIndex + 1
	call SaveTriggerHandle(YDHT, tid, $D0001, trg)
	call SaveInteger(YDHT, tid, $D0002, YDWETimerSystem__TimerSystem_RunIndex)
	set index=LoadInteger(YDHT, GetHandleId(trg), 'YDTS' + data)
    set index=index + 1
	call SaveInteger(YDHT, GetHandleId(trg), 'YDTS' + data, index)
	call SaveTimerHandle(YDHT, GetHandleId(trg), ( 'YDTS' + data ) * index, t)
	
    if b == false then
		call SaveInteger(YDHT, tid, $D0003, times)
        call TimerStart(t, timeout, true, function YDWETimerSystem__RunPeriodicTriggerFunctionByTimes)
      else
        call TimerStart(t, timeout, true, function YDWETimerSystem__RunPeriodicTriggerFunction)
    endif
    set t=null
endfunction
function YDWETimerRunPeriodicTriggerOver takes trigger trg,integer data returns nothing
 local integer trgid= GetHandleId(trg)
    local integer index= LoadInteger(YDHT, trgid, 'YDTS' + data)
    local timer t
    loop
        exitwhen index <= 0
        set t=LoadTimerHandle(YDHT, trgid, ( 'YDTS' + data ) * index)
        call DestroyTimer(t)
        call FlushChildHashtable(YDHT, GetHandleId(t))
		call RemoveSavedHandle(YDHT, trgid, ( 'YDTS' + data ) * index)
        set index=index - 1
    endloop
	
    call RemoveSavedInteger(YDHT, trgid, 'YDTS' + data)
    set t=null
endfunction

//library YDWETimerSystem ends
//===========================================================================
// 
// Âºì
// 
//   Warcraft III map script
//   Generated by the Warcraft III World Editor
//   Date: Thu Aug 30 16:15:32 2018
//   Map Author: Êú™Áü•
// 
//===========================================================================
//***************************************************************************
//*
//*  Global Variables
//*
//***************************************************************************
function InitGlobals takes nothing returns nothing
    set udg_sum=0
endfunction
//***************************************************************************
//*
//*  Unit Creation
//*
//***************************************************************************
//===========================================================================
function CreateUnitsForPlayer0 takes nothing returns nothing
    local player p= Player(0)
    local unit u
    local integer unitID
    local trigger t
    local real life
    set u=CreateUnit(p, 'H000', - 295.9, 650.5, 120.300)
    call SetHeroLevel(u, 10, false)
    call SetHeroStr(u, 21, true)
    call SetHeroAgi(u, 20, true)
    call SetHeroInt(u, 20, true)
    set u=CreateUnit(p, 'O000', 41.8, 724.2, 320.415)
endfunction
//===========================================================================
function CreateUnitsForPlayer1 takes nothing returns nothing
    local player p= Player(1)
    local unit u
    local integer unitID
    local trigger t
    local real life
    set u=CreateUnit(p, 'hpea', 85.7, - 319.1, 332.083)
    set u=CreateUnit(p, 'H001', - 1330.9, - 711.3, 305.089)
    set u=CreateUnit(p, 'H001', - 1018.5, - 650.2, 59.647)
    set u=CreateUnit(p, 'hpea', 128.4, - 292.6, 242.498)
    set u=CreateUnit(p, 'hpea', 63.5, - 386.9, 338.115)
    set u=CreateUnit(p, 'hpea', 143.4, - 401.1, 253.506)
    set u=CreateUnit(p, 'hpea', 218.4, - 335.2, 354.836)
    set u=CreateUnit(p, 'hpea', 217.1, - 254.3, 324.337)
    set u=CreateUnit(p, 'hpea', 159.7, - 258.6, 14.184)
    set u=CreateUnit(p, 'hpea', 171.9, - 322.9, 275.556)
    set u=CreateUnit(p, 'hpea', 204.6, - 372.5, 74.083)
    set u=CreateUnit(p, 'hpea', 90.6, - 268.6, 2.098)
    set u=CreateUnit(p, 'hpea', 51.8, - 343.2, 83.521)
    set u=CreateUnit(p, 'hpea', - 4.0, - 380.4, 124.314)
    set u=CreateUnit(p, 'hpea', - 26.7, - 430.4, 147.979)
    set u=CreateUnit(p, 'hpea', 1.0, - 461.5, 128.654)
    set u=CreateUnit(p, 'hpea', 83.7, - 360.6, 275.535)
    set u=CreateUnit(p, 'hpea', 11.8, - 415.2, 253.913)
    set u=CreateUnit(p, 'hpea', 26.1, - 255.8, 66.733)
    set u=CreateUnit(p, 'hpea', - 15.6, - 234.1, 91.508)
    set u=CreateUnit(p, 'hpea', - 41.5, - 267.2, 73.786)
    set u=CreateUnit(p, 'hpea', - 67.6, - 355.3, 93.398)
    set u=CreateUnit(p, 'hpea', - 82.8, - 393.4, 199.825)
    set u=CreateUnit(p, 'hpea', - 130.4, - 393.4, 92.178)
    set u=CreateUnit(p, 'hpea', - 171.5, - 365.9, 5.790)
    set u=CreateUnit(p, 'hpea', - 212.5, - 406.3, 227.929)
    set u=CreateUnit(p, 'hpea', - 209.5, - 471.3, 286.192)
    set u=CreateUnit(p, 'hpea', - 101.4, - 345.9, 176.413)
endfunction
//===========================================================================
function CreatePlayerBuildings takes nothing returns nothing
endfunction
//===========================================================================
function CreatePlayerUnits takes nothing returns nothing
    call CreateUnitsForPlayer0()
    call CreateUnitsForPlayer1()
endfunction
//===========================================================================
function CreateAllUnits takes nothing returns nothing
    call CreatePlayerBuildings()
    call CreatePlayerUnits()
endfunction
//***************************************************************************
//*
//*  Triggers
//*
//***************************************************************************
//===========================================================================
// Trigger: ‰º§ÂÆ≥ÊºÇÊµÆÊòæÁ§∫
//===========================================================================
function Trig___________________uConditions takes nothing returns boolean
    return ( ( GetEventDamage() >= 1.00 ) )
endfunction
function Trig___________________uActions takes nothing returns nothing
    call CreateTextTagUnitBJ(I2S(R2I(GetEventDamage())), GetTriggerUnit(), 0, 10.00, 100, 0.00, 0.00, 0)
    call SetTextTagVelocityBJ(GetLastCreatedTextTag(), 64.00, 90)
    call YDWETimerDestroyTextTag(2 , GetLastCreatedTextTag())
endfunction
//===========================================================================
function InitTrig___________________u takes nothing returns nothing
    set gg_trg___________________u=CreateTrigger()
    call YDWESyStemAnyUnitDamagedRegistTrigger(gg_trg___________________u)
    call TriggerAddCondition(gg_trg___________________u, Condition(function Trig___________________uConditions))
    call TriggerAddAction(gg_trg___________________u, function Trig___________________uActions)
endfunction
//===========================================================================
// Trigger: QÊ∞¥ÊµÅÁàÜÁ†¥
//===========================================================================
function Trig_Q____________uConditions takes nothing returns boolean
    return ( ( GetSpellAbilityId() == 'A002' ) )
endfunction
function Trig_Q____________uFunc011Func001Func010001003 takes nothing returns boolean
    return ( ( ( IsUnitType(GetFilterUnit(), UNIT_TYPE_STRUCTURE) == false ) and ( ( IsUnitType(GetFilterUnit(), UNIT_TYPE_DEAD) == false ) and ( IsUnitEnemy(GetFilterUnit(), GetOwningPlayer(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0xA59BB4C6))) == true ) ) ) )
endfunction
function Trig_Q____________uFunc011Func001Func010Func007T takes nothing returns nothing
    if ( ( LoadInteger(YDHT, GetHandleId(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0xE1001B12)), 0x9537AD16) < 15 ) ) then
        call SetUnitFlyHeight(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0xE1001B12), ( ( GetUnitFlyHeight(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0xE1001B12)) ) + ( 20.00 ) ), 5000.00)
        call SaveInteger(YDHT, GetHandleId(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0xE1001B12)), 0x9537AD16, ( ( LoadInteger(YDHT, GetHandleId(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0xE1001B12)), 0x9537AD16) ) + ( 1 ) ))
    else
        if ( ( LoadInteger(YDHT, GetHandleId(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0xE1001B12)), 0x9537AD16) < 35 ) ) then
            call SetUnitFlyHeight(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0xE1001B12), ( ( GetUnitFlyHeight(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0xE1001B12)) ) - ( 20.00 ) ), 5000.00)
            call SaveInteger(YDHT, GetHandleId(GetEnumUnit()), 0x9537AD16, ( ( LoadInteger(YDHT, GetHandleId(GetEnumUnit()), 0x9537AD16) ) + ( 1 ) ))
            call SaveInteger(YDHT, GetHandleId(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0xE1001B12)), 0x9537AD16, ( ( LoadInteger(YDHT, GetHandleId(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0xE1001B12)), 0x9537AD16) ) + ( 1 ) ))
        else
            call SetUnitFlyHeight(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0xE1001B12), 0.00, 8000.00)
            call PauseUnitBJ(false, LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0xE1001B12))
            call FlushChildHashtable(YDLOC, GetHandleId(GetExpiredTimer()))
            call DestroyTimer(GetExpiredTimer())
        endif
    endif
endfunction
function Trig_Q____________uFunc011Func001Func010A takes nothing returns nothing
    local timer ydl_timer
    call SaveUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0xE1001B12, GetEnumUnit())
    call UnitDamageTargetBJ(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0xA59BB4C6), GetEnumUnit(), 1.00, ATTACK_TYPE_MELEE, DAMAGE_TYPE_COLD)
    call PauseUnitBJ(true, LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0xE1001B12))
    call YDWEFlyEnable(GetEnumUnit())
    call SaveTimerHandle(YDHT, GetHandleId(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0xE1001B12)), 0x6859183B, CreateTimer())
    call SaveInteger(YDHT, GetHandleId(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0xE1001B12)), 0x9537AD16, 0)
    set ydl_timer=LoadTimerHandle(YDHT, GetHandleId(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0xE1001B12)), 0x6859183B)
    call SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), 0xE1001B12, LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0xE1001B12))
    call TimerStart(ydl_timer, 0.05, true, function Trig_Q____________uFunc011Func001Func010Func007T)
    set ydl_timer=null
endfunction
function Trig_Q____________uFunc011Func001Func012T takes nothing returns nothing
    call RemoveUnit(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0x90BB9840))
    call FlushChildHashtable(YDLOC, GetHandleId(GetExpiredTimer()))
    call DestroyTimer(GetExpiredTimer())
endfunction
function Trig_Q____________uFunc011T takes nothing returns nothing
    local group ydl_group
    local unit ydl_unit
    local timer ydl_timer
    if ( ( LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), 0xD92DB513) < 20 ) ) then
        call SaveLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0x8D3C1FA0, GetUnitLoc(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0x90BB9840)))
        call SaveLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0xCCB71FEE, PolarProjectionBJ(LoadLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0x8D3C1FA0), 50.00, GetUnitFacing(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0x90BB9840))))
        call SetUnitPositionLocFacingBJ(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0x90BB9840), LoadLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0xCCB71FEE), GetUnitFacing(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0x90BB9840)))
        call AddSpecialEffectLocBJ(LoadLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0x8D3C1FA0), "war3mapImported\\aquaspike.mdx")
        call SaveLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0x247CC5E5, GetUnitLoc(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0xA59BB4C6)))
        call SaveLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0xF4C4BD37, PolarProjectionBJ(LoadLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0x247CC5E5), 40.00, LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), 0x6938B6F7)))
        call SetUnitPositionLocFacingBJ(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0xA59BB4C6), LoadLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0xF4C4BD37), LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), 0x6938B6F7))
        call SetUnitFacingTimed(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0xA59BB4C6), LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), 0x50147B77), 0)
        call ForGroupBJ(YDWEGetUnitsInRangeOfLocMatchingNull(100.00 , GetUnitLoc(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0x90BB9840)) , Condition(function Trig_Q____________uFunc011Func001Func010001003)), function Trig_Q____________uFunc011Func001Func010A)
        call SaveInteger(YDLOC, GetHandleId(GetExpiredTimer()), 0xD92DB513, ( ( LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), 0xD92DB513) ) + ( 1 ) ))
    else
        set ydl_timer=CreateTimer()
        call SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), 0x90BB9840, LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0x90BB9840))
        call TimerStart(ydl_timer, 1.30, false, function Trig_Q____________uFunc011Func001Func012T)
        call RemoveLocation(LoadLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0x8D3C1FA0))
        call RemoveLocation(LoadLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0xCCB71FEE))
        call RemoveLocation(LoadLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0x247CC5E5))
        call RemoveLocation(LoadLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0xF4C4BD37))
        call FlushChildHashtable(YDLOC, GetHandleId(GetExpiredTimer()))
        call DestroyTimer(GetExpiredTimer())
    endif
    set ydl_group=null
    set ydl_unit=null
    set ydl_timer=null
endfunction
function Trig_Q____________uActions takes nothing returns nothing
    local timer ydl_timer
    local integer ydl_localvar_step= LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76)
 set ydl_localvar_step=ydl_localvar_step + 3
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76, ydl_localvar_step)
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xECE825E7, ydl_localvar_step)
    call SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xA59BB4C6, GetTriggerUnit())
    call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x6938B6F7, ( ( GetUnitFacing(GetTriggerUnit()) ) + ( 180.00 ) ))
    call SaveLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x7B014FA1, GetSpellTargetLoc())
    call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x50147B77, YDWEAngleBetweenUnitAndPoint(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xA59BB4C6) , LoadLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x7B014FA1)))
    call SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x90BB9840, CreateUnitAtLoc(GetOwningPlayer(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xA59BB4C6)), 'e005', GetUnitLoc(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xA59BB4C6)), LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x50147B77)))
    call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xD92DB513, 0)
    call RemoveLocation(LoadLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x7B014FA1))
    call SaveTimerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x3B44AAED, CreateTimer())
    set ydl_timer=LoadTimerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x3B44AAED)
    call SaveReal(YDLOC, GetHandleId(ydl_timer), 0x6938B6F7, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x6938B6F7))
    call SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), 0x90BB9840, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x90BB9840))
    call SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), 0xE1001B12, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xE1001B12))
    call SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), 0xA59BB4C6, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xA59BB4C6))
    call SaveReal(YDLOC, GetHandleId(ydl_timer), 0x50147B77, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x50147B77))
    call SaveLocationHandle(YDLOC, GetHandleId(ydl_timer), 0x8D3C1FA0, LoadLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x8D3C1FA0))
    call SaveLocationHandle(YDLOC, GetHandleId(ydl_timer), 0xCCB71FEE, LoadLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xCCB71FEE))
    call SaveLocationHandle(YDLOC, GetHandleId(ydl_timer), 0x247CC5E5, LoadLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x247CC5E5))
    call SaveLocationHandle(YDLOC, GetHandleId(ydl_timer), 0xF4C4BD37, LoadLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xF4C4BD37))
    call SaveInteger(YDLOC, GetHandleId(ydl_timer), 0xD92DB513, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xD92DB513))
    call TimerStart(ydl_timer, 0.02, true, function Trig_Q____________uFunc011T)
    call FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step)
    set ydl_timer=null
endfunction
//===========================================================================
function InitTrig_Q____________u takes nothing returns nothing
    set gg_trg_Q____________u=CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_Q____________u, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddCondition(gg_trg_Q____________u, Condition(function Trig_Q____________uConditions))
    call TriggerAddAction(gg_trg_Q____________u, function Trig_Q____________uActions)
endfunction
//===========================================================================
// Trigger: ‰∏áÁÆ≠ÈΩêÂèë-ÂàùÂßãÂåñ
//===========================================================================
function Trig_______________________uConditions takes nothing returns boolean
    return ( ( GetSpellAbilityId() == 'A000' ) )
endfunction
function Trig_______________________uActions takes nothing returns nothing
    set udg_player=GetTriggerUnit()
    set udg_spot=GetSpellTargetLoc()
    set udg_sum=( ( 50 ) * ( GetUnitAbilityLevel(GetTriggerUnit(), 'A000') ) )
    call TriggerExecute(gg_trg_____________u)
endfunction
//===========================================================================
function InitTrig_______________________u takes nothing returns nothing
    set gg_trg_______________________u=CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_______________________u, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddCondition(gg_trg_______________________u, Condition(function Trig_______________________uConditions))
    call TriggerAddAction(gg_trg_______________________u, function Trig_______________________uActions)
endfunction
//===========================================================================
// Trigger: ‰∏áÁÆ≠ÈΩêÂèë
//===========================================================================
function Trig_____________uFunc002Func002Func010Func002Func005001003 takes nothing returns boolean
    return ( ( ( IsUnitType(GetFilterUnit(), UNIT_TYPE_STRUCTURE) == false ) and ( IsUnitEnemy(GetFilterUnit(), GetOwningPlayer(udg_player)) == true ) ) )
endfunction
function Trig_____________uFunc002Func002Func010Func002Func005A takes nothing returns nothing
    call UnitDamageTargetBJ(udg_player, GetEnumUnit(), I2R(( ( GetHeroAgi(udg_player, true) ) * ( ( ( 1 ) + ( GetUnitAbilityLevel(udg_player, 'A000') ) ) ) )), ATTACK_TYPE_HERO, DAMAGE_TYPE_NORMAL)
endfunction
function Trig_____________uFunc002Func002Func010T takes nothing returns nothing
    local group ydl_group
    local unit ydl_unit
    call SaveInteger(YDLOC, GetHandleId(GetExpiredTimer()), 0x1173F311 + ( LoadInteger(YDHT, GetHandleId(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0xFBEDEC54)), 0x6C2DED4E) ), ( ( LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), 0x1173F311 + ( LoadInteger(YDHT, GetHandleId(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0xFBEDEC54)), 0x6C2DED4E) )) ) + ( 1 ) ))
    if ( ( LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), 0x1173F311 + ( LoadInteger(YDHT, GetHandleId(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0xFBEDEC54)), 0x6C2DED4E) )) <= 30 ) ) then
        call SaveLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0xC18F437A, GetUnitLoc(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0xFBEDEC54)))
        call SaveLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0xF6952DAF, PolarProjectionBJ(LoadLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0xC18F437A), 50.00, GetUnitFacing(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0xFBEDEC54))))
        call SetUnitPositionLocFacingBJ(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0xFBEDEC54), LoadLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0xF6952DAF), LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), 0x2D345649))
        call ForGroupBJ(YDWEGetUnitsInRangeOfLocMatchingNull(100.00 , GetUnitLoc(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0xFBEDEC54)) , Condition(function Trig_____________uFunc002Func002Func010Func002Func005001003)), function Trig_____________uFunc002Func002Func010Func002Func005A)
        call RemoveLocation(LoadLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0xC18F437A))
        call RemoveLocation(LoadLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0xF6952DAF))
    else
        call RemoveUnit(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0xFBEDEC54))
        call FlushChildHashtable(YDLOC, GetHandleId(GetExpiredTimer()))
        call DestroyTimer(GetExpiredTimer())
    endif
    set ydl_group=null
    set ydl_unit=null
endfunction
function Trig_____________uFunc002T takes nothing returns nothing
    local timer ydl_timer
    set udg_sum=( ( udg_sum ) - ( 1 ) )
    if ( ( udg_sum >= 0 ) ) then
        call SaveLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0x9CD60476, PolarProjectionBJ(GetUnitLoc(udg_player), GetRandomReal(50.00, 100.00), GetRandomDirectionDeg()))
        call SaveReal(YDLOC, GetHandleId(GetExpiredTimer()), 0x2D345649, YDWEAngleBetweenUnitAndPoint(udg_player , udg_spot))
        call SaveUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0xA274AFBE, CreateUnitAtLoc(GetOwningPlayer(udg_player), 'e001', LoadLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0x9CD60476), LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), 0x2D345649)))
        call YDWETimerRemoveUnit(0.20 , LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0xA274AFBE))
        call SaveInteger(YDLOC, GetHandleId(GetExpiredTimer()), 0x6A2033C7, GetRandomInt(1, 4))
        if ( ( LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), 0x6A2033C7) == 1 ) ) then
            call SaveUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0xFBEDEC54, CreateUnitAtLoc(GetOwningPlayer(udg_player), 'e002', LoadLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0x9CD60476), LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), 0x2D345649)))
            call SetUnitFlyHeight(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0xFBEDEC54), GetRandomReal(50.00, 150.00), 0.00)
            call SaveTimerHandle(YDHT, GetHandleId(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0xFBEDEC54)), 0xFBEDEC54, CreateTimer())
            call SaveInteger(YDHT, GetHandleId(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0xFBEDEC54)), 0x6C2DED4E, 1)
        else
            if ( ( LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), 0x6A2033C7) == 2 ) ) then
                call SaveUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0xFBEDEC54, CreateUnitAtLoc(GetOwningPlayer(udg_player), 'e003', LoadLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0x9CD60476), LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), 0x2D345649)))
                call SetUnitFlyHeight(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0xFBEDEC54), GetRandomReal(50.00, 150.00), 0.00)
                call SaveTimerHandle(YDHT, GetHandleId(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0xFBEDEC54)), 0xFBEDEC54, CreateTimer())
                call SaveInteger(YDHT, GetHandleId(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0xFBEDEC54)), 0x6C2DED4E, 1)
            else
                if ( ( LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), 0x6A2033C7) == 3 ) ) then
                    call SaveUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0xFBEDEC54, CreateUnitAtLoc(GetOwningPlayer(udg_player), 'e004', LoadLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0x9CD60476), LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), 0x2D345649)))
                    call SetUnitFlyHeight(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0xFBEDEC54), GetRandomReal(50.00, 150.00), 0.00)
                    call SaveTimerHandle(YDHT, GetHandleId(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0xFBEDEC54)), 0xFBEDEC54, CreateTimer())
                    call SaveInteger(YDHT, GetHandleId(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0xFBEDEC54)), 0x6C2DED4E, 1)
                else
                    if ( ( LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), 0x6A2033C7) == 4 ) ) then
                        call SaveUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0xFBEDEC54, CreateUnitAtLoc(GetOwningPlayer(udg_player), 'e000', LoadLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0x9CD60476), LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), 0x2D345649)))
                        call SetUnitFlyHeight(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0xFBEDEC54), GetRandomReal(50.00, 150.00), 0.00)
                        call SaveTimerHandle(YDHT, GetHandleId(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0xFBEDEC54)), 0xFBEDEC54, CreateTimer())
                        call SaveInteger(YDHT, GetHandleId(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0xFBEDEC54)), 0x6C2DED4E, 1)
                    else
                    endif
                endif
            endif
        endif
        call SaveGroupHandle(YDHT, GetHandleId(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0xFBEDEC54)), 0x89CAD642, CreateGroup())
        call SaveInteger(YDLOC, GetHandleId(GetExpiredTimer()), 0x1173F311 + ( LoadInteger(YDHT, GetHandleId(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0xFBEDEC54)), 0x6C2DED4E) ), 0)
        set ydl_timer=LoadTimerHandle(YDHT, GetHandleId(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0xFBEDEC54)), 0xFBEDEC54)
        call SaveLocationHandle(YDLOC, GetHandleId(ydl_timer), 0xC18F437A, LoadLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0xC18F437A))
        call SaveLocationHandle(YDLOC, GetHandleId(ydl_timer), 0xF6952DAF, LoadLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0xF6952DAF))
        call SaveInteger(YDLOC, GetHandleId(ydl_timer), 0x1173F311, LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), 0x1173F311))
        call SaveReal(YDLOC, GetHandleId(ydl_timer), 0x2D345649, LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), 0x2D345649))
        call SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), 0xFBEDEC54, LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0xFBEDEC54))
        call TimerStart(ydl_timer, GetRandomReal(0.02, 0.09), true, function Trig_____________uFunc002Func002Func010T)
        call GroupClear(LoadGroupHandle(YDHT, GetHandleId(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0xFBEDEC54)), 0x89CAD642))
        call DestroyGroup(LoadGroupHandle(YDHT, GetHandleId(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0xFBEDEC54)), 0x89CAD642))
        call RemoveLocation(LoadLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0x9CD60476))
    else
        call FlushChildHashtable(YDLOC, GetHandleId(GetExpiredTimer()))
        call DestroyTimer(GetExpiredTimer())
    endif
    set ydl_timer=null
endfunction
function Trig_____________uActions takes nothing returns nothing
    local timer ydl_timer
    local integer ydl_localvar_step= LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76)
 set ydl_localvar_step=ydl_localvar_step + 3
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76, ydl_localvar_step)
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xECE825E7, ydl_localvar_step)
    call SaveTimerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x1CA61CEC, CreateTimer())
    set ydl_timer=LoadTimerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x1CA61CEC)
    call SaveLocationHandle(YDLOC, GetHandleId(ydl_timer), 0x9CD60476, LoadLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x9CD60476))
    call SaveLocationHandle(YDLOC, GetHandleId(ydl_timer), 0xC18F437A, LoadLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xC18F437A))
    call SaveLocationHandle(YDLOC, GetHandleId(ydl_timer), 0xF6952DAF, LoadLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xF6952DAF))
    call SaveInteger(YDLOC, GetHandleId(ydl_timer), 0x1173F311, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x1173F311))
    call SaveReal(YDLOC, GetHandleId(ydl_timer), 0x2D345649, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x2D345649))
    call SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), 0xFBEDEC54, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xFBEDEC54))
    call SaveInteger(YDLOC, GetHandleId(ydl_timer), 0x6A2033C7, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x6A2033C7))
    call SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), 0xA274AFBE, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xA274AFBE))
    call TimerStart(ydl_timer, 0.02, true, function Trig_____________uFunc002T)
    call FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step)
    set ydl_timer=null
endfunction
//===========================================================================
function InitTrig_____________u takes nothing returns nothing
    set gg_trg_____________u=CreateTrigger()
    call TriggerAddAction(gg_trg_____________u, function Trig_____________uActions)
endfunction
//===========================================================================
// Trigger: ËãçÈæôÂá∫Ê∞¥JQ
//===========================================================================
function Trig_____________JQConditions takes nothing returns boolean
    return ( ( GetSpellAbilityId() == 'A004' ) )
endfunction
function Trig_____________JQFunc010Func002Func005001003 takes nothing returns boolean
    return ( ( ( IsUnitType(GetFilterUnit(), UNIT_TYPE_STRUCTURE) == false ) and ( IsUnitEnemy(GetFilterUnit(), GetOwningPlayer(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0xC303079D))) == true ) ) )
endfunction
function Trig_____________JQFunc010Func002Func005A takes nothing returns nothing
    call AddSpecialEffectTargetUnitBJ("chest", GetEnumUnit(), "war3mapImported\\MoonSpear.mdx")
    call UnitDamageTarget(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0xC303079D), GetEnumUnit(), ( ( GetUnitState(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0xC303079D), ConvertUnitState(0x15)) ) * ( ( ( 1.00 ) + ( ( ( I2R(GetUnitAbilityLevel(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0xC303079D), 'A004')) ) * ( 0.50 ) ) ) ) ) ), true, false, ATTACK_TYPE_HERO, DAMAGE_TYPE_NORMAL, WEAPON_TYPE_WHOKNOWS)
    call DestroyEffect(GetLastCreatedEffectBJ())
endfunction
function Trig_____________JQFunc010T takes nothing returns nothing
    local group ydl_group
    local unit ydl_unit
    if ( ( LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), 0xFBEDEC54) < 8 ) ) then
        call SaveLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0xE02073E6, PolarProjectionBJ(GetUnitLoc(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0x41D3632F)), 100.00, LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), 0x29AA0F48)))
        call SetUnitPositionLoc(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0x41D3632F), LoadLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0xE02073E6))
        call SaveInteger(YDLOC, GetHandleId(GetExpiredTimer()), 0xFBEDEC54, ( ( LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), 0xFBEDEC54) ) + ( 1 ) ))
        call ForGroupBJ(YDWEGetUnitsInRangeOfLocMatchingNull(100.00 , GetUnitLoc(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0x41D3632F)) , Condition(function Trig_____________JQFunc010Func002Func005001003)), function Trig_____________JQFunc010Func002Func005A)
    else
        call SetUnitPositionLoc(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0xC303079D), GetUnitLoc(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0x41D3632F)))
        call ShowUnit(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0x41D3632F), false)
        call ShowUnit(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0xC303079D), true)
        call RemoveUnit(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0x41D3632F))
        call SelectUnitForPlayerSingle(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0xC303079D), GetOwningPlayer(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0xC303079D)))
        call RemoveLocation(LoadLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0xE02073E6))
        call RemoveLocation(LoadLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0x63017DEC))
        call RemoveLocation(LoadLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0x284BEFA8))
        call FlushChildHashtable(YDLOC, GetHandleId(GetExpiredTimer()))
        call DestroyTimer(GetExpiredTimer())
    endif
    set ydl_group=null
    set ydl_unit=null
endfunction
function Trig_____________JQActions takes nothing returns nothing
    local timer ydl_timer
    local integer ydl_localvar_step= LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76)
 set ydl_localvar_step=ydl_localvar_step + 3
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76, ydl_localvar_step)
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xECE825E7, ydl_localvar_step)
    call SaveLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x284BEFA8, GetSpellTargetLoc())
    call SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xC303079D, GetTriggerUnit())
    call SaveLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x63017DEC, GetUnitLoc(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xC303079D)))
    call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x29AA0F48, YDWEAngleBetweenUnitAndPoint(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xC303079D) , LoadLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x284BEFA8)))
    call SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x41D3632F, CreateUnitAtLoc(GetOwningPlayer(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xC303079D)), 'e006', LoadLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x63017DEC), LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x29AA0F48)))
    call SaveTimerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x1CA61CEC, CreateTimer())
    call ShowUnit(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xC303079D), false)
    set ydl_timer=CreateTimer()
    call SaveInteger(YDLOC, GetHandleId(ydl_timer), 0xFBEDEC54, 0)
    call SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), 0x41D3632F, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x41D3632F))
    call SaveLocationHandle(YDLOC, GetHandleId(ydl_timer), 0x284BEFA8, LoadLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x284BEFA8))
    call SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), 0xC303079D, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xC303079D))
    call SaveLocationHandle(YDLOC, GetHandleId(ydl_timer), 0x63017DEC, LoadLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x63017DEC))
    call SaveReal(YDLOC, GetHandleId(ydl_timer), 0x29AA0F48, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x29AA0F48))
    call SaveLocationHandle(YDLOC, GetHandleId(ydl_timer), 0xE02073E6, LoadLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xE02073E6))
    call TimerStart(ydl_timer, 0.02, true, function Trig_____________JQFunc010T)
    call FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step)
    set ydl_timer=null
endfunction
//===========================================================================
function InitTrig_____________JQ takes nothing returns nothing
    set gg_trg_____________JQ=CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_____________JQ, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddCondition(gg_trg_____________JQ, Condition(function Trig_____________JQConditions))
    call TriggerAddAction(gg_trg_____________JQ, function Trig_____________JQActions)
endfunction
//===========================================================================
function InitCustomTriggers takes nothing returns nothing
    call InitTrig___________________u()
    call InitTrig_Q____________u()
    call InitTrig_______________________u()
    call InitTrig_____________u()
    call InitTrig_____________JQ()
endfunction
//***************************************************************************
//*
//*  Players
//*
//***************************************************************************
function InitCustomPlayerSlots takes nothing returns nothing
    // Player 0
    call SetPlayerStartLocation(Player(0), 0)
    call SetPlayerColor(Player(0), ConvertPlayerColor(0))
    call SetPlayerRacePreference(Player(0), RACE_PREF_HUMAN)
    call SetPlayerRaceSelectable(Player(0), true)
    call SetPlayerController(Player(0), MAP_CONTROL_USER)
    // Player 1
    call SetPlayerStartLocation(Player(1), 1)
    call SetPlayerColor(Player(1), ConvertPlayerColor(1))
    call SetPlayerRacePreference(Player(1), RACE_PREF_ORC)
    call SetPlayerRaceSelectable(Player(1), true)
    call SetPlayerController(Player(1), MAP_CONTROL_COMPUTER)
endfunction
function InitCustomTeams takes nothing returns nothing
    // Force: TRIGSTR_004
    call SetPlayerTeam(Player(0), 0)
    // Force: TRIGSTR_005
    call SetPlayerTeam(Player(1), 1)
endfunction
//***************************************************************************
//*
//*  Main Initialization
//*
//***************************************************************************
//===========================================================================
function main takes nothing returns nothing
    call SetCameraBounds(- 3328.0 + GetCameraMargin(CAMERA_MARGIN_LEFT), - 3584.0 + GetCameraMargin(CAMERA_MARGIN_BOTTOM), 3328.0 - GetCameraMargin(CAMERA_MARGIN_RIGHT), 3072.0 - GetCameraMargin(CAMERA_MARGIN_TOP), - 3328.0 + GetCameraMargin(CAMERA_MARGIN_LEFT), 3072.0 - GetCameraMargin(CAMERA_MARGIN_TOP), 3328.0 - GetCameraMargin(CAMERA_MARGIN_RIGHT), - 3584.0 + GetCameraMargin(CAMERA_MARGIN_BOTTOM))
    call SetDayNightModels("Environment\\DNC\\DNCLordaeron\\DNCLordaeronTerrain\\DNCLordaeronTerrain.mdl", "Environment\\DNC\\DNCLordaeron\\DNCLordaeronUnit\\DNCLordaeronUnit.mdl")
    call NewSoundEnvironment("Default")
    call SetAmbientDaySound("LordaeronSummerDay")
    call SetAmbientNightSound("LordaeronSummerNight")
    call SetMapMusic("Music", true, 0)
    call CreateAllUnits()
    call InitBlizzard()

call ExecuteFunc("YDTriggerSaveLoadSystem__Init")
call ExecuteFunc("InitializeYD")
call ExecuteFunc("YDWETimerSystem__Init")

    set udg_sum=0 // INLINED!!
    call InitCustomTriggers()
endfunction
//***************************************************************************
//*
//*  Map Configuration
//*
//***************************************************************************
function config takes nothing returns nothing
    call SetMapName("Âºì")
    call SetMapDescription("‰∏áÁÆ≠ÈΩêÂèë„ÄÅÊøÄÊµÅÁàÜÁ†¥")
    call SetPlayers(2)
    call SetTeams(2)
    call SetGamePlacement(MAP_PLACEMENT_USE_MAP_SETTINGS)
    call DefineStartLocation(0, - 256.0, 576.0)
    call DefineStartLocation(1, 64.0, - 384.0)
    // Player setup
    call InitCustomPlayerSlots()
    call InitCustomTeams()
endfunction
//===========================================================================  
//===========================================================================  
//◊‘∂®“Â ¬º˛ 
//===========================================================================
//===========================================================================   
//===========================================================================
//œµÕ≥-TimerSystem
//===========================================================================




//Struct method generated initializers/callers:

