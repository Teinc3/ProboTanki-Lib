package Renamed451
{
   import Renamed136.Renamed663;
   import Renamed215.Renamed5725;
   import Renamed496.Renamed5728;
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.services.targeting.TargetingInputManager;
   import alternativa.utils.removeDisplayObject;
   import controls.Label;
   import controls.RedButton;
   import controls.buttons.h30px.GreenMediumButton;
   import controls.resultassets.ResultWindowGray;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   import Renamed415.Renamed6585;
   
   public class Renamed4719 extends Sprite
   {
      [Inject]
      public static var display:IDisplay;
      
      [Inject]
      public static var localeService:ILocaleService;
      
      [Inject]
      public static var Renamed1499:TargetingInputManager;
      
      private var Renamed9029:Renamed4718;
      
      private var Renamed9030:Renamed4718;
      
      private var Renamed9031:Renamed4718;
      
      private var Renamed9032:Sprite;
      
      private var Renamed9033:RedButton;
      
      private var Renamed9034:GreenMediumButton;
      
      private var Renamed9035:ResultWindowGray;
      
      private var Renamed9036:Boolean;
      
      private var Renamed9037:Label;
      
      private var Renamed9038:Renamed6585;
      
      private var Renamed9039:Renamed9027;
      
      public function Renamed4719(param1:String, param2:Boolean)
      {
         super();
         this.Renamed9036 = param2;
         visible = false;
         this.Renamed9039 = new Renamed9027(param1);
      }
      
      public function Renamed5742(param1:Boolean, param2:Boolean, param3:String, param4:Vector.<Renamed5725>, param5:Boolean, param6:int) : void
      {
         if(!visible)
         {
            this.Renamed9031 = this.Renamed9040(Renamed4718.GREEN,param3,param4,param5,Renamed663.NONE,param2);
            addChild(this.Renamed9031);
            this.Renamed9041(param1,param6);
         }
      }
      
      public function Renamed9042(param1:Boolean, param2:String, param3:Vector.<Renamed5725>, param4:Vector.<Renamed5725>, param5:Boolean, param6:int, param7:Renamed663) : void
      {
         if(!visible)
         {
            this.Renamed9029 = this.Renamed9040(Renamed4718.RED,param2,param3,param5,param7,true);
            addChild(this.Renamed9029);
            this.Renamed9030 = this.Renamed9040(Renamed4718.BLUE,param2,param4,param5,param7,true);
            addChild(this.Renamed9030);
            this.Renamed9041(param1,param6);
         }
      }
      
      private function Renamed9040(param1:int, param2:String, param3:Vector.<Renamed5725>, param4:Boolean, param5:Renamed663, param6:Boolean) : Renamed4718
      {
         var _loc7_:Renamed4718 = new Renamed4718(param1,param2,param4,param5,param6);
         _loc7_.Renamed9043(param3);
         return _loc7_;
      }
      
      private function Renamed9041(param1:Boolean, param2:int) : void
      {
         Renamed1499.Renamed3837();
         visible = true;
         addChild(this.Renamed9039);
         this.Renamed9044(param1,param2);
         display.stage.addEventListener(Event.RESIZE,this.onResize);
         this.onResize();
      }
      
      public function hide() : void
      {
         if(!visible)
         {
            return;
         }
         visible = false;
         display.stage.removeEventListener(Event.RESIZE,this.onResize);
         removeChild(this.Renamed9039);
         removeDisplayObject(this.Renamed9030);
         this.Renamed9030 = null;
         removeDisplayObject(this.Renamed9029);
         this.Renamed9029 = null;
         removeDisplayObject(this.Renamed9031);
         this.Renamed9031 = null;
         if(this.Renamed9033 != null)
         {
            this.Renamed9033.removeEventListener(MouseEvent.CLICK,this.Renamed9045);
            this.Renamed9033 = null;
         }
         if(this.Renamed9034 != null)
         {
            this.Renamed9034.removeEventListener(MouseEvent.CLICK,this.Renamed9046);
            this.Renamed9034 = null;
         }
         removeDisplayObject(this.Renamed9032);
         this.Renamed9032 = null;
         Renamed1499.Renamed2637();
      }
      
      private function onResize(param1:Event = null) : void
      {
         var _loc2_:int = 0;
         var _loc5_:Renamed4718 = null;
         _loc2_ = 0;
         var _loc3_:int = 0;
         _loc2_ = display.stage.stageWidth / 2;
         _loc3_ = display.stage.stageHeight / 2;
         var _loc4_:Renamed4718 = null;
         _loc5_ = null;
         if(this.Renamed9031)
         {
            this.Renamed9047();
            this.Renamed9031.y = -(this.Renamed9031.height >> 1);
            _loc4_ = _loc5_ = this.Renamed9031;
         }
         else if(Boolean(this.Renamed9030) && Boolean(this.Renamed9029))
         {
            this.Renamed9048();
            this.Renamed9029.y = -(this.Renamed9030.height + this.Renamed9029.height + 5 >> 1);
            this.Renamed9030.y = this.Renamed9029.y + this.Renamed9029.height + 5;
            _loc4_ = this.Renamed9029;
            _loc5_ = this.Renamed9030;
         }
         this.Renamed9039.y = _loc4_.y - this.Renamed9039.height - 5;
         this.Renamed9039.width = _loc4_.width;
         this.Renamed9032.y = _loc5_.y + _loc5_.height + 10;
         this.Renamed9035.width = _loc4_.width;
         this.Renamed9033.x = this.Renamed9035.width - this.Renamed9033.width - 7;
         x = _loc2_ - (width >> 1);
         y = _loc3_;
      }
      
      private function Renamed9047() : void
      {
         var _loc1_:Number = display.stage.stageHeight - 200;
         this.Renamed9031.resize(_loc1_);
      }
      
      private function Renamed9048() : void
      {
         var _loc1_:Number = NaN;
         var _loc2_:Number = display.stage.stageHeight - 200;
         this.Renamed9030.resize(_loc2_);
         this.Renamed9029.resize(_loc2_);
         if(this.Renamed9030.height + this.Renamed9029.height > _loc2_)
         {
            _loc1_ = 0.5 * _loc2_;
            if(this.Renamed9030.height > _loc1_ && this.Renamed9029.height > _loc1_)
            {
               this.Renamed9030.resize(_loc1_);
               this.Renamed9029.resize(_loc1_);
            }
            else if(this.Renamed9030.height < _loc1_)
            {
               this.Renamed9029.resize(_loc2_ - this.Renamed9030.height);
            }
            else
            {
               this.Renamed9030.resize(_loc2_ - this.Renamed9029.height);
            }
         }
      }
      
      private function Renamed9044(param1:Boolean, param2:int) : void
      {
         this.Renamed9032 = new Sprite();
         this.Renamed9035 = new ResultWindowGray();
         this.Renamed9035.width = width;
         this.Renamed9032.addChild(this.Renamed9035);
         this.Renamed9033 = new RedButton();
         this.Renamed9035.height = this.Renamed9033.height + 8;
         this.Renamed9033.addEventListener(MouseEvent.CLICK,this.Renamed9045);
         this.Renamed9033.width = 96;
         this.Renamed9033.label = localeService.getText(TanksLocale.TEXT_BATTLE_EXIT);
         this.Renamed9033.x = this.Renamed9035.width - this.Renamed9033.width - 7;
         this.Renamed9033.y = 4;
         this.Renamed9032.addChild(this.Renamed9033);
         if(param2 > 0)
         {
            this.Renamed9037 = new Label();
            this.Renamed9037.text = param1 ? localeService.getText(TanksLocale.TEXT_BATTLE_FINISH_IN) : localeService.getText(TanksLocale.TEXT_BATTLE_RESTART) + ": ";
            this.Renamed9032.addChild(this.Renamed9037);
            this.Renamed9037.x = 4;
            this.Renamed9037.y = 10;
            this.Renamed9037.visible = true;
            this.Renamed9038 = new Renamed6585(-1,-1,null,true);
            this.Renamed9038.Renamed6608(param2);
            this.Renamed9032.addChild(this.Renamed9038);
            this.Renamed9038.x = this.Renamed9037.x + this.Renamed9037.width;
            this.Renamed9038.y = 4;
            this.Renamed9038.size = 22;
            this.Renamed9038.visible = true;
         }
         addChild(this.Renamed9032);
      }
      
      public function Renamed5748(param1:String, param2:Renamed663) : void
      {
         if(!visible)
         {
            return;
         }
         if(this.Renamed9036 && this.Renamed9030 && Boolean(this.Renamed9029))
         {
            if(param2 == Renamed663.BLUE)
            {
               this.Renamed9030.Renamed5748(param1);
            }
            else
            {
               this.Renamed9029.Renamed5748(param1);
            }
            this.Renamed9048();
         }
         else if(this.Renamed9031)
         {
            this.Renamed9031.Renamed5748(param1);
            this.Renamed9047();
         }
      }
      
      public function Renamed5746(param1:Vector.<Renamed5725>) : void
      {
         if(visible)
         {
            this.Renamed9031.Renamed9043(param1);
            this.Renamed9047();
            this.onResize();
         }
      }
      
      public function Renamed5736(param1:Renamed5725) : void
      {
         if(visible)
         {
            this.Renamed9031.Renamed9049(param1);
         }
      }
      
      public function Renamed9050(param1:Vector.<Renamed5725>, param2:Renamed663) : void
      {
         if(visible)
         {
            if(param2 == Renamed663.BLUE)
            {
               this.Renamed9030.Renamed9043(param1);
            }
            else if(param2 == Renamed663.RED)
            {
               this.Renamed9029.Renamed9043(param1);
            }
            this.Renamed9048();
            this.onResize();
         }
      }
      
      public function Renamed9051(param1:Renamed5725) : void
      {
         if(visible)
         {
            if(param1.teamType == Renamed663.BLUE)
            {
               this.Renamed9030.Renamed9049(param1);
            }
            else if(param1.teamType == Renamed663.RED)
            {
               this.Renamed9029.Renamed9049(param1);
            }
         }
      }
      
      private function Renamed9045(param1:MouseEvent) : void
      {
         dispatchEvent(new Renamed5728(Renamed5728.EXIT));
      }
      
      private function Renamed9046(param1:MouseEvent) : void
      {
         this.Renamed9037.visible = true;
         this.Renamed9038.visible = true;
         this.Renamed9034.visible = false;
         dispatchEvent(new Renamed5728(Renamed5728.CONTINUE));
      }
   }
}

