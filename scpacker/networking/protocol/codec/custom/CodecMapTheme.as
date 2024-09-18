package scpacker.networking.protocol.codec.custom
{
   import §?"a§.§finally for do§;
   import §[" §.ICodec;
   import flash.utils.ByteArray;
   
   public class CodecMapTheme implements ICodec
   {
      public function CodecMapTheme()
      {
         super();
      }
      
      public function decode(param1:ByteArray) : Object
      {
         var _loc2_:§finally for do§ = null;
         var _loc3_:int = param1.readInt();
         switch(_loc3_)
         {
            case 0:
               _loc2_ = §finally for do§.SUMMER;
               break;
            case 1:
               _loc2_ = §finally for do§.WINTER;
               break;
            case 2:
               _loc2_ = §finally for do§.SPACE;
               break;
            case 3:
               _loc2_ = §finally for do§.SUMMER_DAY;
               break;
            case 4:
               _loc2_ = §finally for do§.SUMMER_NIGHT;
               break;
            case 5:
               _loc2_ = §finally for do§.WINTER_DAY;
               break;
            case 6:
               _loc2_ = §finally for do§.WINTER_NIGHT;
         }
         return _loc2_;
      }
      
      public function encode(param1:ByteArray, param2:Object) : int
      {
         if(param2 == null)
         {
            throw new Error("Object is null. Use @ProtocolOptional annotation.");
         }
         var _loc3_:int = int(param2.value);
         param1.writeInt(_loc3_);
         return 4;
      }
   }
}

