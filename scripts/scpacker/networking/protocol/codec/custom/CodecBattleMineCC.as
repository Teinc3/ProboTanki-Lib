package scpacker.networking.protocol.codec.custom
{
   import Renamed5811.ICodec;
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.clientlog.IClientLog;
   import Renamed326.Renamed7757;
   import Renamed326.Renamed7688;
   import flash.utils.ByteArray;
   import platform.client.fp10.core.resource.types.ImageResource;
   import platform.client.fp10.core.resource.types.MultiframeImageResource;
   import platform.client.fp10.core.resource.types.SoundResource;
   import projects.tanks.clients.flash.resources.resource.Tanks3DSResource;
   import scpacker.networking.protocol.CodecRegisterer;
   
   public class CodecBattleMineCC implements ICodec
   {
      public static var log:IClientLog = IClientLog(OSGi.getInstance().getService(IClientLog));
      
      private var Renamed10588:ICodec;
      
      private var Renamed10589:ICodec;
      
      private var Renamed10590:ICodec;
      
      private var Renamed10591:ICodec;
      
      private var Renamed10592:ICodec;
      
      private var Renamed10593:ICodec;
      
      private var Renamed10594:ICodec;
      
      private var Renamed10595:ICodec;
      
      private var Renamed10596:ICodec;
      
      private var Renamed10597:ICodec;
      
      private var Renamed10598:ICodec;
      
      private var Renamed10599:ICodec;
      
      private var Renamed10600:ICodec;
      
      private var Renamed10601:ICodec;
      
      private var Renamed10602:ICodec;
      
      private var Renamed10603:ICodec;
      
      private var Renamed10604:ICodec;
      
      private var Renamed10605:ICodec;
      
      public function CodecBattleMineCC(param1:CodecRegisterer)
      {
         super();
         this.Renamed10588 = param1.getCodec("scpacker.networking.protocol.codec.custom.ResourceGetterCodec");
         this.Renamed10589 = param1.getCodec("scpacker.networking.protocol.codec.primitive.IntCodec");
         this.Renamed10590 = param1.getCodec("scpacker.networking.protocol.codec.custom.VectorCodecBattleMine");
         this.Renamed10591 = param1.getCodec("scpacker.networking.protocol.codec.custom.ResourceGetterCodec");
         this.Renamed10592 = param1.getCodec("scpacker.networking.protocol.codec.custom.ResourceGetterCodec");
         this.Renamed10593 = param1.getCodec("scpacker.networking.protocol.codec.custom.ResourceGetterCodec");
         this.Renamed10594 = param1.getCodec("scpacker.networking.protocol.codec.custom.ResourceGetterCodec");
         this.Renamed10595 = param1.getCodec("scpacker.networking.protocol.codec.custom.ResourceGetterCodec");
         this.Renamed10596 = param1.getCodec("scpacker.networking.protocol.codec.primitive.FloatCodec");
         this.Renamed10597 = param1.getCodec("scpacker.networking.protocol.codec.custom.ResourceGetterCodec");
         this.Renamed10598 = param1.getCodec("scpacker.networking.protocol.codec.custom.ResourceGetterCodec");
         this.Renamed10599 = param1.getCodec("scpacker.networking.protocol.codec.primitive.FloatCodec");
         this.Renamed10600 = param1.getCodec("scpacker.networking.protocol.codec.custom.ResourceGetterCodec");
         this.Renamed10601 = param1.getCodec("scpacker.networking.protocol.codec.primitive.FloatCodec");
         this.Renamed10602 = param1.getCodec("scpacker.networking.protocol.codec.custom.ResourceGetterCodec");
         this.Renamed10603 = param1.getCodec("scpacker.networking.protocol.codec.primitive.FloatCodec");
         this.Renamed10604 = param1.getCodec("scpacker.networking.protocol.codec.primitive.FloatCodec");
         this.Renamed10605 = param1.getCodec("scpacker.networking.protocol.codec.custom.ResourceGetterCodec");
      }
      
      public function decode(param1:ByteArray) : Object
      {
         var _loc2_:Renamed7688 = new Renamed7688();
         _loc2_.Renamed7776 = this.Renamed10588.decode(param1) as SoundResource;
         _loc2_.Renamed7777 = this.Renamed10589.decode(param1) as int;
         _loc2_.Renamed7778 = this.Renamed10590.decode(param1) as Vector.<Renamed7757>;
         _loc2_.Renamed7779 = this.Renamed10591.decode(param1) as ImageResource;
         _loc2_.Renamed7780 = this.Renamed10592.decode(param1) as SoundResource;
         _loc2_.Renamed7781 = this.Renamed10593.decode(param1) as ImageResource;
         _loc2_.explosionMarkTexture = this.Renamed10594.decode(param1) as ImageResource;
         _loc2_.explosionSound = this.Renamed10595.decode(param1) as SoundResource;
         _loc2_.Renamed7782 = this.Renamed10596.decode(param1) as Number;
         _loc2_.Renamed7783 = this.Renamed10597.decode(param1) as ImageResource;
         _loc2_.Renamed7784 = this.Renamed10598.decode(param1) as MultiframeImageResource;
         _loc2_.impactForce = this.Renamed10599.decode(param1) as Number;
         _loc2_.Renamed7785 = this.Renamed10600.decode(param1) as MultiframeImageResource;
         _loc2_.Renamed7786 = this.Renamed10601.decode(param1) as Number;
         _loc2_.Renamed7787 = this.Renamed10602.decode(param1) as Tanks3DSResource;
         _loc2_.Renamed7788 = this.Renamed10603.decode(param1) as Number;
         _loc2_.radius = this.Renamed10604.decode(param1) as Number;
         _loc2_.Renamed7789 = this.Renamed10605.decode(param1) as ImageResource;
         return _loc2_;
      }
      
      public function encode(param1:ByteArray, param2:Object) : int
      {
         if(param2 == null)
         {
            throw new Error("Object is null. Use @ProtocolOptional annotation.");
         }
         var _loc3_:Renamed7688 = Renamed7688(param2);
         this.Renamed10588.encode(param1,_loc3_.Renamed7776);
         this.Renamed10589.encode(param1,_loc3_.Renamed7777);
         this.Renamed10590.encode(param1,_loc3_.Renamed7778);
         this.Renamed10591.encode(param1,_loc3_.Renamed7779);
         this.Renamed10592.encode(param1,_loc3_.Renamed7780);
         this.Renamed10593.encode(param1,_loc3_.Renamed7781);
         this.Renamed10594.encode(param1,_loc3_.explosionMarkTexture);
         this.Renamed10595.encode(param1,_loc3_.explosionSound);
         this.Renamed10596.encode(param1,_loc3_.Renamed7782);
         this.Renamed10597.encode(param1,_loc3_.Renamed7783);
         this.Renamed10598.encode(param1,_loc3_.Renamed7784);
         this.Renamed10599.encode(param1,_loc3_.impactForce);
         this.Renamed10600.encode(param1,_loc3_.Renamed7785);
         this.Renamed10601.encode(param1,_loc3_.Renamed7786);
         this.Renamed10602.encode(param1,_loc3_.Renamed7787);
         this.Renamed10603.encode(param1,_loc3_.Renamed7788);
         this.Renamed10604.encode(param1,_loc3_.radius);
         this.Renamed10605.encode(param1,_loc3_.Renamed7789);
         return 4;
      }
   }
}

