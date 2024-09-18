package §##6§
{
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.clientlog.IClientLog;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.protocol.info.TypeCodecInfo;
   import alternativa.types.Byte;
   import alternativa.types.Short;
   import platform.client.models.commons.types.Timestamp;
   
   public class §;!s§ implements ICodec
   {
      public static var log:IClientLog = IClientLog(OSGi.getInstance().getService(IClientLog));
      
      private var §0!C§:ICodec;
      
      private var §9"-§:ICodec;
      
      private var §class set null§:ICodec;
      
      private var §9>§:ICodec;
      
      private var §2!B§:ICodec;
      
      private var §&!I§:ICodec;
      
      public function §;!s§()
      {
         super();
      }
      
      public function init(param1:IProtocol) : void
      {
         this.§0!C§ = param1.getCodec(new TypeCodecInfo(Byte,false));
         this.§9"-§ = param1.getCodec(new TypeCodecInfo(Byte,false));
         this.§class set null§ = param1.getCodec(new TypeCodecInfo(Byte,false));
         this.§9>§ = param1.getCodec(new TypeCodecInfo(Byte,false));
         this.§2!B§ = param1.getCodec(new TypeCodecInfo(Byte,false));
         this.§&!I§ = param1.getCodec(new TypeCodecInfo(Short,false));
      }
      
      public function decode(param1:ProtocolBuffer) : Object
      {
         var _loc2_:Timestamp = new Timestamp();
         _loc2_.day = this.§0!C§.decode(param1) as int;
         _loc2_.hours = this.§9"-§.decode(param1) as int;
         _loc2_.minutes = this.§class set null§.decode(param1) as int;
         _loc2_.month = this.§9>§.decode(param1) as int;
         _loc2_.seconds = this.§2!B§.decode(param1) as int;
         _loc2_.year = this.§&!I§.decode(param1) as int;
         return _loc2_;
      }
      
      public function encode(param1:ProtocolBuffer, param2:Object) : void
      {
         if(param2 == null)
         {
            throw new Error("Object is null. Use @ProtocolOptional annotation.");
         }
         var _loc3_:Timestamp = Timestamp(param2);
         this.§0!C§.encode(param1,_loc3_.day);
         this.§9"-§.encode(param1,_loc3_.hours);
         this.§class set null§.encode(param1,_loc3_.minutes);
         this.§9>§.encode(param1,_loc3_.month);
         this.§2!B§.encode(param1,_loc3_.seconds);
         this.§&!I§.encode(param1,_loc3_.year);
      }
   }
}

