package Renamed1
{
   import Renamed211.Renamed908;
   import alternativa.math.Vector3;
   import alternativa.tanks.camera.Renamed842;
   import alternativa.tanks.engine3d.Renamed843;
   import Renamed356.Renamed1443;
   import Renamed356.Renamed1444;
   
   public class Renamed7004 extends Renamed1444 implements Renamed609
   {
      private static const Renamed4941:Number = 100;
      
      private var Renamed7005:Number;
      
      protected var scale:Number;
      
      protected var Renamed7006:Number;
      
      protected var Renamed5093:Renamed7007;
      
      private var currentTime:int;
      
      private var maxTime:int;
      
      private var container:Renamed908;
      
      public function Renamed7004(param1:Renamed1443)
      {
         super(param1);
         this.Renamed5093 = new Renamed7007(Renamed4941);
         this.Renamed5093.useShadowMap = false;
         this.Renamed5093.useLight = false;
         this.Renamed5093.shadowMapAlphaThreshold = 2;
         this.Renamed5093.depthMapAlphaThreshold = 2;
         this.Renamed5093.softAttenuation = 0;
      }
      
      public function init(param1:Number, param2:Vector3, param3:Vector3, param4:Renamed843, param5:Number) : void
      {
         this.Renamed5093.init(param4,0.001 * param4.fps);
         this.maxTime = this.Renamed5093.Renamed6419();
         this.currentTime = 0;
         this.Renamed7005 = 0.001 * param5;
         this.Renamed7006 = param1 / Renamed4941;
         this.scale = this.Renamed7006;
         this.Renamed5093.x = param2.x;
         this.Renamed5093.y = param2.y;
         this.Renamed5093.z = param2.z;
         this.Renamed5093.rotationX = param3.x;
         this.Renamed5093.rotationY = param3.y;
         this.Renamed5093.rotationZ = param3.z;
      }
      
      public function Renamed1411(param1:Renamed908) : void
      {
         this.container = param1;
         param1.addChild(this.Renamed5093);
      }
      
      public function play(param1:int, param2:Renamed842) : Boolean
      {
         if(this.currentTime >= this.maxTime)
         {
            return false;
         }
         this.Renamed5093.setTime(this.currentTime);
         this.currentTime += param1;
         this.Renamed5093.scaleX = this.scale;
         this.Renamed5093.scaleY = this.scale;
         this.scale = this.Renamed7006 + this.Renamed7006 * this.Renamed7005 * this.currentTime;
         return true;
      }
      
      public function destroy() : void
      {
         this.container.removeChild(this.Renamed5093);
         this.container = null;
         this.Renamed5093.clear();
         recycle();
      }
      
      public function kill() : void
      {
         this.currentTime = this.maxTime;
      }
   }
}

