package §]s§
{
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.models.battle.gui.chat.§1$ §;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.blockuser.IBlockUserService;
   
   public class §for for native§ implements §="?§
   {
      [Inject]
      public static var localeService:ILocaleService;
      
      [Inject]
      public static var blockUserService:IBlockUserService;
      
      private var output:§1$ §;
      
      public function §for for native§(param1:§1$ §)
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
         blockUserService.blockUser(_loc2_);
         this.output.§use package throw§(localeService.getText(TanksLocale.TEXT_CHAT_PANEL_COMMAND_BLOCK,_loc2_));
         return true;
      }
   }
}

