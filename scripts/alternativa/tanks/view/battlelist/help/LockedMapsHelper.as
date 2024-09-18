package alternativa.tanks.view.battlelist.help
{
   import alternativa.tanks.help.BubbleHelper;
   import alternativa.tanks.help.HelperAlign;
   
   public class LockedMapsHelper extends BubbleHelper
   {
      public function LockedMapsHelper(param1:String, param2:int)
      {
         super();
         text = param1;
         arrowLehgth = param2;
         arrowAlign = HelperAlign.MIDDLE_LEFT;
         _showLimit = 5;
      }
   }
}

