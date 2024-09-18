package §switch var return§
{
   import §-!!§.§6!<§;
   import §7"j§.§finally const package§;
   import §7"j§.§null catch while§;
   import alternativa.engine3d.core.Object3D;
   import alternativa.math.Matrix3;
   import alternativa.math.Matrix4;
   import alternativa.math.Vector3;
   import alternativa.physics.Body;
   import alternativa.physics.collision.CollisionDetector;
   import alternativa.physics.collision.types.RayHit;
   import alternativa.tanks.camera.§3!0§;
   import alternativa.tanks.models.weapon.shared.§+"-§;
   import alternativa.tanks.utils.EncryptedInt;
   import alternativa.tanks.utils.EncryptedIntImpl;
   import §extends for const§.§1Q§;
   import §extends for const§.§["D§;
   import §finally package else§.§;!q§;
   import flash.geom.ColorTransform;
   import flash.utils.getTimer;
   import §for set super§.§super const continue§;
   
   public class §%]§ extends §["D§ implements §finally const package§
   {
      private static const §throw catch while§:EncryptedInt = new EncryptedIntImpl(1000);
      
      private static const §import package if§:int = 20;
      
      private static const §override set super§:Number = 3;
      
      private static const matrix:Matrix3 = new Matrix3();
      
      private static const §with const false§:Matrix4 = new Matrix4();
      
      private static const §if package var§:Vector3 = new Vector3();
      
      private static const direction:Vector3 = new Vector3();
      
      private static const §`#V§:Vector3 = new Vector3();
      
      private static const §each const continue§:Vector3 = new Vector3();
      
      private static const §continue set static§:Vector3 = new Vector3();
      
      private static const intersection:RayHit = new RayHit();
      
      private var _range:Number;
      
      private var §import package while§:Number;
      
      private var particleSpeed:Number;
      
      private var §%#a§:Vector3;
      
      private var turret:Object3D;
      
      private var sfxData:§null package throw§;
      
      private var collisionDetector:CollisionDetector;
      
      private var §'"R§:Vector.<§+"-§>;
      
      private var §""H§:Number;
      
      private var §import catch with§:Number;
      
      private var time:int;
      
      private var §super for implements§:int;
      
      private var §-!D§:int;
      
      private var container:§6!<§;
      
      private var dead:Boolean;
      
      private var §-"§:§case set implements§;
      
      private var §8#?§:Body;
      
      private var §%#'§:Number;
      
      private var §override const throw§:Number;
      
      private var §&#W§:Number;
      
      private var §function throw§:Number;
      
      public function §%]§(param1:§1Q§)
      {
         this.§%#a§ = new Vector3();
         this.§'"R§ = new Vector.<§+"-§>(§import package if§);
         super(param1);
         this.§-"§ = new §case set implements§();
      }
      
      public function init(param1:Body, param2:Number, param3:Number, param4:Number, param5:Vector3, param6:Object3D, param7:§null package throw§, param8:CollisionDetector, param9:Number, param10:Number, param11:Number, param12:Number, param13:Number, param14:Number) : void
      {
         this.§8#?§ = param1;
         this._range = param2;
         this.§import package while§ = Math.tan(0.5 * param3);
         this.particleSpeed = param4;
         this.§%#a§.copy(param5);
         this.turret = param6;
         this.sfxData = param7;
         this.collisionDetector = param8;
         this.§%#'§ = param11;
         this.§override const throw§ = param12;
         this.§&#W§ = param13;
         this.§function throw§ = param14;
         this.§-"§.resize(param9,param10);
         this.§""H§ = 2 * (param12 - param11) / param2;
         this.§import catch with§ = 1000 * param2 / (§import package if§ * param4);
         this.§-!D§ = 0;
         this.time = this.§super for implements§ = getTimer();
         this.§else const try§(param7);
         this.dead = false;
      }
      
      private function §else const try§(param1:§null package throw§) : void
      {
         var _loc2_:§;!q§ = null;
         var _loc3_:ColorTransform = null;
         this.§-"§.init(param1.§if var package§);
         if(param1.§#k§ != null)
         {
            _loc2_ = param1.§#k§[0];
            _loc3_ = this.§-"§.colorTransform == null ? new ColorTransform() : this.§-"§.colorTransform;
            _loc3_.alphaMultiplier = _loc2_.alphaMultiplier;
            _loc3_.alphaOffset = _loc2_.alphaOffset;
            _loc3_.redMultiplier = _loc2_.redMultiplier;
            _loc3_.redOffset = _loc2_.redOffset;
            _loc3_.greenMultiplier = _loc2_.greenMultiplier;
            _loc3_.greenOffset = _loc2_.greenOffset;
            _loc3_.blueMultiplier = _loc2_.blueMultiplier;
            _loc3_.blueOffset = _loc2_.blueOffset;
            this.§-"§.colorTransform = _loc3_;
         }
         else
         {
            this.§-"§.colorTransform = null;
         }
      }
      
      public function destroy() : void
      {
         while(this.§-!D§ > 0)
         {
            this.§7?§(0);
         }
         this.container.removeChild(this.§-"§);
         this.§-"§.clear();
         this.container = null;
         this.§8#?§ = null;
         this.turret = null;
         this.sfxData = null;
         this.collisionDetector = null;
         recycle();
      }
      
      public function play(param1:int, param2:§3!0§) : Boolean
      {
         var _loc3_:Number = NaN;
         var _loc4_:§+"-§ = null;
         var _loc5_:Vector3 = null;
         var _loc6_:Number = NaN;
         this.§=#E§();
         _loc3_ = param1 / §throw catch while§.getInt();
         if(this.collisionDetector.raycastStatic(§if package var§,direction,§super const continue§.§finally catch while§,this.§%#a§.y + this.§-"§.length,null,intersection))
         {
            this.§-"§.visible = false;
         }
         else
         {
            this.§-"§.visible = true;
            this.§-"§.update(_loc3_,this.sfxData.§if var package§.fps);
            §null catch while§.§native var static§(this.§-"§,§continue set static§,direction,param2.position);
         }
         if(!this.dead && this.§-!D§ < §import package if§ && this.time >= this.§super for implements§)
         {
            this.§super for implements§ += this.§import catch with§;
            this.§with catch if§();
         }
         var _loc7_:int = 0;
         while(_loc7_ < this.§-!D§)
         {
            _loc4_ = this.§'"R§[_loc7_];
            §each const continue§.x = _loc4_.x;
            §each const continue§.y = _loc4_.y;
            §each const continue§.z = _loc4_.z;
            if(_loc4_.§static set native§ > this._range || this.collisionDetector.raycastStatic(§each const continue§,_loc4_.velocity,§super const continue§.WEAPON,_loc3_,null,intersection))
            {
               this.§7?§(_loc7_--);
            }
            else
            {
               _loc5_ = _loc4_.velocity;
               _loc4_.x += _loc5_.x * _loc3_;
               _loc4_.y += _loc5_.y * _loc3_;
               _loc4_.z += _loc5_.z * _loc3_;
               _loc4_.§static set native§ += this.particleSpeed * _loc3_;
               _loc4_.rotation += §override set super§ * _loc3_ * _loc4_.§if var get§;
               _loc4_.§true const switch§(_loc4_.§2!2§);
               _loc4_.§2!2§ += this.sfxData.§18§.fps * _loc3_;
               _loc6_ = this.§%#'§ + this.§""H§ * _loc4_.§static set native§;
               if(_loc6_ > this.§override const throw§)
               {
                  _loc6_ = this.§override const throw§;
               }
               _loc4_.width = _loc6_;
               _loc4_.height = _loc6_;
               _loc4_.§@"%§(this._range,this.sfxData.§return throw§);
            }
            _loc7_++;
         }
         this.time += param1;
         return !this.dead || this.§-!D§ > 0;
      }
      
      public function kill() : void
      {
         if(!this.dead)
         {
            this.dead = true;
            this.container.removeChild(this.§-"§);
         }
      }
      
      public function §&"-§(param1:§6!<§) : void
      {
         this.container = param1;
         param1.addChild(this.§-"§);
      }
      
      private function §=#E§() : void
      {
         var _loc1_:Number = NaN;
         §with const false§.setMatrix(this.turret.x,this.turret.y,this.turret.z,this.turret.rotationX,this.turret.rotationY,this.turret.rotationZ);
         §`#V§.x = §with const false§.m00;
         §`#V§.y = §with const false§.m10;
         §`#V§.z = §with const false§.m20;
         direction.x = §with const false§.m01;
         direction.y = §with const false§.m11;
         direction.z = §with const false§.m21;
         §with const false§.transformVector(this.§%#a§,§continue set static§);
         _loc1_ = this.§%#a§.y;
         §if package var§.x = §continue set static§.x - _loc1_ * direction.x;
         §if package var§.y = §continue set static§.y - _loc1_ * direction.y;
         §if package var§.z = §continue set static§.z - _loc1_ * direction.z;
      }
      
      private function §with catch if§() : void
      {
         var _loc1_:Number = this.§&#W§ + Math.random() * this.§function throw§;
         if(!this.§-"§.visible && intersection.t < this.§%#a§.y + _loc1_)
         {
            return;
         }
         var _loc2_:§+"-§ = §+"-§.§with var for§();
         _loc2_.§do var super§(this.sfxData.§18§);
         _loc2_.rotation = Math.random() * Math.PI * 2;
         _loc2_.§2!2§ = Math.random() * _loc2_.getNumFrames();
         this.§continue set implements§(direction);
         _loc2_.velocity.x = this.particleSpeed * direction.x;
         _loc2_.velocity.y = this.particleSpeed * direction.y;
         _loc2_.velocity.z = this.particleSpeed * direction.z;
         _loc2_.velocity.add(this.§8#?§.state.velocity);
         _loc2_.§static set native§ = _loc1_;
         _loc2_.x = §continue set static§.x + _loc1_ * direction.x;
         _loc2_.y = §continue set static§.y + _loc1_ * direction.y;
         _loc2_.z = §continue set static§.z + _loc1_ * direction.z;
         _loc2_.§if var get§ = Math.random() < 0.5 ? int(1) : int(-1);
         var _loc3_:* = this.§-!D§++;
         this.§'"R§[_loc3_] = _loc2_;
         this.container.addChild(_loc2_);
      }
      
      private function §7?§(param1:int) : void
      {
         var _loc2_:§+"-§ = this.§'"R§[param1];
         this.§'"R§[param1] = this.§'"R§[--this.§-!D§];
         this.§'"R§[this.§-!D§] = null;
         this.container.removeChild(_loc2_);
         _loc2_.dispose();
      }
      
      private function §continue set implements§(param1:Vector3) : void
      {
         var _loc2_:Number = NaN;
         var _loc3_:Number = 2 * Math.PI * Math.random();
         matrix.fromAxisAngle(param1,_loc3_);
         §`#V§.transform3(matrix);
         _loc2_ = this._range * this.§import package while§ * Math.random();
         param1.x = param1.x * this._range + §`#V§.x * _loc2_;
         param1.y = param1.y * this._range + §`#V§.y * _loc2_;
         param1.z = param1.z * this._range + §`#V§.z * _loc2_;
         param1.normalize();
      }
      
      public function get §try catch null§() : Vector.<§+"-§>
      {
         return this.§'"R§;
      }
      
      public function get §6"B§() : int
      {
         return this.§-!D§;
      }
      
      public function get range() : Number
      {
         return this._range;
      }
   }
}

