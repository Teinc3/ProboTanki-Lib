package scpacker.networking.protocol.codec.custom
{
   import §[" §.ICodec;
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.clientlog.IClientLog;
   import flash.utils.ByteArray;
   import projects.tanks.client.entrance.model.entrance.externalentrance.SocialNetworkEntranceParams;
   import scpacker.networking.protocol.§?"s§;
   
   public class CodecSocialNetworkEntranceParams implements ICodec
   {
      public static var log:IClientLog = IClientLog(OSGi.getInstance().getService(IClientLog));
      
      private var §##?§:ICodec;
      
      private var §^!%§:ICodec;
      
      public function CodecSocialNetworkEntranceParams(param1:§?"s§)
      {
         super();
         this.§##?§ = param1.getCodec("scpacker.networking.protocol.codec.primitive.StringCodec");
         this.§^!%§ = param1.getCodec("scpacker.networking.protocol.codec.primitive.StringCodec");
      }
      
      public function decode(param1:ByteArray) : Object
      {
         var _loc2_:SocialNetworkEntranceParams = new SocialNetworkEntranceParams();
         _loc2_.authorizationUrl = this.§##?§.decode(param1) as String;
         _loc2_.snId = this.§^!%§.decode(param1) as String;
         return _loc2_;
      }
      
      public function encode(param1:ByteArray, param2:Object) : int
      {
         var _loc3_:int = 0;
         if(param2 == null)
         {
            throw new Error("Object is null. Use @ProtocolOptional annotation.");
         }
         var _loc4_:SocialNetworkEntranceParams = SocialNetworkEntranceParams(param2);
         _loc3_ += this.§##?§.encode(param1,_loc4_.authorizationUrl);
         return _loc3_ + this.§^!%§.encode(param1,_loc4_.snId);
      }
   }
}

