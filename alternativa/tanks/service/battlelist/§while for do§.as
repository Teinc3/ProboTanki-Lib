package alternativa.tanks.service.battlelist
{
   import §!#%§.§<"U§;
   import §-#e§.§break package const§;
   import §>6§.§null for do§;
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
   import projects.tanks.client.battleselect.model.item.§5!9§;
   import projects.tanks.client.battleselect.model.item.BattleItemCC;
   import projects.tanks.clients.fp10.libraries.tanksservices.utils.BattleFormatUtil;
   
   public class §while for do§ extends EventDispatcher implements IBattleListFormService
   {
      [Inject]
      public static var display:IDisplay;
      
      [Inject]
      public static var battleCreateFormService:IBattleCreateFormService;
      
      [Inject]
      public static var battleInfoFormService:IBattleInfoFormService;
      
      [Inject]
      public static var §]"j§:BattleFormatUtil;
      
      public var §[#P§:BattleListController;
      
      public function §while for do§()
      {
         super();
      }
      
      public function §in for finally§() : void
      {
         this.§[#P§ = new BattleListController(new BattleListView(display.stage,display.systemLayer,new LocaleBattleList(),battleCreateFormService.battleCreationDisabled));
         this.§[#P§.showForm();
         this.§[#P§.addEventListener(CreateBattleClickEvent.CREATE_BATTLE_CLICK,this.§null finally§);
         this.§[#P§.addEventListener(BattleSelectedEvent.BATTLE_SELECTED,this.onBattleSelected);
         this.§[#P§.addEventListener(BattleByURLNotFoundEvent.BATTLE_BY_URL_NOT_FOUND,this.onBattleByURLNotFound);
      }
      
      public function §&w§() : void
      {
         this.§[#P§.removeEventListener(CreateBattleClickEvent.CREATE_BATTLE_CLICK,this.§null finally§);
         this.§[#P§.removeEventListener(BattleSelectedEvent.BATTLE_SELECTED,this.onBattleSelected);
         this.§[#P§.removeEventListener(BattleByURLNotFoundEvent.BATTLE_BY_URL_NOT_FOUND,this.onBattleByURLNotFound);
         this.§[#P§.hideForm();
         this.§[#P§.destroy();
         this.§[#P§ = null;
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
         if(param1.hasModel(§<"U§) && param1.adapt(§<"U§) != null)
         {
            _loc2_ = §<"U§(param1.adapt(§<"U§)).getUsersCountBlue();
            _loc3_ = §<"U§(param1.adapt(§<"U§)).getUsersCountRed();
            _loc4_ = §<"U§(param1.adapt(§<"U§)).getFriendsCountBlue();
            _loc5_ = §<"U§(param1.adapt(§<"U§)).getFriendsCountRed();
            this.§[#P§.battleItemRecord(param1,_loc8_.battleMode,_loc8_.name,false,_loc3_,_loc2_,_loc5_,_loc4_,0,0,_loc8_.maxPeople,§null for do§(_loc8_.map.adapt(§null for do§)).getName(),_loc8_.rankRange,_loc8_.noSuppliesBattle,_loc8_.privateBattle,_loc8_.suspicionLevel,_loc8_.proBattle,§]"j§.§8z§(_loc8_.equipmentConstraintsMode,_loc8_.parkourMode),§]"j§.§<!C§(_loc8_.equipmentConstraintsMode,_loc8_.parkourMode),§null for do§(_loc8_.map.adapt(§null for do§)).getAdditionalCrystalsPercent());
         }
         else
         {
            if(!param1.hasModel(§break package const§) && param1.adapt(§break package const§) == null)
            {
               throw new ArgumentError("Invalid battle item model" + param1);
            }
            _loc6_ = §break package const§(param1.adapt(§break package const§)).getUsersCount();
            _loc7_ = §break package const§(param1.adapt(§break package const§)).getFriendsCount();
            this.§[#P§.battleItemRecord(param1,_loc8_.battleMode,_loc8_.name,true,0,0,0,0,_loc6_,_loc7_,_loc8_.maxPeople,§null for do§(_loc8_.map.adapt(§null for do§)).getName(),_loc8_.rankRange,_loc8_.noSuppliesBattle,_loc8_.privateBattle,_loc8_.suspicionLevel,_loc8_.proBattle,§]"j§.§8z§(_loc8_.equipmentConstraintsMode,_loc8_.parkourMode),§]"j§.§<!C§(_loc8_.equipmentConstraintsMode,_loc8_.parkourMode),§null for do§(_loc8_.map.adapt(§null for do§)).getAdditionalCrystalsPercent());
         }
      }
      
      public function selectBattleItemFromServer(param1:String) : void
      {
         this.§[#P§.selectBattleItemFromServer(param1);
      }
      
      public function updateName(param1:String, param2:String) : void
      {
         this.§[#P§.updateName(param1,param2);
      }
      
      public function madePrivate(param1:String, param2:String) : void
      {
         this.§[#P§.madePrivate(param1,param2);
      }
      
      public function updateSuspicious(param1:String, param2:§5!9§) : void
      {
         this.§[#P§.updateSuspicious(param1,param2);
      }
      
      public function §implements var catch§(param1:String) : void
      {
         this.§[#P§.removeBattle(param1);
      }
      
      public function updateUsersCountTeam(param1:String, param2:int, param3:int, param4:int, param5:int) : void
      {
         this.§[#P§.updateUsersCountTeam(param1,param2,param3,param4,param5);
      }
      
      public function updateUsersCountDm(param1:String, param2:int, param3:int) : void
      {
         this.§[#P§.updateUsersCountDm(param1,param2,param3);
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
         this.§[#P§.swapTeams(param1);
      }
      
      public function battleItemsPacketJoinSuccess() : void
      {
         this.§[#P§.battleItemsPacketJoinSuccess();
      }
      
      private function §null finally§(param1:CreateBattleClickEvent) : void
      {
         battleCreateFormService.showForm();
         battleInfoFormService.removeFormFromStage();
      }
   }
}

