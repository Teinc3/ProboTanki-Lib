package alternativa.tanks.model.item.buyable
{
   import alternativa.tanks.model.item.discount.IDiscount;
   import projects.tanks.client.garage.models.item.buyable.BuyableModelBase;
   import projects.tanks.client.garage.models.item.buyable.IBuyableModelBase;
   
   public class BuyableModel extends BuyableModelBase implements IBuyableModelBase, IBuyable
   {
      public function BuyableModel()
      {
         super();
      }
      
      public function getPriceWithoutDiscount() : int
      {
         return getInitParam().priceWithoutDiscount;
      }
      
      public function getPrice() : int
      {
         var _loc1_:IDiscount = IDiscount(object.adapt(IDiscount));
         return _loc1_.applyDiscount(getInitParam().priceWithoutDiscount);
      }
      
      public function isBuyable() : Boolean
      {
         return getInitParam().buyable;
      }
   }
}

