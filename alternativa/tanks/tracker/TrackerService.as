package alternativa.tanks.tracker
{
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.clientlog.IClientLog;
   import flash.events.TimerEvent;
   import flash.external.ExternalInterface;
   import flash.utils.Dictionary;
   import flash.utils.Timer;
   import flash.utils.getTimer;
   
   public class TrackerService implements ITrackerService
   {
      private static var clientLog:IClientLog;
      
      private static var Renamed3881:Dictionary;
      
      private var commands:Vector.<TrackerCommand>;
      
      private var timer:Timer;
      
      private var available:Boolean = false;
      
      public function TrackerService()
      {
         super();
         this.available = ExternalInterface.available && ExternalInterface.call("checkGALoaded");
         clientLog = IClientLog(OSGi.getInstance().getService(IClientLog));
         if(this.available)
         {
            this.commands = new Vector.<TrackerCommand>();
            this.timer = new Timer(1000);
            this.timer.addEventListener(TimerEvent.TIMER,this.Renamed3882);
            Renamed3881 = new Dictionary();
            this.trackPageView("initTracker");
         }
      }
      
      public function trackPageView(param1:String) : void
      {
         var _loc2_:int = 0;
         if(this.available)
         {
            _loc2_ = getTimer() / 100;
            Renamed3881[param1] = _loc2_;
            this.commands.push(new TrackerCommand("GATrackPageView","/" + param1));
            this.timer.start();
         }
      }
      
      public function trackEvent(param1:String, param2:String, param3:String) : void
      {
         var _loc4_:int = 0;
         if(this.available)
         {
            _loc4_ = getTimer() / 100;
            Renamed3881[param2] = _loc4_;
            this.commands.push(new TrackerCommand("GATrackEvent",param1,param2,param3));
            this.timer.start();
         }
      }
      
      public function trackEventAfter(param1:String, param2:String, param3:String) : void
      {
         var _loc4_:int = 0;
         if(this.available)
         {
            _loc4_ = getTimer() / 100;
            if(Renamed3881[param3] != null)
            {
               this.trackEvent(param1,param2 + "<=" + param3,String((_loc4_ - Renamed3881[param3]) / 10));
            }
            else
            {
               this.trackEvent(param1,param2 + "<=" + param3,"action not logged");
            }
         }
      }
      
      private function Renamed3882(param1:TimerEvent) : void
      {
         var _loc3_:TrackerCommand = null;
         var _loc4_:Boolean = false;
         if(this.commands.length > 0)
         {
            if(this.available)
            {
               _loc3_ = this.commands.shift();
               _loc4_ = _loc3_.arguments.length == 1 ? Boolean(ExternalInterface.call(_loc3_.command,_loc3_.arguments[0])) : Boolean(ExternalInterface.call(_loc3_.command,_loc3_.arguments[0],_loc3_.arguments[1],_loc3_.arguments[2]));
            }
         }
         else
         {
            this.timer.stop();
         }
      }
   }
}

class TrackerCommand
{
   private var _command:String;
   
   private var _arguments:Array;
   
   public function TrackerCommand(param1:String, ... rest)
   {
      super();
      this._command = param1;
      this._arguments = rest;
   }
   
   public function get command() : String
   {
      return this._command;
   }
   
   public function set command(param1:String) : void
   {
      this._command = param1;
   }
   
   public function get arguments() : Array
   {
      return this._arguments;
   }
   
   public function set arguments(param1:Array) : void
   {
      this._arguments = param1;
   }
}

