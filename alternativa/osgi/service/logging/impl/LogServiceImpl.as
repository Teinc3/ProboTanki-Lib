package alternativa.osgi.service.logging.impl
{
   import alternativa.osgi.service.logging.LogLevel;
   import alternativa.osgi.service.logging.LogService;
   import alternativa.osgi.service.logging.LogTarget;
   import alternativa.osgi.service.logging.Logger;
   
   public class LogServiceImpl implements LogService, LogTarget
   {
      private var logTargets:Vector.<LogTarget>;
      
      public function LogServiceImpl()
      {
         this.logTargets = new Vector.<LogTarget>();
         super();
      }
      
      public function getLogger(param1:Object) : Logger
      {
         return new LoggerImpl(param1,this);
      }
      
      public function addLogTarget(param1:LogTarget) : void
      {
         if(this.logTargets.indexOf(param1) < 0)
         {
            this.logTargets.push(param1);
         }
      }
      
      public function removeLogTarget(param1:LogTarget) : void
      {
         var _loc2_:int = int(this.logTargets.indexOf(param1));
         if(_loc2_ >= 0)
         {
            this.logTargets = this.logTargets.splice(_loc2_,1);
         }
      }
      
      public function log(param1:Object, param2:LogLevel, param3:String, param4:Array = null) : void
      {
         var object:Object = param1;
         var level:LogLevel = param2;
         var message:String = param3;
         var params:Array = param4;
         var logTarget:LogTarget = null;
         for each(logTarget in this.logTargets)
         {
            try
            {
               logTarget.log(object,level,message,params);
            }
            catch(e:Error)
            {
            }
         }
      }
   }
}

