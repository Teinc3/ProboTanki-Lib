package alternativa.tanks.battle.objects.tank.tankskin
{
   import alternativa.engine3d.core.Object3D;
   import alternativa.engine3d.objects.Mesh;
   import alternativa.math.Vector3;
   import alternativa.tanks.battle.objects.tank.§continue var use§;
   import alternativa.tanks.battle.objects.tank.§return var try§;
   import alternativa.tanks.utils.DataUnitValidator;
   import alternativa.tanks.utils.DataValidatorType;
   import alternativa.tanks.utils.EncryptedNumber;
   import alternativa.tanks.utils.EncryptedNumberImpl;
   import projects.tanks.clients.flash.resources.resource.Tanks3DSResource;
   
   public class §for for if§ extends §function else§ implements DataUnitValidator
   {
      public var §extends var import§:Vector3;
      
      private var §throw const continue§:EncryptedNumber;
      
      private var §native for static§:EncryptedNumber;
      
      private var §;#[§:EncryptedNumber;
      
      public var mesh:Mesh;
      
      public function §for for if§(param1:Tanks3DSResource)
      {
         super(param1);
         var _loc2_:Vector.<Object3D> = param1.getObjectsByName(/mount/i);
         if(_loc2_ == null)
         {
            throw new §continue var use§();
         }
         var _loc3_:Object3D = _loc2_[0];
         this.§extends var import§ = new Vector3(_loc3_.x,_loc3_.y,_loc3_.z);
         this.§throw const continue§ = new EncryptedNumberImpl(_loc3_.x);
         this.§native for static§ = new EncryptedNumberImpl(_loc3_.y);
         this.§;#[§ = new EncryptedNumberImpl(_loc3_.z);
         this.mesh = initMesh(this.§;#^§(param1));
      }
      
      public function hasIncorrectData() : Boolean
      {
         return this.§extends var import§.x != this.§throw const continue§.getNumber() || this.§extends var import§.y != this.§native for static§.getNumber() || this.§extends var import§.z != this.§;#[§.getNumber();
      }
      
      public function getType() : int
      {
         return DataValidatorType.MEMHACK_TURRET_MOUNT_POINT;
      }
      
      private function §;#^§(param1:Tanks3DSResource) : Mesh
      {
         var _loc2_:Vector.<Object3D> = param1.getObjectsByName(/hull/i);
         if(_loc2_ == null)
         {
            throw new §return var try§();
         }
         return Mesh(_loc2_[0]);
      }
      
      public function §static for set§() : Number
      {
         return this.§throw const continue§.getNumber();
      }
      
      public function §-1§() : Number
      {
         return this.§native for static§.getNumber();
      }
      
      public function §&T§() : Number
      {
         return this.§;#[§.getNumber();
      }
   }
}

