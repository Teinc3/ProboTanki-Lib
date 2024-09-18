package Renamed1
{
   import Renamed211.Renamed908;
   import alternativa.engine3d.core.Object3D;
   import alternativa.engine3d.lights.TubeLight;
   import alternativa.math.Vector3;
   import alternativa.tanks.camera.Renamed842;
   import Renamed356.Renamed1443;
   import Renamed356.Renamed1444;
   
   public class Renamed6906 extends Renamed1444 implements Renamed609
   {
      private static const Renamed6907:Number = 1.5;
      
      private static const position:Vector3 = new Vector3();
      
      private static const Renamed6908:Vector3 = new Vector3();
      
      private var light:TubeLight;
      
      private var Renamed6909:Renamed6901;
      
      private var Renamed6910:Renamed6901;
      
      private var animation:Renamed3193;
      
      private var currentTime:int;
      
      private var Renamed5867:int;
      
      private var Renamed1648:Boolean;
      
      private var alive:Boolean;
      
      private var target:Object3D;
      
      private var container:Renamed908;
      
      public function Renamed6906(param1:Renamed1443)
      {
         super(param1);
         this.light = new TubeLight(0,0,0,0,0);
         this.target = new Object3D();
      }
      
      public function init(param1:Renamed6901, param2:Renamed6901, param3:Renamed3193, param4:Boolean = false) : void
      {
         this.Renamed6911(param1,param2,param3.Renamed6912(),param3,param4);
      }
      
      public function Renamed6911(param1:Renamed6901, param2:Renamed6901, param3:int, param4:Renamed3193, param5:Boolean = false) : void
      {
         this.Renamed6909 = param1;
         this.Renamed6910 = param2;
         this.Renamed5867 = param3;
         this.currentTime = 0;
         this.animation = param4;
         this.Renamed1648 = param5;
         this.alive = true;
      }
      
      public function Renamed1411(param1:Renamed908) : void
      {
         this.container = param1;
         param1.addChild(this.light);
         param1.addChild(this.target);
      }
      
      public function play(param1:int, param2:Renamed842) : Boolean
      {
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         if(this.alive)
         {
            this.animation.Renamed6913(this.light,this.currentTime,this.Renamed5867);
            this.Renamed6909.Renamed6905(this.light,param2,param1);
            this.Renamed6910.Renamed6905(this.target,param2,param1);
            this.currentTime += param1;
            position.x = this.light.x;
            position.y = this.light.y;
            position.z = this.light.z;
            Renamed6908.x = this.target.x;
            Renamed6908.y = this.target.y;
            Renamed6908.z = this.target.z;
            _loc3_ = Vector3.distanceBetween(position,Renamed6908);
            _loc4_ = param2.farClipping / Renamed6907;
            _loc3_ = _loc3_ > _loc4_ ? Number(_loc4_) : Number(_loc3_);
            this.light.length = _loc3_;
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
            this.light.lookAt(this.target.x,this.target.y,this.target.z);
            this.light.falloff = this.light.attenuationEnd - this.light.attenuationBegin;
            return this.alive;
         }
         return false;
      }
      
      public function destroy() : void
      {
         this.container.removeChild(this.light);
         this.container.removeChild(this.target);
         this.container = null;
         this.animation = null;
         this.Renamed6909 = null;
         recycle();
      }
      
      public function kill() : void
      {
         this.alive = false;
      }
   }
}

