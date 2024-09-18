package Renamed305
{
   import alternativa.osgi.service.logging.LogService;
   import alternativa.tanks.service.delaymountcategory.IDelayMountCategoryService;
   import platform.client.fp10.core.model.ObjectLoadPostListener;
   import platform.client.fp10.core.model.ObjectUnloadListener;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.battle.BattleInfoServiceEvent;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.battle.IBattleInfoService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.layout.ILobbyLayoutService;
   import Renamed433.Renamed7539;
   import Renamed433.Renamed4789;
   
   public class Renamed4775 extends Renamed7539 implements Renamed4789, ObjectLoadPostListener, ObjectUnloadListener
   {
      [Inject]
      public static var Renamed1714:IDelayMountCategoryService;
      
      [Inject]
      public static var lobbyLayoutService:ILobbyLayoutService;
      
      [Inject]
      public static var battleInfoService:IBattleInfoService;
      
      [Inject]
      public static var logService:LogService;
      
      public function Renamed4775()
      {
         super();
      }
      
      private static function Renamed2831(param1:BattleInfoServiceEvent) : void
      {
         Renamed1714.Renamed3669();
      }
      
      private static function onBattleUnload(param1:BattleInfoServiceEvent) : void
      {
         Renamed1714.Renamed3669();
      }
      
      public function objectLoadedPost() : void
      {
         if(lobbyLayoutService.inBattle())
         {
            Renamed1714.Renamed3667(getInitParam());
            battleInfoService.addEventListener(BattleInfoServiceEvent.BATTLE_RESTART,Renamed2831);
            battleInfoService.addEventListener(BattleInfoServiceEvent.BATTLE_UNLOAD,onBattleUnload);
         }
      }
      
      public function objectUnloaded() : void
      {
         battleInfoService.removeEventListener(BattleInfoServiceEvent.BATTLE_RESTART,Renamed2831);
         battleInfoService.removeEventListener(BattleInfoServiceEvent.BATTLE_UNLOAD,onBattleUnload);
         if(lobbyLayoutService.inBattle())
         {
            Renamed1714.Renamed3668();
         }
      }
   }
}

