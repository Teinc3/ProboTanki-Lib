package forms.base
{
   import base.DiscreteSprite;
   import controls.TankWindow;
   
   public class BaseForm extends DiscreteSprite
   {
      protected var bg:TankWindow;
      
      public function BaseForm(param1:int, param2:int)
      {
         super();
         this.bg = new TankWindow(param1,param2);
         addChild(this.bg);
      }
      
      public function get window() : TankWindow
      {
         return this.bg;
      }
   }
}

