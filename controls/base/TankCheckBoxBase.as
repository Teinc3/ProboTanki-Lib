package controls.base
{
   import controls.checkbox.Renamed3966;
   
   public class TankCheckBoxBase extends Renamed3966
   {
      private var _labelBase:LabelBase;
      
      public function TankCheckBoxBase()
      {
         super();
         this._labelBase = new LabelBase();
         this._labelBase.x = 29;
         this._labelBase.y = 7;
         addChild(this._labelBase);
      }
      
      override public function set label(param1:String) : void
      {
         this._labelBase.text = param1;
      }
   }
}

