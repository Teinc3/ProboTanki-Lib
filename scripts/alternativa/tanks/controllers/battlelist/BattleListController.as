package alternativa.tanks.controllers.battlelist
{
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.osgi.service.logging.LogService;
   import alternativa.tanks.controllers.BattleSelectVectorUtil;
   import alternativa.tanks.model.battleselect.BattleSelectModel;
   import alternativa.tanks.service.battleinfo.IBattleInfoFormService;
   import alternativa.tanks.view.battlelist.IBattleListView;
   import alternativa.types.Long;
   import flash.events.EventDispatcher;
   import flash.utils.clearTimeout;
   import flash.utils.getTimer;
   import flash.utils.setTimeout;
   import platform.client.fp10.core.type.IGameObject;
   import projects.tanks.client.battleselect.model.item.Renamed1620;
   import projects.tanks.client.battleservice.Renamed1586;
   import projects.tanks.client.battleservice.Renamed1587;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.battle.IBattleInfoService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.layout.ILobbyLayoutService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.storage.IStorageService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.userproperties.IUserPropertiesService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.userproperties.UserPropertiesServiceEvent;
   
   public class BattleListController extends EventDispatcher implements IBattleListViewControllerCallBack
   {
      [Inject]
      public static var battleInfoFormService:IBattleInfoFormService;
      
      [Inject]
      public static var userPropertiesService:IUserPropertiesService;
      
      [Inject]
      public static var storageService:IStorageService;
      
      [Inject]
      public static var display:IDisplay;
      
      [Inject]
      public static var logService:LogService;
      
      [Inject]
      public static var battleInfoService:IBattleInfoService;
      
      [Inject]
      public static var lobbyLayoutService:ILobbyLayoutService;
      
      private static var _lastShowedItem:String;
      
      private static const FILTER_BY_DM:String = "FILTER_BY_DM";
      
      private static const FILTER_BY_TDM:String = "FILTER_BY_TDM";
      
      private static const FILTER_BY_CTF:String = "FILTER_BY_CTF";
      
      private static const FILTER_BY_CP:String = "FILTER_BY_CP";
      
      private static const FILTER_BY_AS:String = "FILTER_BY_AS";
      
      private static const RESPONSE_TIMEOUT:int = 400;
      
      private var _filterByDmBattle:Boolean;
      
      private var _filterByTdmBattle:Boolean;
      
      private var _filterByCtfBattle:Boolean;
      
      private var _filterByCpBattle:Boolean;
      
      private var Renamed1621:Boolean;
      
      private var _currentLockedBattleMode:Renamed1587;
      
      private var _view:IBattleListView;
      
      private var _selectedItem:String;
      
      private var _timeOutChangeBattleItem:uint;
      
      private var _allItems:Vector.<BattleListItemParams>;
      
      private var _itemsAwaitPacketJoinSuccess:Array;
      
      private var _isItemsPacketJoinSuccess:Boolean;
      
      public function BattleListController(param1:IBattleListView)
      {
         super();
         this._view = param1;
         this.init();
      }
      
      private static function getBoolean(param1:String, param2:Boolean) : Boolean
      {
         var _loc3_:* = storageService.getStorage().data[param1];
         return _loc3_ == null ? Boolean(param2) : Boolean(_loc3_);
      }
      
      private static function storeBoolean(param1:String, param2:Boolean) : void
      {
         storageService.getStorage().data[param1] = param2;
      }
      
      private function init() : void
      {
         this._allItems = new Vector.<BattleListItemParams>();
         this._itemsAwaitPacketJoinSuccess = new Array();
         this._view.setCallBack(this);
         this.setFilterBattleModeFormStorage();
      }
      
      private function setFilterBattleModeFormStorage() : void
      {
         this._filterByDmBattle = getBoolean(FILTER_BY_DM,true);
         this._filterByTdmBattle = getBoolean(FILTER_BY_TDM,true);
         this._filterByCtfBattle = getBoolean(FILTER_BY_CTF,true);
         this._filterByCpBattle = getBoolean(FILTER_BY_CP,true);
         this.Renamed1621 = getBoolean(FILTER_BY_AS,true);
         if(!this._filterByDmBattle && !this._filterByTdmBattle && !this._filterByCtfBattle && !this._filterByCpBattle && !this.Renamed1621)
         {
            this._filterByDmBattle = true;
            this._filterByTdmBattle = true;
            this._filterByCtfBattle = true;
            this._filterByCpBattle = true;
            this.Renamed1621 = true;
         }
         this.updatePressedBattleMode();
      }
      
      public function destroy() : void
      {
         if(!lobbyLayoutService.inBattle())
         {
         }
         clearTimeout(this._timeOutChangeBattleItem);
         this.removeEvents();
         this._view.destroy();
         this._view = null;
         this._selectedItem = null;
         this._allItems = null;
         this._itemsAwaitPacketJoinSuccess = null;
         this._isItemsPacketJoinSuccess = false;
      }
      
      public function showForm() : void
      {
         this._view.show(this._filterByDmBattle,this._filterByTdmBattle,this._filterByCtfBattle,this._filterByCpBattle,this.Renamed1621);
         this.setEvents();
      }
      
      private function setEvents() : void
      {
         userPropertiesService.addEventListener(UserPropertiesServiceEvent.UPDATE_RANK,this.onUpdateRank);
      }
      
      private function onUpdateRank(param1:UserPropertiesServiceEvent) : void
      {
         this._view.updateAvailableItems(param1.userProperties.rank);
      }
      
      private function selectBattleItemById(param1:String) : void
      {
         var _loc2_:BattleListItemParams = this.findBattleListItem(param1);
         if(_loc2_ == null)
         {
            this.resetSelectedItem();
            dispatchEvent(new BattleByURLNotFoundEvent(BattleByURLNotFoundEvent.BATTLE_BY_URL_NOT_FOUND,param1));
         }
         else if(_loc2_.id != this._selectedItem)
         {
            this.selectBattleItem(_loc2_.id,true,true);
         }
      }
      
      private function findBattleListItem(param1:String) : BattleListItemParams
      {
         var _loc2_:BattleListItemParams = null;
         var _loc3_:int = int(this._allItems.length);
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            if(this.getIdBattlePart(this._allItems[_loc4_].id) == param1)
            {
               _loc2_ = this._allItems[_loc4_];
               break;
            }
            _loc4_++;
         }
         return _loc2_;
      }
      
      private function selectBattleItem(param1:String, param2:Boolean, param3:Boolean, param4:Number = 0) : void
      {
         var _loc5_:BattleListItemParams = null;
         clearTimeout(this._timeOutChangeBattleItem);
         this._selectedItem = param1;
         if(param2)
         {
            if(this._view.getItemIndex(param1) < 0)
            {
               _loc5_ = BattleSelectVectorUtil.findElementInVector(this._allItems,param1);
               if(_loc5_ != null)
               {
                  this._view.createItem(_loc5_,true);
                  if(_loc5_.id == battleInfoFormService.getBattleItemId())
                  {
                     battleInfoFormService.Renamed1622();
                  }
               }
            }
            this._view.setSelect(this._selectedItem);
         }
         if(param3)
         {
            if(param4 == 0)
            {
               dispatchEvent(new BattleSelectedEvent(BattleSelectedEvent.BATTLE_SELECTED,this._selectedItem));
            }
            else
            {
               this._timeOutChangeBattleItem = setTimeout(this.battleItemListChangeDelay,param4);
            }
         }
         if(_lastShowedItem == this._selectedItem)
         {
            battleInfoFormService.Renamed1622();
         }
         _lastShowedItem = this._selectedItem;
      }
      
      private function getIdBattlePart(param1:String) : String
      {
         return param1;
      }
      
      public function onBattleListItemClick(param1:String) : void
      {
         this.selectBattleItem(param1,false,true);
      }
      
      public function onBattleListItemChange(param1:String) : void
      {
         if(this._selectedItem != null)
         {
            if(this._selectedItem != param1)
            {
               this.selectBattleItem(param1,false,true,RESPONSE_TIMEOUT);
            }
         }
         else
         {
            this.selectBattleItem(param1,false,true);
         }
      }
      
      public function selectBattleItemFromServer(param1:String) : void
      {
         clearTimeout(this._timeOutChangeBattleItem);
         if(param1 == null)
         {
            this.resetSelectedItem();
         }
         else
         {
            this.selectBattleItem(param1,true,false);
         }
      }
      
      private function battleItemListChangeDelay() : void
      {
         dispatchEvent(new BattleSelectedEvent(BattleSelectedEvent.BATTLE_SELECTED,this._selectedItem));
      }
      
      private function resetSelectedItem() : void
      {
         if(this._selectedItem != null)
         {
            this._selectedItem = null;
            this._view.resetSelectedItem();
         }
      }
      
      public function hideForm() : void
      {
         this.removeEvents();
         this._view.hide();
      }
      
      private function removeEvents() : void
      {
         userPropertiesService.removeEventListener(UserPropertiesServiceEvent.UPDATE_RANK,this.onUpdateRank);
      }
      
      public function battleItemRecord(param1:IGameObject, param2:Renamed1587, param3:String, param4:Boolean = true, param5:int = 0, param6:int = 0, param7:int = 0, param8:int = 0, param9:int = 0, param10:int = 0, param11:int = 0, param12:String = "", param13:Renamed1586 = null, param14:Boolean = false, param15:Boolean = false, param16:Renamed1620 = null, param17:Boolean = false, param18:Boolean = false, param19:String = "", param20:int = 0) : void
      {
         var _loc21_:BattleListItemParams = new BattleListItemParams();
         if(param15)
         {
            _loc21_.gamename = "[Private] " + this.Renamed1623(param3,param18,param19);
         }
         else
         {
            _loc21_.gamename = this.Renamed1623(param3,param18,param19);
         }
         _loc21_.battleItemGO = param1;
         _loc21_.battleMode = param2;
         _loc21_.id = param1.name;
         _loc21_.dmatch = param4;
         _loc21_.reds = param5;
         _loc21_.blues = param6;
         _loc21_.friendsReds = param7;
         _loc21_.friendsBlues = param8;
         _loc21_.all = param9;
         _loc21_.friends = param10;
         _loc21_.maxPeople = param11;
         _loc21_.nmap = param12;
         _loc21_.rankRange = param13;
         _loc21_.accessible = userPropertiesService.rank >= param13.min && userPropertiesService.rank <= param13.max;
         _loc21_.noSupplies = param14;
         _loc21_.proBattle = param17;
         _loc21_.suspicionLevel = param16;
         _loc21_.friends = Math.max(param10,param8 + param7);
         _loc21_.Renamed1624 = param18;
         _loc21_.Renamed1625 = param19;
         _loc21_.additionalCrystalsPercent = param20;
         if(this._isItemsPacketJoinSuccess)
         {
            this._allItems.push(_loc21_);
            if(this.isVisibleItem(param2))
            {
               this._view.createItem(_loc21_,true);
            }
         }
         else
         {
            this._itemsAwaitPacketJoinSuccess.push(_loc21_);
         }
      }
      
      private function Renamed1623(param1:String, param2:Boolean, param3:String) : String
      {
         if(param2)
         {
            param1 = param1 + " " + param3;
         }
         return param1;
      }
      
      private function isVisibleItem(param1:Renamed1587) : Boolean
      {
         if(param1 == Renamed1587.DM)
         {
            return this._filterByDmBattle;
         }
         if(param1 == Renamed1587.TDM)
         {
            return this._filterByTdmBattle;
         }
         if(param1 == Renamed1587.CTF)
         {
            return this._filterByCtfBattle;
         }
         if(param1 == Renamed1587.CP)
         {
            return this._filterByCpBattle;
         }
         if(param1 == Renamed1587.AS)
         {
            return this.Renamed1621;
         }
         return true;
      }
      
      public function removeBattle(param1:String) : void
      {
         this._view.removeItem(param1);
         BattleSelectVectorUtil.deleteElementInVector(this._allItems,param1);
         BattleSelectVectorUtil.deleteElementInArray(this._itemsAwaitPacketJoinSuccess,param1);
      }
      
      public function onShowCreateBattleFormButtonClick() : void
      {
         this.resetSelectedItem();
         dispatchEvent(new CreateBattleClickEvent(CreateBattleClickEvent.CREATE_BATTLE_CLICK,null));
      }
      
      public function updateName(param1:String, param2:String) : void
      {
         var _loc3_:BattleListItemParams = BattleSelectVectorUtil.findElementInVector(this._allItems,param1);
         _loc3_.gamename = param2;
         this._view.updateName(param1,param2);
      }
      
      public function madePrivate(param1:String, param2:String) : void
      {
         this.updateName(param1,"[Private] " + param2);
      }
      
      public function updateSuspicious(param1:String, param2:Renamed1620) : void
      {
         var _loc3_:BattleListItemParams = BattleSelectVectorUtil.findElementInVector(this._allItems,param1);
         _loc3_.suspicionLevel = param2;
         this._view.updateSuspicious(param1,param2);
      }
      
      public function updateUsersCountTeam(param1:String, param2:int, param3:int, param4:int, param5:int) : void
      {
         var _loc6_:BattleListItemParams;
         (_loc6_ = BattleSelectVectorUtil.findElementInVector(this._allItems,param1)).reds = param2;
         _loc6_.blues = param3;
         _loc6_.friendsBlues = param5;
         _loc6_.friendsReds = param4;
         this._view.updateUsersCountTeam(param1,param2,param3,param4,param5);
      }
      
      public function updateUsersCountDm(param1:String, param2:int, param3:int) : void
      {
         var _loc4_:BattleListItemParams;
         (_loc4_ = BattleSelectVectorUtil.findElementInVector(this._allItems,param1)).all = param2;
         this._view.updateUsersCountDm(param1,param2,param3);
      }
      
      public function swapTeams(param1:String) : void
      {
         var _loc2_:BattleListItemParams = BattleSelectVectorUtil.findElementInVector(this._allItems,param1);
         var _loc3_:int = _loc2_.reds;
         _loc2_.reds = _loc2_.blues;
         _loc2_.blues = _loc3_;
         var _loc4_:int = _loc2_.friendsReds;
         _loc2_.friendsReds = _loc2_.friendsBlues;
         _loc2_.friendsBlues = _loc4_;
         this._view.swapTeams(param1,_loc2_.reds,_loc2_.blues,_loc2_.friendsReds,_loc2_.friendsBlues);
      }
      
      public function battleItemsPacketJoinSuccess() : void
      {
         var _loc1_:BattleListItemParams = null;
         var _loc2_:int = 0;
         var _loc3_:BattleListItemParams = null;
         var _loc4_:Long = null;
         this._isItemsPacketJoinSuccess = true;
         var _loc5_:int = getTimer();
         logService.getLogger(BattleSelectModel.CHANNEL).info("battleItemsPacketJoinSuccess item=%1, await=%2",[this._allItems.length,this._itemsAwaitPacketJoinSuccess.length]);
         var _loc6_:int = int(this._itemsAwaitPacketJoinSuccess.length);
         if(_loc6_ != 0)
         {
            this._itemsAwaitPacketJoinSuccess.sortOn(["suspicionLevel","accessible","friends","id"],[Array.NUMERIC | Array.DESCENDING,Array.DESCENDING,Array.NUMERIC | Array.DESCENDING,Array.DESCENDING]);
            if(!lobbyLayoutService.inBattle())
            {
               _loc1_ = this.getRecommendedFriendsBattle();
            }
            _loc2_ = 0;
            while(_loc2_ < _loc6_)
            {
               _loc3_ = this._itemsAwaitPacketJoinSuccess[_loc2_];
               this._allItems.push(_loc3_);
               if(this.isVisibleItem(_loc3_.battleMode))
               {
                  this._view.createItem(_loc3_,false);
               }
               _loc2_++;
            }
            this._view.sortBattleList();
         }
         this._itemsAwaitPacketJoinSuccess.length = 0;
         this._view.resize();
         if(_lastShowedItem != null && !lobbyLayoutService.inBattle())
         {
            _loc1_ = BattleSelectVectorUtil.findElementInVector(this._allItems,_lastShowedItem);
         }
         else if(_loc1_ != null)
         {
            this.selectBattleItem(_loc1_.id,true,true,RESPONSE_TIMEOUT);
         }
         logService.getLogger(BattleSelectModel.CHANNEL).info("battleItemsPacketJoinSuccess runtime=%1",[getTimer() - _loc5_]);
      }
      
      private function getRecommendedFriendsBattle() : BattleListItemParams
      {
         var _loc1_:BattleListItemParams = null;
         var _loc2_:BattleListItemParams = this._itemsAwaitPacketJoinSuccess[0];
         var _loc3_:int = this.getFreePlaces(_loc2_);
         var _loc4_:uint = this._itemsAwaitPacketJoinSuccess.length;
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_)
         {
            _loc1_ = this._itemsAwaitPacketJoinSuccess[_loc5_];
            if(_loc1_.friends > _loc2_.friends && this.getFreePlaces(_loc1_) > _loc3_)
            {
               _loc2_ = _loc1_;
            }
            _loc5_++;
         }
         return _loc2_;
      }
      
      private function getFreePlaces(param1:BattleListItemParams) : int
      {
         return param1.maxPeople - Math.max(param1.all,param1.reds + param1.blues);
      }
      
      public function onBattleModeChange(param1:Renamed1587, param2:Boolean) : void
      {
         switch(param1)
         {
            case Renamed1587.DM:
               this._filterByDmBattle = param2;
               storeBoolean(FILTER_BY_DM,param2);
               break;
            case Renamed1587.TDM:
               this._filterByTdmBattle = param2;
               storeBoolean(FILTER_BY_TDM,param2);
               break;
            case Renamed1587.CTF:
               this._filterByCtfBattle = param2;
               storeBoolean(FILTER_BY_CTF,param2);
               break;
            case Renamed1587.CP:
               this._filterByCpBattle = param2;
               storeBoolean(FILTER_BY_CP,param2);
               break;
            case Renamed1587.AS:
               this.Renamed1621 = param2;
               storeBoolean(FILTER_BY_AS,param2);
         }
         if(param2)
         {
            this.showBattleByType(param1);
         }
         else
         {
            this.hideBattleByType(param1);
         }
         this.updatePressedBattleMode();
      }
      
      private function showBattleByType(param1:Renamed1587) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = int(this._allItems.length);
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            if(this._allItems[_loc4_].battleMode == param1)
            {
               this._view.createItem(this._allItems[_loc4_],false);
               _loc2_++;
            }
            _loc4_++;
         }
         if(_loc2_ != 0)
         {
            this._view.sortBattleList();
            if(this._selectedItem != null)
            {
               this.selectBattleItem(this._selectedItem,true,false);
            }
            this._view.resize();
         }
      }
      
      private function hideBattleByType(param1:Renamed1587) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = int(this._allItems.length);
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            if(this._allItems[_loc4_].battleMode == param1)
            {
               this._view.removeItem(this._allItems[_loc4_].id);
               _loc2_++;
            }
            _loc4_++;
         }
         if(_loc2_ != 0)
         {
            this._view.resize();
         }
         if(this._selectedItem != null)
         {
            if(this._view.getItemIndex(this._selectedItem) == -1)
            {
               battleInfoFormService.removeFormFromStage();
               this.resetSelectedItem();
            }
         }
      }
      
      private function updatePressedBattleMode() : void
      {
         var _loc1_:Boolean = false;
         if(this._filterByDmBattle && !this._filterByTdmBattle && !this._filterByCtfBattle && !this._filterByCpBattle)
         {
            _loc1_ = true;
            this.lockBattleMode(Renamed1587.DM);
         }
         if(!this._filterByDmBattle && this._filterByTdmBattle && !this._filterByCtfBattle && !this._filterByCpBattle)
         {
            _loc1_ = true;
            this.lockBattleMode(Renamed1587.TDM);
         }
         if(!this._filterByDmBattle && !this._filterByTdmBattle && this._filterByCtfBattle && !this._filterByCpBattle)
         {
            _loc1_ = true;
            this.lockBattleMode(Renamed1587.CTF);
         }
         if(!this._filterByDmBattle && !this._filterByTdmBattle && !this._filterByCtfBattle && this._filterByCpBattle)
         {
            _loc1_ = true;
            this.lockBattleMode(Renamed1587.CP);
         }
         if(!_loc1_)
         {
            this.unLockCurrentBattleMode();
         }
      }
      
      private function lockBattleMode(param1:Renamed1587) : void
      {
         this.unLockCurrentBattleMode();
         this._currentLockedBattleMode = param1;
         this._view.lockFilter(this._currentLockedBattleMode);
      }
      
      private function unLockCurrentBattleMode() : void
      {
         if(this._currentLockedBattleMode != null)
         {
            this._view.unLockFilter(this._currentLockedBattleMode);
            this._currentLockedBattleMode = null;
         }
      }
   }
}

