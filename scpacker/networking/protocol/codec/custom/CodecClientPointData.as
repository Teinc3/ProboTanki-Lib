package scpacker.networking.protocol.codec.custom
{
   import §,#a§.§'"P§;
   import §,#a§.§each package default§;
   import §;"?§.§#">§;
   import §[" §.ICodec;
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.clientlog.IClientLog;
   import flash.utils.ByteArray;
   import scpacker.networking.protocol.§?"s§;
   
   public class CodecClientPointData implements ICodec
   {
      public static var log:IClientLog = IClientLog(OSGi.getInstance().getService(IClientLog));
      
      private var §default set native§:ICodec;
      
      private var §+#!§:ICodec;
      
      private var §static var true§:ICodec;
      
      private var §each package do§:ICodec;
      
      private var §return for final§:ICodec;
      
      private var §>!L§:ICodec;
      
      private var §for catch with§:ICodec;
      
      public function CodecClientPointData(param1:§?"s§)
      {
         super();
         this.§default set native§ = param1.getCodec("scpacker.networking.protocol.codec.primitive.IntCodec");
         this.§+#!§ = param1.getCodec("scpacker.networking.protocol.codec.primitive.StringCodec");
         this.§static var true§ = param1.getCodec("scpacker.networking.protocol.codec.custom.CodecVector3d");
         this.§each package do§ = param1.getCodec("scpacker.networking.protocol.codec.primitive.FloatCodec");
         this.§return for final§ = param1.getCodec("scpacker.networking.protocol.codec.primitive.FloatCodec");
         this.§>!L§ = param1.getCodec("scpacker.networking.protocol.codec.custom.CodecControlPointState");
         this.§for catch with§ = param1.getCodec("scpacker.networking.protocol.codec.complex.VectorCodecString");
      }
      
      public function decode(param1:ByteArray) : Object
      {
         var _loc2_:§'"P§ = new §'"P§();
         _loc2_.id = this.§default set native§.decode(param1) as int;
         _loc2_.name = this.§+#!§.decode(param1) as String;
         _loc2_.position = this.§static var true§.decode(param1) as §#">§;
         _loc2_.score = this.§each package do§.decode(param1) as Number;
         _loc2_.§while import§ = this.§return for final§.decode(param1) as Number;
         _loc2_.state = this.§>!L§.decode(param1) as §each package default§;
         _loc2_.§import case§ = this.§for catch with§.decode(param1) as Vector.<String>;
         return _loc2_;
      }
      
      public function encode(param1:ByteArray, param2:Object) : int
      {
         if(param2 == null)
         {
            throw new Error("Object is null. Use @ProtocolOptional annotation.");
         }
         var _loc3_:§'"P§ = §'"P§(param2);
         this.§default set native§.encode(param1,_loc3_.id);
         this.§+#!§.encode(param1,_loc3_.name);
         this.§static var true§.encode(param1,_loc3_.position);
         this.§each package do§.encode(param1,_loc3_.score);
         this.§return for final§.encode(param1,_loc3_.§while import§);
         this.§>!L§.encode(param1,_loc3_.state);
         this.§for catch with§.encode(param1,_loc3_.§import case§);
         return 4;
      }
   }
}

