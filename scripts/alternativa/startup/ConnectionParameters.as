package alternativa.startup
{
   public class ConnectionParameters
   {
      public var serverAddress:String;
      
      public var serverPorts:Vector.<int>;
      
      public var serverHttpPorts:Vector.<int>;
      
      public var resourcesRootURL:String;
      
      public var secure:Boolean;
      
      public var recoveryEnabled:Boolean;
      
      public function ConnectionParameters(param1:String, param2:Vector.<int>, param3:Vector.<int>, param4:String, param5:Boolean, param6:Boolean)
      {
         super();
         this.serverAddress = param1;
         this.serverPorts = param2;
         this.serverHttpPorts = param3;
         this.resourcesRootURL = param4;
         this.secure = param5;
         this.recoveryEnabled = param6;
      }
   }
}

