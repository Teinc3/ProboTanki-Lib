package §]!3§
{
   import alternativa.math.Vector3;
   import alternativa.physics.Body;
   import alternativa.physics.collision.types.RayHit;
   import alternativa.tanks.battle.§`§;
   import alternativa.tanks.battle.objects.tank.Tank;
   import alternativa.tanks.battle.objects.tank.§continue var case§;
   import §for set super§.§!"N§;
   import §for set super§.§super const continue§;
   
   public class §in package§ implements §`§
   {
      private static const §extends const default§:RayHit = new RayHit();
      
      private var center:Vector3;
      
      private var §if set break§:§throw var each§;
      
      private var §while in§:Number;
      
      private var §get set get§:Boolean;
      
      private var §^!"§:Number;
      
      private var §0"%§:Boolean;
      
      private var pointId:int;
      
      private var §;%§:Number;
      
      private var collisionDetector:§!"N§;
      
      public function §in package§(param1:Vector3, param2:Number, param3:Number, param4:int, param5:§throw var each§, param6:§!"N§, param7:Number)
      {
         super();
         this.center = param1;
         this.§while in§ = param2;
         this.pointId = param4;
         this.§if set break§ = param5;
         this.§^!"§ = param3;
         this.collisionDetector = param6;
         this.§;%§ = param7;
      }
      
      public function reset() : void
      {
         this.§get set get§ = false;
         this.§0"%§ = false;
      }
      
      public function checkTrigger(param1:Body) : void
      {
         var _loc2_:Vector3 = null;
         var _loc3_:Tank = param1.tank;
         if(_loc3_.tankData.spawnState == §continue var case§.§?!S§)
         {
            _loc2_ = param1.state.position;
            this.§null const get§(_loc2_);
            this.§dynamic set finally§(_loc2_);
         }
         else
         {
            if(this.§get set get§)
            {
               this.§get set get§ = false;
               this.§if set break§.§<"v§(this.pointId);
            }
            if(this.§0"%§)
            {
               this.§0"%§ = false;
               this.§if set break§.§dynamic set else§(this.pointId);
            }
         }
      }
      
      private function §null const get§(param1:Vector3) : void
      {
         var _loc2_:Number = Vector3.distanceBetween(param1,this.center);
         if(this.§get set get§)
         {
            if(_loc2_ > this.§while in§ || !this.§%#z§(param1))
            {
               this.§get set get§ = false;
               this.§if set break§.§<"v§(this.pointId);
            }
         }
         else if(_loc2_ <= this.§while in§ && this.§%#z§(param1))
         {
            this.§get set get§ = true;
            this.§if set break§.§%A§(this.pointId);
         }
      }
      
      private function §dynamic set finally§(param1:Vector3) : void
      {
         var _loc2_:Number = param1.distanceToXY(this.center);
         if(this.§0"%§)
         {
            if(_loc2_ > this.§^!"§ || !this.§return static§(param1))
            {
               this.§0"%§ = false;
               this.§if set break§.§dynamic set else§(this.pointId);
            }
         }
         else if(_loc2_ <= this.§^!"§ && this.§return static§(param1))
         {
            this.§0"%§ = true;
            this.§if set break§.§super set import§(this.pointId);
         }
      }
      
      private function §%#z§(param1:Vector3) : Boolean
      {
         var _loc2_:Vector3 = new Vector3(this.center.x,this.center.y,this.center.z + this.§;%§);
         var _loc3_:Vector3 = param1.clone().subtract(_loc2_);
         return !this.collisionDetector.raycastStatic(_loc2_,_loc3_,§super const continue§.§finally catch while§,1,null,§extends const default§);
      }
      
      private function §return static§(param1:Vector3) : Boolean
      {
         var _loc2_:Vector3 = null;
         var _loc3_:Vector3 = null;
         var _loc4_:Vector3 = null;
         _loc2_ = new Vector3(this.center.x,this.center.y,this.center.z + this.§;%§);
         if(this.collisionDetector.raycastStatic(param1,Vector3.DOWN,§super const continue§.§finally catch while§,10000000000,null,§extends const default§))
         {
            _loc3_ = §extends const default§.position;
            _loc3_.z += 0.1;
            _loc4_ = _loc3_.subtract(_loc2_);
            return !this.collisionDetector.raycastStatic(_loc2_,_loc4_,§super const continue§.§finally catch while§,1,null,§extends const default§);
         }
         return false;
      }
   }
}

