package Renamed1342
{
   import alternativa.math.Vector3;
   import alternativa.tanks.battle.scene3d.Renamed919;
   
   public class Renamed1343 implements Renamed919
   {
      private static const Renamed7592:Vector3 = new Vector3();
      
      private var Renamed7593:Number;
      
      private var Renamed6544:int;
      
      public function Renamed1343()
      {
         this.center = new Vector3();
         this.objects = new Vector.<Renamed1448>();
         super();
      }
      
      public function add(param1:Renamed1448) : void
      {
         if(this.objects.indexOf(param1) < 0)
         {
            var _loc2_:* = this.Renamed6544++;
            this.objects[_loc2_] = param1;
         }
      }
      
      public function remove(param1:Renamed1448) : void
      {
         var _loc2_:int = int(this.objects.indexOf(param1));
         if(_loc2_ >= 0)
         {
            param1.setAlphaMultiplier(1);
            --this.Renamed6544;
            this.objects[_loc2_] = this.objects[this.Renamed6544];
            this.objects[this.Renamed6544] = null;
         }
      }
      
      public function Renamed3343(param1:Vector3, param2:Number) : void
      {
         this.center.copy(param1);
         this.Renamed7593 = param2 * param2;
      }
      
      public function Renamed1387() : void
      {
         var _loc1_:Renamed1448 = null;
         var _loc2_:int = 0;
         while(_loc2_ < this.Renamed6544)
         {
            _loc1_ = this.objects[_loc2_];
            _loc1_.setAlphaMultiplier(1);
            _loc2_++;
         }
      }
      
      public function render(param1:int, param2:int) : void
      {
         var _loc3_:Renamed1448 = null;
         var _loc4_:int = 0;
         while(_loc4_ < this.Renamed6544)
         {
            _loc3_ = this.objects[_loc4_];
            _loc3_.readPosition(Renamed7592);
            _loc3_.setAlphaMultiplier(this.Renamed7594(Renamed7592));
            _loc4_++;
         }
      }
      
      private function Renamed7594(param1:Vector3) : Number
      {
         var _loc2_:Number = param1.x - this.center.x;
         var _loc3_:Number = param1.y - this.center.y;
         var _loc4_:Number = param1.z - this.center.z;
         var _loc5_:Number = _loc2_ * _loc2_ + _loc3_ * _loc3_ + _loc4_ * _loc4_;
         if(_loc5_ < this.Renamed7593)
         {
            return Math.sqrt(_loc5_ / this.Renamed7593);
         }
         return 1;
      }
      
      public function clear() : void
      {
         this.objects.length = 0;
         this.Renamed6544 = 0;
      }
   }
}

