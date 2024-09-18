package scpacker.networking.protocol.codec.custom
{
   import Renamed5811.ICodec;
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.clientlog.IClientLog;
   import flash.utils.ByteArray;
   import projects.tanks.client.battleservice.Renamed1586;
   import scpacker.networking.protocol.Renamed536;
   
   public class CodecRange implements ICodec
   {
      public static var log:IClientLog = IClientLog(OSGi.getInstance().getService(IClientLog));
      
      private var Renamed10706:ICodec;
      
      private var Renamed10707:ICodec;
      
      public function CodecRange(param1:Renamed536)
      {
         super();
         this.Renamed10706 = param1.getCodec("scpacker.networking.protocol.codec.primitive.IntCodec");
         this.Renamed10707 = param1.getCodec("scpacker.networking.protocol.codec.primitive.IntCodec");
      }
      
      public function decode(param1:ByteArray) : Object
      {
         var _loc2_:Renamed1586 = new Renamed1586();
         _loc2_.max = this.Renamed10706.decode(param1) as int;
         _loc2_.min = this.Renamed10707.decode(param1) as int;
         return _loc2_;
      }
      
      public function encode(param1:ByteArray, param2:Object) : int
      {
         if(param2 == null)
         {
            throw new Error("Object is null. Use @ProtocolOptional annotation.");
         }
         var _loc3_:Renamed1586 = Renamed1586(param2);
         var _loc4_:int = 0;
         return (_loc4_ = _loc4_ + this.Renamed10706.encode(param1,_loc3_.max)) + this.Renamed10707.encode(param1,_loc3_.min);
      }
   }
}

