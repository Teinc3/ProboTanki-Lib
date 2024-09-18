package alternativa.tanks.services.battlereadiness
{
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.loader.ILoaderWindowService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.layout.ILobbyLayoutService;
   
   public class Renamed524 implements BattleReadinessService
   {
      [Inject]
      public static var Renamed3809:BattleService;
      
      [Inject]
      public static var loaderWindowService:ILoaderWindowService;
      
      [Inject]
      public static var lobbyLayoutService:ILobbyLayoutService;
      
      private var Renamed3810:Boolean;
      
      private var Renamed3811:Boolean;
      
      public function Renamed524()
      {
         super();
      }
      
      public function reset() : void
      {
         lobbyLayoutService.setBattleReady(false);
         this.Renamed3810 = false;
         this.Renamed3811 = false;
      }
      
      public function Renamed2514() : void
      {
         if(!this.Renamed3810)
         {
            this.Renamed3810 = true;
            this.Renamed3812();
         }
      }
      
      public function Renamed2507() : void
      {
         if(!this.Renamed3811)
         {
            this.Renamed3811 = true;
            this.Renamed3812();
         }
      }
      
      public function isBattleReady() : Boolean
      {
         return this.Renamed3810 && this.Renamed3811;
      }
      
      public function Renamed3022() : Boolean
      {
         return this.Renamed3810;
      }
      
      private function Renamed3812() : void
      {
         if(this.isBattleReady())
         {
            lobbyLayoutService.setBattleReady(true);
            loaderWindowService.hideLoaderWindow();
            Renamed3809.Renamed652();
         }
      }
   }
}

