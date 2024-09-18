package scpacker.networking.protocol.codec.custom
{
   import Renamed4808.Renamed5536;
   import Renamed5811.ICodec;
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.clientlog.IClientLog;
   import alternativa.types.Long;
   import flash.utils.ByteArray;
   import platform.client.fp10.core.resource.types.ImageResource;
   import projects.tanks.client.panel.model.dailyquest.Renamed4365;
   import scpacker.networking.protocol.Renamed536;
   
   public class CodecDailyQuestInfo implements ICodec
   {
      public static var log:IClientLog = IClientLog(OSGi.getInstance().getService(IClientLog));
      
      private var Renamed10653:ICodec;
      
      private var Renamed10014:ICodec;
      
      private var Renamed10654:ICodec;
      
      private var Renamed10609:ICodec;
      
      private var Renamed10655:ICodec;
      
      private var Renamed10656:ICodec;
      
      private var Renamed10657:ICodec;
      
      private var Renamed10658:ICodec;
      
      public function CodecDailyQuestInfo(param1:Renamed536)
      {
         super();
         this.Renamed10653 = param1.getCodec("scpacker.networking.protocol.codec.primitive.BooleanCodec");
         this.Renamed10014 = param1.getCodec("scpacker.networking.protocol.codec.primitive.StringCodec");
         this.Renamed10654 = param1.getCodec("scpacker.networking.protocol.codec.primitive.IntCodec");
         this.Renamed10609 = param1.getCodec("scpacker.networking.protocol.codec.custom.ResourceGetterCodec");
         this.Renamed10655 = param1.getCodec("scpacker.networking.protocol.codec.custom.VectorCodecDailyQuestPrizeInfo");
         this.Renamed10656 = param1.getCodec("scpacker.networking.protocol.codec.primitive.IntCodec");
         this.Renamed10657 = param1.getCodec("scpacker.networking.protocol.codec.primitive.IntCodec");
         this.Renamed10658 = param1.getCodec("scpacker.networking.protocol.codec.primitive.IntCodec");
      }
      
      public function decode(param1:ByteArray) : Object
      {
         var _loc2_:Renamed5536 = new Renamed5536();
         _loc2_.Renamed5544 = this.Renamed10653.decode(param1) as Boolean;
         _loc2_.description = this.Renamed10014.decode(param1) as String;
         _loc2_.Renamed5545 = this.Renamed10654.decode(param1) as int;
         _loc2_.image = this.Renamed10609.decode(param1) as ImageResource;
         _loc2_.Renamed5546 = this.Renamed10655.decode(param1) as Vector.<Renamed4365>;
         _loc2_.progress = this.Renamed10656.decode(param1) as int;
         _loc2_.questId = Long.getLong(0,this.Renamed10657.decode(param1) as int);
         _loc2_.Renamed5547 = this.Renamed10658.decode(param1) as int;
         return _loc2_;
      }
      
      public function encode(param1:ByteArray, param2:Object) : int
      {
         if(param2 == null)
         {
            throw new Error("Object is null. Use @ProtocolOptional annotation.");
         }
         var _loc3_:Renamed5536 = Renamed5536(param2);
         this.Renamed10653.encode(param1,_loc3_.Renamed5544);
         this.Renamed10014.encode(param1,_loc3_.description);
         this.Renamed10654.encode(param1,_loc3_.Renamed5545);
         this.Renamed10609.encode(param1,_loc3_.image);
         this.Renamed10655.encode(param1,_loc3_.Renamed5546);
         this.Renamed10656.encode(param1,_loc3_.progress);
         this.Renamed10657.encode(param1,_loc3_.questId.low);
         this.Renamed10658.encode(param1,_loc3_.Renamed5547);
         return 4;
      }
   }
}

