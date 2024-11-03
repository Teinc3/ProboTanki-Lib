package forms.registration.bubbles
{
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.help.BubbleHelper;
   import alternativa.tanks.help.HelperAlign;
   import alternativa.tanks.locale.constants.TextConst;
   
   public class NameIsNotUniqueBubble extends BubbleHelper
   {
      [Inject]
      public static var localeService:ILocaleService;
      
      public function NameIsNotUniqueBubble()
      {
         super();
         text = localeService.getText(TextConst.STRING_HELP_NAME_IS_NOT_UNIQUE);
         arrowLehgth = 20;
         arrowAlign = HelperAlign.TOP_LEFT;
         _showLimit = 3;
      }
   }
}

