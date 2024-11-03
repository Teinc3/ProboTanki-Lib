package Renamed450
{
   import Renamed151.Renamed4798;
   import Renamed193.Renamed4455;
   import alternativa.tanks.service.country.CountryService;
   import Renamed371.Renamed4816;
   import Renamed371.Renamed8258;
   import Renamed372.Renamed3647;
   import platform.client.fp10.core.model.ObjectLoadListener;
   import platform.client.fp10.core.model.ObjectUnloadListener;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.layout.ILobbyLayoutService;
   
   public class Renamed4826 extends Renamed8258 implements Renamed4816, ObjectLoadListener, ObjectUnloadListener
   {
      [Inject]
      public static var Renamed2243:CountryService;
      
      [Inject]
      public static var lobbyLayoutService:ILobbyLayoutService;
      
      private var Renamed9006:Boolean;
      
      public function Renamed4826()
      {
         super();
      }
      
      public function Renamed6094() : void
      {
         this.showPayment();
      }
      
      private function Renamed9007(param1:Renamed4455) : void
      {
         this.Renamed9006 = param1.type == Renamed4455.SWITCH_FROM_BATTLE;
         if(Renamed2243.Renamed2251())
         {
            server.Renamed8250();
         }
         else
         {
            this.showPayment();
         }
      }
      
      private function Renamed8251(param1:String) : void
      {
         Renamed2243.Renamed3646(param1);
         server.Renamed8251(param1);
         this.showPayment();
      }
      
      private function showPayment() : void
      {
         if(this.Renamed9006)
         {
            throw new Error("");
         }
         lobbyLayoutService.showPayment();
      }
      
      public function Renamed6093(param1:String) : void
      {
         Renamed2243.Renamed3646(param1);
         new Renamed4798(this.Renamed8251);
      }
      
      public function objectLoaded() : void
      {
         Renamed2243.Renamed3645(getInitParam());
         this.Renamed2629();
      }
      
      public function objectUnloaded() : void
      {
         this.removeEventListeners();
         this.Renamed9006 = false;
      }
      
      private function Renamed2629() : void
      {
         lobbyLayoutService.addEventListener(Renamed4455.SWITCH_STARTED,this.Renamed9007);
         lobbyLayoutService.addEventListener(Renamed4455.SWITCH_FROM_BATTLE,this.Renamed9007);
         Renamed2243.addEventListener(Renamed3647.Renamed3653,this.Renamed9008);
      }
      
      private function removeEventListeners() : void
      {
         lobbyLayoutService.removeEventListener(Renamed4455.SWITCH_STARTED,this.Renamed9007);
         lobbyLayoutService.removeEventListener(Renamed4455.SWITCH_FROM_BATTLE,this.Renamed9007);
         Renamed2243.removeEventListener(Renamed3647.Renamed3653,this.Renamed9008);
      }
      
      private function Renamed9008(param1:Renamed3647) : void
      {
         server.Renamed8251(param1.Renamed2256);
      }
   }
}

