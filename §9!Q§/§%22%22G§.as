package §9!Q§
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
   
   public class §""G§ implements ICodec
   {
      public static var log:IClientLog = IClientLog(OSGi.getInstance().getService(IClientLog));
      
      private var §while set implements§:ICodec;
      
      private var §'#^§:ICodec;
      
      private var §4!c§:ICodec;
      
      private var §>T§:ICodec;
      
      public function §""G§()
      {
         super();
      }
      
      public function init(param1:IProtocol) : void
      {
         this.§while set implements§ = param1.getCodec(new TypeCodecInfo(Float,false));
         this.§'#^§ = param1.getCodec(new TypeCodecInfo(int,false));
         this.§4!c§ = param1.getCodec(new TypeCodecInfo(int,false));
         this.§>T§ = param1.getCodec(new TypeCodecInfo(Short,false));
      }
      
      public function decode(param1:ProtocolBuffer) : Object
      {
         var _loc2_:ResourceImageFrameParams = new ResourceImageFrameParams();
         _loc2_.fps = this.§while set implements§.decode(param1) as Number;
         _loc2_.frameHeight = this.§'#^§.decode(param1) as int;
         _loc2_.frameWidth = this.§4!c§.decode(param1) as int;
         _loc2_.numFrames = this.§>T§.decode(param1) as int;
         return _loc2_;
      }
      
      public function encode(param1:ProtocolBuffer, param2:Object) : void
      {
         if(param2 == null)
         {
            throw new Error("Object is null. Use @ProtocolOptional annotation.");
         }
         var _loc3_:ResourceImageFrameParams = ResourceImageFrameParams(param2);
         this.§while set implements§.encode(param1,_loc3_.fps);
         this.§'#^§.encode(param1,_loc3_.frameHeight);
         this.§4!c§.encode(param1,_loc3_.frameWidth);
         this.§>T§.encode(param1,_loc3_.numFrames);
      }
   }
}

