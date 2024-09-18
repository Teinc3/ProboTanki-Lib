package forms.registration.bubbles
{
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.help.BubbleHelper;
   import alternativa.tanks.help.HelperAlign;
   import alternativa.tanks.locale.constants.TextConst;
   
   public class PasswordsDoNotMatchBubble extends BubbleHelper
   {
      [Inject]
      public static var localeService:ILocaleService;
      
      public function PasswordsDoNotMatchBubble()
      {
         super();
         text = localeService.getText(TextConst.STRING_HELP_PASSWORDS_DO_NOT_MATCH);
         arrowLehgth = 20;
         arrowAlign = HelperAlign.TOP_LEFT;
         _showLimit = 3;
      }
   }
}

