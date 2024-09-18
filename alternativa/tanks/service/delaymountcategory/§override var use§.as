package alternativa.tanks.service.delaymountcategory
{
   import alternativa.osgi.service.logging.LogService;
   import alternativa.tanks.service.item.ItemService;
   import controls.timer.CountDownTimer;
   import flash.utils.Dictionary;
   import flash.utils.getTimer;
   import platform.client.fp10.core.type.IGameObject;
   import projects.tanks.client.commons.types.ItemCategoryEnum;
   import §switch set try§.§in catch final§;
   
   public class §override var use§ implements IDelayMountCategoryService
   {
      [Inject]
      public static var itemService:ItemService;
      
      [Inject]
      public static var logService:LogService;
      
      private var §9!v§:Dictionary;
      
      public function §override var use§()
      {
         this.§9!v§ = new Dictionary();
         super();
      }
      
      public function §+N§(param1:IGameObject) : CountDownTimer
      {
         var _loc2_:ItemCategoryEnum = itemService.getCategory(param1);
         return this.§9!v§[_loc2_];
      }
      
      public function § "F§(param1:§in catch final§) : void
      {
         this.§!"-§(ItemCategoryEnum.ARMOR,param1.delayMountArmorInSec);
         this.§!"-§(ItemCategoryEnum.WEAPON,param1.delayMountWeaponInSec);
         this.§!"-§(ItemCategoryEnum.COLOR,param1.delayMountColorInSec);
      }
      
      private function §!"-§(param1:ItemCategoryEnum, param2:int) : void
      {
         var _loc3_:CountDownTimer = new CountDownTimer();
         _loc3_.start(param2 * 1000 + getTimer());
         this.§9!v§[param1] = _loc3_;
      }
      
      public function §8#+§() : void
      {
         var _loc1_:CountDownTimer = null;
         for each(_loc1_ in this.§9!v§)
         {
            if(_loc1_ != null)
            {
               _loc1_.destroy();
            }
         }
         delete this.§9!v§[ItemCategoryEnum.ARMOR];
         delete this.§9!v§[ItemCategoryEnum.COLOR];
         delete this.§9!v§[ItemCategoryEnum.WEAPON];
      }
      
      public function §break include§() : void
      {
         var _loc1_:CountDownTimer = null;
         for each(_loc1_ in this.§9!v§)
         {
            if(_loc1_ != null)
            {
               _loc1_.stop();
            }
         }
      }
   }
}

