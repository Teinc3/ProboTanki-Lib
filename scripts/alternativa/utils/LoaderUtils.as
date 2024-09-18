package alternativa.utils
{
   import flash.utils.ByteArray;
   
   public class LoaderUtils
   {
      private static const SEPARATOR:String = "/";
      
      public function LoaderUtils()
      {
         super();
      }
      
      public static function getResourcePath(param1:ByteArray, param2:ByteArray) : String
      {
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         _loc3_ = param2.readUnsignedInt();
         _loc4_ = param2.readUnsignedInt();
         var _loc5_:String = new Long(_loc3_,_loc4_).toOct();
         return SEPARATOR + param1.readUnsignedInt().toString(8) + SEPARATOR + param1.readUnsignedShort().toString(8) + SEPARATOR + param1.readUnsignedByte().toString(8) + SEPARATOR + param1.readUnsignedByte().toString(8) + SEPARATOR + _loc5_ + SEPARATOR;
      }
   }
}

