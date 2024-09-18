package scpacker.networking.protocol.codec.custom
{
   import Renamed602.Renamed603;
   import Renamed5811.ICodec;
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.clientlog.IClientLog;
   import flash.utils.ByteArray;
   import scpacker.networking.protocol.Renamed536;
   import Renamed461.Renamed2772;
   
   public class CodecMoveCommand implements ICodec
   {
      public static var log:IClientLog = IClientLog(OSGi.getInstance().getService(IClientLog));
      
      private var Renamed10690:ICodec;
      
      private var Renamed10691:ICodec;
      
      private var Renamed10692:ICodec;
      
      private var Renamed10693:ICodec;
      
      private var Renamed10535:ICodec;
      
      public function CodecMoveCommand(param1:Renamed536)
      {
         super();
         this.Renamed10690 = param1.getCodec("scpacker.networking.protocol.codec.custom.CodecVector3d");
         this.Renamed10691 = param1.getCodec("scpacker.networking.protocol.codec.primitive.ByteCodec");
         this.Renamed10692 = param1.getCodec("scpacker.networking.protocol.codec.custom.CodecVector3d");
         this.Renamed10693 = param1.getCodec("scpacker.networking.protocol.codec.custom.CodecVector3d");
         this.Renamed10535 = param1.getCodec("scpacker.networking.protocol.codec.custom.CodecVector3d");
      }
      
      public function decode(param1:ByteArray) : Object
      {
         var _loc2_:Renamed2772 = new Renamed2772();
         _loc2_.angularVelocity = this.Renamed10690.decode(param1) as Renamed603;
         _loc2_.control = this.Renamed10691.decode(param1) as int;
         _loc2_.Renamed2904 = this.Renamed10692.decode(param1) as Renamed603;
         _loc2_.orientation = this.Renamed10693.decode(param1) as Renamed603;
         _loc2_.position = this.Renamed10535.decode(param1) as Renamed603;
         return _loc2_;
      }
      
      public function encode(param1:ByteArray, param2:Object) : int
      {
         var _loc3_:int = 0;
         if(param2 == null)
         {
            throw new Error("Object is null. Use @ProtocolOptional annotation.");
         }
         var _loc4_:Renamed2772 = Renamed2772(param2);
         _loc3_ += this.Renamed10690.encode(param1,_loc4_.angularVelocity);
         _loc3_ += this.Renamed10691.encode(param1,_loc4_.control);
         _loc3_ += this.Renamed10692.encode(param1,_loc4_.Renamed2904);
         _loc3_ += this.Renamed10693.encode(param1,_loc4_.orientation);
         return _loc3_ + this.Renamed10535.encode(param1,_loc4_.position);
      }
   }
}

