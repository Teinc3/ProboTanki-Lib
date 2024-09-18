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
   
   public class Renamed10109 extends Renamed1444 implements Renamed609
   {
      private var container:Renamed908;
      
      private var Renamed6398:Renamed10036;
      
      private var Renamed10054:Vector3;
      
      private var direction:Vector3;
      
      private var Renamed10055:Number;
      
      private var Renamed10056:Number;
      
      private var Renamed10040:Number;
      
      private var Renamed4164:int;
      
      private var time:int;
      
      public function Renamed10109(param1:Renamed1443)
      {
         this.Renamed10054 = new Vector3();
         this.direction = new Vector3();
         super(param1);
         this.Renamed6398 = new Renamed10036();
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
         this.Renamed6398.init(param4,_loc9_,param3,param7);
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
         Renamed6378.Renamed6415(this.Renamed6398,this.Renamed10054,this.direction,param2.position);
         _loc4_ = this.time / this.Renamed4164;
         _loc3_ = Math.sqrt(_loc4_);
         this.Renamed6398.scaleX = this.Renamed10055 + (this.Renamed10056 - this.Renamed10055) * _loc3_;
         this.Renamed6398.alpha = 1 - _loc4_;
         this.Renamed6398.update(_loc3_);
         this.time += param1;
         return true;
      }
      
      public function Renamed1411(param1:Renamed908) : void
      {
         this.container = param1;
         param1.addChild(this.Renamed6398);
      }
      
      public function destroy() : void
      {
         this.Renamed6398.clear();
         this.container.removeChild(this.Renamed6398);
         this.container = null;
         recycle();
      }
      
      public function kill() : void
      {
         this.time = this.Renamed4164 + 1;
      }
   }
}

