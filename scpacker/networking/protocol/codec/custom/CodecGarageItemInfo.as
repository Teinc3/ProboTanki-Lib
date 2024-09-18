package scpacker.networking.protocol.codec.custom
{
   import Renamed5811.ICodec;
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.clientlog.IClientLog;
   import alternativa.types.Long;
   import flash.utils.ByteArray;
   import Renamed385.Renamed4886;
   import platform.client.fp10.core.resource.types.ImageResource;
   import platform.client.fp10.core.type.impl.GameObject;
   import projects.tanks.client.commons.types.ItemCategoryEnum;
   import projects.tanks.client.commons.types.ItemViewCategoryEnum;
   import projects.tanks.client.panel.model.garage.GarageItemInfo;
   import scpacker.networking.protocol.Renamed536;
   
   public class CodecGarageItemInfo extends Renamed4886 implements ICodec
   {
      public static var log:IClientLog = IClientLog(OSGi.getInstance().getService(IClientLog));
      
      private var Renamed10682:ICodec;
      
      private var Renamed10683:ICodec;
      
      private var Renamed10684:ICodec;
      
      private var Renamed10685:ICodec;
      
      private var Renamed10686:ICodec;
      
      private var Renamed10015:ICodec;
      
      private var Renamed10535:ICodec;
      
      private var Renamed10687:ICodec;
      
      private var Renamed10688:ICodec;
      
      private var Renamed10689:ICodec;
      
      public function CodecGarageItemInfo(param1:Renamed536)
      {
         super();
         this.Renamed10682 = param1.getCodec("scpacker.networking.protocol.codec.custom.CodecItemCategoryEnum");
         this.Renamed10684 = param1.getCodec("scpacker.networking.protocol.codec.custom.CodecItemViewCategoryEnum");
         this.Renamed10685 = param1.getCodec("scpacker.networking.protocol.codec.primitive.IntCodec");
         this.Renamed10686 = param1.getCodec("scpacker.networking.protocol.codec.primitive.BooleanCodec");
         this.Renamed10015 = param1.getCodec("scpacker.networking.protocol.codec.primitive.StringCodec");
         this.Renamed10535 = param1.getCodec("scpacker.networking.protocol.codec.primitive.IntCodec");
         this.Renamed10687 = param1.getCodec("scpacker.networking.protocol.codec.primitive.BooleanCodec");
         this.Renamed10688 = param1.getCodec("scpacker.networking.protocol.codec.custom.ResourceGetterCodec");
         this.Renamed10689 = param1.getCodec("scpacker.networking.protocol.codec.primitive.IntCodec");
      }
      
      public function decode(param1:ByteArray) : Object
      {
         var _loc2_:GarageItemInfo = new GarageItemInfo();
         _loc2_.category = this.Renamed10682.decode(param1) as ItemCategoryEnum;
         _loc2_.itemViewCategory = this.Renamed10684.decode(param1) as ItemViewCategoryEnum;
         _loc2_.modificationIndex = this.Renamed10685.decode(param1) as int;
         _loc2_.mounted = this.Renamed10686.decode(param1) as Boolean;
         _loc2_.name = this.Renamed10015.decode(param1) as String;
         _loc2_.position = this.Renamed10535.decode(param1) as int;
         _loc2_.premiumItem = this.Renamed10687.decode(param1) as Boolean;
         _loc2_.preview = this.Renamed10688.decode(param1) as ImageResource;
         _loc2_.remaingTimeInMS = this.Renamed10689.decode(param1) as int;
         _loc2_.item = new GameObject(_loc2_.preview.id,null,String(this.Renamed10015.decode(param1)),spaceRegistry.getSpace(Long.getLong(884380667,214)));
         return _loc2_;
      }
      
      public function encode(param1:ByteArray, param2:Object) : int
      {
         if(param2 == null)
         {
            throw new Error("Object is null. Use @ProtocolOptional annotation.");
         }
         var _loc3_:GarageItemInfo = GarageItemInfo(param2);
         this.Renamed10682.encode(param1,_loc3_.category);
         this.Renamed10683.encode(param1,_loc3_.item);
         this.Renamed10684.encode(param1,_loc3_.itemViewCategory);
         this.Renamed10685.encode(param1,_loc3_.modificationIndex);
         this.Renamed10686.encode(param1,_loc3_.mounted);
         this.Renamed10015.encode(param1,_loc3_.name);
         this.Renamed10535.encode(param1,_loc3_.position);
         this.Renamed10687.encode(param1,_loc3_.premiumItem);
         this.Renamed10688.encode(param1,_loc3_.preview);
         this.Renamed10689.encode(param1,_loc3_.remaingTimeInMS);
         return 4;
      }
   }
}

