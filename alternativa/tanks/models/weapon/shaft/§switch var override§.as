package alternativa.tanks.models.weapon.shaft
{
   public class §switch var override§
   {
      public static const TRIGGER_PULL:§switch var override§ = new §switch var override§("TRIGGER_PULL");
      
      public static const TRIGGER_RELEASE:§switch var override§ = new §switch var override§("TRIGGER_RELEASE");
      
      public static const STOP:§switch var override§ = new §switch var override§("STOP");
      
      public static const READY_TO_SHOOT:§switch var override§ = new §switch var override§("READY_TO_SHOOT");
      
      public static const SWITCH:§switch var override§ = new §switch var override§("SWITCH");
      
      public static const EXIT:§switch var override§ = new §switch var override§("EXIT");
      
      private var value:String;
      
      public function §switch var override§(param1:String)
      {
         super();
         this.value = param1;
      }
      
      [Obfuscation(rename="false")]
      public function toString() : String
      {
         return this.value;
      }
   }
}

