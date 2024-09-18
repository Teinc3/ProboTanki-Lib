package scpacker.networking.protocol.codec.custom
{
   import §[" §.ICodec;
   import flash.utils.ByteArray;
   import projects.tanks.client.users.model.friends.container.UserContainerCC;
   import scpacker.networking.protocol.§?"s§;
   
   public class CodecUserContainerCC implements ICodec
   {
      private var §`!Q§:ICodec;
      
      public function CodecUserContainerCC(param1:§?"s§)
      {
         super();
         this.§`!Q§ = param1.getCodec("scpacker.networking.protocol.codec.complex.VectorCodecString");
      }
      
      public function decode(param1:ByteArray) : Object
      {
         var _loc2_:UserContainerCC = new UserContainerCC();
         _loc2_.users = this.§`!Q§.decode(param1) as Vector.<String>;
         return _loc2_;
      }
      
      public function encode(param1:ByteArray, param2:Object) : int
      {
         if(param2 == null)
         {
            throw new Error("Object is null. Use @ProtocolOptional annotation.");
         }
         var _loc3_:UserContainerCC = UserContainerCC(param2);
         this.§`!Q§.encode(param1,_loc3_.users);
         return 4;
      }
   }
}

