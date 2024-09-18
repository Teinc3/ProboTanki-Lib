package platform.client.core.general.resourcelocale.osgi
{
   import Renamed238.Renamed4068;
   import Renamed238.Renamed4069;
   import Renamed238.Renamed4070;
   import Renamed238.Renamed4071;
   import Renamed238.CodecImagePair;
   import Renamed238.CodecStringPair;
   import Renamed238.Renamed4072;
   import Renamed238.Renamed4073;
   import Renamed238.Renamed4074;
   import Renamed238.Renamed4075;
   import Renamed238.Renamed4076;
   import Renamed238.Renamed4077;
   import Renamed238.Renamed4078;
   import Renamed238.Renamed4079;
   import alternativa.osgi.OSGi;
   import alternativa.osgi.bundle.IBundleActivator;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.codec.OptionalCodecDecorator;
   import alternativa.protocol.info.CollectionCodecInfo;
   import alternativa.protocol.info.TypeCodecInfo;
   import platform.client.core.general.resourcelocale.format.Renamed4061;
   import platform.client.core.general.resourcelocale.format.Renamed4059;
   import platform.client.core.general.resourcelocale.format.ImagePair;
   import platform.client.core.general.resourcelocale.format.LocalizedFileFormat;
   import platform.client.core.general.resourcelocale.format.StringPair;
   import platform.client.core.general.resourcelocale.format.Renamed4057;
   import platform.client.core.general.resourcelocale.format.Renamed4063;
   
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
         _loc2_ = new Renamed4077();
         _loc3_.registerCodec(new TypeCodecInfo(Renamed4063,false),_loc2_);
         _loc3_.registerCodec(new TypeCodecInfo(Renamed4063,true),new OptionalCodecDecorator(_loc2_));
         _loc2_ = new Renamed4071();
         _loc3_.registerCodec(new TypeCodecInfo(LocalizedFileFormat,false),_loc2_);
         _loc3_.registerCodec(new TypeCodecInfo(LocalizedFileFormat,true),new OptionalCodecDecorator(_loc2_));
         _loc2_ = new CodecStringPair();
         _loc3_.registerCodec(new TypeCodecInfo(StringPair,false),_loc2_);
         _loc3_.registerCodec(new TypeCodecInfo(StringPair,true),new OptionalCodecDecorator(_loc2_));
         _loc2_ = new Renamed4074();
         _loc3_.registerCodec(new TypeCodecInfo(Renamed4059,false),_loc2_);
         _loc3_.registerCodec(new TypeCodecInfo(Renamed4059,true),new OptionalCodecDecorator(_loc2_));
         _loc2_ = new Renamed4073();
         _loc3_.registerCodec(new TypeCodecInfo(Renamed4061,false),_loc2_);
         _loc3_.registerCodec(new TypeCodecInfo(Renamed4061,true),new OptionalCodecDecorator(_loc2_));
         _loc2_ = new Renamed4072();
         _loc3_.registerCodec(new TypeCodecInfo(Renamed4057,false),_loc2_);
         _loc3_.registerCodec(new TypeCodecInfo(Renamed4057,true),new OptionalCodecDecorator(_loc2_));
         _loc2_ = new Renamed4079(false);
         _loc3_.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(ImagePair,false),false,1),_loc2_);
         _loc3_.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(ImagePair,false),true,1),new OptionalCodecDecorator(_loc2_));
         _loc2_ = new Renamed4079(true);
         _loc3_.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(ImagePair,true),false,1),_loc2_);
         _loc3_.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(ImagePair,true),true,1),new OptionalCodecDecorator(_loc2_));
         _loc2_ = new Renamed4078(false);
         _loc3_.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(LocalizedFileFormat,false),false,1),_loc2_);
         _loc3_.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(LocalizedFileFormat,false),true,1),new OptionalCodecDecorator(_loc2_));
         _loc2_ = new Renamed4078(true);
         _loc3_.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(LocalizedFileFormat,true),false,1),_loc2_);
         _loc3_.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(LocalizedFileFormat,true),true,1),new OptionalCodecDecorator(_loc2_));
         _loc2_ = new Renamed4076(false);
         _loc3_.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(StringPair,false),false,1),_loc2_);
         _loc3_.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(StringPair,false),true,1),new OptionalCodecDecorator(_loc2_));
         _loc2_ = new Renamed4076(true);
         _loc3_.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(StringPair,true),false,1),_loc2_);
         _loc3_.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(StringPair,true),true,1),new OptionalCodecDecorator(_loc2_));
         _loc2_ = new Renamed4075(false);
         _loc3_.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(Renamed4063,false),false,1),_loc2_);
         _loc3_.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(Renamed4063,false),true,1),new OptionalCodecDecorator(_loc2_));
         _loc2_ = new Renamed4075(true);
         _loc3_.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(Renamed4063,true),false,1),_loc2_);
         _loc3_.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(Renamed4063,true),true,1),new OptionalCodecDecorator(_loc2_));
         _loc2_ = new Renamed4080(false);
         _loc3_.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(Renamed4061,false),false,1),_loc2_);
         _loc3_.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(Renamed4061,false),true,1),new OptionalCodecDecorator(_loc2_));
         _loc2_ = new Renamed4080(true);
         _loc3_.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(Renamed4061,true),false,1),_loc2_);
         _loc3_.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(Renamed4061,true),true,1),new OptionalCodecDecorator(_loc2_));
         _loc2_ = new Renamed4070(false);
         _loc3_.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(Renamed4057,false),false,1),_loc2_);
         _loc3_.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(Renamed4057,false),true,1),new OptionalCodecDecorator(_loc2_));
         _loc2_ = new Renamed4070(true);
         _loc3_.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(Renamed4057,true),false,1),_loc2_);
         _loc3_.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(Renamed4057,true),true,1),new OptionalCodecDecorator(_loc2_));
         _loc2_ = new Renamed4069(false);
         _loc3_.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(Renamed4059,false),false,1),_loc2_);
         _loc3_.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(Renamed4059,false),true,1),new OptionalCodecDecorator(_loc2_));
         _loc2_ = new Renamed4069(true);
         _loc3_.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(Renamed4059,true),false,1),_loc2_);
         _loc3_.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(Renamed4059,true),true,1),new OptionalCodecDecorator(_loc2_));
      }
      
      public function stop(param1:OSGi) : void
      {
      }
   }
}

