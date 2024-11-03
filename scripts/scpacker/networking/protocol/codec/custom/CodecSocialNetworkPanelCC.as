package scpacker.networking.protocol.codec.custom
{
   import Renamed5811.ICodec;
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.clientlog.IClientLog;
   import flash.utils.ByteArray;
   import projects.tanks.client.panel.model.socialnetwork.SocialNetworkPanelCC;
   import projects.tanks.client.panel.model.socialnetwork.SocialNetworkPanelParams;
   import scpacker.networking.protocol.CodecRegisterer;
   
   public class CodecSocialNetworkPanelCC implements ICodec
   {
      public static var log:IClientLog = IClientLog(OSGi.getInstance().getService(IClientLog));
      
      private var Renamed10715:ICodec;
      
      private var Renamed10716:ICodec;
      
      public function CodecSocialNetworkPanelCC(param1:CodecRegisterer)
      {
         super();
         this.Renamed10715 = param1.getCodec("scpacker.networking.protocol.codec.primitive.BooleanCodec");
         this.Renamed10716 = param1.getCodec("scpacker.networking.protocol.codec.custom.VectorCodecSocialNetworkPanelParams");
      }
      
      public function decode(param1:ByteArray) : Object
      {
         var _loc2_:SocialNetworkPanelCC = new SocialNetworkPanelCC();
         _loc2_.passwordCreated = this.Renamed10715.decode(param1) as Boolean;
         _loc2_.socialNetworkParams = this.Renamed10716.decode(param1) as Vector.<SocialNetworkPanelParams>;
         return _loc2_;
      }
      
      public function encode(param1:ByteArray, param2:Object) : int
      {
         if(param2 == null)
         {
            throw new Error("Object is null. Use @ProtocolOptional annotation.");
         }
         var _loc3_:SocialNetworkPanelCC = SocialNetworkPanelCC(param2);
         this.Renamed10715.encode(param1,_loc3_.passwordCreated);
         this.Renamed10716.encode(param1,_loc3_.socialNetworkParams);
         return 4;
      }
   }
}

