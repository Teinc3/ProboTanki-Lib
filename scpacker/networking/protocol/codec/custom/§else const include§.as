package scpacker.networking.protocol.codec.custom
{
   import §'!@§.§'"a§;
   import §[" §.ICodec;
   import flash.utils.ByteArray;
   import scpacker.networking.protocol.§?"s§;
   
   public class §else const include§ implements ICodec
   {
      private var elementCodec:ICodec;
      
      private var §?"_§:Boolean;
      
      public function §else const include§(param1:§?"s§)
      {
         super();
         this.elementCodec = param1.getCodec("scpacker.networking.protocol.codec.custom.CodecDamageIndicatorType");
      }
      
      public function decode(param1:ByteArray) : Object
      {
         var _loc2_:int = param1.readInt();
         var _loc3_:Vector.<§'"a§> = new Vector.<§'"a§>(_loc2_,true);
         var _loc4_:int = 0;
         while(_loc4_ < _loc2_)
         {
            _loc3_[_loc4_] = §'"a§(this.elementCodec.decode(param1));
            _loc4_++;
         }
         return _loc3_;
      }
      
      public function encode(param1:ByteArray, param2:Object) : int
      {
         var _loc3_:int = 0;
         if(param2 == null)
         {
            throw new Error("Object is null. Use @ProtocolOptional annotation.");
         }
         var _loc4_:Vector.<§'"a§> = Vector.<§'"a§>(param2);
         var _loc5_:int = int(_loc4_.length);
         param1.writeInt(_loc5_);
         var _loc6_:int = 0;
         while(_loc6_ < _loc5_)
         {
            _loc3_ += this.elementCodec.encode(param1,_loc4_[_loc6_]);
            _loc6_++;
         }
         return 4 + _loc3_;
      }
   }
}

