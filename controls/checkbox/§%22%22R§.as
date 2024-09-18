package controls.checkbox
{
   import assets.icons.CheckIcons;
   import controls.Label;
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.text.AntiAliasType;
   import flash.text.GridFitType;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol560")]
   public class §""R§ extends MovieClip
   {
      public static const FRIENDLY_FIRE:int = 1;
      
      public static const INVITE_ONLY:int = 2;
      
      public static const AUTO_BALANCE:int = 3;
      
      public static const CHECK_SIGN:int = 4;
      
      public static const §!-§:int = 5;
      
      public static const §finally const import§:int = 6;
      
      public static const §do for case§:int = 7;
      
      public static const §=#y§:int = 8;
      
      public static const PRO_BATTLE:int = 9;
      
      public static const CRYSTAL_BONUS:int = 10;
      
      public var _typeIcon:CheckIcons;
      
      private var §catch for class§:CheckIcons;
      
      private var _type:int;
      
      private var §70§:Boolean = false;
      
      private var §each const catch§:int = 0;
      
      public var §class set throw§:Label;
      
      private var _enable:Boolean = true;
      
      public function §""R§()
      {
         super();
         this.§catch for class§ = getChildByName("_typeIcon") as CheckIcons;
         this.type = CHECK_SIGN;
         tabEnabled = false;
         this.§catch for class§.visible = this.§70§;
         gotoAndStop(1);
         this.enable = true;
         this.§class set throw§ = new Label();
         this.§class set throw§.x = 29;
         this.§class set throw§.y = 7;
         this.§class set throw§.antiAliasType = AntiAliasType.ADVANCED;
         this.§class set throw§.gridFitType = GridFitType.SUBPIXEL;
         addChild(this.§class set throw§);
      }
      
      public function get § !w§() : Boolean
      {
         return this.§70§;
      }
      
      public function set § !w§(param1:Boolean) : void
      {
         this.§70§ = param1;
         this.changeState();
      }
      
      public function set enable(param1:Boolean) : void
      {
         this._enable = param1;
         if(this._enable)
         {
            this.addListeners();
         }
         else
         {
            this.removeListeners();
         }
      }
      
      public function set label(param1:String) : void
      {
         this.§class set throw§.text = param1;
      }
      
      private function addListeners() : void
      {
         gotoAndStop(1);
         buttonMode = true;
         mouseEnabled = true;
         addEventListener(MouseEvent.MOUSE_OVER,this.onMouseEvent);
         addEventListener(MouseEvent.MOUSE_OUT,this.onMouseEvent);
         addEventListener(MouseEvent.MOUSE_DOWN,this.onMouseEvent);
         addEventListener(MouseEvent.MOUSE_UP,this.onMouseEvent);
      }
      
      private function removeListeners() : void
      {
         gotoAndStop(4);
         buttonMode = false;
         mouseEnabled = false;
         removeEventListener(MouseEvent.MOUSE_OVER,this.onMouseEvent);
         removeEventListener(MouseEvent.MOUSE_OUT,this.onMouseEvent);
         removeEventListener(MouseEvent.MOUSE_DOWN,this.onMouseEvent);
         removeEventListener(MouseEvent.MOUSE_UP,this.onMouseEvent);
      }
      
      public function set type(param1:int) : void
      {
         this._type = param1;
         this.§catch for class§.type = this._type;
      }
      
      private function onMouseEvent(param1:MouseEvent) : void
      {
         switch(param1.type)
         {
            case MouseEvent.MOUSE_OVER:
               --this.§each const catch§;
               gotoAndStop(2);
               this.§catch for class§.y = 0;
               break;
            case MouseEvent.MOUSE_OUT:
               ++this.§each const catch§;
               gotoAndStop(1);
               this.§catch for class§.y = 0;
               break;
            case MouseEvent.MOUSE_DOWN:
               this.§each const catch§ = 2;
               gotoAndStop(3);
               this.§catch for class§.y = 1;
               break;
            case MouseEvent.MOUSE_UP:
               gotoAndStop(2);
               this.§70§ = !this.§70§;
               if(this.§each const catch§ == 2)
               {
                  this.changeState();
               }
               this.§each const catch§ = 0;
               this.§catch for class§.y = 0;
         }
      }
      
      private function changeState() : void
      {
         this.§catch for class§.visible = this.§70§;
         dispatchEvent(new CheckBoxEvent(CheckBoxEvent.STATE_CHANGED));
      }
   }
}

