package alternativa.tanks.models.weapon.shotgun
{
   import Renamed25.Renamed26;
   import alternativa.math.Vector3;
   
   public class Renamed3426
   {
      private static const Renamed3463:Vector3 = new Vector3();
      
      private static const Renamed3464:Vector3 = new Vector3();
      
      private var Renamed3465:Vector.<Vector3>;
      
      private var result:Vector.<Vector3>;
      
      private var params:Renamed26;
      
      private var Renamed3466:Number;
      
      private var Renamed3467:Number;
      
      public function Renamed3426(param1:Renamed26)
      {
         super();
         this.Renamed3466 = Math.tan(param1.coneHorizontalAngle * 0.5);
         this.Renamed3467 = Math.tan(param1.coneVerticalAngle * 0.5);
         this.params = param1;
         this.Renamed3465 = new Vector.<Vector3>(param1.pelletCount,true);
         this.result = new Vector.<Vector3>(param1.pelletCount,true);
         var _loc2_:int = 0;
         while(_loc2_ < this.Renamed3465.length)
         {
            this.Renamed3465[_loc2_] = new Vector3();
            this.result[_loc2_] = new Vector3();
            _loc2_++;
         }
      }
      
      public function next() : void
      {
         var _loc1_:int = 0;
         while(_loc1_ < this.Renamed3465.length)
         {
            this.Renamed3468(this.Renamed3465[_loc1_]);
            _loc1_++;
         }
      }
      
      private function Renamed3468(param1:Vector3) : void
      {
         var _loc2_:Number = Math.random();
         var _loc3_:Number = Math.random() * Math.PI * 2;
         param1.x = Math.cos(_loc3_) * _loc2_ * this.Renamed3466;
         param1.y = Math.sin(_loc3_) * _loc2_ * this.Renamed3467;
      }
      
      public function Renamed3431(param1:Vector3, param2:Vector3) : Vector.<Vector3>
      {
         var _loc3_:Vector3 = null;
         this.Renamed3469(param1,param2);
         var _loc4_:int = 0;
         while(_loc4_ < this.Renamed3465.length)
         {
            _loc3_ = this.Renamed3465[_loc4_];
            this.Renamed3470(_loc3_.x,_loc3_.y,param2,this.result[_loc4_]);
            _loc4_++;
         }
         return this.result;
      }
      
      private function Renamed3470(param1:Number, param2:Number, param3:Vector3, param4:Vector3) : void
      {
         param4.reset();
         param4.addScaled(param1,Renamed3463);
         param4.addScaled(param2,Renamed3464);
         param4.add(param3);
         param4.normalize();
      }
      
      private function Renamed3469(param1:Vector3, param2:Vector3) : void
      {
         Renamed3463.copy(param1);
         Renamed3464.cross2(Renamed3463,param2).normalize();
      }
   }
}

