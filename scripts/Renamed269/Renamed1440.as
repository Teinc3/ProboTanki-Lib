package Renamed1
{
   import Renamed211.Renamed908;
   import alternativa.engine3d.lights.OmniLight;
   import alternativa.tanks.camera.Renamed842;
   import Renamed356.Renamed1443;
   import Renamed356.Renamed1444;
   
   public class Renamed1440 extends Renamed1444 implements Renamed609
   {
      public static const Renamed7014:Number = 1 / 2.2;
      
      private var light:OmniLight;
      
      private var time:int;
      
      private var currentTime:int;
      
      private var Renamed7015:Number;
      
      private var container:Renamed908;
      
      private var Renamed7016:Number;
      
      public function Renamed1440(param1:Renamed1443)
      {
         super(param1);
         this.light = new OmniLight(0,0,0);
      }
      
      public function init(param1:OmniLight, param2:int, param3:Number = 0.45454545454545453) : void
      {
         this.light.intensity = param1.intensity;
         this.light.color = param1.color;
         this.light.attenuationBegin = param1.attenuationBegin;
         this.light.attenuationEnd = param1.attenuationEnd;
         this.light.x = param1.x;
         this.light.y = param1.y;
         this.light.z = param1.z;
         this.light.calculateBounds();
         this.time = param2;
         this.Renamed7015 = param3;
         this.Renamed7016 = param1.intensity;
         this.currentTime = 0;
      }
      
      public function Renamed1411(param1:Renamed908) : void
      {
         this.container = param1;
         param1.addChild(this.light);
      }
      
      public function play(param1:int, param2:Renamed842) : Boolean
      {
         this.currentTime += param1;
         this.currentTime = Math.min(this.currentTime,this.time);
         var _loc3_:Number = 1 - this.currentTime / this.time;
         this.light.intensity = this.Renamed7016 * Math.pow(_loc3_,this.Renamed7015);
         return this.currentTime < this.time;
      }
      
      public function destroy() : void
      {
         if(this.container != null)
         {
            this.container.removeChild(this.light);
            this.container = null;
         }
         recycle();
      }
      
      public function kill() : void
      {
         this.light = null;
      }
   }
}

