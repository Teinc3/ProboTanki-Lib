package alternativa.tanks.battle
{
   import § !g§.§class for case§;
   import §;"?§.§#">§;
   import alternativa.math.Matrix3;
   import alternativa.math.Vector3;
   import alternativa.physics.Body;
   import alternativa.physics.collision.CollisionDetector;
   import alternativa.physics.collision.types.RayHit;
   import alternativa.tanks.battle.objects.tank.Tank;
   import alternativa.tanks.models.weapon.§ !8§;
   import alternativa.tanks.utils.EncryptedInt;
   import alternativa.tanks.utils.EncryptedIntImpl;
   import flash.geom.Vector3D;
   import §for set super§.§!"N§;
   import §for set super§.§super const continue§;
   import projects.tanks.client.battlefield.models.tankparts.weapons.common.§default for break§;
   
   public class §+$%§
   {
      [Inject]
      public static var battleService:BattleService;
      
      public static const §@!c§:Vector3 = new Vector3();
      
      public static const §6!;§:Matrix3 = new Matrix3();
      
      private static const §&P§:EncryptedInt = new EncryptedIntImpl(100);
      
      private static const _direction:Vector3 = new Vector3();
      
      private static const §'!G§:RayHit = new RayHit();
      
      private static const §function catch else§:Number = 0.22;
      
      public function §+$%§()
      {
         super();
      }
      
      public static function §use final§(param1:Number) : Number
      {
         return param1 * §&P§.getInt();
      }
      
      public static function §var for static§(param1:§class for case§) : §class for case§
      {
         return param1 == §class for case§.BLUE ? §class for case§.RED : §class for case§.BLUE;
      }
      
      public static function §@#z§(param1:§#">§) : Boolean
      {
         return param1 != null && isFinite(param1.x) && isFinite(param1.y) && isFinite(param1.z);
      }
      
      public static function §,i§(param1:Vector3) : §#">§
      {
         return new §#">§(param1.x,param1.y,param1.z);
      }
      
      public static function §throw catch with§(param1:Vector3) : §#">§
      {
         return param1 == null ? null : new §#">§(param1.x,param1.y,param1.z);
      }
      
      public static function §default var super§(param1:Vector3, param2:§#">§) : void
      {
         param2.x = param1.x;
         param2.y = param1.y;
         param2.z = param1.z;
      }
      
      public static function §1!`§(param1:§#">§, param2:§#">§) : void
      {
         param2.x = param1.x;
         param2.y = param1.y;
         param2.z = param1.z;
      }
      
      public static function §?#T§(param1:§#">§) : Vector3
      {
         return new Vector3(param1.x,param1.y,param1.z);
      }
      
      public static function §'!d§(param1:§#">§) : Vector3
      {
         return param1 == null ? null : new Vector3(param1.x,param1.y,param1.z);
      }
      
      public static function §use set super§(param1:§#">§, param2:Vector3) : void
      {
         param2.x = param1.x;
         param2.y = param1.y;
         param2.z = param1.z;
      }
      
      public static function §with catch return§(param1:Vector3, param2:Vector3D) : void
      {
         param2.x = param1.x;
         param2.y = param1.y;
         param2.z = param1.z;
      }
      
      public static function globalToLocal(param1:Body, param2:Vector3) : void
      {
         param2.subtract(param1.state.position);
         param2.transformTransposed3(param1.baseMatrix);
      }
      
      public static function localToGlobal(param1:Body, param2:Vector3) : void
      {
         param2.transform3(param1.baseMatrix);
         param2.add(param1.state.position);
      }
      
      public static function § #!§(param1:String, param2:Number = 0) : Number
      {
         var _loc3_:Number = Number(param1);
         return isNaN(_loc3_) ? Number(param2) : Number(_loc3_);
      }
      
      public static function §package do§(param1:Object, param2:Array) : String
      {
         return "";
      }
      
      public static function § #T§(param1:Body) : Boolean
      {
         return param1 != null && param1.tank != null;
      }
      
      public static function §override var include§(param1:Body, param2:§ !8§) : Boolean
      {
         var _loc3_:CollisionDetector = null;
         var _loc4_:Vector3 = param1.state.position;
         _direction.diff(param2.§if package var§,_loc4_);
         if(param1.scene != null)
         {
            _loc3_ = param1.scene.collisionDetector;
            return !_loc3_.raycastStatic(_loc4_,_direction,§super const continue§.§finally catch while§,1,null,§'!G§);
         }
         return false;
      }
      
      public static function §0c§(param1:§ !8§) : Boolean
      {
         var _loc2_:§!"N§ = battleService.§'x§().§const const true§();
         var _loc3_:Number = Vector3.distanceBetween(param1.§if package var§,param1.§6u§);
         return _loc2_.raycastStatic(param1.§if package var§,param1.direction,§super const continue§.§finally catch while§,_loc3_,null,§'!G§);
      }
      
      public static function §case package§(param1:Tank) : §default for break§
      {
         var _loc2_:§default for break§ = new §default for break§();
         _loc2_.target = param1.§if for with§();
         _loc2_.position = §+$%§.§,i§(param1.§0"t§().state.position);
         param1.§0"t§().state.orientation.getEulerAngles(§@!c§);
         _loc2_.orientation = §,i§(§@!c§);
         _loc2_.turretAngle = param1.§set const implements§();
         return _loc2_;
      }
      
      public static function §!!d§(param1:Vector.<Tank>) : Vector.<§default for break§>
      {
         var _loc2_:Vector.<§default for break§> = new Vector.<§default for break§>(param1.length);
         var _loc3_:int = 0;
         while(_loc3_ < param1.length)
         {
            _loc2_[_loc3_] = §case package§(param1[_loc3_]);
            _loc3_++;
         }
         return _loc2_;
      }
      
      public static function §5!I§(param1:§#">§) : Boolean
      {
         return isNaN(param1.x) || isNaN(param1.y) || isNaN(param1.z);
      }
      
      public static function §dynamic package import§(param1:Body) : Boolean
      {
         return param1.baseMatrix.m22 < §function catch else§;
      }
      
      public static function §const package with§(param1:Vector.<Vector3>) : Vector.<§#">§>
      {
         var _loc2_:Vector.<§#">§> = new Vector.<§#">§>(param1.length);
         var _loc3_:int = 0;
         while(_loc3_ < param1.length)
         {
            _loc2_[_loc3_] = §,i§(param1[_loc3_]);
            _loc3_++;
         }
         return _loc2_;
      }
   }
}

