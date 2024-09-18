package Renamed290
{
   import Renamed4533.Renamed6149;
   import Renamed4533.Renamed4534;
   import platform.client.fp10.core.model.ObjectLoadListener;
   import platform.client.fp10.core.model.ObjectUnloadListener;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.friend.battleinvite.BattleInviteEnableEvent;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.friend.battleinvite.IBattleInviteService;
   
   public class Renamed4535 extends Renamed6149 implements Renamed4534, ObjectLoadListener, ObjectUnloadListener
   {
      [Inject]
      public static var battleInviteService:IBattleInviteService;
      
      public function Renamed4535()
      {
         super();
      }
      
      public function objectLoaded() : void
      {
         battleInviteService.receiveBattleInvite = getInitParam().receiveBattleInvite;
         battleInviteService.addEventListener(BattleInviteEnableEvent.UPDATE,this.Renamed7386);
      }
      
      private function Renamed7386(param1:BattleInviteEnableEvent) : void
      {
         server.enable(param1.enable);
      }
      
      public function objectUnloaded() : void
      {
         battleInviteService.removeEventListener(BattleInviteEnableEvent.UPDATE,this.Renamed7386);
      }
   }
}

