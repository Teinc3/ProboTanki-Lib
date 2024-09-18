package alternativa.tanks.bonuses
{
   import Renamed1342.Renamed1448;
   import alternativa.engine3d.core.Object3D;
   import alternativa.math.Matrix4;
   import alternativa.math.Vector3;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.battle.scene3d.Renamed610;
   
   public class BonusObject3DBase implements Object3DWrapper, Renamed1448
   {
      [Inject]
      public static var battleService:BattleService;
      
      protected var object:Object3D;
      
      private var ownAlpha:Number = 1;
      
      private var alphaMultiplier:Number = 1;
      
      public function BonusObject3DBase()
      {
         super();
      }
      
      public function setPosition(param1:Vector3) : void
      {
         this.object.x = param1.x;
         this.object.y = param1.y;
         this.object.z = param1.z;
      }
      
      public function setPositionComponents(param1:Number, param2:Number, param3:Number) : void
      {
         this.object.x = param1;
         this.object.y = param2;
         this.object.z = param3;
      }
      
      public function setRotation(param1:Vector3) : void
      {
         this.object.rotationX = param1.x;
         this.object.rotationY = param1.y;
         this.object.rotationZ = param1.z;
      }
      
      public function setRotationComponents(param1:Number, param2:Number, param3:Number) : void
      {
         this.object.rotationX = param1;
         this.object.rotationY = param2;
         this.object.rotationZ = param3;
      }
      
      public function readPosition(param1:Vector3) : void
      {
         param1.x = this.object.x;
         param1.y = this.object.y;
         param1.z = this.object.z;
      }
      
      public function readRotation(param1:Vector3) : void
      {
         param1.x = this.object.rotationX;
         param1.y = this.object.rotationY;
         param1.z = this.object.rotationZ;
      }
      
      public function getAlpha() : Number
      {
         return this.ownAlpha;
      }
      
      public function setAlpha(param1:Number) : void
      {
         this.ownAlpha = param1;
         this.updateAlpha();
      }
      
      public function setAlphaMultiplier(param1:Number) : void
      {
         this.alphaMultiplier = param1;
         this.updateAlpha();
      }
      
      protected function updateAlpha() : void
      {
         this.object.alpha = this.alphaMultiplier * this.ownAlpha;
      }
      
      public function readTransform(param1:Matrix4) : void
      {
         param1.setMatrix(this.object.x,this.object.y,this.object.z,this.object.rotationX,this.object.rotationY,this.object.rotationZ);
      }
      
      public function addToScene() : void
      {
         var _loc1_:Renamed610 = battleService.Renamed621();
         _loc1_.addObjToAbsPacket(this.object);
         _loc1_.Renamed1377.add(this);
      }
      
      public function removeFromScene() : void
      {
         var _loc1_:Renamed610 = battleService.Renamed621();
         _loc1_.removeObject(this.object);
         _loc1_.Renamed1377.remove(this);
      }
      
      public function addZ(param1:Number) : void
      {
         this.object.z += param1;
      }
   }
}

