package Renamed4607
{
   import alternativa.osgi.service.locale.ILocaleService;
   
   public class Renamed4608
   {
      [Inject]
      public static var localeService:ILocaleService;
      
      public var color:uint;
      
      private var Renamed7130:String;
      
      public function Renamed4608(param1:uint, param2:String)
      {
         super();
         this.color = param1;
         this.Renamed7130 = param2;
      }
      
      public function getMessage(param1:String) : String
      {
         return localeService.getText(this.Renamed7130).replace("{point}",param1);
      }
   }
}

