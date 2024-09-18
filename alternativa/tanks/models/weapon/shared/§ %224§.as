package alternativa.tanks.models.weapon.shared
{
   import alternativa.math.Matrix3;
   import alternativa.math.Vector3;
   import alternativa.physics.Body;
   import alternativa.physics.collision.types.RayHit;
   import alternativa.tanks.utils.EncryptedNumber;
   import alternativa.tanks.utils.EncryptedNumberImpl;
   import flash.utils.Dictionary;
   import §for set super§.§!"N§;
   import §for set super§.§super const continue§;
   
   public class § "4§
   {
      private static const §null const if§:int = §super const continue§.WEAPON;
      
      private static const origin:Vector3 = new Vector3();
      
      private var range:EncryptedNumber;
      
      private var §=$!§:EncryptedNumber;
      
      private var §@x§:int;
      
      private var §super const try§:int;
      
      private var collisionDetector:§!"N§;
      
      private var §package package break§:§%!v§;
      
      private var §implements for continue§:Dictionary;
      
      private var §,]§:Dictionary;
      
      public function § "4§(param1:Number, param2:Number, param3:int, param4:int, param5:§!"N§, param6:§%!v§)
      {
         this.§""l§ = new Vector3();
         this.matrix = new Matrix3();
         this.§get catch break§ = new Matrix3();
         this.§extends const default§ = new RayHit();
         this.§3!<§ = new §+!f§();
         this.§2#D§ = new Vector3();
         this.§6u§ = new Vector3();
         super();
         this.range = new EncryptedNumberImpl(param1);
         this.§=$!§ = new EncryptedNumberImpl(0.5 * param2);
         this.§@x§ = param3;
         this.§super const try§ = param4;
         this.collisionDetector = param5;
         this.§package package break§ = param6;
      }
      
      public function §else const implements§(param1:Body, param2:Number, param3:Number, param4:Vector3, param5:Vector3, param6:Vector3, param7:Vector.<Body>, param8:Vector.<Number>, param9:Vector.<Vector3>) : void
      {
         var _loc18_:* = undefined;
         var _loc10_:* = undefined;
         var _loc11_:Number = NaN;
         this.§3!<§.shooter = param1;
         this.§implements for continue§ = new Dictionary();
         this.§,]§ = new Dictionary();
         var _loc12_:Number = param3 * param2;
         var _loc13_:Number = param2 - _loc12_;
         if(this.collisionDetector.raycast(param4,param5,§null const if§,param2,this.§3!<§,this.§extends const default§) && this.§extends const default§.shape.body.tank == null)
         {
            return;
         }
         this.§""l§.copy(param6);
         this.§6u§.copy(param4).addScaled(_loc12_,param5);
         var _loc14_:Number = this.range.getNumber() + _loc13_;
         this.§implements var throw§(this.§6u§,param5,_loc14_);
         this.§get catch break§.fromAxisAngle(param5,Math.PI / this.§super const try§);
         var _loc15_:Number = this.§=$!§.getNumber() / this.§@x§;
         var _loc16_:int = 0;
         while(_loc16_ < this.§super const try§)
         {
            this.§static var override§(this.§6u§,param5,this.§""l§,_loc14_,this.§@x§,_loc15_);
            this.§static var override§(this.§6u§,param5,this.§""l§,_loc14_,this.§@x§,-_loc15_);
            this.§""l§.transform3(this.§get catch break§);
            _loc16_++;
         }
         var _loc17_:int = 0;
         for(_loc18_ in this.§implements for continue§)
         {
            param7[_loc17_] = _loc18_;
            _loc11_ = this.§implements for continue§[_loc18_] - _loc13_;
            if(_loc11_ < 0)
            {
               _loc11_ = 0;
            }
            param8[_loc17_] = _loc11_;
            param9[_loc17_] = this.§,]§[_loc18_];
            _loc17_++;
         }
         param7.length = _loc17_;
         param8.length = _loc17_;
         this.§3!<§.shooter = null;
         this.§3!<§.§]!C§();
         this.§implements for continue§ = null;
      }
      
      private function §static var override§(param1:Vector3, param2:Vector3, param3:Vector3, param4:Number, param5:int, param6:Number) : void
      {
         var _loc7_:Number = 0;
         var _loc8_:int = 0;
         while(_loc8_ < param5)
         {
            _loc7_ += param6;
            this.matrix.fromAxisAngle(param3,_loc7_);
            this.matrix.transformVector(param2,this.§2#D§);
            this.§implements var throw§(param1,this.§2#D§,param4);
            _loc8_++;
         }
      }
      
      private function §implements var throw§(param1:Vector3, param2:Vector3, param3:Number) : void
      {
         var _loc4_:Body = null;
         var _loc5_:Number = NaN;
         origin.copy(param1);
         var _loc6_:Number = 0;
         if(this.collisionDetector.raycast(origin,param2,§null const if§,param3,this.§3!<§,this.§extends const default§))
         {
            _loc4_ = this.§extends const default§.shape.body;
            if(_loc4_.tank != null && !§@"e§.§final var override§(origin,this.§extends const default§.position))
            {
               origin.addScaled(this.§extends const default§.t,param2);
               _loc6_ += this.§extends const default§.t;
               if(this.§package package break§.§true const continue§(_loc4_))
               {
                  this.§3!<§.§include package default§(_loc4_);
                  _loc5_ = Number(this.§implements for continue§[_loc4_]);
                  if(isNaN(_loc5_) || _loc5_ > _loc6_)
                  {
                     this.§implements for continue§[_loc4_] = _loc6_;
                     this.§,]§[_loc4_] = this.§extends const default§.position.clone();
                  }
               }
               else
               {
                  this.§3!<§.§+"H§(_loc4_);
               }
            }
         }
         this.§3!<§.§false for var§();
      }
   }
}

