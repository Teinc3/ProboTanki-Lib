package scpacker.networking.protocol.codec.custom
{
   import Renamed5811.ICodec;
   import flash.utils.ByteArray;
   import projects.tanks.client.commons.types.ItemViewCategoryEnum;
   
   public class CodecItemViewCategoryEnum implements ICodec
   {
      public function CodecItemViewCategoryEnum()
      {
         super();
      }
      
      public function decode(param1:ByteArray) : Object
      {
         var _loc2_:ItemViewCategoryEnum = null;
         var _loc3_:int = param1.readInt();
         switch(_loc3_)
         {
            case 0:
               _loc2_ = ItemViewCategoryEnum.WEAPON;
               break;
            case 1:
               _loc2_ = ItemViewCategoryEnum.ARMOR;
               break;
            case 2:
               _loc2_ = ItemViewCategoryEnum.PAINT;
               break;
            case 3:
               _loc2_ = ItemViewCategoryEnum.INVENTORY;
               break;
            case 4:
               _loc2_ = ItemViewCategoryEnum.KIT;
               break;
            case 5:
               _loc2_ = ItemViewCategoryEnum.SPECIAL;
               break;
            case 6:
               _loc2_ = ItemViewCategoryEnum.GIVEN_PRESENTS;
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

