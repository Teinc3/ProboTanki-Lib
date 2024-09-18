package scpacker.networking.protocol.codec.custom
{
   import §9p§.§var const final§;
   import §[" §.ICodec;
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.clientlog.IClientLog;
   import flash.utils.ByteArray;
   import platform.client.fp10.core.resource.types.ImageResource;
   import projects.tanks.clients.flash.resources.resource.Tanks3DSResource;
   import scpacker.networking.protocol.§?"s§;
   
   public class CodecDominationResources implements ICodec
   {
      public static var log:IClientLog = IClientLog(OSGi.getInstance().getService(IClientLog));
      
      private var §=5§:ICodec;
      
      private var §8"[§:ICodec;
      
      private var §88§:ICodec;
      
      private var §5!'§:ICodec;
      
      private var §]#;§:ICodec;
      
      private var §@#7§:ICodec;
      
      private var §set override§:ICodec;
      
      private var §4#,§:ICodec;
      
      private var §>" §:ICodec;
      
      private var §"!-§:ICodec;
      
      private var §7#!§:ICodec;
      
      private var §continue const if§:ICodec;
      
      public function CodecDominationResources(param1:§?"s§)
      {
         super();
         this.§=5§ = param1.getCodec("scpacker.networking.protocol.codec.custom.ResourceGetterCodec");
         this.§8"[§ = param1.getCodec("scpacker.networking.protocol.codec.custom.ResourceGetterCodec");
         this.§88§ = param1.getCodec("scpacker.networking.protocol.codec.custom.ResourceGetterCodec");
         this.§5!'§ = param1.getCodec("scpacker.networking.protocol.codec.custom.ResourceGetterCodec");
         this.§]#;§ = param1.getCodec("scpacker.networking.protocol.codec.custom.ResourceGetterCodec");
         this.§@#7§ = param1.getCodec("scpacker.networking.protocol.codec.custom.ResourceGetterCodec");
         this.§set override§ = param1.getCodec("scpacker.networking.protocol.codec.custom.ResourceGetterCodec");
         this.§4#,§ = param1.getCodec("scpacker.networking.protocol.codec.custom.ResourceGetterCodec");
         this.§>" § = param1.getCodec("scpacker.networking.protocol.codec.custom.ResourceGetterCodec");
         this.§"!-§ = param1.getCodec("scpacker.networking.protocol.codec.custom.ResourceGetterCodec");
         this.§7#!§ = param1.getCodec("scpacker.networking.protocol.codec.custom.ResourceGetterCodec");
         this.§continue const if§ = param1.getCodec("scpacker.networking.protocol.codec.custom.ResourceGetterCodec");
      }
      
      public function decode(param1:ByteArray) : Object
      {
         var _loc2_:§var const final§ = new §var const final§();
         _loc2_.§set var import§ = this.§=5§.decode(param1) as ImageResource;
         _loc2_.§8!1§ = this.§8"[§.decode(param1) as ImageResource;
         _loc2_.§`!>§ = this.§88§.decode(param1) as ImageResource;
         _loc2_.§if catch finally§ = this.§5!'§.decode(param1) as ImageResource;
         _loc2_.§use set else§ = this.§]#;§.decode(param1) as ImageResource;
         _loc2_.§break for const§ = this.§@#7§.decode(param1) as ImageResource;
         _loc2_.§>#l§ = this.§set override§.decode(param1) as ImageResource;
         _loc2_.§true catch finally§ = this.§4#,§.decode(param1) as Tanks3DSResource;
         _loc2_.§use set set§ = this.§>" §.decode(param1) as ImageResource;
         _loc2_.§5I§ = this.§"!-§.decode(param1) as ImageResource;
         _loc2_.§implements var false§ = this.§7#!§.decode(param1) as ImageResource;
         _loc2_.§final var class§ = this.§continue const if§.decode(param1) as ImageResource;
         return _loc2_;
      }
      
      public function encode(param1:ByteArray, param2:Object) : int
      {
         if(param2 == null)
         {
            throw new Error("Object is null. Use @ProtocolOptional annotation.");
         }
         var _loc3_:§var const final§ = §var const final§(param2);
         this.§=5§.encode(param1,_loc3_.§set var import§);
         this.§8"[§.encode(param1,_loc3_.§8!1§);
         this.§88§.encode(param1,_loc3_.§`!>§);
         this.§5!'§.encode(param1,_loc3_.§if catch finally§);
         this.§]#;§.encode(param1,_loc3_.§use set else§);
         this.§@#7§.encode(param1,_loc3_.§break for const§);
         this.§set override§.encode(param1,_loc3_.§>#l§);
         this.§4#,§.encode(param1,_loc3_.§true catch finally§);
         this.§>" §.encode(param1,_loc3_.§use set set§);
         this.§"!-§.encode(param1,_loc3_.§5I§);
         this.§7#!§.encode(param1,_loc3_.§implements var false§);
         this.§continue const if§.encode(param1,_loc3_.§final var class§);
         return 4;
      }
   }
}

