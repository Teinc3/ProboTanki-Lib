package forms.base
{
   import controls.TankWindowInner;
   
   public class BaseFormWithInner extends BaseForm
   {
      private static const BORDER:int = 12;
      
      public var inner:TankWindowInner;
      
      public function BaseFormWithInner(param1:int, param2:int, param3:int)
      {
         super(param1 + BORDER * 2,param2 + param3 + BORDER * 3);
         this.inner = new TankWindowInner(param1,param2,TankWindowInner.GREEN);
         this.inner.x = BORDER;
         this.inner.y = BORDER;
         this.inner.showBlink = true;
         bg.addChild(this.inner);
      }
   }
}

