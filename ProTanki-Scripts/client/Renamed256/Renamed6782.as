package Renamed6781
{
   import Renamed278.Renamed3515;
   import alternativa.math.Matrix3;
   import alternativa.math.Vector3;
   import alternativa.tanks.battle.Renamed668;
   import alternativa.tanks.models.weapon.Renamed664;
   import alternativa.tanks.models.weapons.targeting.priority.Renamed3508;
   import Renamed439.Renamed3533;
   
   public class Renamed6782
   {
      private const Renamed6783:int = 16;
      
      private var Renamed6784:Renamed3508;
      
      private var matrix:Matrix3;
      
      private var direction:Vector3;
      
      private var Renamed3465:Vector.<Renamed3515>;
      
      private var Renamed6785:Renamed6786;
      
      public function Renamed6782(param1:Renamed3508)
      {
         this.matrix = new Matrix3();
         this.direction = new Vector3();
         this.Renamed3465 = new Vector.<Renamed3515>();
         this.Renamed6785 = new Renamed6786();
         super();
         this.Renamed6784 = param1;
      }
      
      public function Renamed6787(param1:Renamed664, param2:Vector.<Renamed3533>) : Vector.<Renamed3515>
      {
         var _loc3_:Renamed3533 = null;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc6_:Number = Number.NEGATIVE_INFINITY;
         this.Renamed3465.length = 0;
         this.Renamed6785.clear();
         for each(_loc3_ in param2)
         {
            _loc4_ = _loc3_.Renamed6788();
            while(!this.Renamed6785.isEmpty() && _loc6_ < _loc4_)
            {
               _loc5_ = Math.min(this.Renamed6785.Renamed597(),_loc4_);
               this.Renamed6789(param1,_loc6_,_loc5_);
               this.Renamed6785.Renamed6790(_loc5_);
               _loc6_ = _loc5_;
            }
            _loc6_ = _loc4_;
            this.Renamed6785.add(_loc3_);
         }
         while(!this.Renamed6785.isEmpty())
         {
            _loc5_ = this.Renamed6785.Renamed597();
            this.Renamed6789(param1,_loc6_,_loc5_);
            this.Renamed6785.Renamed6790(_loc5_);
            _loc6_ = _loc5_;
         }
         return this.Renamed3465;
      }
      
      private function Renamed6789(param1:Renamed664, param2:Number, param3:Number) : void
      {
         var _loc4_:Vector3 = null;
         var _loc5_:Number = param3 - param2;
         var _loc6_:Number = _loc5_ / this.Renamed6783;
         var _loc7_:Number = param2 + _loc6_ * 0.5;
         var _loc8_:Vector.<Renamed3533> = this.Renamed6785.Renamed6791();
         this.matrix.fromAxisAngle(param1.Renamed3025,_loc7_);
         this.matrix.transformVector(param1.direction,this.direction);
         this.matrix.fromAxisAngle(param1.Renamed3025,_loc6_);
         var _loc9_:int = 0;
         while(_loc9_ < this.Renamed6783)
         {
            this.Renamed3465.push(new Renamed3515(this.direction,_loc7_,this.Renamed6784.Renamed3536(_loc7_,_loc8_)));
            _loc4_ = Renamed668.Renamed669;
            _loc4_.copy(this.direction);
            this.matrix.transformVector(_loc4_,this.direction);
            _loc7_ += _loc6_;
            _loc9_++;
         }
         if(param2 <= 0 && 0 <= param3)
         {
            this.Renamed3465.push(new Renamed3515(param1.direction,0,this.Renamed6784.Renamed3536(0,_loc8_)));
         }
      }
   }
}

