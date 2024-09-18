package Renamed31
{
   import Renamed602.3DPositionVector;
   import Renamed495.Renamed4845;
   import Renamed495.Renamed4846;
   import Renamed495.Renamed4847;
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import flash.utils.ByteArray;
   import platform.client.fp10.core.model.IModel;
   import scpacker.networking.Network;
   
   public class Renamed6809
   {
      private var protocol:IProtocol;
      
      private var protocolBuffer:ProtocolBuffer;
      
      private var Renamed4849:Long;
      
      private var Renamed4850:ICodec;
      
      private var Renamed4851:ICodec;
      
      private var Renamed4852:ICodec;
      
      private var Renamed6810:ICodec;
      
      private var Renamed4854:ICodec;
      
      private var Renamed4855:Long;
      
      private var Renamed4856:ICodec;
      
      private var Renamed4857:Long;
      
      private var Renamed4858:ICodec;
      
      private var model:IModel;
      
      private var network:Network;
      
      public function Renamed6809(param1:IModel)
      {
         this.Renamed4849 = Long.getLong(1226168606,1892142748);
         this.Renamed4855 = Long.getLong(36271653,-1590968991);
         this.Renamed4857 = Long.getLong(744810110,-807135961);
         super();
         this.model = param1;
         var _loc2_:ByteArray = new ByteArray();
         this.protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.network = Network(OSGi.getInstance().getService(Network));
      }
      
      public function Renamed4859(param1:int, param2:Vector.<String>, param3:Vector.<int>, param4:Vector.<3DPositionVector>, param5:Vector.<3DPositionVector>) : void
      {
         this.network.send(new Renamed4845(param1,param2,param3,param4,param5));
      }
      
      public function Renamed4860(param1:int) : void
      {
         this.network.send(new Renamed4847(param1));
      }
      
      public function Renamed4861(param1:int) : void
      {
         this.network.send(new Renamed4846(param1));
      }
   }
}

