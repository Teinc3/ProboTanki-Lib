package alternativa.tanks.service.country
{
   import flash.events.EventDispatcher;
   import Renamed371.Renamed2242;
   import Renamed371.Renamed3644;
   import Renamed372.Renamed3647;
   
   public class Renamed568 extends EventDispatcher implements CountryService
   {
      private var Renamed3648:Boolean;
      
      private var Renamed3649:Vector.<Renamed2242>;
      
      private var Renamed3650:String;
      
      public function Renamed568()
      {
         super();
      }
      
      public function Renamed3645(param1:Renamed3644) : void
      {
         this.Renamed3648 = param1.Renamed3651;
         this.Renamed3649 = param1.Renamed3652;
         this.Renamed3650 = param1.defaultCountryCode;
      }
      
      public function Renamed2255() : Vector.<Renamed2242>
      {
         return this.Renamed3649;
      }
      
      public function Renamed2257() : String
      {
         return this.Renamed3650;
      }
      
      public function Renamed3646(param1:String) : void
      {
         this.Renamed3650 = param1;
      }
      
      public function Renamed2254(param1:String) : void
      {
         this.Renamed3650 = param1;
         dispatchEvent(new Renamed3647(Renamed3647.Renamed3653,param1));
      }
      
      public function Renamed2251() : Boolean
      {
         return this.Renamed3648;
      }
   }
}

