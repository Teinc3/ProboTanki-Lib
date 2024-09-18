package Renamed4090
{
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.clientlog.IClientLog;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.protocol.info.CollectionCodecInfo;
   import alternativa.protocol.info.TypeCodecInfo;
   import platform.client.core.general.spaces.loading.dispatcher.types.ObjectsDependencies;
   import platform.client.fp10.core.resource.Resource;
   
   public class Renamed4092 implements ICodec
   {
      public static var log:IClientLog = IClientLog(OSGi.getInstance().getService(IClientLog));
      
      private var Renamed6813:ICodec;
      
      private var Renamed6814:ICodec;
      
      public function Renamed4092()
      {
         super();
      }
      
      public function init(param1:IProtocol) : void
      {
         this.Renamed6813 = param1.getCodec(new TypeCodecInfo(int,false));
         this.Renamed6814 = param1.getCodec(new CollectionCodecInfo(new TypeCodecInfo(Resource,false),false,1));
      }
      
      public function decode(param1:ProtocolBuffer) : Object
      {
         var _loc2_:ObjectsDependencies = new ObjectsDependencies();
         _loc2_.callbackId = this.Renamed6813.decode(param1) as int;
         _loc2_.resources = this.Renamed6814.decode(param1) as Vector.<Resource>;
         return _loc2_;
      }
      
      public function encode(param1:ProtocolBuffer, param2:Object) : void
      {
         if(param2 == null)
         {
            throw new Error("Object is null. Use @ProtocolOptional annotation.");
         }
         var _loc3_:ObjectsDependencies = ObjectsDependencies(param2);
         this.Renamed6813.encode(param1,_loc3_.callbackId);
         this.Renamed6814.encode(param1,_loc3_.resources);
      }
   }
}

