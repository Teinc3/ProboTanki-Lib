package alternativa.tanks.service.battlelist
{
   import Renamed144.Renamed3638;
   import Renamed216.Renamed3639;
   import Renamed1583.Renamed1584;
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.tanks.controllers.battlelist.BattleByURLNotFoundEvent;
   import alternativa.tanks.controllers.battlelist.BattleListController;
   import alternativa.tanks.controllers.battlelist.BattleSelectedEvent;
   import alternativa.tanks.controllers.battlelist.CreateBattleClickEvent;
   import alternativa.tanks.model.item.IBattleItem;
   import alternativa.tanks.service.battlecreate.IBattleCreateFormService;
   import alternativa.tanks.service.battleinfo.IBattleInfoFormService;
   import alternativa.tanks.view.battlelist.BattleListView;
   import alternativa.tanks.view.battlelist.LocaleBattleList;
   import flash.events.EventDispatcher;
   import platform.client.fp10.core.type.IGameObject;
   import projects.tanks.client.battleselect.model.item.Renamed1620;
   import projects.tanks.client.battleselect.model.item.BattleItemCC;
   import projects.tanks.clients.fp10.libraries.tanksservices.utils.BattleFormatUtil;
   
   public class Renamed544 extends EventDispatcher implements IBattleListFormService
   {
      [Inject]
      public static var display:IDisplay;
      
      [Inject]
      public static var battleCreateFormService:IBattleCreateFormService;
      
      [Inject]
      public static var battleInfoFormService:IBattleInfoFormService;
      
      [Inject]
      public static var Renamed1588:BattleFormatUtil;
      
      public var Renamed3640:BattleListController;
      
      public function Renamed544()
      {
         super();
      }
      
      public function Renamed2078() : void
      {
         this.Renamed3640 = new BattleListController(new BattleListView(display.stage,display.systemLayer,new LocaleBattleList(),battleCreateFormService.battleCreationDisabled));
         this.Renamed3640.showForm();
         this.Renamed3640.addEventListener(CreateBattleClickEvent.CREATE_BATTLE_CLICK,this.Renamed3641);
         this.Renamed3640.addEventListener(BattleSelectedEvent.BATTLE_SELECTED,this.onBattleSelected);
         this.Renamed3640.addEventListener(BattleByURLNotFoundEvent.BATTLE_BY_URL_NOT_FOUND,this.onBattleByURLNotFound);
      }
      
      public function Renamed2079() : void
      {
         this.Renamed3640.removeEventListener(CreateBattleClickEvent.CREATE_BATTLE_CLICK,this.Renamed3641);
         this.Renamed3640.removeEventListener(BattleSelectedEvent.BATTLE_SELECTED,this.onBattleSelected);
         this.Renamed3640.removeEventListener(BattleByURLNotFoundEvent.BATTLE_BY_URL_NOT_FOUND,this.onBattleByURLNotFound);
         this.Renamed3640.hideForm();
         this.Renamed3640.destroy();
         this.Renamed3640 = null;
      }
      
      public function battleItemRecord(param1:IGameObject) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:BattleItemCC = IBattleItem(param1.adapt(IBattleItem)).getConstructor();
         if(param1.hasModel(Renamed3638) && param1.adapt(Renamed3638) != null)
         {
            _loc2_ = Renamed3638(param1.adapt(Renamed3638)).getUsersCountBlue();
            _loc3_ = Renamed3638(param1.adapt(Renamed3638)).getUsersCountRed();
            _loc4_ = Renamed3638(param1.adapt(Renamed3638)).getFriendsCountBlue();
            _loc5_ = Renamed3638(param1.adapt(Renamed3638)).getFriendsCountRed();
            this.Renamed3640.battleItemRecord(param1,_loc8_.battleMode,_loc8_.name,false,_loc3_,_loc2_,_loc5_,_loc4_,0,0,_loc8_.maxPeople,Renamed1584(_loc8_.map.adapt(Renamed1584)).getName(),_loc8_.rankRange,_loc8_.noSuppliesBattle,_loc8_.privateBattle,_loc8_.suspicionLevel,_loc8_.proBattle,Renamed1588.Renamed3642(_loc8_.equipmentConstraintsMode,_loc8_.parkourMode),Renamed1588.Renamed3643(_loc8_.equipmentConstraintsMode,_loc8_.parkourMode),Renamed1584(_loc8_.map.adapt(Renamed1584)).getAdditionalCrystalsPercent());
         }
         else
         {
            if(!param1.hasModel(Renamed3639) && param1.adapt(Renamed3639) == null)
            {
               throw new ArgumentError("Invalid battle item model" + param1);
            }
            _loc6_ = Renamed3639(param1.adapt(Renamed3639)).getUsersCount();
            _loc7_ = Renamed3639(param1.adapt(Renamed3639)).getFriendsCount();
            this.Renamed3640.battleItemRecord(param1,_loc8_.battleMode,_loc8_.name,true,0,0,0,0,_loc6_,_loc7_,_loc8_.maxPeople,Renamed1584(_loc8_.map.adapt(Renamed1584)).getName(),_loc8_.rankRange,_loc8_.noSuppliesBattle,_loc8_.privateBattle,_loc8_.suspicionLevel,_loc8_.proBattle,Renamed1588.Renamed3642(_loc8_.equipmentConstraintsMode,_loc8_.parkourMode),Renamed1588.Renamed3643(_loc8_.equipmentConstraintsMode,_loc8_.parkourMode),Renamed1584(_loc8_.map.adapt(Renamed1584)).getAdditionalCrystalsPercent());
         }
      }
      
      public function selectBattleItemFromServer(param1:String) : void
      {
         this.Renamed3640.selectBattleItemFromServer(param1);
      }
      
      public function updateName(param1:String, param2:String) : void
      {
         this.Renamed3640.updateName(param1,param2);
      }
      
      public function madePrivate(param1:String, param2:String) : void
      {
         this.Renamed3640.madePrivate(param1,param2);
      }
      
      public function updateSuspicious(param1:String, param2:Renamed1620) : void
      {
         this.Renamed3640.updateSuspicious(param1,param2);
      }
      
      public function Renamed2130(param1:String) : void
      {
         this.Renamed3640.removeBattle(param1);
      }
      
      public function updateUsersCountTeam(param1:String, param2:int, param3:int, param4:int, param5:int) : void
      {
         this.Renamed3640.updateUsersCountTeam(param1,param2,param3,param4,param5);
      }
      
      public function updateUsersCountDm(param1:String, param2:int, param3:int) : void
      {
         this.Renamed3640.updateUsersCountDm(param1,param2,param3);
      }
      
      private function onBattleSelected(param1:BattleSelectedEvent) : void
      {
         dispatchEvent(new BattleListFormServiceEvent(BattleListFormServiceEvent.BATTLE_SELECTED,param1.selectedItem));
         battleCreateFormService.hideForm();
      }
      
      private function onBattleByURLNotFound(param1:BattleByURLNotFoundEvent) : void
      {
         dispatchEvent(new BattleByURLNotFoundEvent(BattleByURLNotFoundEvent.BATTLE_BY_URL_NOT_FOUND,param1.battleId));
      }
      
      public function swapTeams(param1:String) : void
      {
         this.Renamed3640.swapTeams(param1);
      }
      
      public function battleItemsPacketJoinSuccess() : void
      {
         this.Renamed3640.battleItemsPacketJoinSuccess();
      }
      
      private function Renamed3641(param1:CreateBattleClickEvent) : void
      {
         battleCreateFormService.showForm();
         battleInfoFormService.removeFormFromStage();
      }
   }
}

