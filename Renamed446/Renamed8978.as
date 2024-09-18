package Renamed446
{
   import alternativa.osgi.OSGi;
   import alternativa.tanks.battle.Renamed768;
   import alternativa.tanks.models.tank.Renamed2407;
   import alternativa.tanks.models.tank.Renamed2408;
   import flash.utils.getTimer;
   import platform.client.fp10.core.type.IGameObject;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.layout.ILobbyLayoutService;
   
   public class Renamed2770 implements Renamed768
   {
      [Inject]
      public static var lobbyLayoutService:ILobbyLayoutService;
      
      private var tankObject:IGameObject;
      
      private var endTime:int;
      
      public function Renamed2770(param1:int, param2:IGameObject)
      {
         super();
         this.tankObject = param2;
         this.endTime = getTimer() + param1;
      }
      
      public function Renamed769(param1:int, param2:int) : void
      {
         if(param1 >= this.endTime && !lobbyLayoutService.isWindowOpenOverBattle() && !lobbyLayoutService.isSwitchInProgress())
         {
            Renamed2407(OSGi.getInstance().getService(Renamed2408)).setReadyToPlace();
         }
      }
      
      public function Renamed8977(param1:IGameObject) : void
      {
         this.tankObject = param1;
      }
   }
}

