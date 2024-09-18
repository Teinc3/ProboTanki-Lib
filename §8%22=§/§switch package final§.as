package §8"=§
{
   import alternativa.osgi.service.locale.ILocaleService;
   
   public class §switch package final§
   {
      [Inject]
      public static var localeService:ILocaleService;
      
      public var color:uint;
      
      private var §while set while§:String;
      
      public function §switch package final§(param1:uint, param2:String)
      {
         super();
         this.color = param1;
         this.§while set while§ = param2;
      }
      
      public function getMessage(param1:String) : String
      {
         return localeService.getText(this.§while set while§).replace("{point}",param1);
      }
   }
}

