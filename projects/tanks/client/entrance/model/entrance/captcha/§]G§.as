package projects.tanks.client.entrance.model.entrance.captcha
{
   import §3""§.§-!A§;
   import §3""§.§3§;
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.OptionalMap;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import flash.utils.ByteArray;
   import platform.client.fp10.core.model.IModel;
   import scpacker.networking.Network;
   
   public class §]G§
   {
      private var protocol:IProtocol;
      
      private var protocolBuffer:ProtocolBuffer;
      
      private var §5!&§:Long;
      
      private var §try for set§:ICodec;
      
      private var §!"Q§:ICodec;
      
      private var §var set override§:Long;
      
      private var §true for false§:ICodec;
      
      private var model:IModel;
      
      public function §]G§(param1:IModel)
      {
         this.§5!&§ = Long.getLong(0,300020002);
         this.§var set override§ = Long.getLong(0,300020003);
         super();
         this.model = param1;
         var _loc2_:ByteArray = new ByteArray();
         this.protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.protocolBuffer = new ProtocolBuffer(_loc2_,_loc2_,new OptionalMap());
      }
      
      public function checkCaptcha(param1:CaptchaLocation, param2:String) : void
      {
         Network(OSGi.getInstance().getService(Network)).send(new §-!A§(param1,param2));
      }
      
      public function getNewCaptcha(param1:CaptchaLocation) : void
      {
         Network(OSGi.getInstance().getService(Network)).send(new §3#2§(param1));
      }
   }
}

