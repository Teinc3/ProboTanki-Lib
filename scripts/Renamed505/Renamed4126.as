package Renamed505
{
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.clientlog.IClientLog;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.protocol.info.TypeCodecInfo;
   import platform.client.models.commons.description.DescriptionModelCC;
   
   public class Renamed4126 implements ICodec
   {
      public static var log:IClientLog = IClientLog(OSGi.getInstance().getService(IClientLog));
      
      private var Renamed10014:ICodec;
      
      private var Renamed10015:ICodec;
      
      public function Renamed4126()
      {
         super();
      }
      
      public function init(param1:IProtocol) : void
      {
         this.Renamed10014 = param1.getCodec(new TypeCodecInfo(String,true));
         this.Renamed10015 = param1.getCodec(new TypeCodecInfo(String,true));
      }
      
      public function decode(param1:ProtocolBuffer) : Object
      {
         var _loc2_:DescriptionModelCC = new DescriptionModelCC();
         _loc2_.description = this.Renamed10014.decode(param1) as String;
         _loc2_.name = this.Renamed10015.decode(param1) as String;
         return _loc2_;
      }
      
      public function encode(param1:ProtocolBuffer, param2:Object) : void
      {
         if(param2 == null)
         {
            throw new Error("Object is null. Use @ProtocolOptional annotation.");
         }
         var _loc3_:DescriptionModelCC = DescriptionModelCC(param2);
         this.Renamed10014.encode(param1,_loc3_.description);
         this.Renamed10015.encode(param1,_loc3_.name);
      }
   }
}

