package platform.client.core.general.spaces.osgi
{
   import Renamed4090.Renamed4091;
   import Renamed4090.Renamed4092;
   import Renamed4090.Renamed4093;
   import Renamed4090.Renamed4094;
   import alternativa.osgi.OSGi;
   import alternativa.osgi.bundle.IBundleActivator;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.codec.OptionalCodecDecorator;
   import alternativa.protocol.info.CollectionCodecInfo;
   import alternativa.protocol.info.TypeCodecInfo;
   import alternativa.types.Long;
   import platform.client.core.general.spaces.loading.dispatcher.types.ObjectsData;
   import platform.client.core.general.spaces.loading.dispatcher.types.ObjectsDependencies;
   import platform.client.core.general.spaces.loading.modelconstructors.ModelData;
   import platform.client.fp10.core.registry.ModelRegistry;
   import Renamed434.Renamed4095;
   import Renamed434.Renamed4096;
   
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
         var _loc3_:ModelRegistry = ModelRegistry(OSGi.getInstance().getService(ModelRegistry));
         _loc3_.register(Long.getLong(191355032,163351191),Long.getLong(748816660,1488436371));
         _loc3_.register(Long.getLong(191355032,163351191),Long.getLong(1779039460,1862164506));
         _loc3_.register(Long.getLong(191355032,163351191),Long.getLong(2104499555,54326167));
         var _loc4_:IProtocol = IProtocol(osgi.getService(IProtocol));
         _loc2_ = new Renamed4091();
         _loc4_.registerCodec(new TypeCodecInfo(ObjectsData,false),_loc2_);
         _loc4_.registerCodec(new TypeCodecInfo(ObjectsData,true),new OptionalCodecDecorator(_loc2_));
         _loc2_ = new Renamed4092();
         _loc4_.registerCodec(new TypeCodecInfo(ObjectsDependencies,false),_loc2_);
         _loc4_.registerCodec(new TypeCodecInfo(ObjectsDependencies,true),new OptionalCodecDecorator(_loc2_));
         _loc2_ = new Renamed4095();
         _loc4_.registerCodec(new TypeCodecInfo(ModelData,false),_loc2_);
         _loc4_.registerCodec(new TypeCodecInfo(ModelData,true),new OptionalCodecDecorator(_loc2_));
         _loc2_ = new Renamed4093(false);
         _loc4_.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(ObjectsData,false),false,1),_loc2_);
         _loc4_.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(ObjectsData,false),true,1),new OptionalCodecDecorator(_loc2_));
         _loc2_ = new Renamed4093(true);
         _loc4_.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(ObjectsData,true),false,1),_loc2_);
         _loc4_.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(ObjectsData,true),true,1),new OptionalCodecDecorator(_loc2_));
         _loc2_ = new Renamed4094(false);
         _loc4_.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(ObjectsDependencies,false),false,1),_loc2_);
         _loc4_.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(ObjectsDependencies,false),true,1),new OptionalCodecDecorator(_loc2_));
         _loc2_ = new Renamed4094(true);
         _loc4_.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(ObjectsDependencies,true),false,1),_loc2_);
         _loc4_.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(ObjectsDependencies,true),true,1),new OptionalCodecDecorator(_loc2_));
         _loc2_ = new Renamed4096(false);
         _loc4_.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(ModelData,false),false,1),_loc2_);
         _loc4_.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(ModelData,false),true,1),new OptionalCodecDecorator(_loc2_));
         _loc2_ = new Renamed4096(true);
         _loc4_.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(ModelData,true),false,1),_loc2_);
         _loc4_.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(ModelData,true),true,1),new OptionalCodecDecorator(_loc2_));
      }
      
      public function stop(param1:OSGi) : void
      {
      }
   }
}

