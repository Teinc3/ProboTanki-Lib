package Renamed477
{
   import alternativa.tanks.services.ping.PingService;
   import controls.Label;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.filters.GlowFilter;
   import flash.text.TextFieldAutoSize;
   import flash.utils.getTimer;
   
   public class Renamed4632 extends Sprite
   {
      [Inject]
      public static var Renamed4731:PingService;
      
      private static const Renamed1328:int = 60;
      
      private static const Renamed9400:int = 0;
      
      private static const Renamed9401:int = 999;
      
      private static const Renamed9402:int = 19;
      
      private static const Renamed9403:int = 50 + 8;
      
      private static const Renamed9404:int = 74 + Renamed9402;
      
      private static const Renamed9405:int = 40 + 8;
      
      private static const Renamed9406:int = 10;
      
      private static const glowFilter:GlowFilter = new GlowFilter(0,0.8,4,4,3);
      
      private var Renamed9407:Label;
      
      private var Renamed9408:Label;
      
      private var Renamed9409:Label;
      
      private var Renamed9410:Label;
      
      private var counter:int;
      
      private var time:int;
      
      private var Renamed711:Boolean = false;
      
      public function Renamed4632()
      {
         super();
         addEventListener(Event.ADDED_TO_STAGE,this.onAddedToStage);
      }
      
      private function init() : void
      {
         if(!this.Renamed711)
         {
            this.Renamed9407 = new Label();
            this.Renamed9407.autoSize = TextFieldAutoSize.LEFT;
            this.Renamed9407.color = 16777215;
            this.Renamed9407.text = "FPS: ";
            this.Renamed9407.selectable = false;
            addChild(this.Renamed9407);
            this.Renamed9408 = new Label();
            this.Renamed9408.autoSize = TextFieldAutoSize.LEFT;
            this.Renamed9408.color = int("0x00FF00");
            this.Renamed9408.text = Renamed1328.toString();
            this.Renamed9408.selectable = false;
            addChild(this.Renamed9408);
            this.Renamed9409 = new Label();
            this.Renamed9409.autoSize = TextFieldAutoSize.LEFT;
            this.Renamed9409.color = 16777215;
            this.Renamed9409.text = "PING: ";
            this.Renamed9409.selectable = false;
            this.Renamed9409.x = -7;
            this.Renamed9409.y = Renamed9402;
            addChild(this.Renamed9409);
            this.Renamed9410 = new Label();
            this.Renamed9410.autoSize = TextFieldAutoSize.LEFT;
            this.Renamed9410.color = int("0x00FF00");
            this.Renamed9410.text = Renamed9400.toString();
            this.Renamed9410.selectable = false;
            this.Renamed9410.y = Renamed9402;
            addChild(this.Renamed9410);
            filters = [glowFilter];
            this.Renamed711 = true;
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
         if(++this.counter >= Renamed9406)
         {
            _loc2_ = getTimer();
            _loc3_ = 1000 * this.counter / (_loc2_ - this.time);
            if(_loc3_ > Renamed1328)
            {
               _loc3_ = Number(Renamed1328);
            }
            this.Renamed9408.text = Math.round(_loc3_).toString();
            this.Renamed9408.x = Renamed9405 - this.Renamed9408.width;
            if(_loc3_ > 30)
            {
               if(_loc3_ < 60)
               {
                  this.Renamed9408.color = this.Renamed9411(int("0xFFFF00"),int("0x00FF00"),(_loc3_ - 30) / (60 - 30));
               }
               else
               {
                  this.Renamed9408.color = int("0x00FF00");
               }
            }
            else if(_loc3_ > 15)
            {
               this.Renamed9408.color = this.Renamed9411(int("0XF03416"),int("0XFFFF00"),(_loc3_ - 15) / (30 - 15));
            }
            else
            {
               this.Renamed9408.color = int("0XF03416");
            }
            this.time = _loc2_;
            this.counter = 0;
            _loc4_ = Number(Renamed4731.Renamed3828());
            if(_loc4_ > Renamed9401)
            {
               _loc4_ = Number(Renamed9401);
            }
            this.Renamed9410.text = Math.round(_loc4_).toString();
            this.Renamed9410.x = Renamed9405 - this.Renamed9410.width;
            if(_loc4_ < 200)
            {
               if(_loc4_ > 100)
               {
                  this.Renamed9410.color = this.Renamed9411(int("0x00FF00"),int("0xFFFF00"),(_loc4_ - 100) / (200 - 100));
               }
               else
               {
                  this.Renamed9410.color = int("0x00FF00");
               }
            }
            else if(_loc4_ < 500)
            {
               this.Renamed9410.color = this.Renamed9411(int("0xFFFF00"),int("0XF03416"),(_loc4_ - 200) / (500 - 200));
            }
            else
            {
               this.Renamed9410.color = int("0XF03416");
            }
         }
      }
      
      private function Renamed9411(param1:int, param2:int, param3:Number) : int
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
         x = stage.stageWidth - Renamed9403;
         y = stage.stageHeight - Renamed9404;
         this.Renamed9408.x = Renamed9405 - this.Renamed9408.width;
         this.Renamed9410.x = Renamed9405 - this.Renamed9410.width;
      }
   }
}

