package scpacker.networking.protocol.codec.custom
{
   import §[" §.ICodec;
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.clientlog.IClientLog;
   import flash.utils.ByteArray;
   import projects.tanks.client.panel.model.socialnetwork.SocialNetworkPanelCC;
   import projects.tanks.client.panel.model.socialnetwork.SocialNetworkPanelParams;
   import scpacker.networking.protocol.§?"s§;
   
   public class CodecSocialNetworkPanelCC implements ICodec
   {
      public static var log:IClientLog = IClientLog(OSGi.getInstance().getService(IClientLog));
      
      private var §'§:ICodec;
      
      private var §static catch use§:ICodec;
      
      public function CodecSocialNetworkPanelCC(param1:§?"s§)
      {
         super();
         this.§'§ = param1.getCodec("scpacker.networking.protocol.codec.primitive.BooleanCodec");
         this.§static catch use§ = param1.getCodec("scpacker.networking.protocol.codec.custom.VectorCodecSocialNetworkPanelParams");
      }
      
      public function decode(param1:ByteArray) : Object
      {
         var _loc2_:SocialNetworkPanelCC = new SocialNetworkPanelCC();
         _loc2_.passwordCreated = this.§'§.decode(param1) as Boolean;
         _loc2_.socialNetworkParams = this.§static catch use§.decode(param1) as Vector.<SocialNetworkPanelParams>;
         return _loc2_;
      }
      
      public function encode(param1:ByteArray, param2:Object) : int
      {
         if(param2 == null)
         {
            throw new Error("Object is null. Use @ProtocolOptional annotation.");
         }
         var _loc3_:SocialNetworkPanelCC = SocialNetworkPanelCC(param2);
         this.§'§.encode(param1,_loc3_.passwordCreated);
         this.§static catch use§.encode(param1,_loc3_.socialNetworkParams);
         return 4;
      }
   }
}

