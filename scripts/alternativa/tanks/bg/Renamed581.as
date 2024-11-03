package alternativa.tanks.bg
{
   import alternativa.init.Renamed0;
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.display.IDisplay;
   import flash.display.BitmapData;
   import flash.display.DisplayObjectContainer;
   import flash.display.Shape;
   import flash.display.Stage;
   import flash.events.Event;
   import flash.geom.Rectangle;
   
   public class Renamed581 implements IBackgroundService
   {
      private static const Renamed1434:Class = Renamed1432;
      
      private static const Renamed1435:BitmapData = new Renamed1434().bitmapData;
      
      private var osgi:OSGi;
      
      private var stage:Stage;
      
      private var Renamed1436:DisplayObjectContainer;
      
      private var bg:Shape;
      
      private var Renamed1437:Rectangle;
      
      public function Renamed581()
      {
         super();
         this.osgi = Renamed0.osgi;
         var _loc1_:IDisplay = this.osgi.getService(IDisplay) as IDisplay;
         this.stage = _loc1_.stage;
         this.Renamed1436 = _loc1_.backgroundLayer;
         this.bg = new Shape();
      }
      
      public function showBg() : void
      {
         if(!this.Renamed1436.contains(this.bg))
         {
            this.Renamed1438();
            this.Renamed1436.addChild(this.bg);
            this.stage.addEventListener(Event.RESIZE,this.Renamed1438);
         }
      }
      
      public function hideBg() : void
      {
         if(this.Renamed1436.contains(this.bg))
         {
            this.stage.removeEventListener(Event.RESIZE,this.Renamed1438);
            this.Renamed1436.removeChild(this.bg);
         }
      }
      
      public function drawBg(param1:Rectangle = null) : void
      {
         this.Renamed1437 = param1;
         this.Renamed1438();
      }
      
      private function Renamed1438(param1:Event = null) : void
      {
         this.bg.graphics.clear();
         this.bg.graphics.beginBitmapFill(Renamed1435);
         this.bg.graphics.drawRect(0,0,this.stage.stageWidth,this.stage.stageHeight);
         if(this.Renamed1437 != null)
         {
            this.bg.graphics.drawRect(this.Renamed1437.x,this.Renamed1437.y,this.Renamed1437.width,this.Renamed1437.height);
         }
      }
   }
}

