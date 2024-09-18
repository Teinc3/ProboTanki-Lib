package alternativa.tanks.loader
{
   import alternativa.init.§<!Y§;
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.clientlog.IClientLog;
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.utils.§default package try§;
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
   
   public class §1#o§ extends Sprite implements ILoaderWindowService
   {
      private static const §case static§:int = 1000;
      
      private static const §3#m§:int = 10000;
      
      private static const §static for do§:int = 9000;
      
      private static const §5"H§:Class = §2"M§;
      
      private static const §>"y§:Class = §try for final§;
      
      private static const §while set var§:Class = §<"2§;
      
      private static const §^"C§:Class = §use const function§;
      
      private var layer:DisplayObjectContainer;
      
      private var §return var false§:Bitmap;
      
      private var §use var try§:§[!`§;
      
      private var §static package if§:Timer;
      
      private var §case import§:Timer;
      
      private var §8"§:Timer;
      
      private var §switch function§:Array;
      
      private var lock:Boolean = false;
      
      private var §0#C§:Array;
      
      public function §1#o§()
      {
         this.§-#T§ = new §^"C§();
         this.§0#C§ = [];
         super();
         this.layer = (§<!Y§.osgi.getService(IDisplay) as IDisplay).systemUILayer;
         this.§switch function§ = new Array();
         var _loc1_:BitmapData = this.§6"A§(§<!Y§.osgi.getService(ILocaleService) as ILocaleService);
         this.§return var false§ = §default package try§.§in return§(_loc1_,new §while set var§().bitmapData);
         addChild(this.§return var false§);
         this.§use var try§ = new §[!`§();
         addChild(this.§use var try§);
         this.§-#T§.x = 10;
         this.§-#T§.y = 239;
         addChild(this.§-#T§);
         this.§static package if§ = new Timer(§case static§,1);
         this.§case import§ = new Timer(§3#m§,1);
         this.§8"§ = new Timer(§static for do§,1);
         this.§static package if§.addEventListener(TimerEvent.TIMER_COMPLETE,this.§7!;§);
         this.§case import§.addEventListener(TimerEvent.TIMER_COMPLETE,this.§<a§);
         this.§8"§.addEventListener(TimerEvent.TIMER_COMPLETE,this.§&"j§);
      }
      
      private function §6"A§(param1:ILocaleService) : BitmapData
      {
         if(param1.language == "cn")
         {
            return new §>"y§().bitmapData;
         }
         return new §5"H§().bitmapData;
      }
      
      public function setBatchIdForProcess(param1:int, param2:Object) : void
      {
      }
      
      public function showTip(param1:DisplayObject) : void
      {
         this.§0#C§.push(param1);
      }
      
      private function §&"j§(param1:TimerEvent) : void
      {
         var _loc2_:§each while§ = OSGi.getInstance().getService(§each while§) as §each while§;
         (OSGi.getInstance().getService(IClientLog) as IClientLog).log("loader","==\nLoaderWindow::onNextTipTimerComplete %1\n==",getTimer());
         if(this.§0#C§[0] is DisplayObject)
         {
            this.§use var try§.showTip(this.§0#C§.shift());
         }
         if(_loc2_ != null)
         {
            _loc2_.§[!F§();
         }
         this.§8"§.stop();
         this.§8"§.reset();
         this.§8"§.start();
      }
      
      public function §?!9§(param1:Object) : void
      {
         this.§case import§.stop();
         if(this.§switch function§.indexOf(param1) == -1)
         {
            this.§switch function§.push(param1);
         }
         if(!this.lock && !this.§static package if§.running && !this.layer.contains(this))
         {
            this.§static package if§.reset();
            this.§static package if§.start();
         }
      }
      
      public function showLoaderWindow() : void
      {
         (OSGi.getInstance().getService(IClientLog) as IClientLog).log("loader","==\nLoaderWindow::showLoaderWindow %1\n==",getTimer());
         this.§7!;§();
      }
      
      public function hideLoaderWindow() : void
      {
         (OSGi.getInstance().getService(IClientLog) as IClientLog).log("loader","==\nLoaderWindow::hideLoaderWindow %1\n==",getTimer());
         this.§static package if§.stop();
         this.§<a§();
      }
      
      public function lockLoaderWindow() : void
      {
         if(!this.lock)
         {
            this.lock = true;
            this.§static package if§.stop();
            this.§case import§.stop();
         }
      }
      
      public function unlockLoaderWindow() : void
      {
         if(this.lock)
         {
            this.lock = false;
         }
      }
      
      private function §7!;§(param1:TimerEvent = null) : void
      {
         this.§static package if§.stop();
         this.show();
      }
      
      private function §<a§(param1:TimerEvent = null) : void
      {
         this.§case import§.stop();
         this.hide();
      }
      
      private function show() : void
      {
         if(!this.layer.contains(this))
         {
            this.layer.addChild(this);
            stage.addEventListener(Event.RESIZE,this.align);
            this.align();
            this.§8"§.start();
            this.§&"j§(null);
         }
      }
      
      private function hide() : void
      {
         if(this.layer.contains(this))
         {
            stage.removeEventListener(Event.RESIZE,this.align);
            this.layer.removeChild(this);
            this.§8"§.stop();
         }
         dispatchEvent(new §0=§(§0=§.§&#O§));
      }
      
      private function align(param1:Event = null) : void
      {
         this.x = stage.stageWidth - this.§return var false§.width >>> 1;
         this.y = stage.stageHeight - this.§return var false§.height >>> 1;
      }
      
      public function §<!5§() : Boolean
      {
         return this.§8"§.running;
      }
   }
}

