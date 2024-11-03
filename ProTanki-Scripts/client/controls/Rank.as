package controls
{
   import alternativa.osgi.service.locale.ILocaleService;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   
   public class Rank
   {
      public static var ranks:Array;
      
      [Inject]
      public static var localeService:ILocaleService;
      
      public function Rank()
      {
         super();
      }
      
      public static function name(param1:int) : String
      {
         var _loc2_:String = null;
         if(ranks == null)
         {
            _loc2_ = localeService.getText(TanksLocale.TEXT_RANK_NAMES);
            ranks = _loc2_.split(",");
         }
         return ranks[param1 - 1];
      }
   }
}

