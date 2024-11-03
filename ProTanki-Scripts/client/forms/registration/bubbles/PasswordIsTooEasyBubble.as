package forms.registration.bubbles
{
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.help.BubbleHelper;
   import alternativa.tanks.help.HelperAlign;
   import alternativa.tanks.locale.constants.TextConst;
   
   public class PasswordIsTooEasyBubble extends BubbleHelper
   {
      [Inject]
      public static var localeService:ILocaleService;
      
      public function PasswordIsTooEasyBubble()
      {
         super();
         text = localeService.getText(TextConst.STRING_HELP_PASSWORD_IS_TOO_SIMPLE);
         arrowLehgth = 20;
         arrowAlign = HelperAlign.TOP_LEFT;
         _showLimit = 3;
      }
   }
}

