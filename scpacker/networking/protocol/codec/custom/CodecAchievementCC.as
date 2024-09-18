package scpacker.networking.protocol.codec.custom
{
   import §[" §.ICodec;
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.clientlog.IClientLog;
   import flash.utils.ByteArray;
   import projects.tanks.client.achievements.model.achievements.§null package extends§;
   import scpacker.networking.protocol.§?"s§;
   import §set catch if§.§false for else§;
   
   public class CodecAchievementCC implements ICodec
   {
      public static var log:IClientLog = IClientLog(OSGi.getInstance().getService(IClientLog));
      
      private var §import package catch§:ICodec;
      
      public function CodecAchievementCC(param1:§?"s§)
      {
         super();
         this.§import package catch§ = param1.getCodec("scpacker.networking.protocol.codec.custom.VectorCodecAchievement");
      }
      
      public function decode(param1:ByteArray) : Object
      {
         var _loc2_:§false for else§ = new §false for else§();
         _loc2_.§false catch super§ = this.§import package catch§.decode(param1) as Vector.<§null package extends§>;
         return _loc2_;
      }
      
      public function encode(param1:ByteArray, param2:Object) : int
      {
         if(param2 == null)
         {
            throw new Error("Object is null. Use @ProtocolOptional annotation.");
         }
         var _loc3_:§false for else§ = §false for else§(param2);
         this.§import package catch§.encode(param1,_loc3_.§false catch super§);
         return 4;
      }
   }
}

