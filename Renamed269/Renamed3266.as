package Renamed1
{
   import Renamed211.Renamed908;
   import alternativa.engine3d.lights.OmniLight;
   import alternativa.math.Vector3;
   import alternativa.tanks.camera.Renamed842;
   import Renamed356.Renamed1443;
   import Renamed356.Renamed1444;
   
   public final class Renamed3266 extends Renamed1444 implements Renamed609
   {
      public static const Renamed7059:Number = 99999;
      
      private var light:OmniLight;
      
      private var Renamed6909:Renamed6901;
      
      private var animation:Renamed3193;
      
      private var currentTime:int;
      
      private var Renamed5867:int;
      
      private var Renamed1648:Boolean;
      
      private var alive:Boolean;
      
      private var Renamed6525:Number;
      
      private var Renamed7060:Number;
      
      private var position:Vector3;
      
      private var container:Renamed908;
      
      public function Renamed3266(param1:Renamed1443)
      {
         this.position = new Vector3();
         super(param1);
         this.light = new OmniLight(0,0,0);
      }
      
      public function init(param1:Renamed6901, param2:Renamed3193, param3:Number = 99999, param4:Boolean = false) : void
      {
         this.Renamed6911(param1,param2.Renamed6912(),param2,param3,param4);
      }
      
      public function Renamed6911(param1:Renamed6901, param2:int, param3:Renamed3193, param4:Number = 99999, param5:Boolean = false) : void
      {
         this.Renamed6909 = param1;
         this.Renamed5867 = param2;
         this.currentTime = 0;
         this.animation = param3;
         this.Renamed1648 = param5;
         this.alive = true;
         this.Renamed6525 = param4;
         this.Renamed7060 = param4 / 4 * 3;
      }
      
      public function Renamed1411(param1:Renamed908) : void
      {
         this.container = param1;
         param1.addChild(this.light);
      }
      
      public function play(param1:int, param2:Renamed842) : Boolean
      {
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         if(this.alive)
         {
            this.animation.Renamed6913(this.light,this.currentTime,this.Renamed5867);
            this.Renamed6909.Renamed6905(this.light,param2,param1);
            this.currentTime += param1;
            if(this.currentTime > this.Renamed5867)
            {
               if(this.Renamed1648)
               {
                  this.currentTime %= this.Renamed5867;
               }
               else
               {
                  this.alive = false;
               }
            }
            this.position.x = this.light.x;
            this.position.y = this.light.y;
            this.position.z = this.light.z;
            _loc3_ = Vector3.distanceBetween(this.position,param2.position);
            if(_loc3_ > this.Renamed7060)
            {
               _loc4_ = 1 - (_loc3_ - this.Renamed7060) / (this.Renamed6525 - this.Renamed7060);
               this.light.intensity *= _loc4_;
               this.light.visible = _loc3_ < this.Renamed6525;
            }
            return this.alive;
         }
         return false;
      }
      
      public function destroy() : void
      {
         this.container.removeChild(this.light);
         this.container = null;
         this.animation = null;
         this.Renamed6909.destroy();
         this.Renamed6909 = null;
         recycle();
      }
      
      public function kill() : void
      {
         this.alive = false;
      }
   }
}

