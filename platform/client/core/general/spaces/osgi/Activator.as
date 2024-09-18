package platform.client.core.general.spaces.osgi
{
   import §6"r§.§9O§;
   import §6"r§.§>o§;
   import §6"r§.§final catch final§;
   import §6"r§.§if for finally§;
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
   import §switch var set§.§4!G§;
   import §switch var set§.§return set set§;
   
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
         _loc2_ = new §9O§();
         _loc4_.registerCodec(new TypeCodecInfo(ObjectsData,false),_loc2_);
         _loc4_.registerCodec(new TypeCodecInfo(ObjectsData,true),new OptionalCodecDecorator(_loc2_));
         _loc2_ = new §>o§();
         _loc4_.registerCodec(new TypeCodecInfo(ObjectsDependencies,false),_loc2_);
         _loc4_.registerCodec(new TypeCodecInfo(ObjectsDependencies,true),new OptionalCodecDecorator(_loc2_));
         _loc2_ = new §4!G§();
         _loc4_.registerCodec(new TypeCodecInfo(ModelData,false),_loc2_);
         _loc4_.registerCodec(new TypeCodecInfo(ModelData,true),new OptionalCodecDecorator(_loc2_));
         _loc2_ = new §final catch final§(false);
         _loc4_.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(ObjectsData,false),false,1),_loc2_);
         _loc4_.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(ObjectsData,false),true,1),new OptionalCodecDecorator(_loc2_));
         _loc2_ = new §final catch final§(true);
         _loc4_.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(ObjectsData,true),false,1),_loc2_);
         _loc4_.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(ObjectsData,true),true,1),new OptionalCodecDecorator(_loc2_));
         _loc2_ = new §if for finally§(false);
         _loc4_.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(ObjectsDependencies,false),false,1),_loc2_);
         _loc4_.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(ObjectsDependencies,false),true,1),new OptionalCodecDecorator(_loc2_));
         _loc2_ = new §if for finally§(true);
         _loc4_.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(ObjectsDependencies,true),false,1),_loc2_);
         _loc4_.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(ObjectsDependencies,true),true,1),new OptionalCodecDecorator(_loc2_));
         _loc2_ = new §return set set§(false);
         _loc4_.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(ModelData,false),false,1),_loc2_);
         _loc4_.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(ModelData,false),true,1),new OptionalCodecDecorator(_loc2_));
         _loc2_ = new §return set set§(true);
         _loc4_.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(ModelData,true),false,1),_loc2_);
         _loc4_.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(ModelData,true),true,1),new OptionalCodecDecorator(_loc2_));
      }
      
      public function stop(param1:OSGi) : void
      {
      }
   }
}

