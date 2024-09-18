package scpacker.networking.protocol.codec.custom
{
   import Renamed289.Renamed5084;
   import Renamed5811.ICodec;
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.clientlog.IClientLog;
   import flash.utils.ByteArray;
   import platform.client.fp10.core.resource.types.ImageResource;
   import projects.tanks.clients.flash.resources.resource.Tanks3DSResource;
   import scpacker.networking.protocol.Renamed536;
   
   public class CodecDominationResources implements ICodec
   {
      public static var log:IClientLog = IClientLog(OSGi.getInstance().getService(IClientLog));
      
      private var Renamed10660:ICodec;
      
      private var Renamed10661:ICodec;
      
      private var Renamed10662:ICodec;
      
      private var Renamed10663:ICodec;
      
      private var Renamed10664:ICodec;
      
      private var Renamed10665:ICodec;
      
      private var Renamed10666:ICodec;
      
      private var Renamed10667:ICodec;
      
      private var Renamed10668:ICodec;
      
      private var Renamed10669:ICodec;
      
      private var Renamed10670:ICodec;
      
      private var Renamed10671:ICodec;
      
      public function CodecDominationResources(param1:Renamed536)
      {
         super();
         this.Renamed10660 = param1.getCodec("scpacker.networking.protocol.codec.custom.ResourceGetterCodec");
         this.Renamed10661 = param1.getCodec("scpacker.networking.protocol.codec.custom.ResourceGetterCodec");
         this.Renamed10662 = param1.getCodec("scpacker.networking.protocol.codec.custom.ResourceGetterCodec");
         this.Renamed10663 = param1.getCodec("scpacker.networking.protocol.codec.custom.ResourceGetterCodec");
         this.Renamed10664 = param1.getCodec("scpacker.networking.protocol.codec.custom.ResourceGetterCodec");
         this.Renamed10665 = param1.getCodec("scpacker.networking.protocol.codec.custom.ResourceGetterCodec");
         this.Renamed10666 = param1.getCodec("scpacker.networking.protocol.codec.custom.ResourceGetterCodec");
         this.Renamed10667 = param1.getCodec("scpacker.networking.protocol.codec.custom.ResourceGetterCodec");
         this.Renamed10668 = param1.getCodec("scpacker.networking.protocol.codec.custom.ResourceGetterCodec");
         this.Renamed10669 = param1.getCodec("scpacker.networking.protocol.codec.custom.ResourceGetterCodec");
         this.Renamed10670 = param1.getCodec("scpacker.networking.protocol.codec.custom.ResourceGetterCodec");
         this.Renamed10671 = param1.getCodec("scpacker.networking.protocol.codec.custom.ResourceGetterCodec");
      }
      
      public function decode(param1:ByteArray) : Object
      {
         var _loc2_:Renamed5084 = new Renamed5084();
         _loc2_.Renamed5117 = this.Renamed10660.decode(param1) as ImageResource;
         _loc2_.Renamed5115 = this.Renamed10661.decode(param1) as ImageResource;
         _loc2_.Renamed5099 = this.Renamed10662.decode(param1) as ImageResource;
         _loc2_.Renamed7375 = this.Renamed10663.decode(param1) as ImageResource;
         _loc2_.Renamed7376 = this.Renamed10664.decode(param1) as ImageResource;
         _loc2_.Renamed5114 = this.Renamed10665.decode(param1) as ImageResource;
         _loc2_.Renamed5101 = this.Renamed10666.decode(param1) as ImageResource;
         _loc2_.Renamed5088 = this.Renamed10667.decode(param1) as Tanks3DSResource;
         _loc2_.Renamed5116 = this.Renamed10668.decode(param1) as ImageResource;
         _loc2_.Renamed5100 = this.Renamed10669.decode(param1) as ImageResource;
         _loc2_.Renamed7377 = this.Renamed10670.decode(param1) as ImageResource;
         _loc2_.Renamed7378 = this.Renamed10671.decode(param1) as ImageResource;
         return _loc2_;
      }
      
      public function encode(param1:ByteArray, param2:Object) : int
      {
         if(param2 == null)
         {
            throw new Error("Object is null. Use @ProtocolOptional annotation.");
         }
         var _loc3_:Renamed5084 = Renamed5084(param2);
         this.Renamed10660.encode(param1,_loc3_.Renamed5117);
         this.Renamed10661.encode(param1,_loc3_.Renamed5115);
         this.Renamed10662.encode(param1,_loc3_.Renamed5099);
         this.Renamed10663.encode(param1,_loc3_.Renamed7375);
         this.Renamed10664.encode(param1,_loc3_.Renamed7376);
         this.Renamed10665.encode(param1,_loc3_.Renamed5114);
         this.Renamed10666.encode(param1,_loc3_.Renamed5101);
         this.Renamed10667.encode(param1,_loc3_.Renamed5088);
         this.Renamed10668.encode(param1,_loc3_.Renamed5116);
         this.Renamed10669.encode(param1,_loc3_.Renamed5100);
         this.Renamed10670.encode(param1,_loc3_.Renamed7377);
         this.Renamed10671.encode(param1,_loc3_.Renamed7378);
         return 4;
      }
   }
}

