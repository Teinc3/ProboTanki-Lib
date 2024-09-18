package platform.clients.fp10.libraries.alternativaprotocolflash
{
   import §5"M§.§default package default§;
   import §5"M§.§return for static§;
   import §>"g§.§+!7§;
   import §>"g§.§9#$§;
   import §>"g§.§@r§;
   import §>"g§.§default package default§;
   import §>"g§.§else for dynamic§;
   import §>"g§.§return for static§;
   import alternativa.osgi.OSGi;
   import alternativa.osgi.bundle.IBundleActivator;
   import alternativa.osgi.service.clientlog.IClientLog;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.codec.OptionalCodecDecorator;
   import alternativa.protocol.impl.Protocol;
   import alternativa.protocol.info.CollectionCodecInfo;
   import alternativa.protocol.info.TypeCodecInfo;
   import alternativa.types.Byte;
   import alternativa.types.Float;
   import alternativa.types.Long;
   import alternativa.types.Short;
   import alternativa.types.UByte;
   import alternativa.types.UShort;
   
   public class Activator implements IBundleActivator
   {
      public static var osgi:OSGi;
      
      public function Activator()
      {
         super();
      }
      
      public function start(param1:OSGi) : void
      {
         var codec:ICodec = null;
         var _osgi:OSGi = param1;
         osgi = _osgi;
         var protocol:IProtocol = Protocol.defaultInstance;
         codec = new §else for dynamic§(false);
         protocol.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(String,false),false,1),codec);
         protocol.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(String,false),true,1),new OptionalCodecDecorator(codec));
         codec = new §else for dynamic§(true);
         protocol.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(String,true),false,1),codec);
         protocol.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(String,true),true,1),new OptionalCodecDecorator(codec));
         codec = new §@r§(false);
         protocol.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(Byte,false),false,1),codec);
         protocol.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(Byte,false),true,1),new OptionalCodecDecorator(codec));
         codec = new §@r§(true);
         protocol.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(Byte,true),false,1),codec);
         protocol.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(Byte,true),true,1),new OptionalCodecDecorator(codec));
         codec = new §9#$§(false);
         protocol.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(Float,false),false,1),codec);
         protocol.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(Float,false),true,1),new OptionalCodecDecorator(codec));
         codec = new §9#$§(true);
         protocol.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(Float,true),false,1),codec);
         protocol.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(Float,true),true,1),new OptionalCodecDecorator(codec));
         codec = new §>"g§.§default package default§(false);
         protocol.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(int,false),false,1),codec);
         protocol.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(int,false),true,1),new OptionalCodecDecorator(codec));
         codec = new §>"g§.§default package default§(true);
         protocol.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(int,true),false,1),codec);
         protocol.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(int,true),true,1),new OptionalCodecDecorator(codec));
         codec = new §+!7§(false);
         protocol.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(Long,false),false,1),codec);
         protocol.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(Long,false),true,1),new OptionalCodecDecorator(codec));
         codec = new §+!7§(true);
         protocol.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(Long,true),false,1),codec);
         protocol.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(Long,true),true,1),new OptionalCodecDecorator(codec));
         codec = new §>"g§.§return for static§(false);
         protocol.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(Short,false),false,1),codec);
         protocol.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(Short,false),true,1),new OptionalCodecDecorator(codec));
         codec = new §>"g§.§return for static§(true);
         protocol.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(Short,true),false,1),codec);
         protocol.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(Short,true),true,1),new OptionalCodecDecorator(codec));
         codec = new §5"M§.§default package default§(false);
         protocol.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(UShort,false),false,1),codec);
         protocol.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(UShort,false),true,1),new OptionalCodecDecorator(codec));
         codec = new §5"M§.§default package default§(true);
         protocol.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(UShort,true),false,1),codec);
         protocol.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(UShort,true),true,1),new OptionalCodecDecorator(codec));
         codec = new §5"M§.§return for static§(false);
         protocol.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(UByte,false),false,1),codec);
         protocol.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(UByte,false),true,1),new OptionalCodecDecorator(codec));
         codec = new §5"M§.§return for static§(true);
         protocol.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(UByte,true),false,1),codec);
         protocol.registerCodec(new CollectionCodecInfo(new TypeCodecInfo(UByte,true),true,1),new OptionalCodecDecorator(codec));
         osgi.injectService(IClientLog,function(param1:Object):void
         {
            Protocol.clientLog = IClientLog(param1);
         },function():IClientLog
         {
            return Protocol.clientLog;
         });
      }
      
      public function stop(param1:OSGi) : void
      {
      }
   }
}

