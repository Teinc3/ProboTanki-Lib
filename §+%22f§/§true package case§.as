package §+"f§
{
   import §%!5§.§>"Q§;
   import §%!5§.§try set finally§;
   import alternativa.math.Matrix3;
   import alternativa.math.Vector3;
   import alternativa.physics.Body;
   import alternativa.physics.collision.CollisionDetector;
   import alternativa.physics.collision.IRayCollisionFilter;
   import alternativa.physics.collision.types.RayHit;
   import alternativa.tanks.battle.§+$%§;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.battle.§class true§;
   import alternativa.tanks.battle.§native var const§;
   import alternativa.tanks.battle.§return const break§;
   import alternativa.tanks.battle.scene3d.§[!r§;
   import alternativa.tanks.battle.scene3d.§else if§;
   import alternativa.tanks.models.weapon.§ !8§;
   import alternativa.tanks.utils.EncryptedInt;
   import alternativa.tanks.utils.EncryptedIntImpl;
   import §extends for const§.§1Q§;
   import §extends for const§.§["D§;
   import §extends for const§.§import use§;
   import flash.errors.IllegalOperationError;
   import §for set super§.§super const continue§;
   
   public class §true package case§ extends §["D§ implements §return const break§, §else if§, §native var const§, IRayCollisionFilter
   {
      [Inject]
      public static var battleService:BattleService;
      
      protected static const thousandth:EncryptedInt = new EncryptedIntImpl(1000);
      
      protected static const §2"q§:Matrix3 = new Matrix3();
      
      protected static const §'!G§:RayHit = new RayHit();
      
      protected static const §switch for use§:Vector3 = new Vector3();
      
      private static const §return for if§:Vector3 = new Vector3();
      
      private static const §`z§:Vector3 = new Vector3();
      
      private var shotId:int;
      
      protected var §2=§:Boolean;
      
      protected var §return catch var§:Boolean;
      
      protected var §8#?§:Body;
      
      protected var §function catch with§:Number = 0;
      
      protected var §0#&§:Vector3;
      
      protected var §try catch extends§:Vector3;
      
      protected var §default catch§:Vector3;
      
      protected var §if package var§:Vector3;
      
      protected var §include for var§:Vector3;
      
      protected var §in package throw§:Vector.<Vector3>;
      
      protected var §do catch static§:§try set finally§;
      
      public function §true package case§(param1:§1Q§)
      {
         this.§break set return§ = 2 * Math.PI / this.§switch var else§();
         this.§0#&§ = new Vector3();
         this.§try catch extends§ = new Vector3();
         this.§default catch§ = new Vector3();
         this.§if package var§ = new Vector3();
         this.§include for var§ = new Vector3();
         super(param1);
         this.§in package throw§ = new Vector.<Vector3>(this.§switch var else§(),true);
         var _loc2_:int = 0;
         while(_loc2_ < this.§switch var else§())
         {
            this.§in package throw§[_loc2_] = new Vector3();
            _loc2_++;
         }
      }
      
      private static function §null if§(param1:Vector3, param2:Vector3) : void
      {
         var _loc3_:int = 0;
         var _loc4_:Number = 10000000000;
         var _loc5_:Number = param1.x < 0 ? Number(-param1.x) : Number(param1.x);
         if(_loc5_ < _loc4_)
         {
            _loc4_ = _loc5_;
            _loc3_ = 0;
         }
         _loc5_ = param1.y < 0 ? Number(-param1.y) : Number(param1.y);
         if(_loc5_ < _loc4_)
         {
            _loc4_ = _loc5_;
            _loc3_ = 1;
         }
         _loc5_ = param1.z < 0 ? Number(-param1.z) : Number(param1.z);
         if(_loc5_ < _loc4_)
         {
            _loc3_ = 2;
         }
         if(_loc3_ == 0)
         {
            param2.reset(0,param1.z,-param1.y);
         }
         else if(_loc3_ == 1)
         {
            param2.reset(-param1.z,0,param1.x);
         }
         else if(_loc3_ == 2)
         {
            param2.reset(param1.y,-param1.x,0);
         }
      }
      
      protected function §"$ §() : §try set finally§
      {
         if(this.§2=§)
         {
            return §>"Q§.INSTANCE;
         }
         return §try set finally§(battleService.§class while§().getObject(§try set finally§));
      }
      
      public function §const const while§(param1:§ !8§, param2:Vector3, param3:Body, param4:int = -1) : void
      {
         this.§function catch with§ = 0;
         this.§return catch var§ = true;
         this.shotId = param4;
         this.§2=§ = param4 == -1;
         this.§if package var§.copy(param1.§if package var§);
         this.§try catch extends§.copy(param1.§6u§);
         this.§default catch§.copy(param1.§6u§);
         this.§0#&§.copy(param2);
         this.§8#?§ = param3;
         battleService.§'x§().§^c§(this);
         battleService.§'x§().§,j§(this);
         battleService.§3l§().§9"N§(this,0);
         this.§do catch static§ = this.§"$ §();
         this.§do catch static§.start(this.§try catch extends§,param2);
      }
      
      public function runBeforePhysicsUpdate(param1:Number) : void
      {
         if(this.§return catch var§)
         {
            this.§return catch var§ = false;
            this.§ "v§(param1);
         }
         else
         {
            this.update(param1);
         }
      }
      
      private function § "v§(param1:Number) : void
      {
         if(!this.§function set native§())
         {
            this.§with set get§(this.§try catch extends§,this.§0#&§);
            this.update(param1);
         }
      }
      
      protected function §function set native§() : Boolean
      {
         var _loc1_:Body = null;
         var _loc2_:Vector3 = null;
         var _loc3_:CollisionDetector = battleService.§'x§().§const const true§();
         §`z§.diff(this.§try catch extends§,this.§if package var§);
         var _loc4_:Number = §`z§.length();
         §`z§.normalize();
         if(_loc3_.raycast(this.§if package var§,§`z§,§super const continue§.WEAPON,_loc4_,this,§'!G§))
         {
            _loc1_ = §'!G§.shape.body;
            if(_loc1_.tank == null)
            {
               §'!G§.position.subtract(§`z§);
            }
            this.§dynamic const native§(_loc1_,§'!G§.position,§`z§,_loc4_);
            return true;
         }
         this.§with set get§(this.§if package var§,§`z§);
         var _loc5_:int = 0;
         while(_loc5_ < this.§switch var else§())
         {
            _loc2_ = this.§in package throw§[_loc5_];
            if(_loc3_.raycast(_loc2_,§`z§,§super const continue§.WEAPON,_loc4_,this,§'!G§))
            {
               _loc1_ = §'!G§.shape.body;
               if(§+$%§.§ #T§(_loc1_))
               {
                  §switch for use§.copy(this.§if package var§).addScaled(§'!G§.t,§`z§);
                  this.§dynamic const native§(_loc1_,§switch for use§,§`z§,_loc4_);
                  return true;
               }
            }
            _loc5_++;
         }
         return false;
      }
      
      protected function destroy() : void
      {
         battleService.§'x§().§7`§(this);
         battleService.§'x§().§]#r§(this);
         battleService.§3l§().§0!n§(this,0);
         this.§do catch static§.destroy();
         recycle();
      }
      
      protected function §with set get§(param1:Vector3, param2:Vector3) : void
      {
         §null if§(param2,§return for if§);
         §return for if§.normalize().scale(this.§3"C§());
         §2"q§.fromAxisAngle(param2,this.§break set return§);
         Vector3(this.§in package throw§[0]).sum(param1,§return for if§);
         var _loc3_:int = 1;
         while(_loc3_ < this.§switch var else§())
         {
            §return for if§.transform3(§2"q§);
            Vector3(this.§in package throw§[_loc3_]).sum(param1,§return for if§);
            _loc3_++;
         }
      }
      
      public function interpolatePhysicsState(param1:Number) : void
      {
         this.§include for var§.interpolate(param1,this.§default catch§,this.§try catch extends§);
      }
      
      public function considerBody(param1:Body) : Boolean
      {
         return this.§8#?§ != param1;
      }
      
      public function §function final§() : int
      {
         return this.shotId;
      }
      
      protected function §switch var else§() : int
      {
         return 8;
      }
      
      protected function update(param1:Number) : void
      {
         throw new IllegalOperationError();
      }
      
      protected function §&-§(param1:Body, param2:Vector3, param3:Vector3, param4:Number, param5:int) : void
      {
         throw new IllegalOperationError();
      }
      
      protected function §do set import§(param1:Number) : int
      {
         return Math.round(§'!G§.t / param1 * §class true§.§@"r§);
      }
      
      protected function §dynamic const native§(param1:Body, param2:Vector3, param3:Vector3, param4:Number) : void
      {
         this.§&-§(param1,param2,param3,this.§function catch with§ + §'!G§.t,this.§do set import§(param4));
      }
      
      protected function §3"C§() : Number
      {
         throw new IllegalOperationError();
      }
      
      public function render(param1:int, param2:int) : void
      {
         throw new IllegalOperationError();
      }
      
      protected function §dynamic package set§() : §import use§
      {
         return battleService.§class while§();
      }
      
      protected function §@!!§() : §[!r§
      {
         return battleService.§3l§();
      }
   }
}

