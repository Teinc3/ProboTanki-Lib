package §]s§
{
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.models.battle.gui.chat.§1$ §;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.blockuser.IBlockUserService;
   
   public class §implements static§ implements §="?§
   {
      [Inject]
      public static var localeService:ILocaleService;
      
      [Inject]
      public static var blockUserService:IBlockUserService;
      
      private var output:§1$ §;
      
      public function §implements static§(param1:§1$ §)
      {
         super();
         this.output = param1;
      }
      
      public function §for set null§(param1:Array) : Boolean
      {
         if(param1.length == 0)
         {
            return false;
         }
         var _loc2_:String = param1[0];
         blockUserService.unblockUser(_loc2_);
         this.output.§use package throw§(localeService.getText(TanksLocale.TEXT_CHAT_PANEL_COMMAND_UNBLOCK,_loc2_));
         return true;
      }
   }
}

