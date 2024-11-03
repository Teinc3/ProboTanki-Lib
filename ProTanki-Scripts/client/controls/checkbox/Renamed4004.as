package controls.checkbox
{
   import assets.icons.CheckIcons;
   import controls.Label;
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.text.AntiAliasType;
   import flash.text.GridFitType;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol560")]
   public class Renamed3966 extends MovieClip
   {
      public static const FRIENDLY_FIRE:int = 1;
      
      public static const INVITE_ONLY:int = 2;
      
      public static const AUTO_BALANCE:int = 3;
      
      public static const CHECK_SIGN:int = 4;
      
      public static const Renamed3997:int = 5;
      
      public static const Renamed3998:int = 6;
      
      public static const Renamed3957:int = 7;
      
      public static const Renamed3999:int = 8;
      
      public static const PRO_BATTLE:int = 9;
      
      public static const CRYSTAL_BONUS:int = 10;
      
      public var _typeIcon:CheckIcons;
      
      private var Renamed4000:CheckIcons;
      
      private var _type:int;
      
      private var Renamed4001:Boolean = false;
      
      private var Renamed4002:int = 0;
      
      public var Renamed4003:Label;
      
      private var _enable:Boolean = true;
      
      public function Renamed3966()
      {
         super();
         this.Renamed4000 = getChildByName("_typeIcon") as CheckIcons;
         this.type = CHECK_SIGN;
         tabEnabled = false;
         this.Renamed4000.visible = this.Renamed4001;
         gotoAndStop(1);
         this.enable = true;
         this.Renamed4003 = new Label();
         this.Renamed4003.x = 29;
         this.Renamed4003.y = 7;
         this.Renamed4003.antiAliasType = AntiAliasType.ADVANCED;
         this.Renamed4003.gridFitType = GridFitType.SUBPIXEL;
         addChild(this.Renamed4003);
      }
      
      public function get Renamed1878() : Boolean
      {
         return this.Renamed4001;
      }
      
      public function set Renamed1878(param1:Boolean) : void
      {
         this.Renamed4001 = param1;
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
         this.Renamed4003.text = param1;
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
         this.Renamed4000.type = this._type;
      }
      
      private function onMouseEvent(param1:MouseEvent) : void
      {
         switch(param1.type)
         {
            case MouseEvent.MOUSE_OVER:
               --this.Renamed4002;
               gotoAndStop(2);
               this.Renamed4000.y = 0;
               break;
            case MouseEvent.MOUSE_OUT:
               ++this.Renamed4002;
               gotoAndStop(1);
               this.Renamed4000.y = 0;
               break;
            case MouseEvent.MOUSE_DOWN:
               this.Renamed4002 = 2;
               gotoAndStop(3);
               this.Renamed4000.y = 1;
               break;
            case MouseEvent.MOUSE_UP:
               gotoAndStop(2);
               this.Renamed4001 = !this.Renamed4001;
               if(this.Renamed4002 == 2)
               {
                  this.changeState();
               }
               this.Renamed4002 = 0;
               this.Renamed4000.y = 0;
         }
      }
      
      private function changeState() : void
      {
         this.Renamed4000.visible = this.Renamed4001;
         dispatchEvent(new CheckBoxEvent(CheckBoxEvent.STATE_CHANGED));
      }
   }
}

