package platform.client.fp10.core.logging.serverlog
{
   import alternativa.osgi.service.logging.LogLevel;
   import alternativa.osgi.service.logging.LogTarget;
   import platform.client.fp10.core.network.ICommandSender;
   import platform.client.fp10.core.network.command.control.client.LogCommand;
   import platform.client.fp10.core.service.serverlog.impl.ServerLogPanel;
   
   public class ServerLogTarget implements LogTarget
   {
      private static const logLevels:Object = {
         "t":LogLevel.TRACE,
         "d":LogLevel.DEBUG,
         "i":LogLevel.INFO,
         "w":LogLevel.WARNING,
         "e":LogLevel.ERROR
      };
      
      private var commandSender:ICommandSender;
      
      private var channelLevels:Object;
      
      private var serverLogPanel:ServerLogPanel;
      
      public function ServerLogTarget(param1:ICommandSender, param2:String)
      {
         this.channelLevels = {};
         super();
         this.commandSender = param1;
         this.setup(param2);
      }
      
      private static function createMessage(param1:String, param2:Array) : String
      {
         var _loc3_:int = 0;
         if(param2)
         {
            _loc3_ = 0;
            while(_loc3_ < param2.length)
            {
               param1 = param1.replace("%" + (_loc3_ + 1),param2[_loc3_]);
               _loc3_++;
            }
         }
         return param1;
      }
      
      private function setup(param1:String) : void
      {
         var _loc2_:String = null;
         var _loc3_:Array = param1.split(",");
         for each(_loc2_ in _loc3_)
         {
            this.setupChannelLevels(_loc2_);
         }
      }
      
      private function setupChannelLevels(param1:String) : void
      {
         var _loc2_:String = null;
         var _loc3_:LogLevel = null;
         if(!param1)
         {
            return;
         }
         var _loc4_:Array = param1.split(":");
         var _loc5_:String = _loc4_[0];
         var _loc6_:String = _loc4_[1];
         if(!_loc5_ || !_loc6_)
         {
            return;
         }
         var _loc7_:Object = {};
         var _loc8_:Array = _loc6_.split("");
         for each(_loc2_ in _loc8_)
         {
            _loc3_ = logLevels[_loc2_];
            if(_loc3_)
            {
               _loc7_[_loc3_] = true;
            }
         }
         this.channelLevels[_loc5_] = _loc7_;
      }
      
      public function log(param1:Object, param2:LogLevel, param3:String, param4:Array = null) : void
      {
         var _loc5_:String = null;
         var _loc6_:String = param1.toString();
         if(this.isLogEnabled(_loc6_,param2))
         {
            _loc5_ = createMessage(param3,param4);
            this.commandSender.sendCommand(new LogCommand(param2.getValue(),_loc6_,_loc5_));
            if(this.serverLogPanel)
            {
               this.serverLogPanel.addLogMessage(param2.getName(),_loc6_ + " " + _loc5_);
            }
         }
      }
      
      private function isLogEnabled(param1:String, param2:LogLevel) : Boolean
      {
         var _loc3_:Object = this.channelLevels[param1];
         return Boolean(_loc3_) && Boolean(_loc3_[param2]);
      }
      
      public function setLogPanel(param1:ServerLogPanel) : void
      {
         this.serverLogPanel = param1;
      }
   }
}

