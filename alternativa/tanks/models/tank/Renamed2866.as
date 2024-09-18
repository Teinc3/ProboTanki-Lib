package alternativa.tanks.models.tank
{
   import Renamed136.Renamed663;
   import alternativa.tanks.utils.EncryptedInt;
   import alternativa.tanks.utils.EncryptedIntImpl;
   
   public class Renamed2866
   {
      public static var teamType:Renamed663 = Renamed663.NONE;
      
      private static const specificationId:EncryptedInt = new EncryptedIntImpl();
      
      public function Renamed2866()
      {
         super();
      }
      
      public static function Renamed2919(param1:int) : void
      {
         specificationId.setInt(param1);
      }
      
      public static function Renamed2935() : int
      {
         return specificationId.getInt();
      }
   }
}

