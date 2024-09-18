package scpacker.networking.protocol.codec.custom
{
   import §[" §.ICodec;
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.clientlog.IClientLog;
   import flash.utils.ByteArray;
   import projects.tanks.client.tanksservices.model.notifier.uid.UidNotifierData;
   import scpacker.networking.protocol.§?"s§;
   
   public class §[3§ implements ICodec
   {
      public static var log:IClientLog = IClientLog(OSGi.getInstance().getService(IClientLog));
      
      private var §"#$§:ICodec;
      
      private var §'#X§:ICodec;
      
      public function §[3§(param1:§?"s§)
      {
         super();
         this.§"#$§ = param1.getCodec("scpacker.networking.protocol.codec.primitive.StringCodec");
         this.§'#X§ = param1.getCodec("scpacker.networking.protocol.codec.primitive.StringCodec");
      }
      
      public function decode(param1:ByteArray) : Object
      {
         var _loc2_:UidNotifierData = new UidNotifierData();
         _loc2_.uid = this.§"#$§.decode(param1) as String;
         _loc2_.userId = this.§'#X§.decode(param1) as String;
         return _loc2_;
      }
      
      public function encode(param1:ByteArray, param2:Object) : int
      {
         if(param2 == null)
         {
            throw new Error("Object is null. Use @ProtocolOptional annotation.");
         }
         var _loc3_:UidNotifierData = UidNotifierData(param2);
         this.§"#$§.encode(param1,_loc3_.uid);
         this.§'#X§.encode(param1,_loc3_.userId);
         return 4;
      }
   }
}

