package §for set super§
{
   import alternativa.math.Matrix4;
   import alternativa.math.Vector3;
   import alternativa.physics.PhysicsMaterial;
   import alternativa.physics.ShapeContact;
   import alternativa.physics.collision.primitives.CollisionBox;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.battle.objects.tank.Tank;
   import alternativa.tanks.battle.objects.tank.§native catch var§;
   
   public class §>4§
   {
      [Inject]
      public static var battleService:BattleService;
      
      private static const §class package true§:Number = 12.5;
      
      private static const contacts:Vector.<ShapeContact> = new Vector.<ShapeContact>();
      
      private var tank:Tank;
      
      private var §break set class§:CollisionBox;
      
      private var §false var override§:Boolean;
      
      private var §null false§:Boolean;
      
      private var §["j§:Boolean;
      
      public function §>4§(param1:§=-§)
      {
         super();
         this.tank = param1.body.tank;
         var _loc2_:Vector3 = this.tank.§;`§().hs.clone();
         _loc2_.z += §class package true§;
         this.§break set class§ = new CollisionBox(_loc2_,-1,PhysicsMaterial.DEFAULT_MATERIAL);
         this.§break set class§.body = this.tank.§0"t§();
      }
      
      public function §"#2§() : void
      {
         var _loc1_:ShapeContact = null;
         var _loc2_:Number = NaN;
         this.§false var override§ = this.§null false§;
         this.§<^§();
         var _loc3_:§!"N§ = battleService.§'x§().§const const true§();
         _loc3_.§""[§(this.§break set class§,contacts);
         var _loc4_:Number = 0;
         for each(_loc1_ in contacts)
         {
            if(_loc1_.shape1 == this.§break set class§)
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
         this.§["j§ = contacts.length > 0;
         contacts.length = 0;
         this.§null false§ = _loc4_ < §native catch var§.§7!b§;
      }
      
      private function §<^§() : void
      {
         var _loc1_:CollisionBox = this.tank.§;`§();
         var _loc2_:Matrix4 = this.§break set class§.transform;
         _loc2_.copy(_loc1_.transform);
         _loc2_.m03 -= _loc2_.m02 * §class package true§;
         _loc2_.m13 -= _loc2_.m12 * §class package true§;
         _loc2_.m23 -= _loc2_.m22 * §class package true§;
         this.§break set class§.calculateAABB();
      }
      
      public function §&#Q§() : Boolean
      {
         return this.§null false§;
      }
      
      public function §catch extends§() : Boolean
      {
         return this.§null false§ && !this.§false var override§;
      }
      
      public function §`#U§() : Boolean
      {
         return this.§false var override§ && !this.§null false§;
      }
      
      public function §class var while§() : Boolean
      {
         return this.§null false§ && this.§["j§;
      }
   }
}

