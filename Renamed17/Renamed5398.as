package Renamed17
{
   import alternativa.math.Vector3;
   import alternativa.physics.Body;
   import alternativa.physics.collision.CollisionDetector;
   import alternativa.physics.collision.types.RayHit;
   import alternativa.tanks.battle.Renamed804;
   import Renamed373.Renamed666;
   
   public class Renamed5398 implements Renamed804
   {
      private static const Renamed5399:Number = 250;
      
      private static const Renamed1299:RayHit = new RayHit();
      
      private var center:Vector3;
      
      private var Renamed5400:Number;
      
      private var Renamed122:Renamed4557;
      
      private var Renamed5401:Boolean;
      
      private var collisionDetector:CollisionDetector;
      
      public function Renamed5398(param1:Vector3, param2:Number, param3:Renamed4557, param4:CollisionDetector)
      {
         super();
         this.collisionDetector = param4;
         this.center = param1.clone();
         this.Renamed5400 = param2 * param2;
         this.Renamed122 = param3;
      }
      
      public function reset() : void
      {
         this.Renamed5401 = false;
      }
      
      public function checkTrigger(param1:Body) : void
      {
         var _loc2_:Vector3 = param1.state.position;
         this.Renamed5402(_loc2_);
         var _loc3_:Number = _loc2_.x - this.center.x;
         var _loc4_:Number = _loc2_.y - this.center.y;
         var _loc5_:Number = _loc2_.z - this.center.z;
         var _loc6_:Number = _loc3_ * _loc3_ + _loc4_ * _loc4_ + _loc5_ * _loc5_;
         if(this.Renamed5401)
         {
            if(_loc6_ > this.Renamed5400)
            {
               this.Renamed5401 = false;
               this.Renamed122.Renamed5394();
            }
         }
         else if(_loc6_ <= this.Renamed5400)
         {
            this.Renamed5401 = true;
            this.Renamed122.Renamed5393();
         }
      }
      
      private function Renamed5402(param1:Vector3) : void
      {
         var _loc2_:Number = param1.distanceToXYSquared(this.center);
         if(this.Renamed5401)
         {
            if(_loc2_ > this.Renamed5400 || !this.Renamed5403(param1))
            {
               this.Renamed5401 = false;
               this.Renamed122.Renamed5394();
            }
         }
         else if(_loc2_ <= this.Renamed5400 && this.Renamed5403(param1))
         {
            this.Renamed5401 = true;
            this.Renamed122.Renamed5393();
         }
      }
      
      private function Renamed5403(param1:Vector3) : Boolean
      {
         var _loc2_:Vector3 = null;
         var _loc3_:Vector3 = null;
         var _loc4_:Vector3 = new Vector3(this.center.x,this.center.y,this.center.z + Renamed5399);
         if(this.collisionDetector.raycastStatic(param1,Vector3.DOWN,Renamed666.Renamed690,10000000000,null,Renamed1299))
         {
            _loc2_ = Renamed1299.position;
            _loc2_.z += 0.1;
            _loc3_ = _loc2_.subtract(_loc4_);
            return !this.collisionDetector.raycastStatic(_loc4_,_loc3_,Renamed666.Renamed690,1,null,Renamed1299);
         }
         return false;
      }
   }
}

