package alternativa.tanks.help
{
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.locale.constants.TextConst;
   
   public class ScoreHelper extends BubbleHelper
   {
      public function ScoreHelper()
      {
         super();
         var _loc1_:ILocaleService = ILocaleService(OSGi.getInstance().getService(ILocaleService));
         text = _loc1_.getText(TextConst.STRING_HELP_PANEL_SCORE_HELPER_TEXT);
         arrowLehgth = int(_loc1_.getText(TextConst.STRING_HELP_PANEL_SCORE_HELPER_ARROW_LENGTH));
         arrowAlign = HelperAlign.TOP_LEFT;
         _showLimit = 3;
         _targetPoint.x = 79;
         _targetPoint.y = 25;
      }
   }
}

