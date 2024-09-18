package scpacker.networking.protocol.codec.custom
{
   import §[" §.ICodec;
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.clientlog.IClientLog;
   import flash.utils.ByteArray;
   import projects.tanks.client.battleservice.§<#p§;
   import scpacker.networking.protocol.§?"s§;
   
   public class CodecRange implements ICodec
   {
      public static var log:IClientLog = IClientLog(OSGi.getInstance().getService(IClientLog));
      
      private var §function for class§:ICodec;
      
      private var §-"F§:ICodec;
      
      public function CodecRange(param1:§?"s§)
      {
         super();
         this.§function for class§ = param1.getCodec("scpacker.networking.protocol.codec.primitive.IntCodec");
         this.§-"F§ = param1.getCodec("scpacker.networking.protocol.codec.primitive.IntCodec");
      }
      
      public function decode(param1:ByteArray) : Object
      {
         var _loc2_:§<#p§ = new §<#p§();
         _loc2_.max = this.§function for class§.decode(param1) as int;
         _loc2_.min = this.§-"F§.decode(param1) as int;
         return _loc2_;
      }
      
      public function encode(param1:ByteArray, param2:Object) : int
      {
         if(param2 == null)
         {
            throw new Error("Object is null. Use @ProtocolOptional annotation.");
         }
         var _loc3_:§<#p§ = §<#p§(param2);
         var _loc4_:int = 0;
         return (_loc4_ = _loc4_ + this.§function for class§.encode(param1,_loc3_.max)) + this.§-"F§.encode(param1,_loc3_.min);
      }
   }
}

