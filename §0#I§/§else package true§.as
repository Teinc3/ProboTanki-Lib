package §0#I§
{
   import alternativa.math.Vector3;
   import alternativa.physics.Body;
   import alternativa.physics.collision.CollisionDetector;
   import alternativa.physics.collision.types.RayHit;
   import alternativa.tanks.battle.§`§;
   import alternativa.tanks.battle.objects.tank.Tank;
   import alternativa.tanks.battle.objects.tank.§continue var case§;
   import §for set super§.§super const continue§;
   
   public class §else package true§ implements §`§
   {
      private static const §-!p§:Number = 250;
      
      private static const §extends const default§:RayHit = new RayHit();
      
      private var center:Vector3;
      
      private var §with package extends§:§break for catch§;
      
      private var §^!"§:Number;
      
      private var §0"%§:Boolean;
      
      private var §while in§:Number;
      
      private var §get set get§:Boolean;
      
      private var collisionDetector:CollisionDetector;
      
      public function §else package true§(param1:Vector3, param2:Number, param3:Number, param4:§break for catch§, param5:CollisionDetector)
      {
         super();
         this.collisionDetector = param5;
         this.center = param1.clone();
         this.§^!"§ = param2 * param2;
         this.§while in§ = param3;
         this.§with package extends§ = param4;
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
               this.§with package extends§.§<"v§();
            }
            if(this.§0"%§)
            {
               this.§0"%§ = false;
               this.§with package extends§.§case package native§();
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
               this.§with package extends§.§<"v§();
            }
         }
         else if(_loc2_ <= this.§while in§ && this.§%#z§(param1))
         {
            this.§get set get§ = true;
            this.§with package extends§.§%A§();
         }
      }
      
      private function §%#z§(param1:Vector3) : Boolean
      {
         var _loc2_:Vector3 = new Vector3(this.center.x,this.center.y,this.center.z + §-!p§);
         var _loc3_:Vector3 = param1.clone().subtract(_loc2_);
         return !this.collisionDetector.raycastStatic(_loc2_,_loc3_,§super const continue§.§finally catch while§,1,null,§extends const default§);
      }
      
      private function §dynamic set finally§(param1:Vector3) : void
      {
         var _loc2_:Number = param1.distanceToXYSquared(this.center);
         if(this.§0"%§)
         {
            if(_loc2_ > this.§^!"§ || !this.§return static§(param1))
            {
               this.§0"%§ = false;
               this.§with package extends§.§case package native§();
            }
         }
         else if(_loc2_ <= this.§^!"§ && this.§return static§(param1))
         {
            this.§0"%§ = true;
            this.§with package extends§.§?$#§();
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

