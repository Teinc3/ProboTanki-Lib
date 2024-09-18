package alternativa.tanks.utils
{
   import alternativa.math.Vector3;
   import alternativa.physics.collision.primitives.CollisionBox;
   
   public class EncryptedCollisionBoxData
   {
      private var hs:Vector3;
      
      public function EncryptedCollisionBoxData(param1:CollisionBox)
      {
         this.halfSizeX = new EncryptedNumberImpl();
         this.halfSizeY = new EncryptedNumberImpl();
         this.halfSizeZ = new EncryptedNumberImpl();
         super();
         this.hs = param1.hs;
         this.halfSizeX.setNumber(param1.hs.x);
         this.halfSizeY.setNumber(param1.hs.y);
         this.halfSizeZ.setNumber(param1.hs.z);
      }
      
      public function isInvalid() : Boolean
      {
         return this.hs.x != this.halfSizeX.getNumber() || this.hs.y != this.halfSizeY.getNumber() || this.hs.z != this.halfSizeZ.getNumber();
      }
   }
}

