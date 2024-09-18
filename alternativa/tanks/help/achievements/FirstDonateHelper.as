package alternativa.tanks.help.achievements
{
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.help.BubbleHelper;
   import alternativa.tanks.help.HelperAlign;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   
   public class FirstDonateHelper extends BubbleHelper
   {
      public function FirstDonateHelper()
      {
         super();
         var _loc1_:ILocaleService = ILocaleService(OSGi.getInstance().getService(ILocaleService));
         text = _loc1_.getText(TanksLocale.TEXT_HELP_PANEL_ACHIEVEMENTS_FIRST_DONATE_TEXT);
         arrowLehgth = int(_loc1_.getText(TanksLocale.TEXT_HELP_PANEL_ACHIEVEMENTS_FIRST_DONATE_ARROW_LENGTH));
         arrowAlign = HelperAlign.TOP_RIGHT;
         _showLimit = 3;
      }
   }
}

