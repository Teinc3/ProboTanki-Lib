package scpacker.utils
{
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.tanks.battle.Renamed768;
   import flash.utils.getTimer;
   
   public class Renamed5997 implements Renamed768
   {
      private static const Renamed10784:int = 5000;
      
      public static var display:IDisplay = IDisplay(OSGi.getInstance().getService(IDisplay));
      
      private var Renamed10785:int;
      
      private var Renamed2957:Boolean = true;
      
      public function Renamed5997()
      {
         super();
      }
      
      public function Renamed769(param1:int, param2:int) : void
      {
         var _loc3_:int = getTimer();
         if(this.Renamed2957)
         {
            this.Renamed10785 = _loc3_;
            this.Renamed2957 = false;
         }
         if(display.stage.frameRate >= 70 && this.Renamed10785 + Renamed10784 >= _loc3_)
         {
            this.Renamed10786();
            this.Renamed10785 = _loc3_;
         }
      }
      
      private function Renamed10786() : void
      {
         display.stage.frameRate = 10;
      }
   }
}

