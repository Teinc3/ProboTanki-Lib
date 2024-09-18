package projects.tanks.client.panel.model.battleinvite
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.OptionalMap;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.protocol.info.TypeCodecInfo;
   import alternativa.types.Long;
   import §catch package class§.§function package var§;
   import §catch package class§.§override package true§;
   import §catch package class§.§return for native§;
   import flash.utils.ByteArray;
   import platform.client.fp10.core.model.IModel;
   import scpacker.networking.Network;
   
   public class §in for var§
   {
      private var protocol:IProtocol;
      
      private var protocolBuffer:ProtocolBuffer;
      
      private var §@F§:Long;
      
      private var §&8§:ICodec;
      
      private var §8"F§:Long;
      
      private var §native var continue§:ICodec;
      
      private var §'#p§:ICodec;
      
      private var §const package do§:Long;
      
      private var §const var var§:ICodec;
      
      private var model:IModel;
      
      private var network:Network;
      
      public function §in for var§(param1:IModel)
      {
         this.§@F§ = Long.getLong(0,300050006);
         this.§8"F§ = Long.getLong(0,300050007);
         this.§const package do§ = Long.getLong(0,300050008);
         super();
         this.model = param1;
         var _loc2_:ByteArray = new ByteArray();
         this.protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.network = Network(OSGi.getInstance().getService(Network));
         this.protocolBuffer = new ProtocolBuffer(_loc2_,_loc2_,new OptionalMap());
         this.§&8§ = this.protocol.getCodec(new TypeCodecInfo(Long,false));
         this.§native var continue§ = this.protocol.getCodec(new TypeCodecInfo(Long,false));
         this.§'#p§ = this.protocol.getCodec(new TypeCodecInfo(Long,false));
         this.§const var var§ = this.protocol.getCodec(new TypeCodecInfo(Long,false));
      }
      
      public function accept(param1:String) : void
      {
         this.network.send(new §override package true§(param1));
      }
      
      public function invite(param1:String, param2:String) : void
      {
         this.network.send(new §return for native§(param1,param2));
      }
      
      public function reject(param1:String) : void
      {
         this.network.send(new §function package var§(param1));
      }
   }
}

