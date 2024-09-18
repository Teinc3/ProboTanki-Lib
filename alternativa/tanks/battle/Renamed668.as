package alternativa.tanks.battle
{
   import Renamed136.Renamed663;
   import Renamed602.Renamed603;
   import alternativa.math.Matrix3;
   import alternativa.math.Vector3;
   import alternativa.physics.Body;
   import alternativa.physics.collision.CollisionDetector;
   import alternativa.physics.collision.types.RayHit;
   import alternativa.tanks.battle.objects.tank.Tank;
   import alternativa.tanks.models.weapon.Renamed664;
   import alternativa.tanks.utils.EncryptedInt;
   import alternativa.tanks.utils.EncryptedIntImpl;
   import flash.geom.Vector3D;
   import Renamed373.Renamed665;
   import Renamed373.Renamed666;
   import projects.tanks.client.battlefield.models.tankparts.weapons.common.Renamed667;
   
   public class Renamed668
   {
      [Inject]
      public static var battleService:BattleService;
      
      public static const Renamed669:Vector3 = new Vector3();
      
      public static const Renamed670:Matrix3 = new Matrix3();
      
      private static const Renamed671:EncryptedInt = new EncryptedIntImpl(100);
      
      private static const _direction:Vector3 = new Vector3();
      
      private static const Renamed672:RayHit = new RayHit();
      
      private static const Renamed673:Number = 0.22;
      
      public function Renamed668()
      {
         super();
      }
      
      public static function Renamed674(param1:Number) : Number
      {
         return param1 * Renamed671.getInt();
      }
      
      public static function Renamed675(param1:Renamed663) : Renamed663
      {
         return param1 == Renamed663.BLUE ? Renamed663.RED : Renamed663.BLUE;
      }
      
      public static function Renamed676(param1:Renamed603) : Boolean
      {
         return param1 != null && isFinite(param1.x) && isFinite(param1.y) && isFinite(param1.z);
      }
      
      public static function Renamed677(param1:Vector3) : Renamed603
      {
         return new Renamed603(param1.x,param1.y,param1.z);
      }
      
      public static function Renamed678(param1:Vector3) : Renamed603
      {
         return param1 == null ? null : new Renamed603(param1.x,param1.y,param1.z);
      }
      
      public static function Renamed679(param1:Vector3, param2:Renamed603) : void
      {
         param2.x = param1.x;
         param2.y = param1.y;
         param2.z = param1.z;
      }
      
      public static function Renamed680(param1:Renamed603, param2:Renamed603) : void
      {
         param2.x = param1.x;
         param2.y = param1.y;
         param2.z = param1.z;
      }
      
      public static function Renamed681(param1:Renamed603) : Vector3
      {
         return new Vector3(param1.x,param1.y,param1.z);
      }
      
      public static function Renamed682(param1:Renamed603) : Vector3
      {
         return param1 == null ? null : new Vector3(param1.x,param1.y,param1.z);
      }
      
      public static function Renamed683(param1:Renamed603, param2:Vector3) : void
      {
         param2.x = param1.x;
         param2.y = param1.y;
         param2.z = param1.z;
      }
      
      public static function Renamed684(param1:Vector3, param2:Vector3D) : void
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
      
      public static function Renamed685(param1:String, param2:Number = 0) : Number
      {
         var _loc3_:Number = Number(param1);
         return isNaN(_loc3_) ? Number(param2) : Number(_loc3_);
      }
      
      public static function Renamed686(param1:Object, param2:Array) : String
      {
         return "";
      }
      
      public static function Renamed687(param1:Body) : Boolean
      {
         return param1 != null && param1.tank != null;
      }
      
      public static function Renamed688(param1:Body, param2:Renamed664) : Boolean
      {
         var _loc3_:CollisionDetector = null;
         var _loc4_:Vector3 = param1.state.position;
         _direction.diff(param2.Renamed689,_loc4_);
         if(param1.scene != null)
         {
            _loc3_ = param1.scene.collisionDetector;
            return !_loc3_.raycastStatic(_loc4_,_direction,Renamed666.Renamed690,1,null,Renamed672);
         }
         return false;
      }
      
      public static function Renamed691(param1:Renamed664) : Boolean
      {
         var _loc2_:Renamed665 = battleService.Renamed619().Renamed692();
         var _loc3_:Number = Vector3.distanceBetween(param1.Renamed689,param1.Renamed693);
         return _loc2_.raycastStatic(param1.Renamed689,param1.direction,Renamed666.Renamed690,_loc3_,null,Renamed672);
      }
      
      public static function Renamed694(param1:Tank) : Renamed667
      {
         var _loc2_:Renamed667 = new Renamed667();
         _loc2_.target = param1.Renamed695();
         _loc2_.position = Renamed668.Renamed677(param1.Renamed696().state.position);
         param1.Renamed696().state.orientation.getEulerAngles(Renamed669);
         _loc2_.orientation = Renamed677(Renamed669);
         _loc2_.turretAngle = param1.Renamed697();
         return _loc2_;
      }
      
      public static function Renamed698(param1:Vector.<Tank>) : Vector.<Renamed667>
      {
         var _loc2_:Vector.<Renamed667> = new Vector.<Renamed667>(param1.length);
         var _loc3_:int = 0;
         while(_loc3_ < param1.length)
         {
            _loc2_[_loc3_] = Renamed694(param1[_loc3_]);
            _loc3_++;
         }
         return _loc2_;
      }
      
      public static function Renamed699(param1:Renamed603) : Boolean
      {
         return isNaN(param1.x) || isNaN(param1.y) || isNaN(param1.z);
      }
      
      public static function Renamed700(param1:Body) : Boolean
      {
         return param1.baseMatrix.m22 < Renamed673;
      }
      
      public static function Renamed701(param1:Vector.<Vector3>) : Vector.<Renamed603>
      {
         var _loc2_:Vector.<Renamed603> = new Vector.<Renamed603>(param1.length);
         var _loc3_:int = 0;
         while(_loc3_ < param1.length)
         {
            _loc2_[_loc3_] = Renamed677(param1[_loc3_]);
            _loc3_++;
         }
         return _loc2_;
      }
   }
}

