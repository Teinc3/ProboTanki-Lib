package platform.client.fp10.core.logging.serverlog
{
   import alternativa.osgi.service.logging.LogService;
   import alternativa.osgi.service.logging.Logger;
   import flash.display.Loader;
   import flash.events.ErrorEvent;
   import flash.events.UncaughtErrorEvent;
   import platform.client.fp10.core.network.ICommandSender;
   
   public class UncaughtErrorServerLogImpl implements UncaughtErrorServerLog
   {
      [Inject]
      public static var loggerService:LogService;
      
      private static var channel:String = "UncaughtError";
      
      private var logger:Logger;
      
      public function UncaughtErrorServerLogImpl(param1:ICommandSender)
      {
         super();
         loggerService.addLogTarget(new ServerLogTarget(param1,channel + ":i"));
         this.logger = loggerService.getLogger(channel);
      }
      
      public function addLoader(param1:Loader) : void
      {
         param1.uncaughtErrorEvents.addEventListener(UncaughtErrorEvent.UNCAUGHT_ERROR,this.eventHandler);
      }
      
      private function eventHandler(param1:UncaughtErrorEvent) : void
      {
         var _loc2_:String = null;
         if(param1.error is Error)
         {
            _loc2_ = Error(param1.error).message;
         }
         else if(param1.error is ErrorEvent)
         {
            _loc2_ = ErrorEvent(param1.error).text;
         }
         else
         {
            _loc2_ = param1.error.toString();
         }
         this.logger.info(_loc2_);
      }
   }
}

