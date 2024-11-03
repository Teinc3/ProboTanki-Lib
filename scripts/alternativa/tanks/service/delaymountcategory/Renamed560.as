package alternativa.tanks.service.delaymountcategory
{
   import alternativa.osgi.service.logging.LogService;
   import alternativa.tanks.service.item.ItemService;
   import controls.timer.CountDownTimer;
   import flash.utils.Dictionary;
   import flash.utils.getTimer;
   import platform.client.fp10.core.type.IGameObject;
   import projects.tanks.client.commons.types.ItemCategoryEnum;
   import Renamed433.Renamed3666;
   
   public class Renamed560 implements IDelayMountCategoryService
   {
      [Inject]
      public static var itemService:ItemService;
      
      [Inject]
      public static var logService:LogService;
      
      private var Renamed2009:Dictionary;
      
      public function Renamed560()
      {
         this.Renamed2009 = new Dictionary();
         super();
      }
      
      public function Renamed1775(param1:IGameObject) : CountDownTimer
      {
         var _loc2_:ItemCategoryEnum = itemService.getCategory(param1);
         return this.Renamed2009[_loc2_];
      }
      
      public function Renamed3667(param1:Renamed3666) : void
      {
         this.Renamed3670(ItemCategoryEnum.ARMOR,param1.delayMountArmorInSec);
         this.Renamed3670(ItemCategoryEnum.WEAPON,param1.delayMountWeaponInSec);
         this.Renamed3670(ItemCategoryEnum.COLOR,param1.delayMountColorInSec);
      }
      
      private function Renamed3670(param1:ItemCategoryEnum, param2:int) : void
      {
         var _loc3_:CountDownTimer = new CountDownTimer();
         _loc3_.start(param2 * 1000 + getTimer());
         this.Renamed2009[param1] = _loc3_;
      }
      
      public function Renamed3668() : void
      {
         var _loc1_:CountDownTimer = null;
         for each(_loc1_ in this.Renamed2009)
         {
            if(_loc1_ != null)
            {
               _loc1_.destroy();
            }
         }
         delete this.Renamed2009[ItemCategoryEnum.ARMOR];
         delete this.Renamed2009[ItemCategoryEnum.COLOR];
         delete this.Renamed2009[ItemCategoryEnum.WEAPON];
      }
      
      public function Renamed3669() : void
      {
         var _loc1_:CountDownTimer = null;
         for each(_loc1_ in this.Renamed2009)
         {
            if(_loc1_ != null)
            {
               _loc1_.stop();
            }
         }
      }
   }
}

