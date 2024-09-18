package §3!t§
{
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.clientlog.IClientLog;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.protocol.info.CollectionCodecInfo;
   import alternativa.protocol.info.TypeCodecInfo;
   import platform.client.core.general.resourcelocale.format.§8!W§;
   import platform.client.core.general.resourcelocale.format.§?[§;
   import platform.client.core.general.resourcelocale.format.ImagePair;
   import platform.client.core.general.resourcelocale.format.LocalizedFileFormat;
   import platform.client.core.general.resourcelocale.format.StringPair;
   import platform.client.core.general.resourcelocale.format.§default set case§;
   import platform.client.core.general.resourcelocale.format.§super const function§;
   
   public class §@I§ implements ICodec
   {
      public static var log:IClientLog = IClientLog(OSGi.getInstance().getService(IClientLog));
      
      private var §include var do§:ICodec;
      
      private var §extends for while§:ICodec;
      
      private var §-!$§:ICodec;
      
      private var §,"L§:ICodec;
      
      private var §switch for package§:ICodec;
      
      private var §native for with§:ICodec;
      
      private var §'"J§:ICodec;
      
      public function §@I§()
      {
         super();
      }
      
      public function init(param1:IProtocol) : void
      {
         this.§include var do§ = param1.getCodec(new CollectionCodecInfo(new TypeCodecInfo(§default set case§,false),false,1));
         this.§extends for while§ = param1.getCodec(new CollectionCodecInfo(new TypeCodecInfo(§?[§,false),false,1));
         this.§-!$§ = param1.getCodec(new CollectionCodecInfo(new TypeCodecInfo(ImagePair,false),false,1));
         this.§,"L§ = param1.getCodec(new CollectionCodecInfo(new TypeCodecInfo(§8!W§,false),false,1));
         this.§switch for package§ = param1.getCodec(new CollectionCodecInfo(new TypeCodecInfo(§super const function§,false),false,1));
         this.§native for with§ = param1.getCodec(new TypeCodecInfo(String,false));
         this.§'"J§ = param1.getCodec(new CollectionCodecInfo(new TypeCodecInfo(StringPair,false),false,1));
      }
      
      public function decode(param1:ProtocolBuffer) : Object
      {
         var _loc2_:LocalizedFileFormat = new LocalizedFileFormat();
         _loc2_.booleans = this.§include var do§.decode(param1) as Vector.<§default set case§>;
         _loc2_.§]"O§ = this.§extends for while§.decode(param1) as Vector.<§?[§>;
         _loc2_.images = this.§-!$§.decode(param1) as Vector.<ImagePair>;
         _loc2_.ints = this.§,"L§.decode(param1) as Vector.<§8!W§>;
         _loc2_.movies = this.§switch for package§.decode(param1) as Vector.<§super const function§>;
         _loc2_.§get package while§ = this.§native for with§.decode(param1) as String;
         _loc2_.strings = this.§'"J§.decode(param1) as Vector.<StringPair>;
         return _loc2_;
      }
      
      public function encode(param1:ProtocolBuffer, param2:Object) : void
      {
         if(param2 == null)
         {
            throw new Error("Object is null. Use @ProtocolOptional annotation.");
         }
         var _loc3_:LocalizedFileFormat = LocalizedFileFormat(param2);
         this.§include var do§.encode(param1,_loc3_.booleans);
         this.§extends for while§.encode(param1,_loc3_.§]"O§);
         this.§-!$§.encode(param1,_loc3_.images);
         this.§,"L§.encode(param1,_loc3_.ints);
         this.§switch for package§.encode(param1,_loc3_.movies);
         this.§native for with§.encode(param1,_loc3_.§get package while§);
         this.§'"J§.encode(param1,_loc3_.strings);
      }
   }
}

