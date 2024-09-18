package Renamed475
{
   import alternativa.math.Vector3;
   import alternativa.physics.Body;
   import alternativa.physics.collision.types.RayHit;
   import alternativa.tanks.battle.Renamed804;
   import alternativa.tanks.battle.objects.tank.Tank;
   import alternativa.tanks.battle.objects.tank.Renamed841;
   import Renamed373.Renamed665;
   import Renamed373.Renamed666;
   
   public class Renamed9366 implements Renamed804
   {
      private static const Renamed1299:RayHit = new RayHit();
      
      private var center:Vector3;
      
      private var Renamed9391:Renamed4631;
      
      private var Renamed6334:Number;
      
      private var Renamed6335:Boolean;
      
      private var Renamed6332:Number;
      
      private var Renamed6333:Boolean;
      
      private var pointId:int;
      
      private var Renamed6117:Number;
      
      private var collisionDetector:Renamed665;
      
      public function Renamed9366(param1:Vector3, param2:Number, param3:Number, param4:int, param5:Renamed4631, param6:Renamed665, param7:Number)
      {
         super();
         this.center = param1;
         this.Renamed6334 = param2;
         this.pointId = param4;
         this.Renamed9391 = param5;
         this.Renamed6332 = param3;
         this.collisionDetector = param6;
         this.Renamed6117 = param7;
      }
      
      public function reset() : void
      {
         this.Renamed6335 = false;
         this.Renamed6333 = false;
      }
      
      public function checkTrigger(param1:Body) : void
      {
         var _loc2_:Vector3 = null;
         var _loc3_:Tank = param1.tank;
         if(_loc3_.tankData.spawnState == Renamed841.Renamed854)
         {
            _loc2_ = param1.state.position;
            this.Renamed6336(_loc2_);
            this.Renamed5402(_loc2_);
         }
         else
         {
            if(this.Renamed6335)
            {
               this.Renamed6335 = false;
               this.Renamed9391.Renamed6327(this.pointId);
            }
            if(this.Renamed6333)
            {
               this.Renamed6333 = false;
               this.Renamed9391.Renamed9389(this.pointId);
            }
         }
      }
      
      private function Renamed6336(param1:Vector3) : void
      {
         var _loc2_:Number = Vector3.distanceBetween(param1,this.center);
         if(this.Renamed6335)
         {
            if(_loc2_ > this.Renamed6334 || !this.Renamed6337(param1))
            {
               this.Renamed6335 = false;
               this.Renamed9391.Renamed6327(this.pointId);
            }
         }
         else if(_loc2_ <= this.Renamed6334 && this.Renamed6337(param1))
         {
            this.Renamed6335 = true;
            this.Renamed9391.Renamed6326(this.pointId);
         }
      }
      
      private function Renamed5402(param1:Vector3) : void
      {
         var _loc2_:Number = param1.distanceToXY(this.center);
         if(this.Renamed6333)
         {
            if(_loc2_ > this.Renamed6332 || !this.Renamed5403(param1))
            {
               this.Renamed6333 = false;
               this.Renamed9391.Renamed9389(this.pointId);
            }
         }
         else if(_loc2_ <= this.Renamed6332 && this.Renamed5403(param1))
         {
            this.Renamed6333 = true;
            this.Renamed9391.Renamed9388(this.pointId);
         }
      }
      
      private function Renamed6337(param1:Vector3) : Boolean
      {
         var _loc2_:Vector3 = new Vector3(this.center.x,this.center.y,this.center.z + this.Renamed6117);
         var _loc3_:Vector3 = param1.clone().subtract(_loc2_);
         return !this.collisionDetector.raycastStatic(_loc2_,_loc3_,Renamed666.Renamed690,1,null,Renamed1299);
      }
      
      private function Renamed5403(param1:Vector3) : Boolean
      {
         var _loc2_:Vector3 = null;
         var _loc3_:Vector3 = null;
         var _loc4_:Vector3 = null;
         _loc2_ = new Vector3(this.center.x,this.center.y,this.center.z + this.Renamed6117);
         if(this.collisionDetector.raycastStatic(param1,Vector3.DOWN,Renamed666.Renamed690,10000000000,null,Renamed1299))
         {
            _loc3_ = Renamed1299.position;
            _loc3_.z += 0.1;
            _loc4_ = _loc3_.subtract(_loc2_);
            return !this.collisionDetector.raycastStatic(_loc2_,_loc4_,Renamed666.Renamed690,1,null,Renamed1299);
         }
         return false;
      }
   }
}

