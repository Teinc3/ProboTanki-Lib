package alternativa.tanks.gui
{
   import alternativa.tanks.gui.alerts.ItemsAlert;
   import projects.tanks.client.commons.types.ItemGarageProperty;
   import projects.tanks.client.panel.model.garage.GarageItemInfo;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.premium.PremiumService;
   
   public class AvailableItemsAlert extends ItemsAlert
   {
      [Inject]
      public static var premiumService:PremiumService;
      
      public function AvailableItemsAlert(param1:Vector.<GarageItemInfo>, param2:String, param3:String)
      {
         super(param2,param3,this.addItems,param1);
      }
      
      private function addItems(param1:Vector.<GarageItemInfo>) : void
      {
         var _loc2_:GarageItemInfo = null;
         var _loc3_:int = 0;
         var _loc4_:Boolean = false;
         var _loc5_:Vector.<ItemGarageProperty> = null;
         var _loc6_:int = int(param1.length);
         var _loc7_:int = 0;
         while(_loc7_ < _loc6_)
         {
            _loc2_ = param1[_loc7_];
            _loc3_ = 0;
            _loc4_ = _loc2_.premiumItem && !premiumService.hasPremium();
            partsList.addItem(_loc2_.item,_loc2_.name,_loc2_.category,_loc2_.position,0,_loc3_,_loc4_,true,0,_loc2_.preview,0,null,_loc2_.modificationIndex,null,_loc5_);
            _loc7_++;
         }
      }
   }
}

