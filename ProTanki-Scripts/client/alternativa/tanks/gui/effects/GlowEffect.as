package alternativa.tanks.gui.effects
{
   import alternativa.tanks.service.fps.FPSService;
   import flash.display.DisplayObject;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.filters.GlowFilter;
   
   public class GlowEffect extends EventDispatcher
   {
      [Inject]
      public static var fpsService:FPSService;
      
      private var glowAlpha:Number;
      
      private var glowColor:int;
      
      private var glowDelta:Number;
      
      private var EFFECT_TIME:Number = 1.25;
      
      private var Renamed1924:Boolean = false;
      
      public function GlowEffect()
      {
         super();
      }
      
      public static function glow(param1:DisplayObject, param2:uint) : void
      {
         var _loc3_:GlowEffect = new GlowEffect();
         _loc3_.glow(param1,param2);
      }
      
      public function glow(param1:DisplayObject, param2:uint) : void
      {
         this.glowAlpha = param1.alpha;
         this.glowColor = param2;
         this.glowDelta = 1 / (this.EFFECT_TIME * fpsService.Renamed1654());
         param1.addEventListener(Event.ENTER_FRAME,this.glowFrame);
      }
      
      private function glowFrame(param1:Event) : void
      {
         var _loc2_:DisplayObject = param1.target as DisplayObject;
         var _loc3_:GlowFilter = new GlowFilter(this.glowColor,this.glowAlpha,6,6,4,1,false);
         _loc2_.filters = [_loc3_];
         if(this.Renamed1924)
         {
            this.glowAlpha += this.glowDelta;
         }
         else
         {
            this.glowAlpha -= this.glowDelta;
         }
         if(this.glowAlpha < 0)
         {
            this.Renamed1924 = true;
         }
         else if(this.glowAlpha > 1)
         {
            this.Renamed1924 = false;
         }
      }
   }
}

