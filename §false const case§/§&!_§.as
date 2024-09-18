package §false const case§
{
   import §%!5§.§>"Q§;
   import §%!5§.§try set finally§;
   import §+"f§.§true package case§;
   import §7"j§.§<"z§;
   import §7"j§.§do set case§;
   import §7"j§.§for var throw§;
   import §7"j§.§implements for break§;
   import §7"j§.§null catch while§;
   import §7"j§.set;
   import §7"j§.§while var if§;
   import §=#M§.§catch do§;
   import alternativa.math.Vector3;
   import alternativa.physics.Body;
   import alternativa.physics.collision.CollisionDetector;
   import alternativa.tanks.battle.§+$%§;
   import alternativa.tanks.battle.objects.tank.Tank;
   import alternativa.tanks.battle.scene3d.§[!r§;
   import alternativa.tanks.engine3d.§7J§;
   import alternativa.tanks.models.weapon.§ !8§;
   import alternativa.tanks.models.weapon.shared.§@"e§;
   import §extends for const§.§1Q§;
   import §extends for const§.§import use§;
   import flash.media.Sound;
   import §for set super§.§super const continue§;
   import §import catch function§.§package const override§;
   import §use var final§.§implements each§;
   
   public class §&!_§ extends §true package case§
   {
      public static const §;H§:Number = 300;
      
      public static const §3"Z§:Number = 266;
      
      public static const §5Z§:Number = 100;
      
      private static const §,"E§:Number = 80;
      
      private static const §in catch do§:Number = 300;
      
      private static const §import package each§:int = 6;
      
      private static const §!"!§:Vector3 = new Vector3();
      
      private static const §each set function§:Vector3 = new Vector3();
      
      private static const staticHitPoint:Vector3 = new Vector3();
      
      private var sfxData:§0!L§;
      
      private var callback:§throw native§;
      
      private var §9!i§:Vector.<Vector3>;
      
      private var §5#b§:§implements each§;
      
      private var sprite:§7J§;
      
      private var §5"2§:§catch do§;
      
      private var §>#D§:int;
      
      private var § g§:§5"^§;
      
      private var impactForce:Number;
      
      private var §8#7§:§while var if§;
      
      private var §50§:§for var throw§;
      
      private var §=!x§:§package const override§;
      
      public function §&!_§(param1:§1Q§)
      {
         super(param1);
         this.sprite = new §7J§(§;H§,§;H§);
         this.sprite.§#![§ = true;
         this.§ g§ = new §5"^§(§5Z§,§in catch do§);
         this.§9!i§ = new Vector.<Vector3>();
      }
      
      override protected function §"$ §() : §try set finally§
      {
         return §>"Q§.INSTANCE;
      }
      
      public function init(param1:Number, param2:§implements each§, param3:§0!L§, param4:§catch do§, param5:§throw native§, param6:§package const override§) : void
      {
         this.impactForce = param1;
         this.§5#b§ = param2;
         this.sfxData = param3;
         this.§5"2§ = param4;
         this.callback = param5;
         this.§=!x§ = param6;
         this.sprite.rotation = 2 * Math.PI * Math.random();
         this.sprite.§do var super§(param3.§case package finally§);
         this.sprite.§true const switch§(this.sprite.getNumFrames() * Math.random());
         this.§ g§.setMaterialToAllFaces(param3.§@#J§);
         this.§>#D§ = 0;
         this.§9!i§.length = 0;
         this.§8#7§ = §while var if§(battleService.§class while§().getObject(§while var if§));
         this.§50§ = §for var throw§(battleService.§class while§().getObject(§for var throw§));
         this.§8#7§.init(this.§50§,param3.§%!P§,§while var if§.§?D§,true);
      }
      
      override public function §const const while§(param1:§ !8§, param2:Vector3, param3:Body, param4:int = -1) : void
      {
         super.§const const while§(param1,param2,param3,param4);
         var _loc5_:§[!r§ = battleService.§3l§();
         _loc5_.§with catch with§(this.sprite);
         _loc5_.§with catch with§(this.§ g§);
         _loc5_.§const var extends§(this.§ g§);
         _loc5_.§7"0§(this.§8#7§);
      }
      
      override protected function update(param1:Number) : void
      {
         var _loc2_:Body = null;
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:int = 0;
         var _loc6_:Vector3 = null;
         var _loc7_:Boolean = false;
         var _loc8_:Number = NaN;
         if(§function catch with§ >= this.§5#b§.shotDistance)
         {
            this.destroy();
            return;
         }
         var _loc9_:CollisionDetector = battleService.§'x§().§const const true§();
         var _loc10_:Number = this.§5#b§.shellSpeed * param1;
         §default catch§.copy(§try catch extends§);
         while(_loc10_ > 0)
         {
            _loc3_ = -1;
            _loc4_ = _loc10_;
            if(_loc9_.raycast(§try catch extends§,§0#&§,§super const continue§.WEAPON,_loc10_,this,§'!G§))
            {
               _loc2_ = §'!G§.shape.body;
               _loc3_ = §'!G§.t;
               if(§+$%§.§ #T§(_loc2_))
               {
                  this.§9!i§.push(§'!G§.position.clone().add(§'!G§.normal));
                  this.§'#$§(_loc2_,§'!G§.position,§0#&§,§function catch with§ + _loc3_,this.§9!i§);
                  return;
               }
               _loc4_ = _loc3_;
               staticHitPoint.copy(§'!G§.position);
               §!"!§.copy(§'!G§.normal);
            }
            _loc5_ = 0;
            while(_loc5_ < §import package each§)
            {
               _loc6_ = §in package throw§[_loc5_];
               if(_loc9_.raycast(_loc6_,§0#&§,§super const continue§.WEAPON,_loc4_,this,§'!G§))
               {
                  _loc2_ = §'!G§.shape.body;
                  §switch for use§.copy(§try catch extends§).addScaled(§'!G§.t,§0#&§);
                  _loc7_ = §+$%§.§ #T§(_loc2_) && !this.§continue catch super§(§try catch extends§,§switch for use§);
                  if(_loc7_)
                  {
                     this.§9!i§.push(§switch for use§.clone());
                     this.§'#$§(_loc2_,§switch for use§,§0#&§,§function catch with§ + §'!G§.t,this.§9!i§);
                     return;
                  }
               }
               _loc6_.addScaled(_loc4_,§0#&§);
               _loc5_++;
            }
            if(_loc3_ > -1)
            {
               §function catch with§ += _loc3_;
               _loc10_ -= _loc3_;
               if(this.§>#D§ >= this.§5#b§.maxRicochetCount)
               {
                  _loc8_ = this.§5"2§.§1"g§(§function catch with§);
                  this.§9!i§.push(staticHitPoint.clone());
                  this.§default for while§(§!"!§,_loc8_,_loc2_);
                  return;
               }
               ++this.§>#D§;
               §try catch extends§.addScaled(_loc3_,§0#&§);
               this.§return const return§(§!"!§);
               this.§7#Y§(§try catch extends§);
               this.§9!i§.push(§try catch extends§.clone());
            }
            else
            {
               §function catch with§ += _loc10_;
               §try catch extends§.addScaled(_loc10_,§0#&§);
               _loc10_ = 0;
            }
         }
      }
      
      private function §default for while§(param1:Vector3, param2:Number = 1, param3:Body = null) : void
      {
         var _loc4_:Vector3 = this.§9!i§[this.§9!i§.length - 1];
         _loc4_.addScaled(0.1,param1);
         var _loc5_:Boolean = true;
         this.§"#s§(_loc4_);
         if(Boolean(this.callback) && _loc5_)
         {
            this.callback.§dynamic var const§(§function final§(),this.§9!i§);
         }
         this.destroy();
      }
      
      private function §continue catch super§(param1:Vector3, param2:Vector3) : Boolean
      {
         return §@"e§.§final var override§(param1,param2);
      }
      
      private function §return const return§(param1:Vector3) : void
      {
         §try catch extends§.addScaled(0.1,param1);
         §0#&§.addScaled(-2 * §0#&§.dot(param1),param1);
         §with set get§(§try catch extends§,§0#&§);
      }
      
      override public function render(param1:int, param2:int) : void
      {
         this.sprite.x = §include for var§.x;
         this.sprite.y = §include for var§.y;
         this.sprite.z = §include for var§.z;
         this.sprite.update(param2 / 1000);
         var _loc3_:Number = this.§5"2§.§1"g§(§function catch with§);
         var _loc4_:Number = §;H§ * _loc3_;
         this.sprite.width = _loc4_;
         this.sprite.height = _loc4_;
         this.sprite.rotation -= 0.003 * param2;
         var _loc5_:Vector3 = battleService.§3l§().§super package§().position;
         §null catch while§.§native var static§(this.§ g§,§include for var§,§0#&§,_loc5_);
         var _loc6_:Number = §try catch extends§.x - _loc5_.x;
         var _loc7_:Number = §try catch extends§.y - _loc5_.y;
         var _loc8_:Number = §try catch extends§.z - _loc5_.z;
         var _loc9_:Number = _loc6_ * _loc6_ + _loc7_ * _loc7_ + _loc8_ * _loc8_;
         if(_loc9_ > 0.00001)
         {
            _loc9_ = 1 / Math.sqrt(_loc9_);
            _loc6_ *= _loc9_;
            _loc7_ *= _loc9_;
            _loc8_ *= _loc9_;
         }
         var _loc10_:Number = _loc6_ * §0#&§.x + _loc7_ * §0#&§.y + _loc8_ * §0#&§.z;
         if(_loc10_ < 0)
         {
            _loc10_ = -_loc10_;
         }
         if(_loc10_ > 0.5)
         {
            this.§ g§.alpha = 2 * (1 - _loc10_) * _loc3_;
         }
         else
         {
            this.§ g§.alpha = _loc3_;
         }
         this.§50§.setPosition(§include for var§);
      }
      
      override protected function destroy() : void
      {
         super.destroy();
         var _loc1_:§[!r§ = battleService.§3l§();
         _loc1_.removeObject(this.sprite);
         this.sprite.material = null;
         _loc1_.removeObject(this.§ g§);
         this.§ g§.setMaterialToAllFaces(null);
         _loc1_.§"!f§(this.§ g§);
         §8#?§ = null;
         this.§5#b§ = null;
         this.sfxData = null;
         this.§5"2§ = null;
         this.callback = null;
         this.§8#7§.kill();
         this.§8#7§ = null;
         this.§50§ = null;
      }
      
      override public function considerBody(param1:Body) : Boolean
      {
         return super.considerBody(param1) || this.§>#D§ > 0;
      }
      
      private function §"#s§(param1:Vector3) : void
      {
         var _loc2_:§import use§ = battleService.§class while§();
         var _loc3_:set = set(_loc2_.getObject(set));
         var _loc4_:int = 50;
         _loc3_.init(param1,_loc4_);
         var _loc5_:§<"z§ = §<"z§(_loc2_.getObject(§<"z§));
         var _loc6_:Number = Math.random() * Math.PI * 2;
         var _loc7_:int = 0;
         _loc5_.init(§3"Z§,§3"Z§,this.sfxData.§get catch dynamic§,_loc6_,_loc3_,0.5,0.5,null,_loc7_);
         battleService.§7"0§(_loc5_);
         this.§set set with§(this.sfxData.explosionSound,param1);
         this.§package set else§(param1);
      }
      
      private function §package set else§(param1:Vector3) : void
      {
         var _loc2_:§while var if§ = §while var if§(battleService.§class while§().getObject(§while var if§));
         var _loc3_:set = set(battleService.§class while§().getObject(set));
         _loc3_.init(param1,50);
         _loc2_.init(_loc3_,this.sfxData.§^]§);
         battleService.§7"0§(_loc2_);
      }
      
      private function §#!&§(param1:Vector3) : void
      {
         var _loc2_:§while var if§ = §while var if§(battleService.§class while§().getObject(§while var if§));
         var _loc3_:set = set(battleService.§class while§().getObject(set));
         _loc3_.init(param1,50);
         _loc2_.init(_loc3_,this.sfxData.§##X§);
         battleService.§7"0§(_loc2_);
      }
      
      private function §set set with§(param1:Sound, param2:Vector3) : void
      {
         var _loc3_:Number = NaN;
         var _loc4_:§implements for break§ = null;
         var _loc5_:§do set case§ = null;
         if(param1 != null)
         {
            _loc3_ = 0.8;
            _loc4_ = §implements for break§.create(param1,_loc3_);
            _loc5_ = §do set case§.create(param2,_loc4_);
            battleService.§"#D§(_loc5_);
         }
      }
      
      private function §'#$§(param1:Body, param2:Vector3, param3:Vector3, param4:Number, param5:Vector.<Vector3>) : void
      {
         this.§"#s§(param2);
         var _loc6_:Number = this.§5"2§.§1"g§(param4);
         var _loc7_:Tank = param1.tank;
         _loc7_.§case extends§(param2,param3,_loc6_ * this.impactForce);
         this.§=#e§(param1,param5);
         this.destroy();
      }
      
      private function §=#e§(param1:Body, param2:Vector.<Vector3>) : void
      {
         if(this.callback)
         {
            this.callback.§=#e§(§function final§(),param1,param2);
         }
      }
      
      private function §7#Y§(param1:Vector3) : void
      {
         var _loc2_:§import use§ = battleService.§class while§();
         var _loc3_:set = set(_loc2_.getObject(set));
         var _loc4_:int = 50;
         _loc3_.init(param1,_loc4_);
         var _loc5_:§<"z§ = §<"z§(_loc2_.getObject(§<"z§));
         _loc5_.init(§,"E§,§,"E§,this.sfxData.§1l§,Math.random() * Math.PI * 2,_loc3_,0.5,0.5);
         battleService.§7"0§(_loc5_);
         this.§set set with§(this.sfxData.ricochetSound,param1);
         this.§#!&§(param1);
      }
      
      override protected function §function set native§() : Boolean
      {
         var _loc1_:CollisionDetector = battleService.§'x§().§const const true§();
         §each set function§.diff(§try catch extends§,§if package var§);
         var _loc2_:Number = §each set function§.length();
         §each set function§.normalize();
         return this.§#!f§(§each set function§,_loc2_,_loc1_);
      }
      
      private function §#!f§(param1:Vector3, param2:Number, param3:CollisionDetector) : Boolean
      {
         if(param3.raycast(§if package var§,param1,§super const continue§.WEAPON,param2,this,§'!G§))
         {
            this.§9!i§.push(§'!G§.position.clone());
            if(§+$%§.§ #T§(§'!G§.shape.body))
            {
               this.§'#$§(§'!G§.shape.body,§'!G§.position,param1,0,this.§9!i§);
               return true;
            }
            if(this.§>#D§ >= this.§5#b§.maxRicochetCount)
            {
               this.§default for while§(§'!G§.normal);
               return true;
            }
            ++this.§>#D§;
            §try catch extends§.copy(§'!G§.position);
            this.§return const return§(§'!G§.normal);
            this.§7#Y§(§'!G§.position);
            return false;
         }
         return this.§var var finally§(param1,param2,param3);
      }
      
      private function §var var finally§(param1:Vector3, param2:Number, param3:CollisionDetector) : Boolean
      {
         var _loc4_:Vector3 = null;
         var _loc5_:Body = null;
         §with set get§(§if package var§,param1);
         var _loc6_:int = 0;
         while(_loc6_ < §import package each§)
         {
            _loc4_ = §in package throw§[_loc6_];
            if(param3.raycast(_loc4_,§0#&§,§super const continue§.WEAPON,param2,this,§'!G§))
            {
               _loc5_ = §'!G§.shape.body;
               if(§+$%§.§ #T§(_loc5_))
               {
                  §switch for use§.copy(§if package var§).addScaled(§'!G§.t,param1);
                  this.§9!i§.push(§switch for use§.clone());
                  this.§'#$§(_loc5_,§switch for use§,param1,0,this.§9!i§);
                  return true;
               }
            }
            _loc6_++;
         }
         return false;
      }
      
      override protected function §3"C§() : Number
      {
         return this.§5#b§.shellRadius;
      }
      
      override protected function §switch var else§() : int
      {
         return §import package each§;
      }
   }
}

