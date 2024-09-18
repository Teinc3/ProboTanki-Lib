package scpacker.networking.protocol.codec.custom
{
   import Renamed5811.ICodec;
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.clientlog.IClientLog;
   import Renamed331.Renamed1906;
   import flash.utils.ByteArray;
   import platform.client.fp10.core.resource.types.ImageResource;
   import scpacker.networking.protocol.CodecRegisterer;
   
   public class CodecWeeklyQuestRewardItem implements ICodec
   {
      public static var log:IClientLog = IClientLog(OSGi.getInstance().getService(IClientLog));
      
      private var Renamed10659:ICodec;
      
      private var Renamed10770:ICodec;
      
      public function CodecWeeklyQuestRewardItem(param1:CodecRegisterer)
      {
         super();
         this.Renamed10659 = param1.getCodec("scpacker.networking.protocol.codec.primitive.IntCodec");
         this.Renamed10770 = param1.getCodec("scpacker.networking.protocol.codec.custom.ResourceGetterCodec");
      }
      
      public function decode(param1:ByteArray) : Object
      {
         var _loc2_:Renamed1906 = new Renamed1906();
         _loc2_.count = this.Renamed10659.decode(param1) as int;
         _loc2_.Renamed1918 = this.Renamed10770.decode(param1) as ImageResource;
         return _loc2_;
      }
      
      public function encode(param1:ByteArray, param2:Object) : int
      {
         if(param2 == null)
         {
            throw new Error("Object is null. Use @ProtocolOptional annotation.");
         }
         var _loc3_:Renamed1906 = Renamed1906(param2);
         this.Renamed10659.encode(param1,_loc3_.count);
         this.Renamed10770.encode(param1,_loc3_.Renamed1918);
         return 4;
      }
   }
}

