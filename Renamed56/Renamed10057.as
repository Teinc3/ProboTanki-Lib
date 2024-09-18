package Renamed56
{
   import Renamed211.Renamed908;
   import Renamed1.Renamed609;
   import Renamed1.Renamed6378;
   import alternativa.engine3d.materials.Material;
   import alternativa.math.Vector3;
   import alternativa.tanks.camera.Renamed842;
   import Renamed356.Renamed1443;
   import Renamed356.Renamed1444;
   
   public class Renamed10052 extends Renamed1444 implements Renamed609
   {
      private var container:Renamed908;
      
      private var trail:Renamed10053;
      
      private var Renamed10054:Vector3;
      
      private var direction:Vector3;
      
      private var Renamed10055:Number;
      
      private var Renamed10056:Number;
      
      private var Renamed10040:Number;
      
      private var Renamed4164:int;
      
      private var time:int;
      
      public function Renamed10052(param1:Renamed1443)
      {
         this.Renamed10054 = new Vector3();
         this.direction = new Vector3();
         super(param1);
         this.trail = new Renamed10053();
      }
      
      public function init(param1:Vector3, param2:Vector3, param3:Material, param4:Number, param5:Number, param6:Number, param7:Number, param8:int) : void
      {
         this.Renamed10054.copy(param1);
         this.direction.diff(param2,param1);
         var _loc9_:Number = this.direction.length();
         this.direction.scale(1 / _loc9_);
         this.Renamed10055 = param5;
         this.Renamed10056 = param6;
         this.Renamed10040 = param7;
         this.Renamed4164 = param8;
         this.trail.init(param4,_loc9_,param3,param7);
         this.time = 0;
      }
      
      public function play(param1:int, param2:Renamed842) : Boolean
      {
         var _loc4_:Number = NaN;
         var _loc3_:Number = NaN;
         if(this.time > this.Renamed4164)
         {
            return false;
         }
         Renamed6378.Renamed6415(this.trail,this.Renamed10054,this.direction,param2.position);
         _loc4_ = this.time / this.Renamed4164;
         _loc3_ = Math.sqrt(_loc4_);
         this.trail.scaleX = this.Renamed10055 + (this.Renamed10056 - this.Renamed10055) * _loc3_;
         this.trail.alpha = 1 - _loc4_;
         this.trail.update(_loc3_);
         this.time += param1;
         return true;
      }
      
      public function Renamed1411(param1:Renamed908) : void
      {
         this.container = param1;
         param1.addChild(this.trail);
      }
      
      public function destroy() : void
      {
         this.trail.clear();
         this.container.removeChild(this.trail);
         this.container = null;
         recycle();
      }
      
      public function kill() : void
      {
         this.time = this.Renamed4164 + 1;
      }
   }
}

