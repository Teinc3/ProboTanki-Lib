package Renamed488
{
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.models.battle.gui.chat.Renamed2590;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.blockuser.IBlockUserService;
   
   public class Renamed2613 implements Renamed2612
   {
      [Inject]
      public static var localeService:ILocaleService;
      
      [Inject]
      public static var blockUserService:IBlockUserService;
      
      private var output:Renamed2590;
      
      public function Renamed2613(param1:Renamed2590)
      {
         super();
         this.output = param1;
      }
      
      public function Renamed2643(param1:Array) : Boolean
      {
         if(param1.length == 0)
         {
            return false;
         }
         var _loc2_:String = param1[0];
         blockUserService.blockUser(_loc2_);
         this.output.Renamed2580(localeService.getText(TanksLocale.TEXT_CHAT_PANEL_COMMAND_BLOCK,_loc2_));
         return true;
      }
   }
}

