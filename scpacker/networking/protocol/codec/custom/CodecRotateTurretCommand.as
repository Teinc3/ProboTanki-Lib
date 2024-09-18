package scpacker.networking.protocol.codec.custom
{
   import Renamed5811.ICodec;
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.clientlog.IClientLog;
   import flash.utils.ByteArray;
   import scpacker.networking.protocol.CodecRegisterer;
   import Renamed461.Renamed2773;
   
   public class CodecRotateTurretCommand implements ICodec
   {
      public static var log:IClientLog = IClientLog(OSGi.getInstance().getService(IClientLog));
      
      private var Renamed10712:ICodec;
      
      private var Renamed10691:ICodec;
      
      public function CodecRotateTurretCommand(param1:CodecRegisterer)
      {
         super();
         this.Renamed10712 = param1.getCodec("scpacker.networking.protocol.codec.primitive.FloatCodec");
         this.Renamed10691 = param1.getCodec("scpacker.networking.protocol.codec.primitive.ByteCodec");
      }
      
      public function decode(param1:ByteArray) : Object
      {
         var _loc2_:Renamed2773 = new Renamed2773();
         _loc2_.angle = this.Renamed10712.decode(param1) as Number;
         _loc2_.control = this.Renamed10691.decode(param1) as int;
         return _loc2_;
      }
      
      public function encode(param1:ByteArray, param2:Object) : int
      {
         var _loc3_:int = 0;
         if(param2 == null)
         {
            throw new Error("Object is null. Use @ProtocolOptional annotation.");
         }
         var _loc4_:Renamed2773 = Renamed2773(param2);
         _loc3_ += this.Renamed10712.encode(param1,_loc4_.angle);
         return _loc3_ + this.Renamed10691.encode(param1,_loc4_.control);
      }
   }
}

