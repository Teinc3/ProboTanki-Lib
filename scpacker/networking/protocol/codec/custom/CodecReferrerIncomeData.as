package scpacker.networking.protocol.codec.custom
{
   import §[" §.ICodec;
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.clientlog.IClientLog;
   import flash.utils.ByteArray;
   import scpacker.networking.protocol.§?"s§;
   import §static final§.§continue package do§;
   
   public class CodecReferrerIncomeData implements ICodec
   {
      public static var log:IClientLog = IClientLog(OSGi.getInstance().getService(IClientLog));
      
      private var §get package catch§:ICodec;
      
      private var §try set use§:ICodec;
      
      public function CodecReferrerIncomeData(param1:§?"s§)
      {
         super();
         this.§get package catch§ = param1.getCodec("scpacker.networking.protocol.codec.primitive.IntCodec");
         this.§try set use§ = param1.getCodec("scpacker.networking.protocol.codec.primitive.StringCodec");
      }
      
      public function decode(param1:ByteArray) : Object
      {
         var _loc2_:§continue package do§ = new §continue package do§();
         _loc2_.income = this.§get package catch§.decode(param1) as int;
         _loc2_.user = this.§try set use§.decode(param1) as String;
         return _loc2_;
      }
      
      public function encode(param1:ByteArray, param2:Object) : int
      {
         if(param2 == null)
         {
            throw new Error("Object is null. Use @ProtocolOptional annotation.");
         }
         var _loc3_:§continue package do§ = §continue package do§(param2);
         this.§get package catch§.encode(param1,_loc3_.income);
         this.§try set use§.encode(param1,_loc3_.user);
         return 4;
      }
   }
}

