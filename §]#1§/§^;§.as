package §]#1§
{
   import alternativa.tanks.services.ping.PingService;
   import controls.Label;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.filters.GlowFilter;
   import flash.text.TextFieldAutoSize;
   import flash.utils.getTimer;
   
   public class §^;§ extends Sprite
   {
      [Inject]
      public static var §implements package switch§:PingService;
      
      private static const §9"I§:int = 60;
      
      private static const §6!2§:int = 0;
      
      private static const §7@§:int = 999;
      
      private static const §<"?§:int = 19;
      
      private static const §+#q§:int = 50 + 8;
      
      private static const §continue for static§:int = 74 + §<"?§;
      
      private static const §;!!§:int = 40 + 8;
      
      private static const §const package finally§:int = 10;
      
      private static const glowFilter:GlowFilter = new GlowFilter(0,0.8,4,4,3);
      
      private var §=!%§:Label;
      
      private var §6+§:Label;
      
      private var §super package dynamic§:Label;
      
      private var §`"%§:Label;
      
      private var counter:int;
      
      private var time:int;
      
      private var §=P§:Boolean = false;
      
      public function §^;§()
      {
         super();
         addEventListener(Event.ADDED_TO_STAGE,this.onAddedToStage);
      }
      
      private function init() : void
      {
         if(!this.§=P§)
         {
            this.§=!%§ = new Label();
            this.§=!%§.autoSize = TextFieldAutoSize.LEFT;
            this.§=!%§.color = 16777215;
            this.§=!%§.text = "FPS: ";
            this.§=!%§.selectable = false;
            addChild(this.§=!%§);
            this.§6+§ = new Label();
            this.§6+§.autoSize = TextFieldAutoSize.LEFT;
            this.§6+§.color = int("0x00FF00");
            this.§6+§.text = §9"I§.toString();
            this.§6+§.selectable = false;
            addChild(this.§6+§);
            this.§super package dynamic§ = new Label();
            this.§super package dynamic§.autoSize = TextFieldAutoSize.LEFT;
            this.§super package dynamic§.color = 16777215;
            this.§super package dynamic§.text = "PING: ";
            this.§super package dynamic§.selectable = false;
            this.§super package dynamic§.x = -7;
            this.§super package dynamic§.y = §<"?§;
            addChild(this.§super package dynamic§);
            this.§`"%§ = new Label();
            this.§`"%§.autoSize = TextFieldAutoSize.LEFT;
            this.§`"%§.color = int("0x00FF00");
            this.§`"%§.text = §6!2§.toString();
            this.§`"%§.selectable = false;
            this.§`"%§.y = §<"?§;
            addChild(this.§`"%§);
            filters = [glowFilter];
            this.§=P§ = true;
         }
      }
      
      private function onAddedToStage(param1:Event) : void
      {
         this.init();
         this.onResize();
         this.counter = 0;
         this.time = getTimer();
         stage.addEventListener(Event.ENTER_FRAME,this.onEnterFrame);
         stage.addEventListener(Event.RESIZE,this.onResize);
         removeEventListener(Event.ADDED_TO_STAGE,this.onAddedToStage);
         addEventListener(Event.REMOVED_FROM_STAGE,this.onRemovedFromStage);
      }
      
      private function onRemovedFromStage(param1:Event) : void
      {
         stage.removeEventListener(Event.ENTER_FRAME,this.onEnterFrame);
         stage.removeEventListener(Event.RESIZE,this.onResize);
         removeEventListener(Event.REMOVED_FROM_STAGE,this.onRemovedFromStage);
         addEventListener(Event.ADDED_TO_STAGE,this.onAddedToStage);
      }
      
      private function onEnterFrame(param1:Event) : void
      {
         var _loc2_:int = 0;
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         if(++this.counter >= §const package finally§)
         {
            _loc2_ = getTimer();
            _loc3_ = 1000 * this.counter / (_loc2_ - this.time);
            if(_loc3_ > §9"I§)
            {
               _loc3_ = Number(§9"I§);
            }
            this.§6+§.text = Math.round(_loc3_).toString();
            this.§6+§.x = §;!!§ - this.§6+§.width;
            if(_loc3_ > 30)
            {
               if(_loc3_ < 60)
               {
                  this.§6+§.color = this.§+#r§(int("0xFFFF00"),int("0x00FF00"),(_loc3_ - 30) / (60 - 30));
               }
               else
               {
                  this.§6+§.color = int("0x00FF00");
               }
            }
            else if(_loc3_ > 15)
            {
               this.§6+§.color = this.§+#r§(int("0XF03416"),int("0XFFFF00"),(_loc3_ - 15) / (30 - 15));
            }
            else
            {
               this.§6+§.color = int("0XF03416");
            }
            this.time = _loc2_;
            this.counter = 0;
            _loc4_ = Number(§implements package switch§.§package package function§());
            if(_loc4_ > §7@§)
            {
               _loc4_ = Number(§7@§);
            }
            this.§`"%§.text = Math.round(_loc4_).toString();
            this.§`"%§.x = §;!!§ - this.§`"%§.width;
            if(_loc4_ < 200)
            {
               if(_loc4_ > 100)
               {
                  this.§`"%§.color = this.§+#r§(int("0x00FF00"),int("0xFFFF00"),(_loc4_ - 100) / (200 - 100));
               }
               else
               {
                  this.§`"%§.color = int("0x00FF00");
               }
            }
            else if(_loc4_ < 500)
            {
               this.§`"%§.color = this.§+#r§(int("0xFFFF00"),int("0XF03416"),(_loc4_ - 200) / (500 - 200));
            }
            else
            {
               this.§`"%§.color = int("0XF03416");
            }
         }
      }
      
      private function §+#r§(param1:int, param2:int, param3:Number) : int
      {
         var _loc4_:* = param1 >> 16 & 0xFF;
         var _loc5_:* = param1 >> 8 & 0xFF;
         var _loc6_:* = param1 & 0xFF;
         var _loc7_:* = param2 >> 16 & 0xFF;
         var _loc8_:* = param2 >> 8 & 0xFF;
         var _loc9_:* = param2 & 0xFF;
         if(param3 > 1)
         {
            param3 = 1;
         }
         return _loc4_ + (_loc7_ - _loc4_) * param3 << 16 | _loc5_ + (_loc8_ - _loc5_) * param3 << 8 | int(_loc6_ + (_loc9_ - _loc6_) * param3);
      }
      
      private function onResize(param1:Event = null) : void
      {
         x = stage.stageWidth - §+#q§;
         y = stage.stageHeight - §continue for static§;
         this.§6+§.x = §;!!§ - this.§6+§.width;
         this.§`"%§.x = §;!!§ - this.§`"%§.width;
      }
   }
}

