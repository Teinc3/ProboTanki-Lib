package Renamed283
{
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.clientlog.IClientLog;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.protocol.info.TypeCodecInfo;
   import alternativa.types.Float;
   import alternativa.types.Short;
   import platform.core.general.resource.types.imageframe.ResourceImageFrameParams;
   
   public class Renamed4054 implements ICodec
   {
      public static var log:IClientLog = IClientLog(OSGi.getInstance().getService(IClientLog));
      
      private var Renamed7210:ICodec;
      
      private var Renamed7211:ICodec;
      
      private var Renamed7212:ICodec;
      
      private var Renamed7213:ICodec;
      
      public function Renamed4054()
      {
         super();
      }
      
      public function init(param1:IProtocol) : void
      {
         this.Renamed7210 = param1.getCodec(new TypeCodecInfo(Float,false));
         this.Renamed7211 = param1.getCodec(new TypeCodecInfo(int,false));
         this.Renamed7212 = param1.getCodec(new TypeCodecInfo(int,false));
         this.Renamed7213 = param1.getCodec(new TypeCodecInfo(Short,false));
      }
      
      public function decode(param1:ProtocolBuffer) : Object
      {
         var _loc2_:ResourceImageFrameParams = new ResourceImageFrameParams();
         _loc2_.fps = this.Renamed7210.decode(param1) as Number;
         _loc2_.frameHeight = this.Renamed7211.decode(param1) as int;
         _loc2_.frameWidth = this.Renamed7212.decode(param1) as int;
         _loc2_.numFrames = this.Renamed7213.decode(param1) as int;
         return _loc2_;
      }
      
      public function encode(param1:ProtocolBuffer, param2:Object) : void
      {
         if(param2 == null)
         {
            throw new Error("Object is null. Use @ProtocolOptional annotation.");
         }
         var _loc3_:ResourceImageFrameParams = ResourceImageFrameParams(param2);
         this.Renamed7210.encode(param1,_loc3_.fps);
         this.Renamed7211.encode(param1,_loc3_.frameHeight);
         this.Renamed7212.encode(param1,_loc3_.frameWidth);
         this.Renamed7213.encode(param1,_loc3_.numFrames);
      }
   }
}

