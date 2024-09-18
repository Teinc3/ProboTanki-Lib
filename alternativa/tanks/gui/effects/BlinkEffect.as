package alternativa.tanks.gui.effects
{
   import alternativa.tanks.service.fps.FPSService;
   import flash.display.DisplayObject;
   import flash.events.Event;
   
   public class BlinkEffect
   {
      [Inject]
      public static var fpsService:FPSService;
      
      private var state:int;
      
      private var displayObject:DisplayObject;
      
      private var §override var do§:Number = 0.15;
      
      private var §catch throw§:Number = 0.3;
      
      public function BlinkEffect(param1:Number = 0.15, param2:Number = 0.3)
      {
         super();
         this.§override var do§ = param1;
         this.§catch throw§ = param2;
      }
      
      public function start(param1:DisplayObject) : void
      {
         this.stop();
         this.displayObject = param1;
         this.state = 0;
         param1.alpha = 1;
         param1.addEventListener(Event.ENTER_FRAME,this.onFrame);
      }
      
      public function stop() : void
      {
         if(this.displayObject != null)
         {
            this.displayObject.removeEventListener(Event.ENTER_FRAME,this.onFrame);
            this.displayObject.alpha = 1;
            this.displayObject = null;
         }
      }
      
      private function onFrame(param1:Event) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         _loc2_ = Math.ceil(this.§override var do§ * fpsService.§,"Q§());
         _loc3_ = Math.ceil(this.§catch throw§ * fpsService.§,"Q§());
         ++this.state;
         if(this.state < _loc2_)
         {
            this.displayObject.alpha = 1;
         }
         else if(this.state < _loc2_ + _loc3_)
         {
            this.displayObject.alpha = 1 - (this.state - _loc2_) / _loc3_;
         }
         else if(this.state < _loc2_ + _loc3_ + _loc2_)
         {
            this.displayObject.alpha = 0;
         }
         else if(this.state < _loc2_ + _loc3_ + _loc2_ + _loc3_)
         {
            this.displayObject.alpha = (this.state - _loc2_ - _loc3_ - _loc2_) / _loc3_;
         }
         else
         {
            this.displayObject.alpha = 1;
            this.state = 0;
         }
      }
   }
}

