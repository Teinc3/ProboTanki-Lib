package §var catch finally§
{
   import § !g§.§class for case§;
   import §-!z§.§;"8§;
   import §`#t§.§&p§;
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
   import §return set null§.§switch for default§;
   
   public class §>!^§ extends Sprite
   {
      [Inject]
      public static var display:IDisplay;
      
      [Inject]
      public static var localeService:ILocaleService;
      
      [Inject]
      public static var §9!U§:TargetingInputManager;
      
      private var §0!r§:§1!5§;
      
      private var §?t§:§1!5§;
      
      private var §2#m§:§1!5§;
      
      private var §if catch catch§:Sprite;
      
      private var §`##§:RedButton;
      
      private var §super package use§:GreenMediumButton;
      
      private var §,k§:ResultWindowGray;
      
      private var §3#t§:Boolean;
      
      private var §const for default§:Label;
      
      private var §switch var§:§switch for default§;
      
      private var §implements catch with§:§<x§;
      
      public function §>!^§(param1:String, param2:Boolean)
      {
         super();
         this.§3#t§ = param2;
         visible = false;
         this.§implements catch with§ = new §<x§(param1);
      }
      
      public function §each for catch§(param1:Boolean, param2:Boolean, param3:String, param4:Vector.<§;"8§>, param5:Boolean, param6:int) : void
      {
         if(!visible)
         {
            this.§2#m§ = this.§default catch final§(§1!5§.GREEN,param3,param4,param5,§class for case§.NONE,param2);
            addChild(this.§2#m§);
            this.§implements const if§(param1,param6);
         }
      }
      
      public function §final for final§(param1:Boolean, param2:String, param3:Vector.<§;"8§>, param4:Vector.<§;"8§>, param5:Boolean, param6:int, param7:§class for case§) : void
      {
         if(!visible)
         {
            this.§0!r§ = this.§default catch final§(§1!5§.RED,param2,param3,param5,param7,true);
            addChild(this.§0!r§);
            this.§?t§ = this.§default catch final§(§1!5§.BLUE,param2,param4,param5,param7,true);
            addChild(this.§?t§);
            this.§implements const if§(param1,param6);
         }
      }
      
      private function §default catch final§(param1:int, param2:String, param3:Vector.<§;"8§>, param4:Boolean, param5:§class for case§, param6:Boolean) : §1!5§
      {
         var _loc7_:§1!5§ = new §1!5§(param1,param2,param4,param5,param6);
         _loc7_.§6!=§(param3);
         return _loc7_;
      }
      
      private function §implements const if§(param1:Boolean, param2:int) : void
      {
         §9!U§.§switch while§();
         visible = true;
         addChild(this.§implements catch with§);
         this.§use finally§(param1,param2);
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
         removeChild(this.§implements catch with§);
         removeDisplayObject(this.§?t§);
         this.§?t§ = null;
         removeDisplayObject(this.§0!r§);
         this.§0!r§ = null;
         removeDisplayObject(this.§2#m§);
         this.§2#m§ = null;
         if(this.§`##§ != null)
         {
            this.§`##§.removeEventListener(MouseEvent.CLICK,this.§+#$§);
            this.§`##§ = null;
         }
         if(this.§super package use§ != null)
         {
            this.§super package use§.removeEventListener(MouseEvent.CLICK,this.§super for true§);
            this.§super package use§ = null;
         }
         removeDisplayObject(this.§if catch catch§);
         this.§if catch catch§ = null;
         §9!U§.§return const class§();
      }
      
      private function onResize(param1:Event = null) : void
      {
         var _loc2_:int = 0;
         var _loc5_:§1!5§ = null;
         _loc2_ = 0;
         var _loc3_:int = 0;
         _loc2_ = display.stage.stageWidth / 2;
         _loc3_ = display.stage.stageHeight / 2;
         var _loc4_:§1!5§ = null;
         _loc5_ = null;
         if(this.§2#m§)
         {
            this.§0#§();
            this.§2#m§.y = -(this.§2#m§.height >> 1);
            _loc4_ = _loc5_ = this.§2#m§;
         }
         else if(Boolean(this.§?t§) && Boolean(this.§0!r§))
         {
            this.§case var native§();
            this.§0!r§.y = -(this.§?t§.height + this.§0!r§.height + 5 >> 1);
            this.§?t§.y = this.§0!r§.y + this.§0!r§.height + 5;
            _loc4_ = this.§0!r§;
            _loc5_ = this.§?t§;
         }
         this.§implements catch with§.y = _loc4_.y - this.§implements catch with§.height - 5;
         this.§implements catch with§.width = _loc4_.width;
         this.§if catch catch§.y = _loc5_.y + _loc5_.height + 10;
         this.§,k§.width = _loc4_.width;
         this.§`##§.x = this.§,k§.width - this.§`##§.width - 7;
         x = _loc2_ - (width >> 1);
         y = _loc3_;
      }
      
      private function §0#§() : void
      {
         var _loc1_:Number = display.stage.stageHeight - 200;
         this.§2#m§.resize(_loc1_);
      }
      
      private function §case var native§() : void
      {
         var _loc1_:Number = NaN;
         var _loc2_:Number = display.stage.stageHeight - 200;
         this.§?t§.resize(_loc2_);
         this.§0!r§.resize(_loc2_);
         if(this.§?t§.height + this.§0!r§.height > _loc2_)
         {
            _loc1_ = 0.5 * _loc2_;
            if(this.§?t§.height > _loc1_ && this.§0!r§.height > _loc1_)
            {
               this.§?t§.resize(_loc1_);
               this.§0!r§.resize(_loc1_);
            }
            else if(this.§?t§.height < _loc1_)
            {
               this.§0!r§.resize(_loc2_ - this.§?t§.height);
            }
            else
            {
               this.§?t§.resize(_loc2_ - this.§0!r§.height);
            }
         }
      }
      
      private function §use finally§(param1:Boolean, param2:int) : void
      {
         this.§if catch catch§ = new Sprite();
         this.§,k§ = new ResultWindowGray();
         this.§,k§.width = width;
         this.§if catch catch§.addChild(this.§,k§);
         this.§`##§ = new RedButton();
         this.§,k§.height = this.§`##§.height + 8;
         this.§`##§.addEventListener(MouseEvent.CLICK,this.§+#$§);
         this.§`##§.width = 96;
         this.§`##§.label = localeService.getText(TanksLocale.TEXT_BATTLE_EXIT);
         this.§`##§.x = this.§,k§.width - this.§`##§.width - 7;
         this.§`##§.y = 4;
         this.§if catch catch§.addChild(this.§`##§);
         if(param2 > 0)
         {
            this.§const for default§ = new Label();
            this.§const for default§.text = param1 ? localeService.getText(TanksLocale.TEXT_BATTLE_FINISH_IN) : localeService.getText(TanksLocale.TEXT_BATTLE_RESTART) + ": ";
            this.§if catch catch§.addChild(this.§const for default§);
            this.§const for default§.x = 4;
            this.§const for default§.y = 10;
            this.§const for default§.visible = true;
            this.§switch var§ = new §switch for default§(-1,-1,null,true);
            this.§switch var§.§'!z§(param2);
            this.§if catch catch§.addChild(this.§switch var§);
            this.§switch var§.x = this.§const for default§.x + this.§const for default§.width;
            this.§switch var§.y = 4;
            this.§switch var§.size = 22;
            this.§switch var§.visible = true;
         }
         addChild(this.§if catch catch§);
      }
      
      public function §set for while§(param1:String, param2:§class for case§) : void
      {
         if(!visible)
         {
            return;
         }
         if(this.§3#t§ && this.§?t§ && Boolean(this.§0!r§))
         {
            if(param2 == §class for case§.BLUE)
            {
               this.§?t§.§set for while§(param1);
            }
            else
            {
               this.§0!r§.§set for while§(param1);
            }
            this.§case var native§();
         }
         else if(this.§2#m§)
         {
            this.§2#m§.§set for while§(param1);
            this.§0#§();
         }
      }
      
      public function §class const override§(param1:Vector.<§;"8§>) : void
      {
         if(visible)
         {
            this.§2#m§.§6!=§(param1);
            this.§0#§();
            this.onResize();
         }
      }
      
      public function §try const true§(param1:§;"8§) : void
      {
         if(visible)
         {
            this.§2#m§.§var for catch§(param1);
         }
      }
      
      public function §get package case§(param1:Vector.<§;"8§>, param2:§class for case§) : void
      {
         if(visible)
         {
            if(param2 == §class for case§.BLUE)
            {
               this.§?t§.§6!=§(param1);
            }
            else if(param2 == §class for case§.RED)
            {
               this.§0!r§.§6!=§(param1);
            }
            this.§case var native§();
            this.onResize();
         }
      }
      
      public function § #o§(param1:§;"8§) : void
      {
         if(visible)
         {
            if(param1.teamType == §class for case§.BLUE)
            {
               this.§?t§.§var for catch§(param1);
            }
            else if(param1.teamType == §class for case§.RED)
            {
               this.§0!r§.§var for catch§(param1);
            }
         }
      }
      
      private function §+#$§(param1:MouseEvent) : void
      {
         dispatchEvent(new §&p§(§&p§.EXIT));
      }
      
      private function §super for true§(param1:MouseEvent) : void
      {
         this.§const for default§.visible = true;
         this.§switch var§.visible = true;
         this.§super package use§.visible = false;
         dispatchEvent(new §&p§(§&p§.CONTINUE));
      }
   }
}

