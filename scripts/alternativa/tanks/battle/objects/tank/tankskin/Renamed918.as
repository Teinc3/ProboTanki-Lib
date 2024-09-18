package alternativa.tanks.battle.objects.tank.tankskin
{
   import alternativa.engine3d.core.Object3D;
   import alternativa.engine3d.objects.Mesh;
   import alternativa.math.Vector3;
   import alternativa.tanks.battle.objects.tank.Renamed1153;
   import alternativa.tanks.battle.objects.tank.Renamed1167;
   import alternativa.tanks.utils.DataUnitValidator;
   import alternativa.tanks.utils.DataValidatorType;
   import alternativa.tanks.utils.EncryptedNumber;
   import alternativa.tanks.utils.EncryptedNumberImpl;
   import projects.tanks.clients.flash.resources.resource.Tanks3DSResource;
   
   public class Renamed918 extends Renamed1168 implements DataUnitValidator
   {
      public var Renamed1275:Vector3;
      
      private var Renamed1276:EncryptedNumber;
      
      private var Renamed1277:EncryptedNumber;
      
      private var Renamed1278:EncryptedNumber;
      
      public var mesh:Mesh;
      
      public function Renamed918(param1:Tanks3DSResource)
      {
         super(param1);
         var _loc2_:Vector.<Object3D> = param1.getObjectsByName(/mount/i);
         if(_loc2_ == null)
         {
            throw new Renamed1153();
         }
         var _loc3_:Object3D = _loc2_[0];
         this.Renamed1275 = new Vector3(_loc3_.x,_loc3_.y,_loc3_.z);
         this.Renamed1276 = new EncryptedNumberImpl(_loc3_.x);
         this.Renamed1277 = new EncryptedNumberImpl(_loc3_.y);
         this.Renamed1278 = new EncryptedNumberImpl(_loc3_.z);
         this.mesh = initMesh(this.Renamed1279(param1));
      }
      
      public function hasIncorrectData() : Boolean
      {
         return this.Renamed1275.x != this.Renamed1276.getNumber() || this.Renamed1275.y != this.Renamed1277.getNumber() || this.Renamed1275.z != this.Renamed1278.getNumber();
      }
      
      public function getType() : int
      {
         return DataValidatorType.MEMHACK_TURRET_MOUNT_POINT;
      }
      
      private function Renamed1279(param1:Tanks3DSResource) : Mesh
      {
         var _loc2_:Vector.<Object3D> = param1.getObjectsByName(/hull/i);
         if(_loc2_ == null)
         {
            throw new Renamed1167();
         }
         return Mesh(_loc2_[0]);
      }
      
      public function Renamed1097() : Number
      {
         return this.Renamed1276.getNumber();
      }
      
      public function Renamed1098() : Number
      {
         return this.Renamed1277.getNumber();
      }
      
      public function Renamed1099() : Number
      {
         return this.Renamed1278.getNumber();
      }
   }
}

