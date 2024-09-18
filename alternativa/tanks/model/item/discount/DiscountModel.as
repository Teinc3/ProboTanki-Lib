package alternativa.tanks.model.item.discount
{
   import alternativa.tanks.service.garage.GarageService;
   import controls.timer.CountDownTimer;
   import controls.timer.CountDownTimerOnCompleteBefore;
   import controls.timer.CountDownTimerOnCompleteBeforeWithContext;
   import flash.utils.clearTimeout;
   import flash.utils.getTimer;
   import flash.utils.setTimeout;
   import platform.client.fp10.core.model.ObjectLoadPostListener;
   import platform.client.fp10.core.model.ObjectUnloadListener;
   import projects.tanks.client.garage.models.item.discount.DiscountCC;
   import projects.tanks.client.garage.models.item.discount.DiscountModelBase;
   import projects.tanks.client.garage.models.item.discount.IDiscountModelBase;
   
   public class DiscountModel extends DiscountModelBase implements IDiscountModelBase, ICollectDiscount, ObjectLoadPostListener, ObjectUnloadListener, CountDownTimerOnCompleteBefore
   {
      [Inject]
      public static var garageService:GarageService;
      
      private const SECONDS_IN_MONTH:uint = 2592000;
      
      private const SECOND_MS:int = 1000;
      
      public function DiscountModel()
      {
         super();
      }
      
      public function objectLoadedPost() : void
      {
         this.initDiscountInfo();
         this.scheduleEndDiscount();
         this.scheduleNextStartDiscount();
      }
      
      private function initDiscountInfo() : void
      {
         var _loc1_:DiscountCC = getInitParam();
         if(_loc1_ == null || _loc1_.discount == 0 || _loc1_.timeToStartInSeconds > this.SECONDS_IN_MONTH)
         {
            putData(DiscountInfo,DiscountInfo.NO_DISCOUNT);
            return;
         }
         var _loc2_:uint = uint(getTimer());
         var _loc3_:uint = 0;
         if(_loc1_.timeToStartInSeconds > 0)
         {
            _loc3_ = uint(_loc2_ + _loc1_.timeToStartInSeconds * this.SECOND_MS);
         }
         var _loc4_:uint = uint.MAX_VALUE;
         if(_loc1_.timeLeftInSeconds > 0 && _loc1_.timeLeftInSeconds < this.SECONDS_IN_MONTH)
         {
            _loc4_ = uint(_loc2_ + _loc1_.timeLeftInSeconds * this.SECOND_MS);
         }
         putData(DiscountInfo,new DiscountInfo(_loc1_.discount,_loc3_,_loc4_));
      }
      
      private function scheduleEndDiscount() : void
      {
         var _loc1_:DiscountInfo = null;
         var _loc2_:CountDownTimer = null;
         this.destroyEndDiscountTimer();
         var _loc3_:uint = uint.MAX_VALUE;
         var _loc4_:int = getTimer();
         var _loc5_:DiscountCollector = new DiscountCollector();
         ICollectDiscount(object.event(ICollectDiscount)).collectDiscountsInfo(_loc5_);
         for each(_loc1_ in _loc5_.getDiscountInfoes())
         {
            if(_loc1_.isDiscountTime(_loc4_))
            {
               _loc3_ = Math.min(_loc3_,_loc1_.getEndTime());
            }
         }
         if(_loc3_ != uint.MAX_VALUE)
         {
            _loc2_ = new CountDownTimer();
            _loc2_.start(_loc3_);
            _loc2_.addListener(CountDownTimerOnCompleteBefore,new CountDownTimerOnCompleteBeforeWithContext(object,this));
            putData(CountDownTimer,_loc2_);
         }
      }
      
      private function destroyEndDiscountTimer() : void
      {
         var _loc1_:CountDownTimer = CountDownTimer(getData(CountDownTimer));
         if(_loc1_ != null)
         {
            _loc1_.destroy();
            clearData(CountDownTimer);
         }
      }
      
      public function onCompleteBefore(param1:CountDownTimer, param2:Boolean) : void
      {
         this.scheduleEndDiscount();
         this.updateDiscount();
      }
      
      private function scheduleNextStartDiscount() : void
      {
         var _loc1_:DiscountInfo = null;
         var _loc2_:uint = 0;
         var _loc3_:uint = uint.MAX_VALUE;
         var _loc4_:int = getTimer();
         var _loc5_:DiscountCollector = new DiscountCollector();
         ICollectDiscount(object.event(ICollectDiscount)).collectDiscountsInfo(_loc5_);
         for each(_loc1_ in _loc5_.getDiscountInfoes())
         {
            if(_loc4_ < _loc1_.getBeginTime())
            {
               _loc3_ = Math.min(_loc3_,_loc1_.getBeginTime());
            }
         }
         if(_loc3_ != uint.MAX_VALUE)
         {
            _loc2_ = setTimeout(getFunctionWrapper(this.startDiscount),_loc3_ - _loc4_);
            putData(uint,_loc2_);
         }
      }
      
      private function startDiscount() : void
      {
         clearData(uint);
         this.scheduleEndDiscount();
         this.updateDiscount();
         this.scheduleNextStartDiscount();
      }
      
      private function updateDiscount() : void
      {
         garageService.§!E§().updateDiscount(object);
      }
      
      public function objectUnloaded() : void
      {
         var _loc1_:Object = getData(uint);
         if(_loc1_ != null)
         {
            clearTimeout(uint(_loc1_));
         }
      }
      
      public function collectDiscountsInfo(param1:IDiscountCollector) : void
      {
         param1.addDiscount(DiscountInfo(getData(DiscountInfo)));
      }
   }
}

