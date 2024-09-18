package scpacker.utils
{
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.tanks.battle.§;!t§;
   import flash.utils.getTimer;
   
   public class §with var return§ implements §;!t§
   {
      private static const §return package else§:int = 5000;
      
      public static var display:IDisplay = IDisplay(OSGi.getInstance().getService(IDisplay));
      
      private var §true catch for§:int;
      
      private var §import for get§:Boolean = true;
      
      public function §with var return§()
      {
         super();
      }
      
      public function §var package implements§(param1:int, param2:int) : void
      {
         var _loc3_:int = getTimer();
         if(this.§import for get§)
         {
            this.§true catch for§ = _loc3_;
            this.§import for get§ = false;
         }
         if(display.stage.frameRate >= 70 && this.§true catch for§ + §return package else§ >= _loc3_)
         {
            this.§class set package§();
            this.§true catch for§ = _loc3_;
         }
      }
      
      private function §class set package§() : void
      {
         display.stage.frameRate = 10;
      }
   }
}

