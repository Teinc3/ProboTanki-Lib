package Renamed373
{
   import alternativa.math.Matrix4;
   import alternativa.math.Vector3;
   import alternativa.physics.PhysicsMaterial;
   import alternativa.physics.ShapeContact;
   import alternativa.physics.collision.primitives.CollisionBox;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.battle.objects.tank.Tank;
   import alternativa.tanks.battle.objects.tank.Renamed1049;
   
   public class Renamed4679
   {
      [Inject]
      public static var battleService:BattleService;
      
      private static const Renamed8292:Number = 12.5;
      
      private static const contacts:Vector.<ShapeContact> = new Vector.<ShapeContact>();
      
      private var tank:Tank;
      
      private var Renamed8293:CollisionBox;
      
      private var Renamed8294:Boolean;
      
      private var Renamed8295:Boolean;
      
      private var Renamed8296:Boolean;
      
      public function Renamed4679(param1:Renamed606)
      {
         super();
         this.tank = param1.body.tank;
         var _loc2_:Vector3 = this.tank.Renamed1042().hs.clone();
         _loc2_.z += Renamed8292;
         this.Renamed8293 = new CollisionBox(_loc2_,-1,PhysicsMaterial.DEFAULT_MATERIAL);
         this.Renamed8293.body = this.tank.Renamed696();
      }
      
      public function Renamed8297() : void
      {
         var _loc1_:ShapeContact = null;
         var _loc2_:Number = NaN;
         this.Renamed8294 = this.Renamed8295;
         this.Renamed8298();
         var _loc3_:Renamed665 = battleService.Renamed619().Renamed692();
         _loc3_.Renamed8279(this.Renamed8293,contacts);
         var _loc4_:Number = 0;
         for each(_loc1_ in contacts)
         {
            if(_loc1_.shape1 == this.Renamed8293)
            {
               _loc2_ = _loc1_.normal.dot(Vector3.Z_AXIS);
            }
            else
            {
               _loc2_ = _loc1_.normal.dot(Vector3.DOWN);
            }
            _loc4_ = Math.max(_loc4_,_loc2_);
            _loc1_.dispose();
         }
         this.Renamed8296 = contacts.length > 0;
         contacts.length = 0;
         this.Renamed8295 = _loc4_ < Renamed1049.Renamed1166;
      }
      
      private function Renamed8298() : void
      {
         var _loc1_:CollisionBox = this.tank.Renamed1042();
         var _loc2_:Matrix4 = this.Renamed8293.transform;
         _loc2_.copy(_loc1_.transform);
         _loc2_.m03 -= _loc2_.m02 * Renamed8292;
         _loc2_.m13 -= _loc2_.m12 * Renamed8292;
         _loc2_.m23 -= _loc2_.m22 * Renamed8292;
         this.Renamed8293.calculateAABB();
      }
      
      public function Renamed1124() : Boolean
      {
         return this.Renamed8295;
      }
      
      public function Renamed1128() : Boolean
      {
         return this.Renamed8295 && !this.Renamed8294;
      }
      
      public function Renamed1129() : Boolean
      {
         return this.Renamed8294 && !this.Renamed8295;
      }
      
      public function Renamed1130() : Boolean
      {
         return this.Renamed8295 && this.Renamed8296;
      }
   }
}

