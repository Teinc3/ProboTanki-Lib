package alternativa.tanks.bg
{
   import alternativa.init.§<!Y§;
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.display.IDisplay;
   import flash.display.BitmapData;
   import flash.display.DisplayObjectContainer;
   import flash.display.Shape;
   import flash.display.Stage;
   import flash.events.Event;
   import flash.geom.Rectangle;
   
   public class §include package static§ implements IBackgroundService
   {
      private static const §case set native§:Class = §>`§;
      
      private static const §dynamic while§:BitmapData = new §case set native§().bitmapData;
      
      private var osgi:OSGi;
      
      private var stage:Stage;
      
      private var §,P§:DisplayObjectContainer;
      
      private var bg:Shape;
      
      private var §3#S§:Rectangle;
      
      public function §include package static§()
      {
         super();
         this.osgi = §<!Y§.osgi;
         var _loc1_:IDisplay = this.osgi.getService(IDisplay) as IDisplay;
         this.stage = _loc1_.stage;
         this.§,P§ = _loc1_.backgroundLayer;
         this.bg = new Shape();
      }
      
      public function showBg() : void
      {
         if(!this.§,P§.contains(this.bg))
         {
            this.§,!K§();
            this.§,P§.addChild(this.bg);
            this.stage.addEventListener(Event.RESIZE,this.§,!K§);
         }
      }
      
      public function hideBg() : void
      {
         if(this.§,P§.contains(this.bg))
         {
            this.stage.removeEventListener(Event.RESIZE,this.§,!K§);
            this.§,P§.removeChild(this.bg);
         }
      }
      
      public function drawBg(param1:Rectangle = null) : void
      {
         this.§3#S§ = param1;
         this.§,!K§();
      }
      
      private function §,!K§(param1:Event = null) : void
      {
         this.bg.graphics.clear();
         this.bg.graphics.beginBitmapFill(§dynamic while§);
         this.bg.graphics.drawRect(0,0,this.stage.stageWidth,this.stage.stageHeight);
         if(this.§3#S§ != null)
         {
            this.bg.graphics.drawRect(this.§3#S§.x,this.§3#S§.y,this.§3#S§.width,this.§3#S§.height);
         }
      }
   }
}

