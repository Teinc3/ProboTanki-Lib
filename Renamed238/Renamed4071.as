package Renamed238
{
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.clientlog.IClientLog;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.protocol.info.CollectionCodecInfo;
   import alternativa.protocol.info.TypeCodecInfo;
   import platform.client.core.general.resourcelocale.format.Renamed4061;
   import platform.client.core.general.resourcelocale.format.Renamed4059;
   import platform.client.core.general.resourcelocale.format.ImagePair;
   import platform.client.core.general.resourcelocale.format.LocalizedFileFormat;
   import platform.client.core.general.resourcelocale.format.StringPair;
   import platform.client.core.general.resourcelocale.format.Renamed4057;
   import platform.client.core.general.resourcelocale.format.Renamed4063;
   
   public class Renamed4071 implements ICodec
   {
      public static var log:IClientLog = IClientLog(OSGi.getInstance().getService(IClientLog));
      
      private var Renamed6551:ICodec;
      
      private var Renamed6552:ICodec;
      
      private var Renamed6553:ICodec;
      
      private var Renamed6554:ICodec;
      
      private var Renamed6555:ICodec;
      
      private var Renamed6556:ICodec;
      
      private var Renamed6557:ICodec;
      
      public function Renamed4071()
      {
         super();
      }
      
      public function init(param1:IProtocol) : void
      {
         this.Renamed6551 = param1.getCodec(new CollectionCodecInfo(new TypeCodecInfo(Renamed4057,false),false,1));
         this.Renamed6552 = param1.getCodec(new CollectionCodecInfo(new TypeCodecInfo(Renamed4059,false),false,1));
         this.Renamed6553 = param1.getCodec(new CollectionCodecInfo(new TypeCodecInfo(ImagePair,false),false,1));
         this.Renamed6554 = param1.getCodec(new CollectionCodecInfo(new TypeCodecInfo(Renamed4061,false),false,1));
         this.Renamed6555 = param1.getCodec(new CollectionCodecInfo(new TypeCodecInfo(Renamed4063,false),false,1));
         this.Renamed6556 = param1.getCodec(new TypeCodecInfo(String,false));
         this.Renamed6557 = param1.getCodec(new CollectionCodecInfo(new TypeCodecInfo(StringPair,false),false,1));
      }
      
      public function decode(param1:ProtocolBuffer) : Object
      {
         var _loc2_:LocalizedFileFormat = new LocalizedFileFormat();
         _loc2_.booleans = this.Renamed6551.decode(param1) as Vector.<Renamed4057>;
         _loc2_.Renamed4065 = this.Renamed6552.decode(param1) as Vector.<Renamed4059>;
         _loc2_.images = this.Renamed6553.decode(param1) as Vector.<ImagePair>;
         _loc2_.ints = this.Renamed6554.decode(param1) as Vector.<Renamed4061>;
         _loc2_.movies = this.Renamed6555.decode(param1) as Vector.<Renamed4063>;
         _loc2_.Renamed4066 = this.Renamed6556.decode(param1) as String;
         _loc2_.strings = this.Renamed6557.decode(param1) as Vector.<StringPair>;
         return _loc2_;
      }
      
      public function encode(param1:ProtocolBuffer, param2:Object) : void
      {
         if(param2 == null)
         {
            throw new Error("Object is null. Use @ProtocolOptional annotation.");
         }
         var _loc3_:LocalizedFileFormat = LocalizedFileFormat(param2);
         this.Renamed6551.encode(param1,_loc3_.booleans);
         this.Renamed6552.encode(param1,_loc3_.Renamed4065);
         this.Renamed6553.encode(param1,_loc3_.images);
         this.Renamed6554.encode(param1,_loc3_.ints);
         this.Renamed6555.encode(param1,_loc3_.movies);
         this.Renamed6556.encode(param1,_loc3_.Renamed4066);
         this.Renamed6557.encode(param1,_loc3_.strings);
      }
   }
}

