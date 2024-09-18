package scpacker.networking.protocol.codec.complex
{
   import Renamed5811.ICodec;
   import flash.utils.ByteArray;
   
   public class VectorCodecInt implements ICodec
   {
      private var elementCodec:ICodec;
      
      public function VectorCodecInt(param1:ICodec)
      {
         super();
         this.elementCodec = param1;
      }
      
      public function encode(param1:ByteArray, param2:Object) : int
      {
         var _loc3_:Vector.<int> = Vector.<int>(param2);
         var _loc4_:int = int(_loc3_.length);
         var _loc5_:int = 0;
         param1.writeInt(_loc4_);
         var _loc6_:int = 0;
         while(_loc6_ < _loc4_)
         {
            _loc5_ += this.elementCodec.encode(param1,_loc3_[_loc6_]);
            _loc6_++;
         }
         return _loc5_ + 4;
      }
      
      public function decode(param1:ByteArray) : Object
      {
         var _loc2_:int = param1.readInt();
         var _loc3_:Vector.<int> = new Vector.<int>(_loc2_,true);
         var _loc4_:int = 0;
         while(_loc4_ < _loc2_)
         {
            _loc3_[_loc4_] = int(this.elementCodec.decode(param1));
            _loc4_++;
         }
         return _loc3_;
      }
   }
}

