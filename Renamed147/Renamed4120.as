package Renamed147
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
   
   public class Renamed4120 implements ICodec
   {
      public static var log:IClientLog = IClientLog(OSGi.getInstance().getService(IClientLog));
      
      private var Renamed5003:ICodec;
      
      private var Renamed5004:ICodec;
      
      private var Renamed5005:ICodec;
      
      private var Renamed5006:ICodec;
      
      private var Renamed5007:ICodec;
      
      private var Renamed5008:ICodec;
      
      public function Renamed4120()
      {
         super();
      }
      
      public function init(param1:IProtocol) : void
      {
         this.Renamed5003 = param1.getCodec(new TypeCodecInfo(Byte,false));
         this.Renamed5004 = param1.getCodec(new TypeCodecInfo(Byte,false));
         this.Renamed5005 = param1.getCodec(new TypeCodecInfo(Byte,false));
         this.Renamed5006 = param1.getCodec(new TypeCodecInfo(Byte,false));
         this.Renamed5007 = param1.getCodec(new TypeCodecInfo(Byte,false));
         this.Renamed5008 = param1.getCodec(new TypeCodecInfo(Short,false));
      }
      
      public function decode(param1:ProtocolBuffer) : Object
      {
         var _loc2_:Timestamp = new Timestamp();
         _loc2_.day = this.Renamed5003.decode(param1) as int;
         _loc2_.hours = this.Renamed5004.decode(param1) as int;
         _loc2_.minutes = this.Renamed5005.decode(param1) as int;
         _loc2_.month = this.Renamed5006.decode(param1) as int;
         _loc2_.seconds = this.Renamed5007.decode(param1) as int;
         _loc2_.year = this.Renamed5008.decode(param1) as int;
         return _loc2_;
      }
      
      public function encode(param1:ProtocolBuffer, param2:Object) : void
      {
         if(param2 == null)
         {
            throw new Error("Object is null. Use @ProtocolOptional annotation.");
         }
         var _loc3_:Timestamp = Timestamp(param2);
         this.Renamed5003.encode(param1,_loc3_.day);
         this.Renamed5004.encode(param1,_loc3_.hours);
         this.Renamed5005.encode(param1,_loc3_.minutes);
         this.Renamed5006.encode(param1,_loc3_.month);
         this.Renamed5007.encode(param1,_loc3_.seconds);
         this.Renamed5008.encode(param1,_loc3_.year);
      }
   }
}

