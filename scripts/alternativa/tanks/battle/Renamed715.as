package alternativa.tanks.battle
{
   import alternativa.engine3d.core.Camera3D;
   import alternativa.engine3d.core.PerformanceController;
   import flash.display.Stage;
   import flash.events.Event;
   
   public class Renamed710 extends PerformanceController
   {
      private var stage:Stage;
      
      private var Renamed711:Boolean = false;
      
      public function Renamed710()
      {
         super();
      }
      
      private function init() : void
      {
         if(!this.Renamed711)
         {
            addFeature(PerformanceController.SHADOWS,0.2,true);
            addFeature(PerformanceController.SHADOW_MAP,0.2,false);
            addFeature(PerformanceController.DEFERRED_LIGHTING,0.2,false);
            addFeature(PerformanceController.FOG,0.2,true);
            addFeature(PerformanceController.SOFT_TRANSPARENCY,0.2,false);
            addFeature(PerformanceController.SSAO,0.2,false);
            addFeature(PerformanceController.ANTI_ALIAS,0.2,false);
            this.Renamed711 = true;
         }
      }
      
      public function Renamed712(param1:Stage, param2:Camera3D, param3:String) : void
      {
         this.init();
         this.stage = param1;
         param1.addEventListener(Event.ACTIVATE,this.Renamed713);
         param1.addEventListener(Event.DEACTIVATE,this.Renamed714);
         start(param1,param2,30,0.15,20,5,1,param3);
      }
      
      private function Renamed713(param1:Event) : void
      {
         block = false;
      }
      
      private function Renamed714(param1:Event) : void
      {
         block = true;
      }
      
      [Obfuscation(rename="false")]
      override public function stop() : void
      {
         super.stop();
         this.stage.removeEventListener(Event.ACTIVATE,this.Renamed713);
         this.stage.removeEventListener(Event.DEACTIVATE,this.Renamed714);
         this.stage = null;
      }
   }
}

