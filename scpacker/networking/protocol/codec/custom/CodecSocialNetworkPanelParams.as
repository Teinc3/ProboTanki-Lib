package scpacker.networking.protocol.codec.custom
{
   import §[" §.ICodec;
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.clientlog.IClientLog;
   import flash.utils.ByteArray;
   import projects.tanks.client.panel.model.socialnetwork.SocialNetworkPanelParams;
   import scpacker.networking.protocol.§?"s§;
   
   public class CodecSocialNetworkPanelParams implements ICodec
   {
      public static var log:IClientLog = IClientLog(OSGi.getInstance().getService(IClientLog));
      
      private var §##?§:ICodec;
      
      private var §6!U§:ICodec;
      
      private var §^!%§:ICodec;
      
      public function CodecSocialNetworkPanelParams(param1:§?"s§)
      {
         super();
         this.§##?§ = param1.getCodec("scpacker.networking.protocol.codec.primitive.StringCodec");
         this.§6!U§ = param1.getCodec("scpacker.networking.protocol.codec.primitive.BooleanCodec");
         this.§^!%§ = param1.getCodec("scpacker.networking.protocol.codec.primitive.StringCodec");
      }
      
      public function decode(param1:ByteArray) : Object
      {
         var _loc2_:SocialNetworkPanelParams = new SocialNetworkPanelParams();
         _loc2_.authorizationUrl = this.§##?§.decode(param1) as String;
         _loc2_.linkExists = this.§6!U§.decode(param1) as Boolean;
         _loc2_.snId = this.§^!%§.decode(param1) as String;
         return _loc2_;
      }
      
      public function encode(param1:ByteArray, param2:Object) : int
      {
         if(param2 == null)
         {
            throw new Error("Object is null. Use @ProtocolOptional annotation.");
         }
         var _loc3_:SocialNetworkPanelParams = SocialNetworkPanelParams(param2);
         this.§##?§.encode(param1,_loc3_.authorizationUrl);
         this.§6!U§.encode(param1,_loc3_.linkExists);
         this.§^!%§.encode(param1,_loc3_.snId);
         return 4;
      }
   }
}

