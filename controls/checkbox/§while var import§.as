package controls.checkbox
{
   import controls.base.LabelBase;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   
   public class §while var import§ extends Sprite
   {
      private static const §default package null§:Class = § !<§;
      
      private static const §catch for in§:BitmapData = Bitmap(new §default package null§()).bitmapData;
      
      private static const §null package include§:Class = §]!h§;
      
      private static const §;!G§:BitmapData = Bitmap(new §null package include§()).bitmapData;
      
      private static const §!T§:Class = §-"2§;
      
      private static const § !z§:BitmapData = Bitmap(new §!T§()).bitmapData;
      
      private static const §!!D§:Class = §throw package return§;
      
      private static const §true var static§:BitmapData = Bitmap(new §!!D§()).bitmapData;
      
      private var §3<§:Bitmap;
      
      private var §continue return§:Bitmap;
      
      private var §[!C§:Bitmap;
      
      private var §dynamic set dynamic§:Bitmap;
      
      private var §4k§:Array;
      
      private var §70§:Boolean;
      
      private var §^-§:Boolean;
      
      private var _enabled:Boolean;
      
      protected var §false var§:LabelBase;
      
      public function §while var import§(param1:BitmapData = null)
      {
         super();
         this.§continue return§ = new Bitmap(§;!G§);
         addChild(this.§continue return§);
         this.§[!C§ = new Bitmap(§ !z§);
         addChild(this.§[!C§);
         this.§dynamic set dynamic§ = new Bitmap(§true var static§);
         addChild(this.§dynamic set dynamic§);
         this.§3<§ = new Bitmap(param1 != null ? param1 : §catch for in§);
         addChild(this.§3<§);
         this.§3<§.visible = false;
         this.§4k§ = [this.§continue return§,this.§[!C§,this.§dynamic set dynamic§];
         tabEnabled = false;
         this.§`!a§(this.§continue return§);
         this.enabled = true;
         this.§false var§ = new LabelBase();
         this.§false var§.x = 29;
         this.§false var§.y = 7;
         addChild(this.§false var§);
      }
      
      private function §`!a§(param1:Bitmap) : void
      {
         var _loc2_:Bitmap = null;
         for each(_loc2_ in this.§4k§)
         {
            _loc2_.visible = false;
         }
         param1.visible = true;
      }
      
      public function get § !w§() : Boolean
      {
         return this.§70§;
      }
      
      public function §set class§(param1:Boolean) : void
      {
         if(this.§70§ != param1)
         {
            this.§70§ = param1;
            this.§3<§.visible = this.§70§;
         }
      }
      
      public function set § !w§(param1:Boolean) : void
      {
         if(this.§70§ != param1)
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
         this.§false var§.text = param1;
      }
      
      public function §case const true§(param1:int) : void
      {
         this.§false var§.y += param1;
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
         this.§3<§.y = 0;
         switch(param1.type)
         {
            case MouseEvent.MOUSE_OVER:
               this.§`!a§(this.§dynamic set dynamic§);
               break;
            case MouseEvent.MOUSE_OUT:
               this.§^-§ = false;
               this.§`!a§(this.§continue return§);
               break;
            case MouseEvent.MOUSE_DOWN:
               if(this.§70§)
               {
                  this.§3<§.y = 2;
               }
               this.§^-§ = true;
               this.§`!a§(this.§[!C§);
               break;
            case MouseEvent.MOUSE_UP:
               this.§`!a§(this.§dynamic set dynamic§);
               if(this.§^-§)
               {
                  this.§^-§ = false;
                  this.changeState();
               }
         }
      }
      
      private function changeState() : void
      {
         this.§70§ = !this.§70§;
         this.§3<§.visible = this.§70§;
         dispatchEvent(new CheckBoxEvent(CheckBoxEvent.STATE_CHANGED));
      }
   }
}

