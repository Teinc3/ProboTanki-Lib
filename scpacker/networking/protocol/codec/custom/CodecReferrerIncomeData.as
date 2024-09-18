package scpacker.networking.protocol.codec.custom
{
   import Renamed5811.ICodec;
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.clientlog.IClientLog;
   import flash.utils.ByteArray;
   import scpacker.networking.protocol.Renamed536;
   import Renamed420.Renamed1806;
   
   public class CodecReferrerIncomeData implements ICodec
   {
      public static var log:IClientLog = IClientLog(OSGi.getInstance().getService(IClientLog));
      
      private var Renamed10709:ICodec;
      
      private var Renamed10576:ICodec;
      
      public function CodecReferrerIncomeData(param1:Renamed536)
      {
         super();
         this.Renamed10709 = param1.getCodec("scpacker.networking.protocol.codec.primitive.IntCodec");
         this.Renamed10576 = param1.getCodec("scpacker.networking.protocol.codec.primitive.StringCodec");
      }
      
      public function decode(param1:ByteArray) : Object
      {
         var _loc2_:Renamed1806 = new Renamed1806();
         _loc2_.income = this.Renamed10709.decode(param1) as int;
         _loc2_.user = this.Renamed10576.decode(param1) as String;
         return _loc2_;
      }
      
      public function encode(param1:ByteArray, param2:Object) : int
      {
         if(param2 == null)
         {
            throw new Error("Object is null. Use @ProtocolOptional annotation.");
         }
         var _loc3_:Renamed1806 = Renamed1806(param2);
         this.Renamed10709.encode(param1,_loc3_.income);
         this.Renamed10576.encode(param1,_loc3_.user);
         return 4;
      }
   }
}

