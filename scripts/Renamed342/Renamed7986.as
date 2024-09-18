package Renamed342
{
   import alternativa.math.Matrix3;
   import alternativa.math.Vector3;
   import alternativa.physics.PhysicsMaterial;
   import alternativa.physics.collision.CollisionShape;
   import alternativa.physics.collision.primitives.CollisionBox;
   import alternativa.physics.collision.primitives.CollisionRect;
   import alternativa.physics.collision.primitives.CollisionTriangle;
   
   public class Renamed7986
   {
      private static const Renamed8004:PhysicsMaterial = new PhysicsMaterial(0,1);
      
      private static const Renamed8005:int = 255;
      
      private static const Renamed3412:Vector3 = new Vector3();
      
      private static const position:Vector3 = new Vector3();
      
      private static const rotation:Vector3 = new Vector3();
      
      private static const Renamed1511:Matrix3 = new Matrix3();
      
      public function Renamed7986()
      {
         super();
      }
      
      public static function parse(param1:XML) : Vector.<CollisionShape>
      {
         var _loc2_:Vector.<CollisionShape> = new Vector.<CollisionShape>();
         Renamed8006(Renamed8007(param1),_loc2_);
         Renamed8006(Renamed8008(param1),_loc2_);
         Renamed8006(Renamed8009(param1),_loc2_);
         return _loc2_;
      }
      
      private static function Renamed8006(param1:Vector.<CollisionShape>, param2:Vector.<CollisionShape>) : void
      {
         var _loc3_:CollisionShape = null;
         for each(_loc3_ in param1)
         {
            param2.push(_loc3_);
         }
      }
      
      private static function Renamed8007(param1:XML) : Vector.<CollisionShape>
      {
         var _loc2_:XML = null;
         var _loc3_:CollisionShape = null;
         var _loc4_:Vector.<CollisionShape> = new Vector.<CollisionShape>();
         var _loc5_:XMLList = param1.elements("collision-geometry")[0].elements("collision-plane");
         for each(_loc2_ in _loc5_)
         {
            Renamed3412.x = 0.5 * Number(_loc2_.width);
            Renamed3412.y = 0.5 * Number(_loc2_.length);
            Renamed3412.z = 0;
            _loc3_ = new CollisionRect(Renamed3412,Renamed8005,Renamed8004);
            Renamed8010(_loc3_,_loc2_);
            _loc4_.push(_loc3_);
         }
         return _loc4_;
      }
      
      private static function Renamed8008(param1:XML) : Vector.<CollisionShape>
      {
         var _loc2_:XML = null;
         var _loc3_:CollisionShape = null;
         var _loc4_:Vector.<CollisionShape> = new Vector.<CollisionShape>();
         var _loc5_:XMLList = param1.elements("collision-geometry")[0].elements("collision-box");
         for each(_loc2_ in _loc5_)
         {
            Renamed8011(_loc2_.size,Renamed3412);
            Renamed3412.scale(0.5);
            _loc3_ = new CollisionBox(Renamed3412,Renamed8005,Renamed8004);
            Renamed8010(_loc3_,_loc2_);
            _loc4_.push(_loc3_);
         }
         return _loc4_;
      }
      
      private static function Renamed8009(param1:XML) : Vector.<CollisionShape>
      {
         var _loc2_:XML = null;
         var _loc3_:CollisionShape = null;
         var _loc4_:Vector.<CollisionShape> = new Vector.<CollisionShape>();
         var _loc5_:Vector3 = new Vector3();
         var _loc6_:Vector3 = new Vector3();
         var _loc7_:Vector3 = new Vector3();
         var _loc8_:XMLList = param1.elements("collision-geometry")[0].elements("collision-triangle");
         for each(_loc2_ in _loc8_)
         {
            Renamed8011(_loc2_.v0,_loc5_);
            Renamed8011(_loc2_.v1,_loc6_);
            Renamed8011(_loc2_.v2,_loc7_);
            _loc3_ = new CollisionTriangle(_loc5_,_loc6_,_loc7_,Renamed8005,Renamed8004);
            Renamed8010(_loc3_,_loc2_);
            _loc4_.push(_loc3_);
         }
         return _loc4_;
      }
      
      private static function Renamed8010(param1:CollisionShape, param2:XML) : void
      {
         Renamed8011(param2.position,position);
         Renamed8011(param2.rotation,rotation);
         Renamed1511.setRotationMatrix(rotation.x,rotation.y,rotation.z);
         param1.transform.setFromMatrix3(Renamed1511,position);
      }
      
      private static function Renamed8011(param1:XMLList, param2:Vector3) : void
      {
         var _loc3_:XML = null;
         if(param1.length() > 0)
         {
            _loc3_ = param1[0];
            param2.x = parseFloat(_loc3_.x);
            param2.y = parseFloat(_loc3_.y);
            param2.z = parseFloat(_loc3_.z);
         }
         else
         {
            param2.reset(0,0,0);
         }
      }
   }
}

