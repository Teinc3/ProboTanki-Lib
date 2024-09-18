package §9v§
{
   import §,"i§.§3"+§;
   import §,"i§.§static var get§;
   import platform.client.fp10.core.model.ObjectLoadListener;
   import platform.client.fp10.core.model.ObjectUnloadListener;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.friend.battleinvite.BattleInviteEnableEvent;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.friend.battleinvite.IBattleInviteService;
   
   public class §do var finally§ extends §3"+§ implements §static var get§, ObjectLoadListener, ObjectUnloadListener
   {
      [Inject]
      public static var battleInviteService:IBattleInviteService;
      
      public function §do var finally§()
      {
         super();
      }
      
      public function objectLoaded() : void
      {
         battleInviteService.receiveBattleInvite = getInitParam().receiveBattleInvite;
         battleInviteService.addEventListener(BattleInviteEnableEvent.UPDATE,this.§>"3§);
      }
      
      private function §>"3§(param1:BattleInviteEnableEvent) : void
      {
         server.enable(param1.enable);
      }
      
      public function objectUnloaded() : void
      {
         battleInviteService.removeEventListener(BattleInviteEnableEvent.UPDATE,this.§>"3§);
      }
   }
}

