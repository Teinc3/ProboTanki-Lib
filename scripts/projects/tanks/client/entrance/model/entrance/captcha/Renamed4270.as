package projects.tanks.client.entrance.model.entrance.captcha
{
   import Renamed4281.Renamed4282;
   import Renamed4281.Renamed4283;
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.OptionalMap;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import flash.utils.ByteArray;
   import platform.client.fp10.core.model.IModel;
   import scpacker.networking.Network;
   
   public class Renamed4270
   {
      private var protocol:IProtocol;
      
      private var protocolBuffer:ProtocolBuffer;
      
      private var Renamed4284:Long;
      
      private var Renamed4285:ICodec;
      
      private var Renamed4286:ICodec;
      
      private var Renamed4287:Long;
      
      private var Renamed4288:ICodec;
      
      private var model:IModel;
      
      public function Renamed4270(param1:IModel)
      {
         this.Renamed4284 = Long.getLong(0,300020002);
         this.Renamed4287 = Long.getLong(0,300020003);
         super();
         this.model = param1;
         var _loc2_:ByteArray = new ByteArray();
         this.protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.protocolBuffer = new ProtocolBuffer(_loc2_,_loc2_,new OptionalMap());
      }
      
      public function checkCaptcha(param1:CaptchaLocation, param2:String) : void
      {
         Network(OSGi.getInstance().getService(Network)).send(new Renamed4282(param1,param2));
      }
      
      public function getNewCaptcha(param1:CaptchaLocation) : void
      {
         Network(OSGi.getInstance().getService(Network)).send(new Renamed4289(param1));
      }
   }
}

