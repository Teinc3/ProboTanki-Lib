package scpacker.networking.protocol.codec.custom
{
   import §9p§.§break var finally§;
   import §[" §.ICodec;
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.clientlog.IClientLog;
   import flash.utils.ByteArray;
   import platform.client.fp10.core.resource.types.SoundResource;
   import scpacker.networking.protocol.§?"s§;
   
   public class CodecDominationSounds implements ICodec
   {
      public static var log:IClientLog = IClientLog(OSGi.getInstance().getService(IClientLog));
      
      private var §1#8§:ICodec;
      
      private var §;g§:ICodec;
      
      private var §true set for§:ICodec;
      
      private var §"!B§:ICodec;
      
      private var §dynamic var false§:ICodec;
      
      private var §3!6§:ICodec;
      
      private var §0"r§:ICodec;
      
      private var §,3§:ICodec;
      
      private var §]'§:ICodec;
      
      private var §,#q§:ICodec;
      
      public function CodecDominationSounds(param1:§?"s§)
      {
         super();
         this.§1#8§ = param1.getCodec("scpacker.networking.protocol.codec.custom.ResourceGetterCodec");
         this.§;g§ = param1.getCodec("scpacker.networking.protocol.codec.custom.ResourceGetterCodec");
         this.§true set for§ = param1.getCodec("scpacker.networking.protocol.codec.custom.ResourceGetterCodec");
         this.§"!B§ = param1.getCodec("scpacker.networking.protocol.codec.custom.ResourceGetterCodec");
         this.§dynamic var false§ = param1.getCodec("scpacker.networking.protocol.codec.custom.ResourceGetterCodec");
         this.§3!6§ = param1.getCodec("scpacker.networking.protocol.codec.custom.ResourceGetterCodec");
         this.§0"r§ = param1.getCodec("scpacker.networking.protocol.codec.custom.ResourceGetterCodec");
         this.§,3§ = param1.getCodec("scpacker.networking.protocol.codec.custom.ResourceGetterCodec");
         this.§]'§ = param1.getCodec("scpacker.networking.protocol.codec.custom.ResourceGetterCodec");
         this.§,#q§ = param1.getCodec("scpacker.networking.protocol.codec.custom.ResourceGetterCodec");
      }
      
      public function decode(param1:ByteArray) : Object
      {
         var _loc2_:§break var finally§ = new §break var finally§();
         _loc2_.§!#i§ = this.§1#8§.decode(param1) as SoundResource;
         _loc2_.§6"j§ = this.§;g§.decode(param1) as SoundResource;
         _loc2_.§import set if§ = this.§true set for§.decode(param1) as SoundResource;
         _loc2_.§1"<§ = this.§"!B§.decode(param1) as SoundResource;
         _loc2_.§try set while§ = this.§dynamic var false§.decode(param1) as SoundResource;
         _loc2_.§@#v§ = this.§3!6§.decode(param1) as SoundResource;
         _loc2_.§package package set§ = this.§0"r§.decode(param1) as SoundResource;
         _loc2_.§-#[§ = this.§,3§.decode(param1) as SoundResource;
         _loc2_.§class try§ = this.§]'§.decode(param1) as SoundResource;
         _loc2_.§3;§ = this.§,#q§.decode(param1) as SoundResource;
         return _loc2_;
      }
      
      public function encode(param1:ByteArray, param2:Object) : int
      {
         if(param2 == null)
         {
            throw new Error("Object is null. Use @ProtocolOptional annotation.");
         }
         var _loc3_:§break var finally§ = §break var finally§(param2);
         this.§1#8§.encode(param1,_loc3_.§!#i§);
         this.§;g§.encode(param1,_loc3_.§6"j§);
         this.§true set for§.encode(param1,_loc3_.§import set if§);
         this.§"!B§.encode(param1,_loc3_.§1"<§);
         this.§dynamic var false§.encode(param1,_loc3_.§try set while§);
         this.§3!6§.encode(param1,_loc3_.§@#v§);
         this.§0"r§.encode(param1,_loc3_.§package package set§);
         this.§,3§.encode(param1,_loc3_.§-#[§);
         this.§]'§.encode(param1,_loc3_.§class try§);
         this.§,#q§.encode(param1,_loc3_.§3;§);
         return 4;
      }
   }
}

