package alternativa.tanks.help
{
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.locale.constants.TextConst;
   
   public class ButtonBarHelper extends PanelBubbleHelper
   {
      public function ButtonBarHelper(param1:Number, param2:Number, param3:Number, param4:Boolean = false)
      {
         super(param1,param2,param3);
         var _loc5_:ILocaleService = ILocaleService(OSGi.getInstance().getService(ILocaleService));
         text = _loc5_.getText(param4 ? TextConst.STRING_PARTNER_HELP_PANEL_BUTTON_BAR_HELPER_TEXT : TextConst.STRING_HELP_PANEL_BUTTON_BAR_HELPER_TEXT);
         arrowLehgth = int(_loc5_.getText(TextConst.STRING_HELP_PANEL_BUTTON_BAR_HELPER_ARROW_LENGTH));
         arrowAlign = HelperAlign.TOP_RIGHT;
      }
   }
}

