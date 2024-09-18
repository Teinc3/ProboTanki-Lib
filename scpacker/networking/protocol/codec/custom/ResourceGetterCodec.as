package scpacker.networking.protocol.codec.custom
{
   import Renamed5811.ICodec;
   import alternativa.types.Long;
   import flash.utils.ByteArray;
   import platform.client.fp10.core.registry.ResourceRegistry;
   import platform.client.fp10.core.resource.Resource;
   import scpacker.networking.protocol.CodecRegisterer;
   
   public class ResourceGetterCodec implements ICodec
   {
      private var resourceRegistry:ResourceRegistry;
      
      private var longCodec:ICodec;
      
      public function ResourceGetterCodec(param1:CodecRegisterer, param2:ResourceRegistry)
      {
         super();
         this.resourceRegistry = param2;
         this.longCodec = param1.getCodec("scpacker.networking.protocol.codec.primitive.IntCodec");
      }
      
      public function decode(param1:ByteArray) : Object
      {
         var _loc2_:Long = Long.getLong(0,this.longCodec.decode(param1) as int);
         var _loc3_:Resource = this.resourceRegistry.getResource(_loc2_);
         if(_loc3_ == null)
         {
            throw new Error("Resource " + _loc2_ + " not found");
         }
         return _loc3_;
      }
      
      public function encode(param1:ByteArray, param2:Object) : int
      {
         var _loc3_:int = int(param2.value);
         param1.writeInt(_loc3_);
         return 4;
      }
   }
}

