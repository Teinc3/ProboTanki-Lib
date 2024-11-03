package forms
{
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.locale.constants.TextConst;
   import flash.text.TextFormatAlign;
   
   public class ServerRedirectAlert extends ServerStopAlert
   {
      public function ServerRedirectAlert(param1:int)
      {
         super(param1);
      }
      
      override protected function init() : void
      {
         var _loc1_:ILocaleService = OSGi.getInstance().getService(ILocaleService) as ILocaleService;
         timeLimitLabel.align = TextFormatAlign.CENTER;
         str = _loc1_.getText(TextConst.REDIRECT_ALERT_TEXT);
         timeLimitLabel.text = getText(str,"88");
         addChild(bg);
         addChild(timeLimitLabel);
         timeLimitLabel.x = PADDING;
         timeLimitLabel.y = PADDING;
         bg.width = timeLimitLabel.width + PADDING * 2;
         bg.height = timeLimitLabel.height + PADDING * 2;
         showCountDown();
      }
   }
}

