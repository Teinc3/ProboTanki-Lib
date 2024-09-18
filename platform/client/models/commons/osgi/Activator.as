package platform.client.models.commons.osgi
{
   import §##6§.§;!s§;
   import §##6§.CodecValidationStatus;
   import §##6§.§do var set§;
   import §##6§.§else use§;
   import §3#k§.§#"P§;
   import §3#k§.§in for break§;
   import §`_§.§else set const§;
   import §`_§.§package const native§;
   import alternativa.osgi.OSGi;
   import alternativa.osgi.bundle.IBundleActivator;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.codec.OptionalCodecDecorator;
   import alternativa.protocol.info.CollectionCodecInfo;
   import alternativa.protocol.info.EnumCodecInfo;
   import alternativa.protocol.info.TypeCodecInfo;
   import platform.client.models.commons.description.DescriptionModelCC;
   import platform.client.models.commons.periodtime.TimePeriodModelCC;
   import platform.client.models.commons.types.Timestamp;
   import platform.client.models.commons.types.ValidationStatus;
   
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
         _loc2_ = new §package const native§();
         _loc3_.registerCodec(new TypeCodecInfo(DescriptionModelCC,false),_loc2_);
         _loc3_.registerCodec(new TypeCodecInfo(DescriptionModelCC,true),new OptionalCodecDecorator(_loc2_));
         _loc2_ = new §#"P§();
         _loc3_.registerCodec(new TypeCodecInfo(TimePeriodModelCC,false),_loc2_);
         _loc3_.registerCodec(new TypeCodecInfo(TimePeriodModelCC,true),new OptionalCodecDecorator(_loc2_));
         _loc2_ = new §;!s§();
         _loc3_.registerCodec(new TypeCodecInfo(Timestamp,false),_loc2_);
         _loc3_.registerCodec(new TypeCodecInfo(Timestamp,true),new OptionalCodecDecorator(_loc2_));
         _loc2_ = new CodecValidationStatus();
         _loc3_.registerCodec(new EnumCodecInfo(ValidationStatus,false),_loc2_);
         _loc3_.registerCodec(new EnumCodecInfo(ValidationStatus,true),new OptionalCodecDecorator(_loc2_));
         _loc2_ = new §else set const§(false);
         _loc3_.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(DescriptionModelCC,false),false,1),_loc2_);
         _loc3_.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(DescriptionModelCC,false),true,1),new OptionalCodecDecorator(_loc2_));
         _loc2_ = new §else set const§(true);
         _loc3_.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(DescriptionModelCC,true),false,1),_loc2_);
         _loc3_.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(DescriptionModelCC,true),true,1),new OptionalCodecDecorator(_loc2_));
         _loc2_ = new §in for break§(false);
         _loc3_.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(TimePeriodModelCC,false),false,1),_loc2_);
         _loc3_.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(TimePeriodModelCC,false),true,1),new OptionalCodecDecorator(_loc2_));
         _loc2_ = new §in for break§(true);
         _loc3_.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(TimePeriodModelCC,true),false,1),_loc2_);
         _loc3_.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(TimePeriodModelCC,true),true,1),new OptionalCodecDecorator(_loc2_));
         _loc2_ = new §else use§(false);
         _loc3_.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(Timestamp,false),false,1),_loc2_);
         _loc3_.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(Timestamp,false),true,1),new OptionalCodecDecorator(_loc2_));
         _loc2_ = new §else use§(true);
         _loc3_.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(Timestamp,true),false,1),_loc2_);
         _loc3_.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(Timestamp,true),true,1),new OptionalCodecDecorator(_loc2_));
         _loc2_ = new §do var set§(false);
         _loc3_.registerCodec(new CollectionCodecInfo(new EnumCodecInfo(ValidationStatus,false),false,1),_loc2_);
         _loc3_.registerCodec(new CollectionCodecInfo(new EnumCodecInfo(ValidationStatus,false),true,1),new OptionalCodecDecorator(_loc2_));
         _loc2_ = new §do var set§(true);
         _loc3_.registerCodec(new CollectionCodecInfo(new EnumCodecInfo(ValidationStatus,true),false,1),_loc2_);
         _loc3_.registerCodec(new CollectionCodecInfo(new EnumCodecInfo(ValidationStatus,true),true,1),new OptionalCodecDecorator(_loc2_));
      }
      
      public function stop(param1:OSGi) : void
      {
      }
   }
}

