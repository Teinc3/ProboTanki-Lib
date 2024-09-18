package §%3§
{
   import alternativa.math.Vector3;
   import alternativa.physics.Body;
   import alternativa.physics.collision.CollisionDetector;
   import alternativa.physics.collision.types.RayHit;
   import alternativa.tanks.battle.§`§;
   import §for set super§.§super const continue§;
   
   public class §0#t§ implements §`§
   {
      private static const §-!p§:Number = 250;
      
      private static const §extends const default§:RayHit = new RayHit();
      
      private var center:Vector3;
      
      private var §const catch dynamic§:Number;
      
      private var §9A§:§?"p§;
      
      private var §<!I§:Boolean;
      
      private var collisionDetector:CollisionDetector;
      
      public function §0#t§(param1:Vector3, param2:Number, param3:§?"p§, param4:CollisionDetector)
      {
         super();
         this.collisionDetector = param4;
         this.center = param1.clone();
         this.§const catch dynamic§ = param2 * param2;
         this.§9A§ = param3;
      }
      
      public function reset() : void
      {
         this.§<!I§ = false;
      }
      
      public function checkTrigger(param1:Body) : void
      {
         var _loc2_:Vector3 = param1.state.position;
         this.§dynamic set finally§(_loc2_);
         var _loc3_:Number = _loc2_.x - this.center.x;
         var _loc4_:Number = _loc2_.y - this.center.y;
         var _loc5_:Number = _loc2_.z - this.center.z;
         var _loc6_:Number = _loc3_ * _loc3_ + _loc4_ * _loc4_ + _loc5_ * _loc5_;
         if(this.§<!I§)
         {
            if(_loc6_ > this.§const catch dynamic§)
            {
               this.§<!I§ = false;
               this.§9A§.§case package native§();
            }
         }
         else if(_loc6_ <= this.§const catch dynamic§)
         {
            this.§<!I§ = true;
            this.§9A§.§?$#§();
         }
      }
      
      private function §dynamic set finally§(param1:Vector3) : void
      {
         var _loc2_:Number = param1.distanceToXYSquared(this.center);
         if(this.§<!I§)
         {
            if(_loc2_ > this.§const catch dynamic§ || !this.§return static§(param1))
            {
               this.§<!I§ = false;
               this.§9A§.§case package native§();
            }
         }
         else if(_loc2_ <= this.§const catch dynamic§ && this.§return static§(param1))
         {
            this.§<!I§ = true;
            this.§9A§.§?$#§();
         }
      }
      
      private function §return static§(param1:Vector3) : Boolean
      {
         var _loc2_:Vector3 = null;
         var _loc3_:Vector3 = null;
         var _loc4_:Vector3 = new Vector3(this.center.x,this.center.y,this.center.z + §-!p§);
         if(this.collisionDetector.raycastStatic(param1,Vector3.DOWN,§super const continue§.§finally catch while§,10000000000,null,§extends const default§))
         {
            _loc2_ = §extends const default§.position;
            _loc2_.z += 0.1;
            _loc3_ = _loc2_.subtract(_loc4_);
            return !this.collisionDetector.raycastStatic(_loc4_,_loc3_,§super const continue§.§finally catch while§,1,null,§extends const default§);
         }
         return false;
      }
   }
}

