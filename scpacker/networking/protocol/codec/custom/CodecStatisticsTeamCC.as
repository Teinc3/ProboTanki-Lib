package scpacker.networking.protocol.codec.custom
{
   import Renamed202.Renamed6015;
   import Renamed5811.ICodec;
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.clientlog.IClientLog;
   import flash.utils.ByteArray;
   import projects.tanks.client.battleservice.model.statistics.Renamed2737;
   import scpacker.networking.protocol.Renamed536;
   
   public class CodecStatisticsTeamCC implements ICodec
   {
      public static var log:IClientLog = IClientLog(OSGi.getInstance().getService(IClientLog));
      
      private var Renamed10728:ICodec;
      
      private var Renamed10729:ICodec;
      
      private var Renamed10730:ICodec;
      
      private var Renamed10731:ICodec;
      
      public function CodecStatisticsTeamCC(param1:Renamed536)
      {
         super();
         this.Renamed10728 = param1.getCodec("scpacker.networking.protocol.codec.primitive.IntCodec");
         this.Renamed10729 = param1.getCodec("scpacker.networking.protocol.codec.primitive.IntCodec");
         this.Renamed10730 = param1.getCodec("scpacker.networking.protocol.codec.custom.VectorCodecUserInfo");
         this.Renamed10731 = param1.getCodec("scpacker.networking.protocol.codec.custom.VectorCodecUserInfo");
      }
      
      public function decode(param1:ByteArray) : Object
      {
         var _loc2_:Renamed6015 = new Renamed6015();
         _loc2_.Renamed2689 = this.Renamed10728.decode(param1) as int;
         _loc2_.Renamed2687 = this.Renamed10729.decode(param1) as int;
         _loc2_.Renamed6018 = this.Renamed10730.decode(param1) as Vector.<Renamed2737>;
         _loc2_.Renamed6019 = this.Renamed10731.decode(param1) as Vector.<Renamed2737>;
         return _loc2_;
      }
      
      public function encode(param1:ByteArray, param2:Object) : int
      {
         if(param2 == null)
         {
            throw new Error("Object is null. Use @ProtocolOptional annotation.");
         }
         var _loc3_:Renamed6015 = Renamed6015(param2);
         this.Renamed10728.encode(param1,_loc3_.Renamed2689);
         this.Renamed10729.encode(param1,_loc3_.Renamed2687);
         this.Renamed10730.encode(param1,_loc3_.Renamed6018);
         this.Renamed10731.encode(param1,_loc3_.Renamed6019);
         return 4;
      }
   }
}

