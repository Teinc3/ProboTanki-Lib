package alternativa.tanks.model.battleselect
{
   import alternativa.osgi.service.logging.LogService;
   import alternativa.tanks.controllers.battlelist.BattleByURLNotFoundEvent;
   import alternativa.tanks.service.battle.§final package throw§;
   import alternativa.tanks.service.battleinfo.IBattleInfoFormService;
   import alternativa.tanks.service.battlelist.BattleListFormServiceEvent;
   import alternativa.tanks.service.battlelist.IBattleListFormService;
   import alternativa.tanks.tracker.ITrackerService;
   import platform.client.fp10.core.model.ObjectLoadPostListener;
   import platform.client.fp10.core.model.ObjectUnloadListener;
   import projects.tanks.client.battleselect.model.battleselect.BattleSelectModelBase;
   import projects.tanks.client.battleselect.model.battleselect.IBattleSelectModelBase;
   
   public class BattleSelectModel extends BattleSelectModelBase implements IBattleSelectModelBase, ObjectLoadPostListener, ObjectUnloadListener
   {
      [Inject]
      public static var battleListFormService:IBattleListFormService;
      
      [Inject]
      public static var battleInfoFormService:IBattleInfoFormService;
      
      [Inject]
      public static var trackerService:ITrackerService;
      
      [Inject]
      public static var logService:LogService;
      
      public static const CHANNEL:String = "BattleSelectModel";
      
      private var battleFriendNotificator:§final package throw§;
      
      public function BattleSelectModel()
      {
         super();
      }
      
      public function objectLoadedPost() : void
      {
         this.battleFriendNotificator = new §final package throw§();
         battleListFormService.§in for finally§();
         battleListFormService.addEventListener(BattleListFormServiceEvent.BATTLE_SELECTED,this.onBattleSelected);
         battleListFormService.addEventListener(BattleByURLNotFoundEvent.BATTLE_BY_URL_NOT_FOUND,this.onBattleByURLNotFound);
         trackerService.trackEvent("battleList","init","");
      }
      
      public function objectUnloaded() : void
      {
         this.battleFriendNotificator.destroy();
         this.battleFriendNotificator = null;
         battleInfoFormService.destroy();
         battleListFormService.removeEventListener(BattleListFormServiceEvent.BATTLE_SELECTED,this.onBattleSelected);
         battleListFormService.removeEventListener(BattleByURLNotFoundEvent.BATTLE_BY_URL_NOT_FOUND,this.onBattleByURLNotFound);
         battleListFormService.§&w§();
      }
      
      private function onBattleSelected(param1:BattleListFormServiceEvent) : void
      {
         server.onSelect(param1.selectedItem + " ");
      }
      
      private function onBattleByURLNotFound(param1:BattleByURLNotFoundEvent) : void
      {
         server.search(param1.battleId);
      }
      
      public function select(param1:String) : void
      {
         battleListFormService.selectBattleItemFromServer(param1);
      }
      
      public function battleItemsPacketJoinSuccess() : void
      {
         battleListFormService.battleItemsPacketJoinSuccess();
      }
   }
}

