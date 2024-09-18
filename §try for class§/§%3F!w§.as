package §try for class§
{
   import alternativa.osgi.OSGi;
   import alternativa.tanks.battle.§;!t§;
   import alternativa.tanks.models.tank.§2!s§;
   import alternativa.tanks.models.tank.§finally var return§;
   import flash.utils.getTimer;
   import platform.client.fp10.core.type.IGameObject;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.layout.ILobbyLayoutService;
   
   public class §?!w§ implements §;!t§
   {
      [Inject]
      public static var lobbyLayoutService:ILobbyLayoutService;
      
      private var tankObject:IGameObject;
      
      private var endTime:int;
      
      public function §?!w§(param1:int, param2:IGameObject)
      {
         super();
         this.tankObject = param2;
         this.endTime = getTimer() + param1;
      }
      
      public function §var package implements§(param1:int, param2:int) : void
      {
         if(param1 >= this.endTime && !lobbyLayoutService.isWindowOpenOverBattle() && !lobbyLayoutService.isSwitchInProgress())
         {
            §2!s§(OSGi.getInstance().getService(§finally var return§)).setReadyToPlace();
         }
      }
      
      public function §final for false§(param1:IGameObject) : void
      {
         this.tankObject = param1;
      }
   }
}

