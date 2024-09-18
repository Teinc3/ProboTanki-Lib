package platform.client.core.general.resourcelocale.osgi
{
   import §3!t§.§-§;
   import §3!t§.§9Q§;
   import §3!t§.§;#R§;
   import §3!t§.§@I§;
   import §3!t§.CodecImagePair;
   import §3!t§.CodecStringPair;
   import §3!t§.§const catch class§;
   import §3!t§.§default const const§;
   import §3!t§.§dynamic set in§;
   import §3!t§.§each package var§;
   import §3!t§.§if var true§;
   import §3!t§.§native var in§;
   import §3!t§.§override var while§;
   import §3!t§.§var for package§;
   import alternativa.osgi.OSGi;
   import alternativa.osgi.bundle.IBundleActivator;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.codec.OptionalCodecDecorator;
   import alternativa.protocol.info.CollectionCodecInfo;
   import alternativa.protocol.info.TypeCodecInfo;
   import platform.client.core.general.resourcelocale.format.§8!W§;
   import platform.client.core.general.resourcelocale.format.§?[§;
   import platform.client.core.general.resourcelocale.format.ImagePair;
   import platform.client.core.general.resourcelocale.format.LocalizedFileFormat;
   import platform.client.core.general.resourcelocale.format.StringPair;
   import platform.client.core.general.resourcelocale.format.§default set case§;
   import platform.client.core.general.resourcelocale.format.§super const function§;
   
   public class Activator implements IBundleActivator
   {
      public static var osgi:OSGi;
      
      public function Activator()
      {
         super();
      }
      
      public function start(param1:OSGi) : void
      {
         var _loc2_:ICodec = null;
         osgi = param1;
         var _loc3_:IProtocol = IProtocol(osgi.getService(IProtocol));
         _loc2_ = new CodecImagePair();
         _loc3_.registerCodec(new TypeCodecInfo(ImagePair,false),_loc2_);
         _loc3_.registerCodec(new TypeCodecInfo(ImagePair,true),new OptionalCodecDecorator(_loc2_));
         _loc2_ = new §native var in§();
         _loc3_.registerCodec(new TypeCodecInfo(§super const function§,false),_loc2_);
         _loc3_.registerCodec(new TypeCodecInfo(§super const function§,true),new OptionalCodecDecorator(_loc2_));
         _loc2_ = new §@I§();
         _loc3_.registerCodec(new TypeCodecInfo(LocalizedFileFormat,false),_loc2_);
         _loc3_.registerCodec(new TypeCodecInfo(LocalizedFileFormat,true),new OptionalCodecDecorator(_loc2_));
         _loc2_ = new CodecStringPair();
         _loc3_.registerCodec(new TypeCodecInfo(StringPair,false),_loc2_);
         _loc3_.registerCodec(new TypeCodecInfo(StringPair,true),new OptionalCodecDecorator(_loc2_));
         _loc2_ = new §dynamic set in§();
         _loc3_.registerCodec(new TypeCodecInfo(§?[§,false),_loc2_);
         _loc3_.registerCodec(new TypeCodecInfo(§?[§,true),new OptionalCodecDecorator(_loc2_));
         _loc2_ = new §default const const§();
         _loc3_.registerCodec(new TypeCodecInfo(§8!W§,false),_loc2_);
         _loc3_.registerCodec(new TypeCodecInfo(§8!W§,true),new OptionalCodecDecorator(_loc2_));
         _loc2_ = new §const catch class§();
         _loc3_.registerCodec(new TypeCodecInfo(§default set case§,false),_loc2_);
         _loc3_.registerCodec(new TypeCodecInfo(§default set case§,true),new OptionalCodecDecorator(_loc2_));
         _loc2_ = new §var for package§(false);
         _loc3_.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(ImagePair,false),false,1),_loc2_);
         _loc3_.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(ImagePair,false),true,1),new OptionalCodecDecorator(_loc2_));
         _loc2_ = new §var for package§(true);
         _loc3_.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(ImagePair,true),false,1),_loc2_);
         _loc3_.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(ImagePair,true),true,1),new OptionalCodecDecorator(_loc2_));
         _loc2_ = new §override var while§(false);
         _loc3_.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(LocalizedFileFormat,false),false,1),_loc2_);
         _loc3_.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(LocalizedFileFormat,false),true,1),new OptionalCodecDecorator(_loc2_));
         _loc2_ = new §override var while§(true);
         _loc3_.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(LocalizedFileFormat,true),false,1),_loc2_);
         _loc3_.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(LocalizedFileFormat,true),true,1),new OptionalCodecDecorator(_loc2_));
         _loc2_ = new §if var true§(false);
         _loc3_.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(StringPair,false),false,1),_loc2_);
         _loc3_.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(StringPair,false),true,1),new OptionalCodecDecorator(_loc2_));
         _loc2_ = new §if var true§(true);
         _loc3_.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(StringPair,true),false,1),_loc2_);
         _loc3_.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(StringPair,true),true,1),new OptionalCodecDecorator(_loc2_));
         _loc2_ = new §each package var§(false);
         _loc3_.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(§super const function§,false),false,1),_loc2_);
         _loc3_.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(§super const function§,false),true,1),new OptionalCodecDecorator(_loc2_));
         _loc2_ = new §each package var§(true);
         _loc3_.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(§super const function§,true),false,1),_loc2_);
         _loc3_.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(§super const function§,true),true,1),new OptionalCodecDecorator(_loc2_));
         _loc2_ = new §-#5§(false);
         _loc3_.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(§8!W§,false),false,1),_loc2_);
         _loc3_.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(§8!W§,false),true,1),new OptionalCodecDecorator(_loc2_));
         _loc2_ = new §-#5§(true);
         _loc3_.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(§8!W§,true),false,1),_loc2_);
         _loc3_.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(§8!W§,true),true,1),new OptionalCodecDecorator(_loc2_));
         _loc2_ = new §;#R§(false);
         _loc3_.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(§default set case§,false),false,1),_loc2_);
         _loc3_.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(§default set case§,false),true,1),new OptionalCodecDecorator(_loc2_));
         _loc2_ = new §;#R§(true);
         _loc3_.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(§default set case§,true),false,1),_loc2_);
         _loc3_.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(§default set case§,true),true,1),new OptionalCodecDecorator(_loc2_));
         _loc2_ = new §9Q§(false);
         _loc3_.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(§?[§,false),false,1),_loc2_);
         _loc3_.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(§?[§,false),true,1),new OptionalCodecDecorator(_loc2_));
         _loc2_ = new §9Q§(true);
         _loc3_.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(§?[§,true),false,1),_loc2_);
         _loc3_.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(§?[§,true),true,1),new OptionalCodecDecorator(_loc2_));
      }
      
      public function stop(param1:OSGi) : void
      {
      }
   }
}

