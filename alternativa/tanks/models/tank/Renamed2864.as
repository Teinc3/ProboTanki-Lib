package alternativa.tanks.models.tank
{
   import alternativa.tanks.utils.DataUnitValidator;
   import alternativa.tanks.utils.DataValidator;
   import platform.client.fp10.core.type.AutoClosable;
   
   public class Renamed2864 implements AutoClosable
   {
      [Inject]
      public static var Renamed2419:DataValidator;
      
      private var Renamed3018:DataUnitValidator;
      
      public function Renamed2864(param1:DataUnitValidator)
      {
         super();
         this.Renamed3018 = param1;
         Renamed2419.addValidator(param1);
      }
      
      [Obfuscation(rename="false")]
      public function close() : void
      {
         Renamed2419.removeValidator(this.Renamed3018);
         this.Renamed3018 = null;
      }
   }
}

