package scpacker.networking.protocol.codec.custom
{
   import §[" §.ICodec;
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.clientlog.IClientLog;
   import alternativa.types.Long;
   import flash.utils.ByteArray;
   import §if try§.§return package if§;
   import platform.client.fp10.core.resource.types.ImageResource;
   import platform.client.fp10.core.type.impl.GameObject;
   import projects.tanks.client.commons.types.ItemCategoryEnum;
   import projects.tanks.client.commons.types.ItemViewCategoryEnum;
   import projects.tanks.client.panel.model.garage.GarageItemInfo;
   import scpacker.networking.protocol.§?"s§;
   
   public class CodecGarageItemInfo extends §return package if§ implements ICodec
   {
      public static var log:IClientLog = IClientLog(OSGi.getInstance().getService(IClientLog));
      
      private var §static catch switch§:ICodec;
      
      private var §continue package import§:ICodec;
      
      private var §1a§:ICodec;
      
      private var §final set throw§:ICodec;
      
      private var §^!+§:ICodec;
      
      private var §+#!§:ICodec;
      
      private var §static var true§:ICodec;
      
      private var §5"&§:ICodec;
      
      private var §[!i§:ICodec;
      
      private var §8i§:ICodec;
      
      public function CodecGarageItemInfo(param1:§?"s§)
      {
         super();
         this.§static catch switch§ = param1.getCodec("scpacker.networking.protocol.codec.custom.CodecItemCategoryEnum");
         this.§1a§ = param1.getCodec("scpacker.networking.protocol.codec.custom.CodecItemViewCategoryEnum");
         this.§final set throw§ = param1.getCodec("scpacker.networking.protocol.codec.primitive.IntCodec");
         this.§^!+§ = param1.getCodec("scpacker.networking.protocol.codec.primitive.BooleanCodec");
         this.§+#!§ = param1.getCodec("scpacker.networking.protocol.codec.primitive.StringCodec");
         this.§static var true§ = param1.getCodec("scpacker.networking.protocol.codec.primitive.IntCodec");
         this.§5"&§ = param1.getCodec("scpacker.networking.protocol.codec.primitive.BooleanCodec");
         this.§[!i§ = param1.getCodec("scpacker.networking.protocol.codec.custom.ResourceGetterCodec");
         this.§8i§ = param1.getCodec("scpacker.networking.protocol.codec.primitive.IntCodec");
      }
      
      public function decode(param1:ByteArray) : Object
      {
         var _loc2_:GarageItemInfo = new GarageItemInfo();
         _loc2_.category = this.§static catch switch§.decode(param1) as ItemCategoryEnum;
         _loc2_.itemViewCategory = this.§1a§.decode(param1) as ItemViewCategoryEnum;
         _loc2_.modificationIndex = this.§final set throw§.decode(param1) as int;
         _loc2_.mounted = this.§^!+§.decode(param1) as Boolean;
         _loc2_.name = this.§+#!§.decode(param1) as String;
         _loc2_.position = this.§static var true§.decode(param1) as int;
         _loc2_.premiumItem = this.§5"&§.decode(param1) as Boolean;
         _loc2_.preview = this.§[!i§.decode(param1) as ImageResource;
         _loc2_.remaingTimeInMS = this.§8i§.decode(param1) as int;
         _loc2_.item = new GameObject(_loc2_.preview.id,null,String(this.§+#!§.decode(param1)),spaceRegistry.getSpace(Long.getLong(884380667,214)));
         return _loc2_;
      }
      
      public function encode(param1:ByteArray, param2:Object) : int
      {
         if(param2 == null)
         {
            throw new Error("Object is null. Use @ProtocolOptional annotation.");
         }
         var _loc3_:GarageItemInfo = GarageItemInfo(param2);
         this.§static catch switch§.encode(param1,_loc3_.category);
         this.§continue package import§.encode(param1,_loc3_.item);
         this.§1a§.encode(param1,_loc3_.itemViewCategory);
         this.§final set throw§.encode(param1,_loc3_.modificationIndex);
         this.§^!+§.encode(param1,_loc3_.mounted);
         this.§+#!§.encode(param1,_loc3_.name);
         this.§static var true§.encode(param1,_loc3_.position);
         this.§5"&§.encode(param1,_loc3_.premiumItem);
         this.§[!i§.encode(param1,_loc3_.preview);
         this.§8i§.encode(param1,_loc3_.remaingTimeInMS);
         return 4;
      }
   }
}

