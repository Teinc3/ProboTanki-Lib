package alternativa.tanks.models.tank
{
   import § !g§.§class for case§;
   import alternativa.tanks.utils.EncryptedInt;
   import alternativa.tanks.utils.EncryptedIntImpl;
   
   public class §63§
   {
      public static var teamType:§class for case§ = §class for case§.NONE;
      
      private static const specificationId:EncryptedInt = new EncryptedIntImpl();
      
      public function §63§()
      {
         super();
      }
      
      public static function §<!?§(param1:int) : void
      {
         specificationId.setInt(param1);
      }
      
      public static function §false import§() : int
      {
         return specificationId.getInt();
      }
   }
}

