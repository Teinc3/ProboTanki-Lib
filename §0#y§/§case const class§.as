package §0#y§
{
   import §-!!§.§6!<§;
   import §7"j§.§each var set§;
   import §7"j§.§finally const package§;
   import §7"j§.§null catch while§;
   import §=#M§.§catch do§;
   import alternativa.engine3d.materials.TextureMaterial;
   import alternativa.engine3d.objects.Sprite3D;
   import alternativa.math.Vector3;
   import alternativa.physics.Body;
   import alternativa.physics.collision.types.RayHit;
   import alternativa.tanks.battle.§+$%§;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.battle.objects.tank.§1"o§;
   import alternativa.tanks.battle.scene3d.§<!T§;
   import alternativa.tanks.camera.§3!0§;
   import alternativa.tanks.engine3d.§7J§;
   import alternativa.tanks.engine3d.§throw const switch§;
   import alternativa.tanks.models.weapon.§ !8§;
   import alternativa.tanks.models.weapon.§4"z§;
   import alternativa.tanks.models.weapon.shotgun.§static package null§;
   import alternativa.tanks.models.weapon.shotgun.§throw implements§;
   import §extends for const§.§1Q§;
   import §extends for const§.§["D§;
   import flash.display.BlendMode;
   import §for set super§.§!"N§;
   import §for set super§.§super const continue§;
   
   public class §case const class§ extends §["D§ implements §finally const package§
   {
      [Inject]
      public static var battleService:BattleService;
      
      private static const §case package switch§:Number = 16;
      
      private static const §-"u§:Number = 270;
      
      private static const §try set else§:Number = 100;
      
      private static const § -§:Number = 1.3;
      
      private static const §set var else§:Number = 400;
      
      private static const §use set var§:Number = 150;
      
      private static const §for for override§:Number = 2.5;
      
      private static const §do for true§:Number = 200;
      
      private static const §^5§:Number = 0.08;
      
      private static const §else package class§:Number = 0.3;
      
      private static const §1"Q§:Number = 0.05;
      
      private static const §]^§:Number = 5000;
      
      private static const §throw override§:Number = 6;
      
      private static const §include const final§:Number = 0.2;
      
      private static const §implements for use§:Number = 30;
      
      private static const §extends const default§:RayHit = new RayHit();
      
      private static const §3!<§:§4"z§ = new §4"z§();
      
      private static const §+K§:Vector3 = new Vector3();
      
      private static const §include catch§:Vector3 = new Vector3();
      
      private static const §6#p§:Vector3 = new Vector3();
      
      private static const §=#l§:Vector3 = new Vector3();
      
      private var §4!7§:§each var set§;
      
      private var §native package package§:§each var set§;
      
      private var §each package include§:§7J§;
      
      private var §class§:Vector.<§dynamic const const§>;
      
      private var §use var set§:Vector.<§dynamic const const§>;
      
      private var §dynamic const include§:Vector.<Sprite3D>;
      
      private var §6u§:Vector3;
      
      private var §const continue§:Vector3;
      
      private var time:Number = 0;
      
      private var container:§6!<§;
      
      private var §^"z§:§if catch use§;
      
      private var §for catch break§:Number;
      
      public function §case const class§(param1:§1Q§)
      {
         this.§4!7§ = new §each var set§(§-"u§,§-"u§,0,§-"u§ / 2,0);
         this.§native package package§ = new §each var set§(§-"u§,§-"u§,0,0,0);
         this.§each package include§ = new §7J§(§do for true§,§do for true§);
         this.§class§ = new Vector.<§dynamic const const§>();
         this.§use var set§ = new Vector.<§dynamic const const§>();
         this.§dynamic const include§ = new Vector.<Sprite3D>();
         this.§6u§ = new Vector3();
         this.§const continue§ = new Vector3();
         super(param1);
      }
      
      public function §&"-§(param1:§6!<§) : void
      {
         this.container = param1;
         param1.addChild(this.§4!7§);
         param1.addChild(this.§native package package§);
         param1.addChild(this.§each package include§);
         var _loc2_:int = 0;
         while(_loc2_ < this.§class§.length)
         {
            param1.addChild(this.§class§[_loc2_]);
            _loc2_++;
         }
         var _loc3_:int = 0;
         while(_loc3_ < this.§dynamic const include§.length)
         {
            param1.addChild(this.§dynamic const include§[_loc3_]);
            _loc3_++;
         }
         var _loc4_:int = 0;
         while(_loc4_ < this.§use var set§.length)
         {
            param1.addChild(this.§use var set§[_loc4_]);
            _loc4_++;
         }
      }
      
      public function play(param1:int, param2:§3!0§) : Boolean
      {
         if(this.§final const while§())
         {
            return false;
         }
         var _loc3_:Number = param1 / 1000;
         this.§`w§(param2);
         this.§else for catch§(param2,this.§class§);
         this.§ S§(_loc3_);
         this.§#!$§();
         if(this.time >= §1"Q§)
         {
            this.§]!c§(param2,this.§use var set§);
         }
         this.time += _loc3_;
         this.§,";§();
         return true;
      }
      
      private function §final const while§() : Boolean
      {
         return this.§4!7§.parent == null && this.§native package package§.parent == null && this.§each package include§.parent == null && this.§class§[0].parent == null && this.§dynamic const include§[0].parent == null && this.§use var set§[0].parent == null;
      }
      
      private function §`w§(param1:§3!0§) : void
      {
         var _loc2_:Number = NaN;
         §null catch while§.§4!R§(this.§4!7§,param1.position,this.§const continue§,false,8,0.9);
         §null catch while§.§4!R§(this.§native package package§,param1.position,this.§const continue§,true,4,0.3);
         this.§4!7§.setTime(this.time);
         var _loc3_:int = this.time * this.§^"z§.§6#f§.fps;
         if(_loc3_ == 5)
         {
            _loc2_ = §-"u§ * 0.35;
            §+K§.copy(this.§6u§).addScaled(_loc2_,this.§const continue§);
         }
         else if(_loc3_ >= 6)
         {
            _loc2_ = §-"u§ * 0.5;
            §+K§.copy(this.§6u§).addScaled(_loc2_,this.§const continue§);
         }
         else
         {
            §+K§.copy(this.§6u§);
         }
         §null catch while§.§native var static§(this.§4!7§,§+K§,this.§const continue§,param1.position);
         this.§native package package§.setTime(this.time);
         _loc3_ = this.time * this.§^"z§.§while break§.fps;
         _loc2_ = 0.1 * §-"u§ + _loc3_ * 0.1 * §-"u§;
         this.§native package package§.x = this.§6u§.x + this.§const continue§.x * _loc2_;
         this.§native package package§.y = this.§6u§.y + this.§const continue§.y * _loc2_;
         this.§native package package§.z = this.§6u§.z + this.§const continue§.z * _loc2_;
      }
      
      private function §else for catch§(param1:§3!0§, param2:Vector.<§dynamic const const§>) : void
      {
         var _loc3_:§dynamic const const§ = null;
         var _loc4_:Number = this.time / §else package class§;
         for each(_loc3_ in param2)
         {
            this.§if var while§(_loc3_,_loc4_,param1);
         }
      }
      
      private function §if var while§(param1:§dynamic const const§, param2:Number, param3:§3!0§) : Number
      {
         var _loc4_:Number = param1.distance * param2;
         §include catch§.copy(param1.position).addScaled(_loc4_,param1.direction);
         param1.alpha = 1 - 2 * Math.abs(0.5 - param2);
         §null catch while§.§native var static§(param1,§include catch§,param1.direction,param3.position);
         param1.visible = true;
         return _loc4_;
      }
      
      private function §]!c§(param1:§3!0§, param2:Vector.<§dynamic const const§>) : void
      {
         var _loc3_:§dynamic const const§ = null;
         var _loc4_:Number = (this.time - §1"Q§) / §else package class§;
         for each(_loc3_ in param2)
         {
            if(!_loc3_.§<v§)
            {
               return;
            }
            this.§if var while§(_loc3_,_loc4_,param1);
         }
      }
      
      private function § S§(param1:Number) : void
      {
         var _loc2_:int = 0;
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         if(this.time > §^5§)
         {
            this.§each package include§.visible = true;
            _loc2_ = this.time * this.§each package include§.§,"Q§();
            this.§each package include§.§true const switch§(_loc2_);
            _loc3_ = this.time - §^5§;
            _loc4_ = Math.sqrt(_loc3_ / § -§);
            if(this.§for catch break§ > §try set else§)
            {
               _loc7_ = Math.min(this.§for catch break§ - §try set else§,§set var else§);
               _loc5_ = §try set else§ + _loc7_ * _loc4_;
            }
            else
            {
               _loc5_ = 0;
               this.§each package include§.visible = false;
            }
            this.§each package include§.x = this.§6u§.x + this.§const continue§.x * _loc5_;
            this.§each package include§.y = this.§6u§.y + this.§const continue§.y * _loc5_;
            this.§each package include§.z = this.§6u§.z + this.§const continue§.z * _loc5_ + §use set var§ * _loc4_;
            _loc6_ = 1 + (§for for override§ - 1) * _loc4_;
            this.§each package include§.scaleX = _loc6_;
            this.§each package include§.scaleY = _loc6_;
            this.§each package include§.scaleZ = _loc6_;
            this.§each package include§.alpha = 1 - _loc4_;
            this.§each package include§.rotation -= 0.3 * param1;
         }
         else
         {
            this.§each package include§.visible = false;
         }
      }
      
      private function §#!$§() : void
      {
         var _loc1_:Sprite3D = null;
         var _loc2_:Number = (this.time - §1"Q§) / §include const final§;
         _loc2_ *= _loc2_;
         var _loc3_:Number = 1 + (§implements for use§ - 1) * _loc2_;
         for each(_loc1_ in this.§dynamic const include§)
         {
            _loc1_.scaleX = _loc3_;
            _loc1_.scaleY = _loc3_;
            _loc1_.scaleZ = _loc3_;
            _loc1_.alpha = 1 - _loc2_;
         }
      }
      
      private function §,";§() : void
      {
         var _loc1_:§dynamic const const§ = null;
         var _loc2_:§dynamic const const§ = null;
         var _loc3_:Sprite3D = null;
         if(this.time > §else package class§)
         {
            for each(_loc1_ in this.§class§)
            {
               this.container.removeChild(_loc1_);
            }
         }
         if(this.time > §else package class§ + §1"Q§)
         {
            for each(_loc2_ in this.§use var set§)
            {
               if(_loc2_.parent != null)
               {
                  this.container.removeChild(_loc2_);
               }
            }
         }
         if(this.time > this.§4!7§.§8a§())
         {
            this.container.removeChild(this.§4!7§);
         }
         if(this.time > this.§native package package§.§8a§())
         {
            this.container.removeChild(this.§native package package§);
         }
         if(this.time > §^5§ + § -§)
         {
            this.container.removeChild(this.§each package include§);
         }
         if(this.time > §include const final§)
         {
            for each(_loc3_ in this.§dynamic const include§)
            {
               this.container.removeChild(_loc3_);
            }
         }
      }
      
      public function destroy() : void
      {
         var _loc1_:int = 0;
         while(_loc1_ < this.§class§.length)
         {
            this.§class§[_loc1_].clear();
            _loc1_++;
         }
         var _loc2_:int = 0;
         while(_loc2_ < this.§use var set§.length)
         {
            this.§use var set§[_loc2_].clear();
            this.§use var set§[_loc2_].visible = false;
            _loc2_++;
         }
         var _loc3_:int = 0;
         while(_loc3_ < this.§dynamic const include§.length)
         {
            this.§dynamic const include§[_loc3_].material = null;
            _loc3_++;
         }
         this.§native package package§.clear();
         this.§4!7§.clear();
         this.§each package include§.clear();
         recycle();
      }
      
      public function kill() : void
      {
         var _loc1_:int = 0;
         while(_loc1_ < this.§class§.length)
         {
            this.container.removeChild(this.§class§[_loc1_]);
            this.container.removeChild(this.§use var set§[_loc1_]);
            this.container.removeChild(this.§dynamic const include§[_loc1_]);
            _loc1_++;
         }
         this.container.removeChild(this.§4!7§);
         this.container.removeChild(this.§native package package§);
         this.container.removeChild(this.§each package include§);
      }
      
      public function init(param1:§static package null§, param2:§ !8§, param3:§1"o§, param4:Vector3, param5:§if catch use§) : void
      {
         this.§^"z§ = param5;
         this.§6u§.copy(param2.§6u§);
         this.§const continue§.copy(param2.direction);
         this.§if package override§();
         this.§dynamic static§();
         this.§native var try§(param1,param2,param4,param3.§0"t§());
         this.time = 0;
      }
      
      private function §if package override§() : void
      {
         this.§4!7§.blendMode = BlendMode.ADD;
         var _loc1_:§throw const switch§ = this.§^"z§.§6#f§;
         this.§4!7§.init(_loc1_,_loc1_.fps);
         this.§4!7§.shadowMapAlphaThreshold = 2;
         this.§4!7§.useShadowMap = false;
         this.§4!7§.depthMapAlphaThreshold = 2;
         this.§4!7§.useLight = false;
         var _loc2_:§throw const switch§ = this.§^"z§.§while break§;
         this.§native package package§.init(_loc2_,_loc2_.fps);
         this.§native package package§.blendMode = BlendMode.ADD;
         this.§native package package§.rotationX = Math.atan2(this.§const continue§.z,Math.sqrt(this.§const continue§.x * this.§const continue§.x + this.§const continue§.y * this.§const continue§.y)) - Math.PI / 2;
         this.§native package package§.rotationY = 0;
         this.§native package package§.rotationZ = -Math.atan2(this.§const continue§.x,this.§const continue§.y);
         this.§native package package§.shadowMapAlphaThreshold = 2;
         this.§native package package§.useShadowMap = false;
         this.§native package package§.depthMapAlphaThreshold = 2;
         this.§native package package§.useLight = false;
      }
      
      private function §dynamic static§() : void
      {
         this.§each package include§.§do var super§(this.§^"z§.§82§);
         this.§each package include§.§true const switch§(0);
         this.§each package include§.rotation = Math.random() * Math.PI * 2;
         this.§each package include§.shadowMapAlphaThreshold = 2;
         this.§each package include§.useShadowMap = false;
         this.§each package include§.depthMapAlphaThreshold = 2;
         this.§each package include§.useLight = false;
         this.§each package include§.softAttenuation = 130;
         this.§for catch break§ = §]^§;
      }
      
      private function §native var try§(param1:§static package null§, param2:§ !8§, param3:Vector3, param4:Body) : void
      {
         var _loc5_:Vector3 = null;
         var _loc6_:Vector.<Vector3> = this.§2Y§(param1,param2,param3);
         var _loc7_:§!"N§ = battleService.§'x§().§const const true§();
         §3!<§.§@"n§ = param4;
         var _loc8_:§catch do§ = param1.§use package dynamic§();
         var _loc9_:Number = _loc8_.§6T§();
         while(this.§class§.length < _loc6_.length)
         {
            this.§catch set try§();
         }
         var _loc10_:int = 0;
         while(_loc10_ < _loc6_.length)
         {
            _loc5_ = _loc6_[_loc10_];
            this.§^!O§(_loc10_,_loc7_,_loc5_,param2.§if package var§,_loc9_);
            _loc10_++;
         }
      }
      
      private function §2Y§(param1:§static package null§, param2:§ !8§, param3:Vector3) : Vector.<Vector3>
      {
         var _loc4_:§throw implements§ = param1.§#8§();
         _loc4_.next();
         return _loc4_.§@!9§(param2.§false var try§,param3);
      }
      
      private function §catch set try§() : void
      {
         this.§class§.push(this.§'#L§());
         this.§use var set§.push(this.§'#L§());
         var _loc1_:Sprite3D = new Sprite3D(0,0);
         _loc1_.blendMode = BlendMode.ADD;
         _loc1_.shadowMapAlphaThreshold = 2;
         _loc1_.useShadowMap = false;
         _loc1_.depthMapAlphaThreshold = 2;
         _loc1_.useLight = false;
         this.§dynamic const include§.push(_loc1_);
      }
      
      private function §'#L§() : §dynamic const const§
      {
         var _loc1_:§dynamic const const§ = new §dynamic const const§();
         _loc1_.blendMode = BlendMode.ADD;
         _loc1_.shadowMapAlphaThreshold = 2;
         _loc1_.useShadowMap = false;
         _loc1_.depthMapAlphaThreshold = 2;
         _loc1_.useLight = false;
         return _loc1_;
      }
      
      private function §^!O§(param1:int, param2:§!"N§, param3:Vector3, param4:Vector3, param5:Number) : void
      {
         var _loc6_:Boolean = false;
         var _loc7_:Sprite3D = null;
         var _loc8_:Boolean = param2.raycast(param4,param3,§super const continue§.WEAPON,param5,§3!<§,§extends const default§);
         var _loc9_:Number = §]^§;
         var _loc10_:§dynamic const const§ = this.§class§[param1];
         _loc10_.position.copy(this.§6u§);
         if(_loc8_)
         {
            _loc6_ = §+$%§.§ #T§(§extends const default§.shape.body);
            _loc10_.direction.diff(§extends const default§.position,this.§6u§);
            _loc9_ = this.§extends const while§(param4,_loc9_,_loc10_,_loc6_);
            _loc10_.direction.normalize();
            _loc7_ = this.§dynamic const include§[param1];
            this.§8#3§(_loc7_,§extends const default§.position,param3);
            if(!_loc6_)
            {
               this.§-+§(param4,§extends const default§.position);
            }
         }
         else
         {
            _loc10_.direction.copy(param3);
         }
         this.§dynamic set native§(_loc10_,_loc9_);
      }
      
      private function §extends const while§(param1:Vector3, param2:Number, param3:§dynamic const const§, param4:Boolean) : Number
      {
         var _loc5_:Number = param1.distanceTo(§extends const default§.position);
         var _loc6_:Number = param1.distanceTo(this.§6u§);
         if(_loc5_ > _loc6_)
         {
            param2 = param3.direction.length();
         }
         else
         {
            param2 = 0;
         }
         if(!param4)
         {
            this.§for catch break§ = Math.min(param2,this.§for catch break§);
         }
         return param2;
      }
      
      private function §+j§(param1:Vector3, param2:§dynamic const const§, param3:Boolean) : Number
      {
         if(!param3)
         {
            return param2.direction.length();
         }
         return param1.distanceTo(§extends const default§.position);
      }
      
      private function §dynamic set native§(param1:§dynamic const const§, param2:Number) : void
      {
         var _loc3_:Number = 3 + Math.random() * 8;
         var _loc4_:Number = 0.3 + Math.random() * 0.3;
         var _loc5_:Number = Math.min(Math.random() * 200,param2);
         var _loc6_:Number = Math.min(400 + Math.random() * 2100,param2);
         var _loc7_:Number = 300 + Math.random() * 500;
         if(_loc7_ + _loc6_ > param2)
         {
            _loc7_ = Math.max(0,param2 - _loc6_);
         }
         param1.init(_loc3_,_loc4_,_loc5_,_loc6_,_loc7_,this.§^"z§.§class const null§);
      }
      
      private function §8#3§(param1:Sprite3D, param2:Vector3, param3:Vector3) : void
      {
         var _loc4_:Number = §throw override§ + Math.random() * §throw override§;
         var _loc5_:Number = _loc4_ / 2;
         param1.width = _loc4_;
         param1.height = _loc4_;
         param1.material = this.§^"z§.§1!6§;
         param1.x = param2.x - _loc5_ * param3.x;
         param1.y = param2.y - _loc5_ * param3.y;
         param1.z = param2.z - _loc5_ * param3.z;
         param1.rotation = Math.random() * Math.PI * 2;
         param1.visible = true;
      }
      
      private function §-+§(param1:Vector3, param2:Vector3) : void
      {
         var _loc3_:Vector.<TextureMaterial> = this.§^"z§.§default for if§;
         var _loc4_:int = Math.floor(Math.random() * _loc3_.length);
         battleService.§3l§().addDecal(param2,param1,§case package switch§,_loc3_[_loc4_],§<!T§.§6"t§);
      }
   }
}

