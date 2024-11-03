package Renamed838
{
   import alternativa.math.Vector3;
   import alternativa.physics.Body;
   import alternativa.tanks.battle.Renamed668;
   
   public class Renamed840
   {
      public var body:Body;
      
      public var Renamed861:Vector.<Renamed839>;
      
      public var Renamed860:int;
      
      public var Renamed1217:int;
      
      public var Renamed983:Renamed911;
      
      public var Renamed858:Number = 0;
      
      public var Renamed1227:int;
      
      public function Renamed840(param1:Body, param2:int, param3:Vector3, param4:Number, param5:Renamed911, param6:int)
      {
         this.Renamed1223 = new Vector3();
         super();
         this.body = param1;
         this.Renamed1227 = param6;
         this.Renamed5794(param2,param3,param4,param5);
      }
      
      private function Renamed5794(param1:int, param2:Vector3, param3:Number, param4:Renamed911) : void
      {
         var _loc5_:Vector3 = null;
         this.Renamed860 = param1;
         this.Renamed983 = param4;
         this.Renamed861 = new Vector.<Renamed839>(param1);
         var _loc6_:Number = param3 / (param1 - 1);
         var _loc7_:int = 0;
         while(_loc7_ < param1)
         {
            _loc5_ = new Vector3(param2.x,param2.y + 0.5 * param3 - _loc7_ * _loc6_,param2.z);
            this.Renamed861[_loc7_] = new Renamed839(this.body,_loc5_,Vector3.DOWN,param4);
            _loc7_++;
         }
      }
      
      public function Renamed5771(param1:int) : void
      {
         var _loc2_:int = 0;
         while(_loc2_ < this.Renamed860)
         {
            Renamed839(this.Renamed861[_loc2_]).collisionGroup = param1;
            _loc2_++;
         }
      }
      
      public function Renamed1008() : Boolean
      {
         var _loc1_:Renamed839 = null;
         for each(_loc1_ in this.Renamed861)
         {
            if(_loc1_.Renamed5782 && !Renamed668.Renamed687(_loc1_.Renamed1299.shape.body))
            {
               return true;
            }
         }
         return false;
      }
      
      public function Renamed5773(param1:Number) : void
      {
         var _loc2_:Renamed839 = null;
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         this.Renamed1217 = 0;
         this.Renamed1223.x = 0;
         this.Renamed1223.y = 0;
         this.Renamed1223.z = 0;
         var _loc6_:Vector3 = this.body.state.velocity;
         var _loc7_:int = 0;
         while(_loc7_ < this.Renamed860)
         {
            _loc2_ = this.Renamed861[_loc7_];
            _loc2_.update(param1);
            if(_loc2_.Renamed5782)
            {
               ++this.Renamed1217;
               this.body.addWorldForceScaled(_loc2_.Renamed862(),_loc2_.Renamed5793(),-_loc2_.Renamed5787);
               this.Renamed1223.x += _loc2_.Renamed5784.x;
               this.Renamed1223.y += _loc2_.Renamed5784.y;
               this.Renamed1223.z += _loc2_.Renamed5784.z;
               _loc3_ = _loc6_.x - _loc2_.Renamed5784.x;
               _loc4_ = _loc6_.y - _loc2_.Renamed5784.y;
               _loc5_ = _loc6_.z - _loc2_.Renamed5784.z;
               _loc2_.speed = Math.sqrt(_loc3_ * _loc3_ + _loc4_ * _loc4_ + _loc5_ * _loc5_);
            }
            else
            {
               _loc2_.speed = 0;
            }
            _loc7_++;
         }
         if(this.Renamed1217 > 1)
         {
            this.Renamed1223.x /= this.Renamed1217;
            this.Renamed1223.y /= this.Renamed1217;
            this.Renamed1223.z /= this.Renamed1217;
         }
      }
      
      public function Renamed1221(param1:Number, param2:Number) : void
      {
         var _loc3_:Number = NaN;
         if(this.Renamed858 < param1)
         {
            _loc3_ = this.Renamed858 + param2;
            this.Renamed858 = _loc3_ > param1 ? Number(param1) : Number(_loc3_);
         }
         else if(this.Renamed858 > param1)
         {
            _loc3_ = this.Renamed858 - param2;
            this.Renamed858 = _loc3_ < param1 ? Number(param1) : Number(_loc3_);
         }
      }
   }
}

