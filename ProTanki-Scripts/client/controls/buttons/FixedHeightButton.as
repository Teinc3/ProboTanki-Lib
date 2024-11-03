package controls.buttons
{
   import controls.FixedHeightRectangle;
   
   public class FixedHeightButton extends ButtonBase
   {
      private var upState:FixedHeightRectangle;
      
      private var overState:FixedHeightRectangle;
      
      private var downState:FixedHeightRectangle;
      
      private var disabledState:FixedHeightRectangle;
      
      public function FixedHeightButton(param1:FixedHeightButtonSkin)
      {
         this.upState = new FixedHeightRectangle(param1.up);
         this.overState = new FixedHeightRectangle(param1.over);
         this.downState = new FixedHeightRectangle(param1.down);
         this.disabledState = new FixedHeightRectangle(param1.disabled);
         super(this.upState,this.overState,this.downState,this.disabledState);
      }
      
      public function setSkin(param1:FixedHeightButtonSkin) : void
      {
         this.upState.setSkin(param1.up);
         this.overState.setSkin(param1.over);
         this.downState.setSkin(param1.down);
         this.disabledState.setSkin(param1.disabled);
      }
   }
}

