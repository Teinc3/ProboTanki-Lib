package alternativa.tanks.service.country
{
   import flash.events.EventDispatcher;
   import §for package case§.§for else§;
   import §for package case§.§get var use§;
   import §for set include§.§ !m§;
   
   public class §^"+§ extends EventDispatcher implements CountryService
   {
      private var §if set false§:Boolean;
      
      private var §include const super§:Vector.<§for else§>;
      
      private var §>a§:String;
      
      public function §^"+§()
      {
         super();
      }
      
      public function §&[§(param1:§get var use§) : void
      {
         this.§if set false§ = param1.§final var false§;
         this.§include const super§ = param1.§override for extends§;
         this.§>a§ = param1.defaultCountryCode;
      }
      
      public function §[!S§() : Vector.<§for else§>
      {
         return this.§include const super§;
      }
      
      public function §1#A§() : String
      {
         return this.§>a§;
      }
      
      public function §2"l§(param1:String) : void
      {
         this.§>a§ = param1;
      }
      
      public function §in package var§(param1:String) : void
      {
         this.§>a§ = param1;
         dispatchEvent(new § !m§(§ !m§.§null const include§,param1));
      }
      
      public function §?"=§() : Boolean
      {
         return this.§if set false§;
      }
   }
}

