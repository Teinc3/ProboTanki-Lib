package alternativa.tanks.services.battlereadiness
{
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.loader.ILoaderWindowService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.layout.ILobbyLayoutService;
   
   public class §case each§ implements BattleReadinessService
   {
      [Inject]
      public static var §include for with§:BattleService;
      
      [Inject]
      public static var loaderWindowService:ILoaderWindowService;
      
      [Inject]
      public static var lobbyLayoutService:ILobbyLayoutService;
      
      private var §native package null§:Boolean;
      
      private var §import set while§:Boolean;
      
      public function §case each§()
      {
         super();
      }
      
      public function reset() : void
      {
         lobbyLayoutService.setBattleReady(false);
         this.§native package null§ = false;
         this.§import set while§ = false;
      }
      
      public function §#!`§() : void
      {
         if(!this.§native package null§)
         {
            this.§native package null§ = true;
            this.§<"m§();
         }
      }
      
      public function §3"W§() : void
      {
         if(!this.§import set while§)
         {
            this.§import set while§ = true;
            this.§<"m§();
         }
      }
      
      public function isBattleReady() : Boolean
      {
         return this.§native package null§ && this.§import set while§;
      }
      
      public function §for for continue§() : Boolean
      {
         return this.§native package null§;
      }
      
      private function §<"m§() : void
      {
         if(this.isBattleReady())
         {
            lobbyLayoutService.setBattleReady(true);
            loaderWindowService.hideLoaderWindow();
            §include for with§.§2I§();
         }
      }
   }
}

