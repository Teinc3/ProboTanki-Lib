package platform.client.core.general.resource.osgi
{
   import Renamed283.Renamed4054;
   import Renamed283.Renamed4055;
   import alternativa.osgi.OSGi;
   import alternativa.osgi.bundle.IBundleActivator;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.codec.OptionalCodecDecorator;
   import alternativa.protocol.info.CollectionCodecInfo;
   import alternativa.protocol.info.TypeCodecInfo;
   import platform.core.general.resource.types.imageframe.ResourceImageFrameParams;
   
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
         _loc2_ = new Renamed4054();
         _loc3_.registerCodec(new TypeCodecInfo(ResourceImageFrameParams,false),_loc2_);
         _loc3_.registerCodec(new TypeCodecInfo(ResourceImageFrameParams,true),new OptionalCodecDecorator(_loc2_));
         _loc2_ = new Renamed4055(false);
         _loc3_.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(ResourceImageFrameParams,false),false,1),_loc2_);
         _loc3_.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(ResourceImageFrameParams,false),true,1),new OptionalCodecDecorator(_loc2_));
         _loc2_ = new Renamed4055(true);
         _loc3_.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(ResourceImageFrameParams,true),false,1),_loc2_);
         _loc3_.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(ResourceImageFrameParams,true),true,1),new OptionalCodecDecorator(_loc2_));
      }
      
      public function stop(param1:OSGi) : void
      {
      }
   }
}

