package scpacker.networking.protocol.codec.custom
{
   import §[" §.ICodec;
   import flash.utils.ByteArray;
   import projects.tanks.client.panel.model.dailyquest.§native const in§;
   import scpacker.networking.protocol.§?"s§;
   
   public class VectorCodecDailyQuestPrizeInfo implements ICodec
   {
      private var elementCodec:ICodec;
      
      public function VectorCodecDailyQuestPrizeInfo(param1:§?"s§)
      {
         super();
         this.elementCodec = param1.getCodec("scpacker.networking.protocol.codec.custom.CodecDailyQuestPrizeInfo");
      }
      
      public function decode(param1:ByteArray) : Object
      {
         var _loc2_:int = param1.readInt();
         var _loc3_:Vector.<§native const in§> = new Vector.<§native const in§>(_loc2_,true);
         var _loc4_:int = 0;
         while(_loc4_ < _loc2_)
         {
            _loc3_[_loc4_] = §native const in§(this.elementCodec.decode(param1));
            _loc4_++;
         }
         return _loc3_;
      }
      
      public function encode(param1:ByteArray, param2:Object) : int
      {
         if(param2 == null)
         {
            throw new Error("Object is null. Use @ProtocolOptional annotation.");
         }
         var _loc3_:Vector.<§native const in§> = Vector.<§native const in§>(param2);
         var _loc4_:int = int(_loc3_.length);
         param1.writeInt(_loc4_);
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         while(_loc6_ < _loc4_)
         {
            _loc5_ += this.elementCodec.encode(param1,_loc3_[_loc6_]);
            _loc6_++;
         }
         return _loc5_ + 4;
      }
   }
}

