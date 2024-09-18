package alternativa.tanks.models.tank
{
   import alternativa.tanks.utils.DataUnitValidator;
   import alternativa.tanks.utils.DataValidator;
   import platform.client.fp10.core.type.AutoClosable;
   
   public class §super catch function§ implements AutoClosable
   {
      [Inject]
      public static var §'!1§:DataValidator;
      
      private var §finally set switch§:DataUnitValidator;
      
      public function §super catch function§(param1:DataUnitValidator)
      {
         super();
         this.§finally set switch§ = param1;
         §'!1§.addValidator(param1);
      }
      
      [Obfuscation(rename="false")]
      public function close() : void
      {
         §'!1§.removeValidator(this.§finally set switch§);
         this.§finally set switch§ = null;
      }
   }
}

