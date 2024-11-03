package alternativa.tanks.model.item.kit
{
   import alternativa.tanks.model.item.discount.DiscountInfo;
   import alternativa.tanks.model.item.discount.ICollectDiscount;
   import alternativa.tanks.model.item.discount.IDiscount;
   import alternativa.tanks.model.item.discount.IDiscountCollector;
   import alternativa.tanks.service.item.ItemService;
   import platform.client.fp10.core.resource.types.ImageResource;
   import projects.tanks.client.commons.types.ItemCategoryEnum;
   import projects.tanks.client.garage.models.item.kit.Renamed2138;
   import projects.tanks.client.garage.models.item.kit.Renamed2139;
   import projects.tanks.client.garage.models.item.kit.KitItem;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.userproperties.IUserPropertiesService;
   
   public class Renamed2140 extends Renamed2138 implements Renamed2139, GarageKit, ICollectDiscount
   {
      [Inject]
      public static var itemService:ItemService;
      
      [Inject]
      public static var userPropertyService:IUserPropertiesService;
      
      public function Renamed2140()
      {
         super();
      }
      
      public function getImage() : ImageResource
      {
         return getInitParam().image;
      }
      
      public function getPrice() : int
      {
         var _loc1_:int = this.getPriceWithoutDiscount();
         var _loc2_:IDiscount = IDiscount(object.adapt(IDiscount));
         return _loc2_.applyDiscount(_loc1_);
      }
      
      public function getPriceWithoutDiscount() : int
      {
         var _loc1_:KitItem = null;
         var _loc2_:int = 0;
         for each(_loc1_ in this.getItems())
         {
            _loc2_ += itemService.getPriceWithoutDiscount(_loc1_.item) * _loc1_.count;
         }
         return _loc2_;
      }
      
      public function Renamed2136() : int
      {
         var _loc1_:KitItem = null;
         var _loc2_:int = 0;
         for each(_loc1_ in this.getItems())
         {
            if(itemService.Renamed1773(_loc1_.item) && !itemService.isCountable(_loc1_.item) && itemService.getCategory(_loc1_.item) != ItemCategoryEnum.PLUGIN)
            {
               _loc2_ += itemService.getPriceWithoutDiscount(_loc1_.item) * _loc1_.count;
            }
         }
         return _loc2_;
      }
      
      public function Renamed2137() : int
      {
         return this.getPriceWithoutDiscount() - this.getPrice() - this.Renamed2136();
      }
      
      public function canBuy() : Boolean
      {
         var _loc1_:KitItem = null;
         for each(_loc1_ in this.getItems())
         {
            if(!itemService.Renamed1773(_loc1_.item) && itemService.Renamed1764(_loc1_.item) > userPropertyService.rank)
            {
               return true;
            }
         }
         return this.Renamed2137() > 0;
      }
      
      public function getItems() : Vector.<KitItem>
      {
         return getInitParam().kitItems;
      }
      
      public function collectDiscountsInfo(param1:IDiscountCollector) : void
      {
         if(getInitParam() == null)
         {
            return;
         }
         param1.addDiscount(new DiscountInfo(getInitParam().discountInPercent,0));
      }
   }
}

