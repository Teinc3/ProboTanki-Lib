package §]#R§
{
   import alternativa.engine3d.alternativa3d;
   import alternativa.math.Matrix3;
   import alternativa.math.Vector3;
   import alternativa.tanks.battle.§+$%§;
   import alternativa.tanks.battle.§0_§;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.camera.§3!0§;
   import alternativa.tanks.models.weapon.shaft.§9#D§;
   
   use namespace alternativa3d;
   
   public class §9"0§
   {
      [Inject]
      public static var battleService:BattleService;
      
      private var camera:§3!0§;
      
      private var §`!w§:§9#D§;
      
      public function §9"0§(param1:§9#D§)
      {
         super();
         this.§`!w§ = param1;
         this.camera = battleService.§3l§().§super package§();
      }
      
      public function update(param1:Vector3) : void
      {
         var _loc2_:§0_§ = null;
         var _loc3_:Number = Number(this.camera.alternativa3d::focalLength);
         var _loc4_:Number = Number(this.camera.alternativa3d::viewSizeX);
         var _loc5_:Number = Number(this.camera.alternativa3d::viewSizeY);
         var _loc6_:Number = Math.atan((_loc5_ + this.§`!w§.height / 2) / _loc3_);
         var _loc7_:Number = Math.atan((_loc4_ + this.§`!w§.width / 2) / _loc3_);
         var _loc8_:Matrix3 = §+$%§.§6!;§;
         _loc8_.setRotationMatrixForObject3D(this.camera);
         var _loc9_:Vector3 = §+$%§.§@!c§;
         _loc8_.transformVectorInverse(param1,_loc9_);
         var _loc10_:Number = Math.atan2(_loc9_.x,_loc9_.z);
         var _loc11_:Number = Math.atan2(_loc9_.y,_loc9_.z);
         this.§`!w§.visible = Math.abs(_loc11_) <= _loc6_ && Math.abs(_loc10_) <= _loc7_;
         if(this.§`!w§.visible)
         {
            _loc2_ = battleService.§7#P§();
            this.§`!w§.x = _loc2_.§="f§() + Math.tan(_loc10_) * _loc3_ + _loc4_ - this.§`!w§.width / 2;
            this.§`!w§.y = _loc2_.§6!W§() + Math.tan(_loc11_) * _loc3_ + _loc5_ - this.§`!w§.height / 2;
         }
      }
   }
}

