package controls.checkbox
{
   import controls.base.LabelBase;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   
   public class Renamed3902 extends Sprite
   {
      private static const Renamed4008:Class = Renamed3995;
      
      private static const Renamed4009:BitmapData = Bitmap(new Renamed4008()).bitmapData;
      
      private static const Renamed4010:Class = Renamed4011;
      
      private static const Renamed4012:BitmapData = Bitmap(new Renamed4010()).bitmapData;
      
      private static const Renamed4013:Class = Renamed4005;
      
      private static const Renamed4014:BitmapData = Bitmap(new Renamed4013()).bitmapData;
      
      private static const Renamed4015:Class = Renamed4007;
      
      private static const Renamed4016:BitmapData = Bitmap(new Renamed4015()).bitmapData;
      
      private var Renamed4017:Bitmap;
      
      private var Renamed4018:Bitmap;
      
      private var Renamed4019:Bitmap;
      
      private var Renamed4020:Bitmap;
      
      private var Renamed4021:Array;
      
      private var Renamed4001:Boolean;
      
      private var Renamed4022:Boolean;
      
      private var _enabled:Boolean;
      
      protected var Renamed4023:LabelBase;
      
      public function Renamed3902(param1:BitmapData = null)
      {
         super();
         this.Renamed4018 = new Bitmap(Renamed4012);
         addChild(this.Renamed4018);
         this.Renamed4019 = new Bitmap(Renamed4014);
         addChild(this.Renamed4019);
         this.Renamed4020 = new Bitmap(Renamed4016);
         addChild(this.Renamed4020);
         this.Renamed4017 = new Bitmap(param1 != null ? param1 : Renamed4009);
         addChild(this.Renamed4017);
         this.Renamed4017.visible = false;
         this.Renamed4021 = [this.Renamed4018,this.Renamed4019,this.Renamed4020];
         tabEnabled = false;
         this.Renamed4024(this.Renamed4018);
         this.enabled = true;
         this.Renamed4023 = new LabelBase();
         this.Renamed4023.x = 29;
         this.Renamed4023.y = 7;
         addChild(this.Renamed4023);
      }
      
      private function Renamed4024(param1:Bitmap) : void
      {
         var _loc2_:Bitmap = null;
         for each(_loc2_ in this.Renamed4021)
         {
            _loc2_.visible = false;
         }
         param1.visible = true;
      }
      
      public function get Renamed1878() : Boolean
      {
         return this.Renamed4001;
      }
      
      public function Renamed4025(param1:Boolean) : void
      {
         if(this.Renamed4001 != param1)
         {
            this.Renamed4001 = param1;
            this.Renamed4017.visible = this.Renamed4001;
         }
      }
      
      public function set Renamed1878(param1:Boolean) : void
      {
         if(this.Renamed4001 != param1)
         {
            this.changeState();
         }
      }
      
      public function set enabled(param1:Boolean) : void
      {
         if(this._enabled != param1)
         {
            this._enabled = param1;
            if(this._enabled)
            {
               buttonMode = true;
               mouseEnabled = true;
               this.addListeners();
            }
            else
            {
               buttonMode = false;
               mouseEnabled = false;
               this.removeListeners();
            }
         }
      }
      
      public function set label(param1:String) : void
      {
         this.Renamed4023.text = param1;
      }
      
      public function Renamed4026(param1:int) : void
      {
         this.Renamed4023.y += param1;
      }
      
      private function addListeners() : void
      {
         addEventListener(MouseEvent.MOUSE_OVER,this.onMouseEvent);
         addEventListener(MouseEvent.MOUSE_OUT,this.onMouseEvent);
         addEventListener(MouseEvent.MOUSE_DOWN,this.onMouseEvent);
         addEventListener(MouseEvent.MOUSE_UP,this.onMouseEvent);
      }
      
      private function removeListeners() : void
      {
         removeEventListener(MouseEvent.MOUSE_OVER,this.onMouseEvent);
         removeEventListener(MouseEvent.MOUSE_OUT,this.onMouseEvent);
         removeEventListener(MouseEvent.MOUSE_DOWN,this.onMouseEvent);
         removeEventListener(MouseEvent.MOUSE_UP,this.onMouseEvent);
      }
      
      private function onMouseEvent(param1:MouseEvent) : void
      {
         this.Renamed4017.y = 0;
         switch(param1.type)
         {
            case MouseEvent.MOUSE_OVER:
               this.Renamed4024(this.Renamed4020);
               break;
            case MouseEvent.MOUSE_OUT:
               this.Renamed4022 = false;
               this.Renamed4024(this.Renamed4018);
               break;
            case MouseEvent.MOUSE_DOWN:
               if(this.Renamed4001)
               {
                  this.Renamed4017.y = 2;
               }
               this.Renamed4022 = true;
               this.Renamed4024(this.Renamed4019);
               break;
            case MouseEvent.MOUSE_UP:
               this.Renamed4024(this.Renamed4020);
               if(this.Renamed4022)
               {
                  this.Renamed4022 = false;
                  this.changeState();
               }
         }
      }
      
      private function changeState() : void
      {
         this.Renamed4001 = !this.Renamed4001;
         this.Renamed4017.visible = this.Renamed4001;
         dispatchEvent(new CheckBoxEvent(CheckBoxEvent.STATE_CHANGED));
      }
   }
}

