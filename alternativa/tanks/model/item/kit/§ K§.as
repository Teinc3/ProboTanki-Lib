package alternativa.tanks.model.item.kit
{
   import alternativa.tanks.model.item.discount.DiscountInfo;
   import alternativa.tanks.model.item.discount.ICollectDiscount;
   import alternativa.tanks.model.item.discount.IDiscount;
   import alternativa.tanks.model.item.discount.IDiscountCollector;
   import alternativa.tanks.service.item.ItemService;
   import platform.client.fp10.core.resource.types.ImageResource;
   import projects.tanks.client.commons.types.ItemCategoryEnum;
   import projects.tanks.client.garage.models.item.kit.§3!p§;
   import projects.tanks.client.garage.models.item.kit.§7"V§;
   import projects.tanks.client.garage.models.item.kit.KitItem;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.userproperties.IUserPropertiesService;
   
   public class § K§ extends §3!p§ implements §7"V§, GarageKit, ICollectDiscount
   {
      [Inject]
      public static var itemService:ItemService;
      
      [Inject]
      public static var userPropertyService:IUserPropertiesService;
      
      public function § K§()
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
      
      public function §set super§() : int
      {
         var _loc1_:KitItem = null;
         var _loc2_:int = 0;
         for each(_loc1_ in this.getItems())
         {
            if(itemService.§null var continue§(_loc1_.item) && !itemService.isCountable(_loc1_.item) && itemService.getCategory(_loc1_.item) != ItemCategoryEnum.PLUGIN)
            {
               _loc2_ += itemService.getPriceWithoutDiscount(_loc1_.item) * _loc1_.count;
            }
         }
         return _loc2_;
      }
      
      public function §static if§() : int
      {
         return this.getPriceWithoutDiscount() - this.getPrice() - this.§set super§();
      }
      
      public function canBuy() : Boolean
      {
         var _loc1_:KitItem = null;
         for each(_loc1_ in this.getItems())
         {
            if(!itemService.§null var continue§(_loc1_.item) && itemService.§,$!§(_loc1_.item) > userPropertyService.rank)
            {
               return true;
            }
         }
         return this.§static if§() > 0;
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

