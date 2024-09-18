package §use for class§
{
   import §#$#§.§`";§;
   import §&V§.§,"-§;
   import alternativa.tanks.service.country.CountryService;
   import §for package case§.§5!^§;
   import §for package case§.§include for static§;
   import §for set include§.§ !m§;
   import platform.client.fp10.core.model.ObjectLoadListener;
   import platform.client.fp10.core.model.ObjectUnloadListener;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.layout.ILobbyLayoutService;
   
   public class §default package with§ extends §include for static§ implements §5!^§, ObjectLoadListener, ObjectUnloadListener
   {
      [Inject]
      public static var §"!b§:CountryService;
      
      [Inject]
      public static var lobbyLayoutService:ILobbyLayoutService;
      
      private var §function const include§:Boolean;
      
      public function §default package with§()
      {
         super();
      }
      
      public function §get const null§() : void
      {
         this.showPayment();
      }
      
      private function §implements for catch§(param1:§,"-§) : void
      {
         this.§function const include§ = param1.type == §,"-§.SWITCH_FROM_BATTLE;
         if(§"!b§.§?"=§())
         {
            server.§continue package catch§();
         }
         else
         {
            this.showPayment();
         }
      }
      
      private function §8#Z§(param1:String) : void
      {
         §"!b§.§2"l§(param1);
         server.§8#Z§(param1);
         this.showPayment();
      }
      
      private function showPayment() : void
      {
         if(this.§function const include§)
         {
            throw new Error("");
         }
         lobbyLayoutService.showPayment();
      }
      
      public function §true catch const§(param1:String) : void
      {
         §"!b§.§2"l§(param1);
         new §`";§(this.§8#Z§);
      }
      
      public function objectLoaded() : void
      {
         §"!b§.§&[§(getInitParam());
         this.§return var while§();
      }
      
      public function objectUnloaded() : void
      {
         this.removeEventListeners();
         this.§function const include§ = false;
      }
      
      private function §return var while§() : void
      {
         lobbyLayoutService.addEventListener(§,"-§.SWITCH_STARTED,this.§implements for catch§);
         lobbyLayoutService.addEventListener(§,"-§.SWITCH_FROM_BATTLE,this.§implements for catch§);
         §"!b§.addEventListener(§ !m§.§null const include§,this.§0#L§);
      }
      
      private function removeEventListeners() : void
      {
         lobbyLayoutService.removeEventListener(§,"-§.SWITCH_STARTED,this.§implements for catch§);
         lobbyLayoutService.removeEventListener(§,"-§.SWITCH_FROM_BATTLE,this.§implements for catch§);
         §"!b§.removeEventListener(§ !m§.§null const include§,this.§0#L§);
      }
      
      private function §0#L§(param1:§ !m§) : void
      {
         server.§8#Z§(param1.§throw const var§);
      }
   }
}

