package alternativa.tanks.models.battle.gui.chat
{
   import § !g§.§class for case§;
   import §-!z§.§!"L§;
   import §]s§.§="?§;
   import §]s§.§for for native§;
   import §]s§.§implements static§;
   import §`"b§.§if for else§;
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.battle.events.BattleEventDispatcher;
   import alternativa.tanks.model.ShowChat;
   import alternativa.tanks.models.battle.battlefield.BattleUserInfoService;
   import alternativa.tanks.services.battlegui.BattleGUIService;
   import alternativa.tanks.services.battleinput.BattleInputService;
   import alternativa.tanks.services.battleinput.§class const while§;
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
   
   public class §3"Q§ extends Sprite implements ShowChat
   {
      [Inject]
      public static var display:IDisplay;
      
      [Inject]
      public static var §const catch get§:BattleInputService;
      
      [Inject]
      public static var battleEventDispatcher:BattleEventDispatcher;
      
      [Inject]
      public static var localeService:ILocaleService;
      
      [Inject]
      public static var blockUserService:IBlockUserService;
      
      [Inject]
      public static var §]!W§:BattleGUIService;
      
      [Inject]
      public static var battleInfoService:IBattleInfoService;
      
      [Inject]
      public static var userPropertiesService:IUserPropertiesService;
      
      [Inject]
      public static var userInfoService:BattleUserInfoService;
      
      [Inject]
      public static var fullscreenService:FullscreenService;
      
      [Inject]
      public static var §else for if§:TargetingInputManager;
      
      private const §native set const§:String = "/block";
      
      private const §native false§:String = "/unblock";
      
      private const FULL_SCREEN:String = "fullScreen";
      
      private const §with for native§:String = "fullScreenInteractiveAccepted";
      
      private var §extends var native§:Object;
      
      private var §class var break§:§true catch§;
      
      private var §class set native§:Boolean;
      
      private var inputControl:BattleChatInput;
      
      private var input:TextField;
      
      private var output:§1$ §;
      
      private var §implements return§:Boolean;
      
      private var _locked:Boolean;
      
      private var §=#F§:Boolean;
      
      private var §static finally§:§class for case§;
      
      private var §<#E§:IGameObject;
      
      public function §3"Q§()
      {
         super();
         this.init();
      }
      
      public function set §!$#§(param1:Boolean) : void
      {
         if(this.§class set native§ != param1)
         {
            this.§class set native§ = param1;
            if(!this.§implements return§)
            {
               this.output.visible = this.§class set native§;
            }
         }
      }
      
      public function set locked(param1:Boolean) : void
      {
         this._locked = param1;
      }
      
      public function get §["2§() : Boolean
      {
         return this.§implements return§;
      }
      
      public function §-#]§(param1:String, param2:§class for case§, param3:String, param4:Boolean, param5:Boolean) : void
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
      
      public function §use package throw§(param1:String) : void
      {
         this.output.§use package throw§(param1);
         this.onResize();
      }
      
      public function clear() : void
      {
         this.output.clear();
      }
      
      public function §^#`§() : void
      {
         var _loc1_:§!"L§ = null;
         if(!(this.§implements return§ || this._locked))
         {
            this.output.visible = true;
            this.§class var break§.visible = this.§class var break§.getText().length > 0;
            if(!battleInfoService.spectator)
            {
               _loc1_ = §if for else§(OSGi.getInstance().getService(§if for else§)).getShortUserInfo(userPropertiesService.userId);
               this.§static finally§ = _loc1_.teamType;
            }
            this.§return var while§();
            this.§implements return§ = true;
            this.input.text = "";
            this.inputControl.visible = true;
            display.stage.focus = this.input;
            this.onResize();
            §const catch get§.lock(§class const while§.CHAT);
            battleEventDispatcher.dispatchEvent(new §switch set in§(§switch set in§.OPEN));
            this.§include for set§();
            §else for if§.§6c§();
         }
      }
      
      public function §=!&§(param1:IGameObject) : void
      {
         this.§<#E§ = param1;
         this.§=#F§ = true;
      }
      
      private function §include for set§() : void
      {
         if(battleInfoService.isSpectatorMode())
         {
            if(this.§=#F§)
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
         if(this.§=#F§ && this.§static finally§ != §class for case§.NONE)
         {
            if(this.§static finally§ == §class for case§.BLUE)
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
      
      private function §package var finally§() : void
      {
         this.§=#F§ = !this.§=#F§;
         this.§include for set§();
      }
      
      public function §5!B§() : void
      {
         if(this.§implements return§)
         {
            this.output.visible = this.§class set native§;
            this.§class var break§.visible = false;
            this.§class var break§.setText("");
            if(this.inputControl.visible)
            {
               this.removeEventListeners();
               this.§implements return§ = false;
               this.inputControl.visible = false;
               this.§in catch break§();
               this.output.§return catch if§();
               this.onResize();
            }
            §const catch get§.unlock(§class const while§.CHAT);
            battleEventDispatcher.dispatchEvent(new §switch set in§(§switch set in§.CLOSE));
            §else for if§.§return const class§();
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
         this.input.addEventListener(FocusEvent.FOCUS_IN,this.§override var switch§);
         this.output = new §1$ §();
         this.output.visible = this.§class set native§;
         this.output.tabEnabled = false;
         this.output.tabChildren = false;
         this.output.x = 10;
         addChild(this.output);
         this.§class var break§ = new §true catch§();
         this.§class var break§.x = 10;
         this.§class var break§.visible = false;
         addChild(this.§class var break§);
         this.§[!I§();
         addEventListener(Event.ADDED_TO_STAGE,this.onAddedToStage);
         addEventListener(Event.REMOVED_FROM_STAGE,this.onRemovedFromStage);
      }
      
      private function §[!I§() : void
      {
         this.§extends var native§ = {};
         this.§extends var native§[this.§native set const§] = new §for for native§(this.output);
         this.§extends var native§[this.§native false§] = new §implements static§(this.output);
      }
      
      public function §8"O§(param1:String) : void
      {
         this.§class var break§.setText(param1);
      }
      
      [Obfuscation(rename="false")]
      public function setShowChat(param1:Boolean) : void
      {
         this.§!$#§ = param1;
      }
      
      private function §return var while§() : void
      {
         this.input.addEventListener(FocusEvent.FOCUS_OUT,this.§do catch break§);
         if(fullscreenService.isAvailable())
         {
            display.stage.addEventListener(this.FULL_SCREEN,this.onFullscreen);
            display.stage.addEventListener(this.§with for native§,this.onFullscreen);
         }
      }
      
      private function removeEventListeners() : void
      {
         this.input.removeEventListener(FocusEvent.FOCUS_OUT,this.§do catch break§);
         if(fullscreenService.isAvailable())
         {
            display.stage.removeEventListener(this.FULL_SCREEN,this.onFullscreen);
            display.stage.removeEventListener(this.§with for native§,this.onFullscreen);
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
         if(this.§implements return§)
         {
            this.output.§8#-§();
         }
         var _loc3_:int = int(0.25 * display.stage.stageWidth);
         var _loc4_:int = §]!W§.§9"n§();
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
               this.output.§-M§();
               _loc2_ -= this.output.height;
            }
         }
         this.output.y = _loc2_;
         this.§class var break§.§`@§(0.25 * display.stage.stageWidth);
         this.§class var break§.y = _loc2_ - 120;
         if(this.§implements return§)
         {
            this.§include for set§();
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
                  if(!this.§for set null§(this.input.text) && hasEventListener(§!&§.SEND_MESSAGE))
                  {
                     dispatchEvent(new §!&§(§!&§.SEND_MESSAGE,this.input.text,this.§=#F§));
                  }
                  this.input.text = "";
               }
               param1.keyCode = 0;
               this.§5!B§();
            }
            if(AlertUtils.isCancelKey(param1.keyCode))
            {
               param1.keyCode = 0;
               this.§5!B§();
            }
            if(param1.keyCode == Keyboard.TAB)
            {
               this.§package var finally§();
            }
         }
      }
      
      private function §for set null§(param1:String) : Boolean
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
         var _loc4_:§="?§ = this.§extends var native§[_loc3_];
         if(_loc4_ == null)
         {
            return false;
         }
         _loc4_.§for set null§(_loc2_);
         return true;
      }
      
      private function §override var switch§(param1:FocusEvent) : void
      {
         if(!this.§implements return§)
         {
            this.§in catch break§();
         }
      }
      
      private function §do catch break§(param1:FocusEvent) : void
      {
         if(stage && this.input && this.inputControl && this.inputControl.visible)
         {
            stage.focus = this.input;
         }
         else
         {
            this.§5!B§();
         }
      }
      
      private function onFullscreen(param1:Event) : void
      {
         if(this.§implements return§)
         {
            stage.focus = this.input;
         }
      }
      
      private function §in catch break§() : void
      {
         if(display.stage.focus == this.input)
         {
            display.stage.focus = null;
         }
      }
   }
}

