package platform.client.fp10.core.resource
{
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.console.IConsole;
   import alternativa.osgi.service.launcherparams.ILauncherParams;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import flash.utils.getTimer;
   import platform.client.fp10.core.service.IResourceTimer;
   
   public class ResourceTimer implements IResourceTimer
   {
      private static const DEFAULT_TIMEOUT:int = 30000;
      
      private static const DEFAULT_RELOAD_ATTEMTS:int = 3;
      
      private static const MIN_TIMEOUT:int = 5000;
      
      private var timer:Timer;
      
      private var resources:Vector.<Resource>;
      
      private var numResources:int;
      
      private var timeout:int;
      
      private var maxReloadAttemts:int;
      
      public function ResourceTimer(param1:OSGi)
      {
         super();
         var _loc2_:ILauncherParams = ILauncherParams(param1.getService(ILauncherParams));
         this.timeout = int(DEFAULT_TIMEOUT);
         if(this.timeout < MIN_TIMEOUT)
         {
            this.timeout = MIN_TIMEOUT;
         }
         this.maxReloadAttemts = int(DEFAULT_RELOAD_ATTEMTS);
         if(this.maxReloadAttemts < 0)
         {
            this.maxReloadAttemts = 0;
         }
         this.resources = new Vector.<Resource>();
         this.timer = new Timer(1000);
         var _loc3_:IConsole = IConsole(param1.getService(IConsole));
         _loc3_.setCommandHandler("res_timer",this.onConsoleCommand);
      }
      
      public function getMaxReloadAttemts() : int
      {
         return this.maxReloadAttemts;
      }
      
      public function addResource(param1:Resource) : void
      {
         var _loc2_:* = undefined;
         if(this.resources.indexOf(param1) < 0)
         {
            _loc2_ = this.numResources++;
            this.resources[_loc2_] = param1;
            if(this.numResources == 1)
            {
               this.timer.addEventListener(TimerEvent.TIMER,this.onTimer);
               this.timer.start();
            }
         }
      }
      
      public function removeResource(param1:Resource) : void
      {
         var _loc2_:int = int(this.resources.indexOf(param1));
         if(_loc2_ >= 0)
         {
            this.resources[_loc2_] = this.resources[--this.numResources];
            this.resources[this.numResources] = null;
            if(this.numResources == 0)
            {
               this.timer.stop();
               this.timer.removeEventListener(TimerEvent.TIMER,this.onTimer);
            }
         }
      }
      
      private function onTimer(param1:TimerEvent) : void
      {
         var _loc2_:Resource = null;
         var _loc3_:int = getTimer();
         var _loc4_:int = 0;
         while(_loc4_ < this.numResources)
         {
            _loc2_ = this.resources[_loc4_];
            if(_loc3_ - _loc2_.lastActivityTime > this.timeout)
            {
               this.removeResource(_loc2_);
               _loc4_--;
               _loc2_.reload();
            }
            _loc4_++;
         }
      }
      
      private function onConsoleCommand(param1:IConsole, param2:Array) : void
      {
         if(param2.length == 0)
         {
            param1.addText("Available parameters:");
            param1.addText("ls -- list currently tracked resources");
            return;
         }
         switch(param2[0])
         {
            case "ls":
               this.listResources(param1);
         }
      }
      
      private function listResources(param1:IConsole) : void
      {
         var _loc2_:Resource = null;
         var _loc3_:int = 0;
         var _loc4_:int = getTimer();
         var _loc5_:int = 0;
         while(_loc5_ < this.numResources)
         {
            _loc2_ = this.resources[_loc5_];
            _loc3_ = (_loc4_ - _loc2_.lastActivityTime) / 1000;
            param1.addText(_loc5_ + 1 + ". " + _loc2_ + ", time: " + _loc3_ + " second(s)");
            _loc5_++;
         }
      }
   }
}

