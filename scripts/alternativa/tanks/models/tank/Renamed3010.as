package alternativa.tanks.models.tank
{
   import flash.utils.getTimer;
   
   public class Renamed3010
   {
      private var Renamed3011:uint;
      
      public function Renamed3010()
      {
         super();
      }
      
      public function reset(param1:uint) : void
      {
         this.Renamed3011 = getTimer() + param1;
      }
      
      public function getTimeLeft() : uint
      {
         return this.Renamed3011 - getTimer();
      }
   }
}

