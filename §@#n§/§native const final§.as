package §@#n§
{
   import alternativa.osgi.service.logging.LogService;
   import alternativa.tanks.service.delaymountcategory.IDelayMountCategoryService;
   import platform.client.fp10.core.model.ObjectLoadPostListener;
   import platform.client.fp10.core.model.ObjectUnloadListener;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.battle.BattleInfoServiceEvent;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.battle.IBattleInfoService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.layout.ILobbyLayoutService;
   import §switch set try§.§5"G§;
   import §switch set try§.§var throw§;
   
   public class §native const final§ extends §5"G§ implements §var throw§, ObjectLoadPostListener, ObjectUnloadListener
   {
      [Inject]
      public static var §super set dynamic§:IDelayMountCategoryService;
      
      [Inject]
      public static var lobbyLayoutService:ILobbyLayoutService;
      
      [Inject]
      public static var battleInfoService:IBattleInfoService;
      
      [Inject]
      public static var logService:LogService;
      
      public function §native const final§()
      {
         super();
      }
      
      private static function §do const switch§(param1:BattleInfoServiceEvent) : void
      {
         §super set dynamic§.§break include§();
      }
      
      private static function onBattleUnload(param1:BattleInfoServiceEvent) : void
      {
         §super set dynamic§.§break include§();
      }
      
      public function objectLoadedPost() : void
      {
         if(lobbyLayoutService.inBattle())
         {
            §super set dynamic§.§ "F§(getInitParam());
            battleInfoService.addEventListener(BattleInfoServiceEvent.BATTLE_RESTART,§do const switch§);
            battleInfoService.addEventListener(BattleInfoServiceEvent.BATTLE_UNLOAD,onBattleUnload);
         }
      }
      
      public function objectUnloaded() : void
      {
         battleInfoService.removeEventListener(BattleInfoServiceEvent.BATTLE_RESTART,§do const switch§);
         battleInfoService.removeEventListener(BattleInfoServiceEvent.BATTLE_UNLOAD,onBattleUnload);
         if(lobbyLayoutService.inBattle())
         {
            §super set dynamic§.§8#+§();
         }
      }
   }
}

