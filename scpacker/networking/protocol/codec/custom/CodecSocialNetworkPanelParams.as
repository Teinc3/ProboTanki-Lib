package scpacker.networking.protocol.codec.custom
{
   import Renamed5811.ICodec;
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.clientlog.IClientLog;
   import flash.utils.ByteArray;
   import projects.tanks.client.panel.model.socialnetwork.SocialNetworkPanelParams;
   import scpacker.networking.protocol.Renamed536;
   
   public class CodecSocialNetworkPanelParams implements ICodec
   {
      public static var log:IClientLog = IClientLog(OSGi.getInstance().getService(IClientLog));
      
      private var Renamed10713:ICodec;
      
      private var Renamed10717:ICodec;
      
      private var Renamed10714:ICodec;
      
      public function CodecSocialNetworkPanelParams(param1:Renamed536)
      {
         super();
         this.Renamed10713 = param1.getCodec("scpacker.networking.protocol.codec.primitive.StringCodec");
         this.Renamed10717 = param1.getCodec("scpacker.networking.protocol.codec.primitive.BooleanCodec");
         this.Renamed10714 = param1.getCodec("scpacker.networking.protocol.codec.primitive.StringCodec");
      }
      
      public function decode(param1:ByteArray) : Object
      {
         var _loc2_:SocialNetworkPanelParams = new SocialNetworkPanelParams();
         _loc2_.authorizationUrl = this.Renamed10713.decode(param1) as String;
         _loc2_.linkExists = this.Renamed10717.decode(param1) as Boolean;
         _loc2_.snId = this.Renamed10714.decode(param1) as String;
         return _loc2_;
      }
      
      public function encode(param1:ByteArray, param2:Object) : int
      {
         if(param2 == null)
         {
            throw new Error("Object is null. Use @ProtocolOptional annotation.");
         }
         var _loc3_:SocialNetworkPanelParams = SocialNetworkPanelParams(param2);
         this.Renamed10713.encode(param1,_loc3_.authorizationUrl);
         this.Renamed10717.encode(param1,_loc3_.linkExists);
         this.Renamed10714.encode(param1,_loc3_.snId);
         return 4;
      }
   }
}

