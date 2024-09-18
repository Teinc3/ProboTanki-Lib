package alternativa.tanks.loader
{
   import alternativa.init.Renamed0;
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.clientlog.IClientLog;
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.utils.Renamed2034;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import flash.utils.getTimer;
   
   public class Renamed582 extends Sprite implements ILoaderWindowService
   {
      private static const Renamed2035:int = 1000;
      
      private static const Renamed2036:int = 10000;
      
      private static const Renamed2037:int = 9000;
      
      private static const Renamed2038:Class = Renamed2039;
      
      private static const Renamed2040:Class = Renamed2041;
      
      private static const Renamed2042:Class = Renamed2030;
      
      private static const Renamed2043:Class = Renamed2044;
      
      private var layer:DisplayObjectContainer;
      
      private var Renamed2045:Bitmap;
      
      private var Renamed2046:Renamed2047;
      
      private var Renamed2048:Timer;
      
      private var Renamed2049:Timer;
      
      private var Renamed2050:Timer;
      
      private var Renamed2051:Array;
      
      private var lock:Boolean = false;
      
      private var Renamed2052:Array;
      
      public function Renamed582()
      {
         this.Renamed2053 = new Renamed2043();
         this.Renamed2052 = [];
         super();
         this.layer = (Renamed0.osgi.getService(IDisplay) as IDisplay).systemUILayer;
         this.Renamed2051 = new Array();
         var _loc1_:BitmapData = this.Renamed2054(Renamed0.osgi.getService(ILocaleService) as ILocaleService);
         this.Renamed2045 = Renamed2034.Renamed2055(_loc1_,new Renamed2042().bitmapData);
         addChild(this.Renamed2045);
         this.Renamed2046 = new Renamed2047();
         addChild(this.Renamed2046);
         this.Renamed2053.x = 10;
         this.Renamed2053.y = 239;
         addChild(this.Renamed2053);
         this.Renamed2048 = new Timer(Renamed2035,1);
         this.Renamed2049 = new Timer(Renamed2036,1);
         this.Renamed2050 = new Timer(Renamed2037,1);
         this.Renamed2048.addEventListener(TimerEvent.TIMER_COMPLETE,this.Renamed2056);
         this.Renamed2049.addEventListener(TimerEvent.TIMER_COMPLETE,this.Renamed2057);
         this.Renamed2050.addEventListener(TimerEvent.TIMER_COMPLETE,this.Renamed2058);
      }
      
      private function Renamed2054(param1:ILocaleService) : BitmapData
      {
         if(param1.language == "cn")
         {
            return new Renamed2040().bitmapData;
         }
         return new Renamed2038().bitmapData;
      }
      
      public function setBatchIdForProcess(param1:int, param2:Object) : void
      {
      }
      
      public function showTip(param1:DisplayObject) : void
      {
         this.Renamed2052.push(param1);
      }
      
      private function Renamed2058(param1:TimerEvent) : void
      {
         var _loc2_:Renamed2059 = OSGi.getInstance().getService(Renamed2059) as Renamed2059;
         (OSGi.getInstance().getService(IClientLog) as IClientLog).log("loader","==\nLoaderWindow::onNextTipTimerComplete %1\n==",getTimer());
         if(this.Renamed2052[0] is DisplayObject)
         {
            this.Renamed2046.showTip(this.Renamed2052.shift());
         }
         if(_loc2_ != null)
         {
            _loc2_.Renamed2060();
         }
         this.Renamed2050.stop();
         this.Renamed2050.reset();
         this.Renamed2050.start();
      }
      
      public function Renamed2061(param1:Object) : void
      {
         this.Renamed2049.stop();
         if(this.Renamed2051.indexOf(param1) == -1)
         {
            this.Renamed2051.push(param1);
         }
         if(!this.lock && !this.Renamed2048.running && !this.layer.contains(this))
         {
            this.Renamed2048.reset();
            this.Renamed2048.start();
         }
      }
      
      public function showLoaderWindow() : void
      {
         (OSGi.getInstance().getService(IClientLog) as IClientLog).log("loader","==\nLoaderWindow::showLoaderWindow %1\n==",getTimer());
         this.Renamed2056();
      }
      
      public function hideLoaderWindow() : void
      {
         (OSGi.getInstance().getService(IClientLog) as IClientLog).log("loader","==\nLoaderWindow::hideLoaderWindow %1\n==",getTimer());
         this.Renamed2048.stop();
         this.Renamed2057();
      }
      
      public function lockLoaderWindow() : void
      {
         if(!this.lock)
         {
            this.lock = true;
            this.Renamed2048.stop();
            this.Renamed2049.stop();
         }
      }
      
      public function unlockLoaderWindow() : void
      {
         if(this.lock)
         {
            this.lock = false;
         }
      }
      
      private function Renamed2056(param1:TimerEvent = null) : void
      {
         this.Renamed2048.stop();
         this.show();
      }
      
      private function Renamed2057(param1:TimerEvent = null) : void
      {
         this.Renamed2049.stop();
         this.hide();
      }
      
      private function show() : void
      {
         if(!this.layer.contains(this))
         {
            this.layer.addChild(this);
            stage.addEventListener(Event.RESIZE,this.align);
            this.align();
            this.Renamed2050.start();
            this.Renamed2058(null);
         }
      }
      
      private function hide() : void
      {
         if(this.layer.contains(this))
         {
            stage.removeEventListener(Event.RESIZE,this.align);
            this.layer.removeChild(this);
            this.Renamed2050.stop();
         }
         dispatchEvent(new Renamed2032(Renamed2032.Renamed2033));
      }
      
      private function align(param1:Event = null) : void
      {
         this.x = stage.stageWidth - this.Renamed2045.width >>> 1;
         this.y = stage.stageHeight - this.Renamed2045.height >>> 1;
      }
      
      public function Renamed2029() : Boolean
      {
         return this.Renamed2050.running;
      }
   }
}

