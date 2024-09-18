package Renamed479
{
   import alternativa.engine3d.alternativa3d;
   import alternativa.math.Matrix3;
   import alternativa.math.Vector3;
   import alternativa.tanks.battle.Renamed668;
   import alternativa.tanks.battle.Renamed623;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.camera.Renamed842;
   import alternativa.tanks.models.weapon.shaft.Renamed3184;
   
   use namespace alternativa3d;
   
   public class Renamed4633
   {
      [Inject]
      public static var battleService:BattleService;
      
      private var camera:Renamed842;
      
      private var Renamed3327:Renamed3184;
      
      public function Renamed4633(param1:Renamed3184)
      {
         super();
         this.Renamed3327 = param1;
         this.camera = battleService.Renamed621().Renamed739();
      }
      
      public function update(param1:Vector3) : void
      {
         var _loc2_:Renamed623 = null;
         var _loc3_:Number = Number(this.camera.alternativa3d::focalLength);
         var _loc4_:Number = Number(this.camera.alternativa3d::viewSizeX);
         var _loc5_:Number = Number(this.camera.alternativa3d::viewSizeY);
         var _loc6_:Number = Math.atan((_loc5_ + this.Renamed3327.height / 2) / _loc3_);
         var _loc7_:Number = Math.atan((_loc4_ + this.Renamed3327.width / 2) / _loc3_);
         var _loc8_:Matrix3 = Renamed668.Renamed670;
         _loc8_.setRotationMatrixForObject3D(this.camera);
         var _loc9_:Vector3 = Renamed668.Renamed669;
         _loc8_.transformVectorInverse(param1,_loc9_);
         var _loc10_:Number = Math.atan2(_loc9_.x,_loc9_.z);
         var _loc11_:Number = Math.atan2(_loc9_.y,_loc9_.z);
         this.Renamed3327.visible = Math.abs(_loc11_) <= _loc6_ && Math.abs(_loc10_) <= _loc7_;
         if(this.Renamed3327.visible)
         {
            _loc2_ = battleService.Renamed622();
            this.Renamed3327.x = _loc2_.Renamed749() + Math.tan(_loc10_) * _loc3_ + _loc4_ - this.Renamed3327.width / 2;
            this.Renamed3327.y = _loc2_.Renamed750() + Math.tan(_loc11_) * _loc3_ + _loc5_ - this.Renamed3327.height / 2;
         }
      }
   }
}

