package Renamed434
{
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.clientlog.IClientLog;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.protocol.info.TypeCodecInfo;
   import alternativa.types.Long;
   import platform.client.core.general.spaces.loading.modelconstructors.ModelData;
   
   public class Renamed4095 implements ICodec
   {
      public static var log:IClientLog = IClientLog(OSGi.getInstance().getService(IClientLog));
      
      private var Renamed8879:ICodec;
      
      private var Renamed8880:ICodec;
      
      public function Renamed4095()
      {
         super();
      }
      
      public function init(param1:IProtocol) : void
      {
         this.Renamed8879 = param1.getCodec(new TypeCodecInfo(Object,false));
         this.Renamed8880 = param1.getCodec(new TypeCodecInfo(Long,false));
      }
      
      public function decode(param1:ProtocolBuffer) : Object
      {
         var _loc2_:ModelData = new ModelData();
         _loc2_.data = this.Renamed8879.decode(param1) as Object;
         _loc2_.id = this.Renamed8880.decode(param1) as Long;
         return _loc2_;
      }
      
      public function encode(param1:ProtocolBuffer, param2:Object) : void
      {
         if(param2 == null)
         {
            throw new Error("Object is null. Use @ProtocolOptional annotation.");
         }
         var _loc3_:ModelData = ModelData(param2);
         this.Renamed8879.encode(param1,_loc3_.data);
         this.Renamed8880.encode(param1,_loc3_.id);
      }
   }
}

