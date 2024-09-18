package scpacker.networking.protocol.codec.custom
{
   import Renamed5811.ICodec;
   import flash.utils.ByteArray;
   import projects.tanks.client.commons.types.ItemCategoryEnum;
   
   public class CodecItemCategoryEnum implements ICodec
   {
      public function CodecItemCategoryEnum()
      {
         super();
      }
      
      public function decode(param1:ByteArray) : Object
      {
         var _loc2_:ItemCategoryEnum = null;
         var _loc3_:int = param1.readInt();
         switch(_loc3_)
         {
            case 0:
               _loc2_ = ItemCategoryEnum.WEAPON;
               break;
            case 1:
               _loc2_ = ItemCategoryEnum.ARMOR;
               break;
            case 2:
               _loc2_ = ItemCategoryEnum.COLOR;
               break;
            case 3:
               _loc2_ = ItemCategoryEnum.INVENTORY;
               break;
            case 4:
               _loc2_ = ItemCategoryEnum.PLUGIN;
               break;
            case 5:
               _loc2_ = ItemCategoryEnum.KIT;
               break;
            case 6:
               _loc2_ = ItemCategoryEnum.EMBLEM;
               break;
            case 7:
               _loc2_ = ItemCategoryEnum.PRESENT;
               break;
            case 8:
               _loc2_ = ItemCategoryEnum.GIVEN_PRESENT;
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

