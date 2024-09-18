package alternativa.tanks.model.item.discount
{
   import alternativa.osgi.OSGi;
   import controls.timer.CountDownTimer;
   import flash.utils.getTimer;
   import platform.client.fp10.core.registry.ModelRegistry;
   import projects.tanks.client.garage.models.item.discount.DiscountCollectorModelBase;
   import projects.tanks.client.garage.models.item.discount.IDiscountCollectorModelBase;
   import projects.tanks.client.garage.models.item.discount.IDiscountModelBase;
   
   public class DiscountCollectorModel extends DiscountCollectorModelBase implements IDiscountCollectorModelBase, IDiscount
   {
      public function DiscountCollectorModel()
      {
         super();
      }
      
      public function getDiscountInPercent() : int
      {
         var _loc1_:Number = this.getDiscount();
         return _loc1_ * 100 + 0.0001;
      }
      
      public function applyDiscount(param1:int) : int
      {
         var _loc2_:DiscountInfo = null;
         var _loc3_:int = 0;
         var _loc4_:int = getTimer();
         var _loc5_:Vector.<int> = new Vector.<int>();
         var _loc6_:DiscountCollector = new DiscountCollector();
         ICollectDiscount(object.event(ICollectDiscount)).collectDiscountsInfo(_loc6_);
         for each(_loc2_ in _loc6_.getDiscountInfoes())
         {
            if(_loc2_.hasDiscount() && _loc2_.isDiscountTime(_loc4_))
            {
               _loc5_.push(_loc2_.getDiscountInPercent());
            }
         }
         _loc5_.sort(Array.NUMERIC);
         for each(_loc3_ in _loc5_)
         {
            param1 = int(param1 * (100 - _loc3_) / 100 + 0.001);
         }
         return param1;
      }
      
      public function getEndDiscountTimer() : CountDownTimer
      {
         return CountDownTimer(ModelRegistry(OSGi.getInstance().getService(ModelRegistry)).getModelForObject(object,IDiscountModelBase).getData(CountDownTimer));
      }
      
      private function getDiscount() : Number
      {
         var _loc1_:DiscountInfo = null;
         var _loc2_:Number = 0;
         var _loc3_:int = getTimer();
         var _loc4_:DiscountCollector = new DiscountCollector();
         ICollectDiscount(object.event(ICollectDiscount)).collectDiscountsInfo(_loc4_);
         for each(_loc1_ in _loc4_.getDiscountInfoes())
         {
            if(_loc1_.isDiscountTime(_loc3_))
            {
               _loc2_ = 1 - (1 - _loc2_) * (1 - _loc1_.getDiscountInPercent() * 0.01);
            }
         }
         return _loc2_;
      }
   }
}

