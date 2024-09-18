package §false const case§
{
   import alternativa.math.Matrix3;
   import alternativa.math.Vector3;
   import alternativa.physics.Body;
   import alternativa.physics.collision.IRayCollisionFilter;
   import alternativa.physics.collision.types.RayHit;
   import alternativa.tanks.models.weapon.shared.§@"e§;
   import §for set super§.§!"N§;
   import §for set super§.§super const continue§;
   
   public class §3"8§ implements IRayCollisionFilter
   {
      private static const §extends const default§:RayHit = new RayHit();
      
      private static const §throw package break§:Vector3 = new Vector3();
      
      private static const §package set var§:Vector3 = new Vector3();
      
      private static const direction:Vector3 = new Vector3();
      
      private static const matrix:Matrix3 = new Matrix3();
      
      private var §switch set finally§:Number;
      
      private var §="q§:int;
      
      private var §with const set§:Number;
      
      private var §7"[§:int;
      
      private var §1#0§:Number;
      
      private var §5#k§:§##Z§;
      
      private var §switch for null§:Number;
      
      private var §>#D§:int;
      
      private var §8#?§:Body;
      
      private var collisionDetector:§!"N§;
      
      private var maxRicochetCount:int;
      
      public function §3"8§(param1:Number, param2:int, param3:Number, param4:int, param5:Number, param6:§!"N§, param7:§##Z§, param8:int)
      {
         super();
         this.§switch set finally§ = param1;
         this.§="q§ = param2;
         this.§with const set§ = param3;
         this.§7"[§ = param4;
         this.§1#0§ = param5;
         this.§5#k§ = param7;
         this.collisionDetector = param6;
         this.maxRicochetCount = param8;
      }
      
      public function considerBody(param1:Body) : Boolean
      {
         return this.§8#?§ != param1 || this.§>#D§ > 0;
      }
      
      public function §continue var break§(param1:Vector3, param2:Vector3, param3:Vector3, param4:Body, param5:Vector3) : void
      {
         this.§1$#§(param4);
         this.§continue const final§(param1,param2,0,param5);
         this.§package with§(param1,param2,param3,this.§switch set finally§ / this.§="q§,this.§="q§,param5);
         this.§package with§(param1,param2,param3,-this.§with const set§ / this.§7"[§,this.§7"[§,param5);
         this.§var set for§(param5,param2);
      }
      
      private function §1$#§(param1:Body) : void
      {
         this.§8#?§ = param1;
         this.§switch for null§ = 0;
      }
      
      private function §continue const final§(param1:Vector3, param2:Vector3, param3:Number, param4:Vector3) : void
      {
         var _loc5_:Body = null;
         var _loc6_:* = false;
         this.§>#D§ = 0;
         §throw package break§.copy(param1);
         §package set var§.copy(param2);
         var _loc7_:Number = this.§1#0§;
         while(_loc7_ > 0)
         {
            if(!this.collisionDetector.raycast(§throw package break§,§package set var§,§super const continue§.WEAPON,_loc7_,this,§extends const default§))
            {
               return;
            }
            _loc7_ -= §extends const default§.t;
            if(_loc7_ -= §extends const default§.t < 0)
            {
               _loc7_ = 0;
            }
            _loc5_ = §extends const default§.shape.body;
            _loc6_ = false;
            if(_loc5_.tank != null)
            {
               if(this.§>#D§ > 0)
               {
                  _loc6_ = true;
               }
               else
               {
                  _loc6_ = !§@"e§.§final var override§(§throw package break§,§extends const default§.position);
               }
            }
            if(_loc5_.tank != null && _loc5_ != this.§8#?§ && _loc6_)
            {
               this.§'!T§(_loc5_,_loc7_,param3,param2,param4);
               return;
            }
            if(_loc6_)
            {
               return;
            }
            if(!this.§!!%§())
            {
               return;
            }
         }
      }
      
      private function §'!T§(param1:Body, param2:Number, param3:Number, param4:Vector3, param5:Vector3) : void
      {
         var _loc6_:Number = this.§1#0§ - param2;
         var _loc7_:Number = this.§5#k§.§case var try§(param1,this.§>#D§,_loc6_,param3,this.§1#0§,Math.max(this.§switch set finally§,this.§with const set§));
         if(_loc7_ > this.§switch for null§)
         {
            this.§switch for null§ = _loc7_;
            param5.copy(param4);
         }
      }
      
      private function §!!%§() : Boolean
      {
         var _loc1_:Vector3 = null;
         if(this.§>#D§ < this.maxRicochetCount)
         {
            ++this.§>#D§;
            _loc1_ = §extends const default§.normal;
            §package set var§.addScaled(-2 * §package set var§.dot(_loc1_),_loc1_);
            §throw package break§.copy(§extends const default§.position).addScaled(0.5,_loc1_);
            return true;
         }
         return false;
      }
      
      private function §package with§(param1:Vector3, param2:Vector3, param3:Vector3, param4:Number, param5:int, param6:Vector3) : void
      {
         direction.copy(param2);
         matrix.fromAxisAngle(param3,param4);
         if(param4 < 0)
         {
            param4 = -param4;
         }
         var _loc7_:Number = param4;
         var _loc8_:int = 0;
         while(_loc8_ < param5)
         {
            direction.transform3(matrix);
            this.§continue const final§(param1,direction,_loc7_,param6);
            _loc8_++;
            _loc7_ += param4;
         }
      }
      
      private function §var set for§(param1:Vector3, param2:Vector3) : void
      {
         this.§8#?§ = null;
         if(this.§switch for null§ == 0)
         {
            param1.copy(param2);
         }
      }
   }
}

