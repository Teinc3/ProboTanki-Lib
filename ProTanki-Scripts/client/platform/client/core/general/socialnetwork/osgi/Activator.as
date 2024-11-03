package platform.client.core.general.socialnetwork.osgi
{
   import Renamed263.Renamed4081;
   import Renamed263.Renamed4082;
   import Renamed282.Renamed4083;
   import Renamed4084.Renamed4085;
   import Renamed4084.Renamed4086;
   import Renamed4084.Renamed4087;
   import Renamed4084.Renamed4088;
   import alternativa.osgi.OSGi;
   import alternativa.osgi.bundle.IBundleActivator;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.codec.OptionalCodecDecorator;
   import alternativa.protocol.info.CollectionCodecInfo;
   import alternativa.protocol.info.EnumCodecInfo;
   import alternativa.protocol.info.MapCodecInfo;
   import alternativa.protocol.info.TypeCodecInfo;
   import platform.client.core.general.socialnetwork.models.socialnetworkparameters.SocialNetworkParametersCC;
   import platform.client.core.general.socialnetwork.types.Gender;
   import platform.client.core.general.socialnetwork.types.LoginParameters;
   
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
         _loc2_ = new Renamed4081();
         _loc3_.registerCodec(new TypeCodecInfo(SocialNetworkParametersCC,false),_loc2_);
         _loc3_.registerCodec(new TypeCodecInfo(SocialNetworkParametersCC,true),new OptionalCodecDecorator(_loc2_));
         _loc2_ = new Renamed4085();
         _loc3_.registerCodec(new EnumCodecInfo(Gender,false),_loc2_);
         _loc3_.registerCodec(new EnumCodecInfo(Gender,true),new OptionalCodecDecorator(_loc2_));
         _loc2_ = new Renamed4086();
         _loc3_.registerCodec(new TypeCodecInfo(LoginParameters,false),_loc2_);
         _loc3_.registerCodec(new TypeCodecInfo(LoginParameters,true),new OptionalCodecDecorator(_loc2_));
         _loc2_ = new Renamed4083(false,false);
         _loc3_.registerCodec(new MapCodecInfo(new TypeCodecInfo(String,false),new TypeCodecInfo(String,false),false),_loc2_);
         _loc3_.registerCodec(new MapCodecInfo(new TypeCodecInfo(String,false),new TypeCodecInfo(String,false),true),new OptionalCodecDecorator(_loc2_));
         _loc2_ = new Renamed4082(false);
         _loc3_.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(SocialNetworkParametersCC,false),false,1),_loc2_);
         _loc3_.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(SocialNetworkParametersCC,false),true,1),new OptionalCodecDecorator(_loc2_));
         _loc2_ = new Renamed4082(true);
         _loc3_.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(SocialNetworkParametersCC,true),false,1),_loc2_);
         _loc3_.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(SocialNetworkParametersCC,true),true,1),new OptionalCodecDecorator(_loc2_));
         _loc2_ = new Renamed4088(false);
         _loc3_.registerCodec(new CollectionCodecInfo(new EnumCodecInfo(Gender,false),false,1),_loc2_);
         _loc3_.registerCodec(new CollectionCodecInfo(new EnumCodecInfo(Gender,false),true,1),new OptionalCodecDecorator(_loc2_));
         _loc2_ = new Renamed4088(true);
         _loc3_.registerCodec(new CollectionCodecInfo(new EnumCodecInfo(Gender,true),false,1),_loc2_);
         _loc3_.registerCodec(new CollectionCodecInfo(new EnumCodecInfo(Gender,true),true,1),new OptionalCodecDecorator(_loc2_));
         _loc2_ = new Renamed4087(false);
         _loc3_.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(LoginParameters,false),false,1),_loc2_);
         _loc3_.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(LoginParameters,false),true,1),new OptionalCodecDecorator(_loc2_));
         _loc2_ = new Renamed4087(true);
         _loc3_.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(LoginParameters,true),false,1),_loc2_);
         _loc3_.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(LoginParameters,true),true,1),new OptionalCodecDecorator(_loc2_));
      }
      
      public function stop(param1:OSGi) : void
      {
      }
   }
}

