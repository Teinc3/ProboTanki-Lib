package scpacker.networking.protocol.codec.custom
{
   import Renamed602.3DPositionVector;
   import Renamed5811.ICodec;
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.clientlog.IClientLog;
   import Renamed326.Renamed7757;
   import flash.utils.ByteArray;
   import scpacker.networking.protocol.CodecRegisterer;
   
   public class CodecBattleMine implements ICodec
   {
      public static var log:IClientLog = IClientLog(OSGi.getInstance().getService(IClientLog));
      
      private var Renamed10585:ICodec;
      
      private var Renamed10586:ICodec;
      
      private var Renamed10587:ICodec;
      
      private var Renamed10535:ICodec;
      
      public function CodecBattleMine(param1:CodecRegisterer)
      {
         super();
         this.Renamed10585 = param1.getCodec("scpacker.networking.protocol.codec.primitive.BooleanCodec");
         this.Renamed10586 = param1.getCodec("scpacker.networking.protocol.codec.primitive.StringCodec");
         this.Renamed10587 = param1.getCodec("scpacker.networking.protocol.codec.primitive.StringCodec");
         this.Renamed10535 = param1.getCodec("scpacker.networking.protocol.codec.custom.CodecVector3d");
      }
      
      public function decode(param1:ByteArray) : Object
      {
         var _loc2_:Renamed7757 = new Renamed7757();
         _loc2_.activated = true;
         _loc2_.mineId = this.Renamed10586.decode(param1) as String;
         _loc2_.ownerId = this.Renamed10587.decode(param1) as String;
         _loc2_.position = this.Renamed10535.decode(param1) as 3DPositionVector;
         return _loc2_;
      }
      
      public function encode(param1:ByteArray, param2:Object) : int
      {
         if(param2 == null)
         {
            throw new Error("Object is null. Use @ProtocolOptional annotation.");
         }
         var _loc3_:Renamed7757 = Renamed7757(param2);
         this.Renamed10585.encode(param1,_loc3_.activated);
         this.Renamed10586.encode(param1,_loc3_.mineId);
         this.Renamed10587.encode(param1,_loc3_.ownerId);
         this.Renamed10535.encode(param1,_loc3_.position);
         return 4;
      }
   }
}

