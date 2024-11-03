package alternativa.tanks.models.battle.gui.chat
{
   import Renamed136.Renamed663;
   import Renamed215.Renamed2611;
   import Renamed488.Renamed2612;
   import Renamed488.Renamed2613;
   import Renamed488.Renamed2614;
   import Renamed2615.Renamed2616;
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.battle.events.BattleEventDispatcher;
   import alternativa.tanks.model.ShowChat;
   import alternativa.tanks.models.battle.battlefield.BattleUserInfoService;
   import alternativa.tanks.services.battlegui.BattleGUIService;
   import alternativa.tanks.services.battleinput.BattleInputService;
   import alternativa.tanks.services.battleinput.Renamed2410;
   import alternativa.tanks.services.targeting.TargetingInputManager;
   import controls.chat.BattleChatInput;
   import controls.chat.ChatInputType;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.FocusEvent;
   import flash.events.KeyboardEvent;
   import flash.text.TextField;
   import flash.ui.Keyboard;
   import platform.client.fp10.core.type.IGameObject;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.battle.IBattleInfoService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.blockuser.IBlockUserService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.fullscreen.FullscreenService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.userproperties.IUserPropertiesService;
   import projects.tanks.clients.fp10.libraries.tanksservices.utils.AlertUtils;
   
   public class Renamed2568 extends Sprite implements ShowChat
   {
      [Inject]
      public static var display:IDisplay;
      
      [Inject]
      public static var Renamed2384:BattleInputService;
      
      [Inject]
      public static var battleEventDispatcher:BattleEventDispatcher;
      
      [Inject]
      public static var localeService:ILocaleService;
      
      [Inject]
      public static var blockUserService:IBlockUserService;
      
      [Inject]
      public static var Renamed2423:BattleGUIService;
      
      [Inject]
      public static var battleInfoService:IBattleInfoService;
      
      [Inject]
      public static var userPropertiesService:IUserPropertiesService;
      
      [Inject]
      public static var userInfoService:BattleUserInfoService;
      
      [Inject]
      public static var fullscreenService:FullscreenService;
      
      [Inject]
      public static var Renamed2425:TargetingInputManager;
      
      private const Renamed2617:String = "/block";
      
      private const Renamed2618:String = "/unblock";
      
      private const FULL_SCREEN:String = "fullScreen";
      
      private const Renamed2619:String = "fullScreenInteractiveAccepted";
      
      private var Renamed2620:Object;
      
      private var Renamed2621:Renamed2622;
      
      private var Renamed2623:Boolean;
      
      private var inputControl:BattleChatInput;
      
      private var input:TextField;
      
      private var output:Renamed2590;
      
      private var Renamed2624:Boolean;
      
      private var _locked:Boolean;
      
      private var Renamed2586:Boolean;
      
      private var Renamed2625:Renamed663;
      
      private var Renamed2626:IGameObject;
      
      public function Renamed2568()
      {
         super();
         this.init();
      }
      
      public function set Renamed2627(param1:Boolean) : void
      {
         if(this.Renamed2623 != param1)
         {
            this.Renamed2623 = param1;
            if(!this.Renamed2624)
            {
               this.output.visible = this.Renamed2623;
            }
         }
      }
      
      public function set locked(param1:Boolean) : void
      {
         this._locked = param1;
      }
      
      public function get Renamed2628() : Boolean
      {
         return this.Renamed2624;
      }
      
      public function Renamed2578(param1:String, param2:Renamed663, param3:String, param4:Boolean, param5:Boolean) : void
      {
         var _loc6_:String = null;
         if(!param5)
         {
            _loc6_ = param1;
            if(blockUserService.isBlocked(_loc6_))
            {
               return;
            }
         }
         this.output.addLine(param1,param2,param3,param4,param5);
         this.onResize();
      }
      
      public function Renamed2580(param1:String) : void
      {
         this.output.Renamed2580(param1);
         this.onResize();
      }
      
      public function clear() : void
      {
         this.output.clear();
      }
      
      public function Renamed2582() : void
      {
         var _loc1_:Renamed2611 = null;
         if(!(this.Renamed2624 || this._locked))
         {
            this.output.visible = true;
            this.Renamed2621.visible = this.Renamed2621.getText().length > 0;
            if(!battleInfoService.spectator)
            {
               _loc1_ = Renamed2616(OSGi.getInstance().getService(Renamed2616)).getShortUserInfo(userPropertiesService.userId);
               this.Renamed2625 = _loc1_.teamType;
            }
            this.Renamed2629();
            this.Renamed2624 = true;
            this.input.text = "";
            this.inputControl.visible = true;
            display.stage.focus = this.input;
            this.onResize();
            Renamed2384.lock(Renamed2410.CHAT);
            battleEventDispatcher.dispatchEvent(new Renamed2630(Renamed2630.OPEN));
            this.Renamed2631();
            Renamed2425.Renamed2632();
         }
      }
      
      public function Renamed2633(param1:IGameObject) : void
      {
         this.Renamed2626 = param1;
         this.Renamed2586 = true;
      }
      
      private function Renamed2631() : void
      {
         if(battleInfoService.isSpectatorMode())
         {
            if(this.Renamed2586)
            {
               this.inputControl.setInputType(ChatInputType.YELLOW);
               this.inputControl.setChannelText(localeService.getText(TanksLocale.TEXT_CHAT_LABEL_SPECTATORS));
            }
            else
            {
               this.inputControl.setInputType(ChatInputType.STANDART);
               this.inputControl.setChannelText(localeService.getText(TanksLocale.TEXT_CHAT_LABEL_ALL));
            }
            return;
         }
         if(this.Renamed2586 && this.Renamed2625 != Renamed663.NONE)
         {
            if(this.Renamed2625 == Renamed663.BLUE)
            {
               this.inputControl.setInputType(ChatInputType.BLUE);
            }
            else
            {
               this.inputControl.setInputType(ChatInputType.RED);
            }
            this.inputControl.setChannelText(localeService.getText(TanksLocale.TEXT_CHAT_LABEL_TEAM));
         }
         else
         {
            this.inputControl.setInputType(ChatInputType.STANDART);
            this.inputControl.setChannelText(localeService.getText(TanksLocale.TEXT_CHAT_LABEL_ALL));
         }
      }
      
      private function Renamed2634() : void
      {
         this.Renamed2586 = !this.Renamed2586;
         this.Renamed2631();
      }
      
      public function Renamed2635() : void
      {
         if(this.Renamed2624)
         {
            this.output.visible = this.Renamed2623;
            this.Renamed2621.visible = false;
            this.Renamed2621.setText("");
            if(this.inputControl.visible)
            {
               this.removeEventListeners();
               this.Renamed2624 = false;
               this.inputControl.visible = false;
               this.Renamed2636();
               this.output.Renamed2609();
               this.onResize();
            }
            Renamed2384.unlock(Renamed2410.CHAT);
            battleEventDispatcher.dispatchEvent(new Renamed2630(Renamed2630.CLOSE));
            Renamed2425.Renamed2637();
         }
      }
      
      private function init() : void
      {
         this.inputControl = new BattleChatInput();
         this.inputControl.tabEnabled = false;
         this.inputControl.tabChildren = false;
         this.inputControl.x = 10;
         addChild(this.inputControl);
         this.input = this.inputControl.textField;
         this.input.maxChars = 299;
         this.input.addEventListener(KeyboardEvent.KEY_UP,this.onInputKeyUp);
         this.input.addEventListener(FocusEvent.FOCUS_IN,this.Renamed2638);
         this.output = new Renamed2590();
         this.output.visible = this.Renamed2623;
         this.output.tabEnabled = false;
         this.output.tabChildren = false;
         this.output.x = 10;
         addChild(this.output);
         this.Renamed2621 = new Renamed2622();
         this.Renamed2621.x = 10;
         this.Renamed2621.visible = false;
         addChild(this.Renamed2621);
         this.Renamed2639();
         addEventListener(Event.ADDED_TO_STAGE,this.onAddedToStage);
         addEventListener(Event.REMOVED_FROM_STAGE,this.onRemovedFromStage);
      }
      
      private function Renamed2639() : void
      {
         this.Renamed2620 = {};
         this.Renamed2620[this.Renamed2617] = new Renamed2613(this.output);
         this.Renamed2620[this.Renamed2618] = new Renamed2614(this.output);
      }
      
      public function Renamed2581(param1:String) : void
      {
         this.Renamed2621.setText(param1);
      }
      
      [Obfuscation(rename="false")]
      public function setShowChat(param1:Boolean) : void
      {
         this.Renamed2627 = param1;
      }
      
      private function Renamed2629() : void
      {
         this.input.addEventListener(FocusEvent.FOCUS_OUT,this.Renamed2640);
         if(fullscreenService.isAvailable())
         {
            display.stage.addEventListener(this.FULL_SCREEN,this.onFullscreen);
            display.stage.addEventListener(this.Renamed2619,this.onFullscreen);
         }
      }
      
      private function removeEventListeners() : void
      {
         this.input.removeEventListener(FocusEvent.FOCUS_OUT,this.Renamed2640);
         if(fullscreenService.isAvailable())
         {
            display.stage.removeEventListener(this.FULL_SCREEN,this.onFullscreen);
            display.stage.removeEventListener(this.Renamed2619,this.onFullscreen);
         }
      }
      
      private function onAddedToStage(param1:Event) : void
      {
         this.inputControl.visible = false;
         stage.addEventListener(Event.RESIZE,this.onResize);
         this.onResize(null);
      }
      
      private function onRemovedFromStage(param1:Event) : void
      {
         stage.removeEventListener(Event.RESIZE,this.onResize);
      }
      
      private function onResize(param1:Event = null) : void
      {
         var _loc2_:Number = NaN;
         if(this.Renamed2624)
         {
            this.output.Renamed2606();
         }
         var _loc3_:int = int(0.25 * display.stage.stageWidth);
         var _loc4_:int = Renamed2423.Renamed2641();
         if(_loc4_ != 0 && this.inputControl.x + _loc3_ + 10 > _loc4_)
         {
            _loc3_ = _loc4_ - this.inputControl.x - 10;
         }
         this.inputControl.width = _loc3_;
         this.inputControl.y = display.stage.stageHeight - this.inputControl.height - 70;
         _loc2_ = this.inputControl.y - this.output.height - 10;
         if(_loc2_ < 50)
         {
            while(_loc2_ < 50)
            {
               _loc2_ += this.output.height;
               this.output.Renamed2605();
               _loc2_ -= this.output.height;
            }
         }
         this.output.y = _loc2_;
         this.Renamed2621.Renamed2642(0.25 * display.stage.stageWidth);
         this.Renamed2621.y = _loc2_ - 120;
         if(this.Renamed2624)
         {
            this.Renamed2631();
         }
      }
      
      private function onInputKeyUp(param1:KeyboardEvent) : void
      {
         if(this.inputControl.visible)
         {
            if(param1.keyCode == Keyboard.ENTER)
            {
               if(this.input.text != "")
               {
                  if(!this.Renamed2643(this.input.text) && hasEventListener(Renamed2573.SEND_MESSAGE))
                  {
                     dispatchEvent(new Renamed2573(Renamed2573.SEND_MESSAGE,this.input.text,this.Renamed2586));
                  }
                  this.input.text = "";
               }
               param1.keyCode = 0;
               this.Renamed2635();
            }
            if(AlertUtils.isCancelKey(param1.keyCode))
            {
               param1.keyCode = 0;
               this.Renamed2635();
            }
            if(param1.keyCode == Keyboard.TAB)
            {
               this.Renamed2634();
            }
         }
      }
      
      private function Renamed2643(param1:String) : Boolean
      {
         if(param1.charAt(0) != "/")
         {
            return false;
         }
         var _loc2_:Array = param1.split(/\s+/);
         if(_loc2_.length == 0)
         {
            return false;
         }
         var _loc3_:String = _loc2_.shift();
         var _loc4_:Renamed2612 = this.Renamed2620[_loc3_];
         if(_loc4_ == null)
         {
            return false;
         }
         _loc4_.Renamed2643(_loc2_);
         return true;
      }
      
      private function Renamed2638(param1:FocusEvent) : void
      {
         if(!this.Renamed2624)
         {
            this.Renamed2636();
         }
      }
      
      private function Renamed2640(param1:FocusEvent) : void
      {
         if(stage && this.input && this.inputControl && this.inputControl.visible)
         {
            stage.focus = this.input;
         }
         else
         {
            this.Renamed2635();
         }
      }
      
      private function onFullscreen(param1:Event) : void
      {
         if(this.Renamed2624)
         {
            stage.focus = this.input;
         }
      }
      
      private function Renamed2636() : void
      {
         if(display.stage.focus == this.input)
         {
            display.stage.focus = null;
         }
      }
   }
}

