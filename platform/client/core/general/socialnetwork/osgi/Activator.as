package platform.client.core.general.socialnetwork.osgi
{
   import §7!7§.§break const import§;
   import §7!7§.§continue var false§;
   import §9!J§.§3"D§;
   import §["1§.§%!z§;
   import §["1§.§45§;
   import §["1§.§^"8§;
   import §["1§.§include package super§;
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
         _loc2_ = new §break const import§();
         _loc3_.registerCodec(new TypeCodecInfo(SocialNetworkParametersCC,false),_loc2_);
         _loc3_.registerCodec(new TypeCodecInfo(SocialNetworkParametersCC,true),new OptionalCodecDecorator(_loc2_));
         _loc2_ = new §%!z§();
         _loc3_.registerCodec(new EnumCodecInfo(Gender,false),_loc2_);
         _loc3_.registerCodec(new EnumCodecInfo(Gender,true),new OptionalCodecDecorator(_loc2_));
         _loc2_ = new §45§();
         _loc3_.registerCodec(new TypeCodecInfo(LoginParameters,false),_loc2_);
         _loc3_.registerCodec(new TypeCodecInfo(LoginParameters,true),new OptionalCodecDecorator(_loc2_));
         _loc2_ = new §3"D§(false,false);
         _loc3_.registerCodec(new MapCodecInfo(new TypeCodecInfo(String,false),new TypeCodecInfo(String,false),false),_loc2_);
         _loc3_.registerCodec(new MapCodecInfo(new TypeCodecInfo(String,false),new TypeCodecInfo(String,false),true),new OptionalCodecDecorator(_loc2_));
         _loc2_ = new §continue var false§(false);
         _loc3_.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(SocialNetworkParametersCC,false),false,1),_loc2_);
         _loc3_.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(SocialNetworkParametersCC,false),true,1),new OptionalCodecDecorator(_loc2_));
         _loc2_ = new §continue var false§(true);
         _loc3_.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(SocialNetworkParametersCC,true),false,1),_loc2_);
         _loc3_.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(SocialNetworkParametersCC,true),true,1),new OptionalCodecDecorator(_loc2_));
         _loc2_ = new §include package super§(false);
         _loc3_.registerCodec(new CollectionCodecInfo(new EnumCodecInfo(Gender,false),false,1),_loc2_);
         _loc3_.registerCodec(new CollectionCodecInfo(new EnumCodecInfo(Gender,false),true,1),new OptionalCodecDecorator(_loc2_));
         _loc2_ = new §include package super§(true);
         _loc3_.registerCodec(new CollectionCodecInfo(new EnumCodecInfo(Gender,true),false,1),_loc2_);
         _loc3_.registerCodec(new CollectionCodecInfo(new EnumCodecInfo(Gender,true),true,1),new OptionalCodecDecorator(_loc2_));
         _loc2_ = new §^"8§(false);
         _loc3_.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(LoginParameters,false),false,1),_loc2_);
         _loc3_.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(LoginParameters,false),true,1),new OptionalCodecDecorator(_loc2_));
         _loc2_ = new §^"8§(true);
         _loc3_.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(LoginParameters,true),false,1),_loc2_);
         _loc3_.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(LoginParameters,true),true,1),new OptionalCodecDecorator(_loc2_));
      }
      
      public function stop(param1:OSGi) : void
      {
      }
   }
}

