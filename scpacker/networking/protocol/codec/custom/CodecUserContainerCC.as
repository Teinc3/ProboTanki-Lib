package scpacker.networking.protocol.codec.custom
{
   import Renamed5811.ICodec;
   import flash.utils.ByteArray;
   import projects.tanks.client.users.model.friends.container.UserContainerCC;
   import scpacker.networking.protocol.Renamed536;
   
   public class CodecUserContainerCC implements ICodec
   {
      private var Renamed10740:ICodec;
      
      public function CodecUserContainerCC(param1:Renamed536)
      {
         super();
         this.Renamed10740 = param1.getCodec("scpacker.networking.protocol.codec.complex.VectorCodecString");
      }
      
      public function decode(param1:ByteArray) : Object
      {
         var _loc2_:UserContainerCC = new UserContainerCC();
         _loc2_.users = this.Renamed10740.decode(param1) as Vector.<String>;
         return _loc2_;
      }
      
      public function encode(param1:ByteArray, param2:Object) : int
      {
         if(param2 == null)
         {
            throw new Error("Object is null. Use @ProtocolOptional annotation.");
         }
         var _loc3_:UserContainerCC = UserContainerCC(param2);
         this.Renamed10740.encode(param1,_loc3_.users);
         return 4;
      }
   }
}

