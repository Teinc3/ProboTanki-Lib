package scpacker.networking.protocol.codec.custom
{
   import Renamed5811.ICodec;
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.clientlog.IClientLog;
   import flash.utils.ByteArray;
   import projects.tanks.client.entrance.model.entrance.externalentrance.SocialNetworkEntranceParams;
   import scpacker.networking.protocol.Renamed536;
   
   public class CodecSocialNetworkEntranceParams implements ICodec
   {
      public static var log:IClientLog = IClientLog(OSGi.getInstance().getService(IClientLog));
      
      private var Renamed10713:ICodec;
      
      private var Renamed10714:ICodec;
      
      public function CodecSocialNetworkEntranceParams(param1:Renamed536)
      {
         super();
         this.Renamed10713 = param1.getCodec("scpacker.networking.protocol.codec.primitive.StringCodec");
         this.Renamed10714 = param1.getCodec("scpacker.networking.protocol.codec.primitive.StringCodec");
      }
      
      public function decode(param1:ByteArray) : Object
      {
         var _loc2_:SocialNetworkEntranceParams = new SocialNetworkEntranceParams();
         _loc2_.authorizationUrl = this.Renamed10713.decode(param1) as String;
         _loc2_.snId = this.Renamed10714.decode(param1) as String;
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
         _loc3_ += this.Renamed10713.encode(param1,_loc4_.authorizationUrl);
         return _loc3_ + this.Renamed10714.encode(param1,_loc4_.snId);
      }
   }
}

