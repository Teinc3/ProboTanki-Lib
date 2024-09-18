package Renamed405
{
   import Renamed136.Renamed663;
   import Renamed235.Renamed607;
   import Renamed289.Renamed6109;
   import alternativa.tanks.models.tank.Renamed2866;
   import flash.media.Sound;
   import platform.client.fp10.core.resource.types.SoundResource;
   
   public class Renamed8583
   {
      private var Renamed633:Renamed607;
      
      private var Renamed974:Renamed6109;
      
      public function Renamed8583(param1:Renamed607, param2:Renamed6109)
      {
         super();
         this.Renamed633 = param1;
         this.Renamed974 = param2;
      }
      
      private static function Renamed8584(param1:SoundResource) : Sound
      {
         if(param1 == null)
         {
            return null;
         }
         return param1.sound;
      }
      
      public function Renamed8585(param1:Renamed663) : void
      {
         var _loc2_:Sound = null;
         if(param1 == Renamed2866.teamType)
         {
            _loc2_ = Renamed8584(this.Renamed974.Renamed7354);
         }
         else
         {
            _loc2_ = Renamed8584(this.Renamed974.Renamed7353);
         }
         this.Renamed633.Renamed2316(_loc2_);
      }
      
      public function Renamed8586(param1:Renamed663) : void
      {
         var _loc2_:Sound = null;
         if(param1 == Renamed2866.teamType)
         {
            _loc2_ = Renamed8584(this.Renamed974.Renamed7355);
         }
         else
         {
            _loc2_ = Renamed8584(this.Renamed974.Renamed7356);
         }
         this.Renamed633.Renamed2316(_loc2_);
      }
      
      public function Renamed8587(param1:Renamed663) : void
      {
         var _loc2_:Sound = null;
         if(param1 == Renamed2866.teamType)
         {
            _loc2_ = Renamed8584(this.Renamed974.Renamed7358);
         }
         else
         {
            _loc2_ = Renamed8584(this.Renamed974.Renamed7357);
         }
         this.Renamed633.Renamed2316(_loc2_);
      }
      
      public function Renamed8588(param1:Renamed663) : void
      {
         var _loc2_:Sound = null;
         if(param1 == Renamed2866.teamType)
         {
            _loc2_ = Renamed8584(this.Renamed974.Renamed7359);
         }
         else
         {
            _loc2_ = Renamed8584(this.Renamed974.Renamed7360);
         }
         this.Renamed633.Renamed2316(_loc2_);
      }
   }
}

