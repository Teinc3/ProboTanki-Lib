package alternativa.tanks.blur
{
   import alternativa.init.Renamed0;
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.tanks.help.IHelpService;
   import flash.display.Sprite;
   import flash.events.Event;
   
   public class BlurService implements IBlurService
   {
      private var Renamed1439:Boolean;
      
      private var mainContainerService:IDisplay;
      
      private var overlay:Sprite;
      
      public function BlurService()
      {
         super();
         this.mainContainerService = IDisplay(Renamed0.osgi.getService(IDisplay));
         this.overlay = new Sprite();
         this.overlay.mouseEnabled = true;
         this.Renamed1439 = false;
      }
      
      public function blur() : void
      {
         var _loc1_:IHelpService = null;
         if(!this.Renamed1439)
         {
            this.Renamed1439 = true;
            this.mainContainerService.dialogsLayer.addChildAt(this.overlay,0);
            this.mainContainerService.stage.addEventListener(Event.RESIZE,this.onStageResize);
            this.redrawOverlay();
            _loc1_ = Renamed0.osgi.getService(IHelpService) as IHelpService;
            _loc1_.pushState();
            _loc1_.hideAllHelpers();
            _loc1_.lock();
         }
      }
      
      public function unblur() : void
      {
         var _loc1_:IHelpService = null;
         if(this.Renamed1439)
         {
            this.Renamed1439 = false;
            this.mainContainerService.dialogsLayer.removeChild(this.overlay);
            this.mainContainerService.stage.removeEventListener(Event.RESIZE,this.onStageResize);
            _loc1_ = Renamed0.osgi.getService(IHelpService) as IHelpService;
            _loc1_.popState();
            _loc1_.unlock();
         }
      }
      
      private function onStageResize(param1:Event) : void
      {
         this.redrawOverlay();
      }
      
      private function redrawOverlay() : void
      {
         var _loc1_:int = this.mainContainerService.stage.stageWidth;
         var _loc2_:int = this.mainContainerService.stage.stageHeight;
         this.overlay.graphics.clear();
         this.overlay.graphics.beginFill(0,0.5);
         this.overlay.graphics.drawRect(0,0,_loc1_,_loc2_);
      }
   }
}

