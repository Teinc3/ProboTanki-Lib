package scpacker.networking.protocol.codec.custom
{
   import §[" §.ICodec;
   import flash.utils.ByteArray;
   import projects.tanks.client.battleservice.§final package import§;
   
   public class CodecBattleMode implements ICodec
   {
      public function CodecBattleMode()
      {
         super();
      }
      
      public function decode(param1:ByteArray) : Object
      {
         var _loc2_:§final package import§ = null;
         var _loc3_:int = param1.readInt();
         switch(_loc3_)
         {
            case 0:
               _loc2_ = §final package import§.DM;
               break;
            case 1:
               _loc2_ = §final package import§.TDM;
               break;
            case 2:
               _loc2_ = §final package import§.CTF;
               break;
            case 3:
               _loc2_ = §final package import§.CP;
               break;
            case 4:
               _loc2_ = §final package import§.AS;
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

