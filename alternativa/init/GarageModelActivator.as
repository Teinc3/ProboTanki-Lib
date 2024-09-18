package alternativa.init
{
   import alternativa.osgi.OSGi;
   import alternativa.osgi.bundle.IBundleActivator;
   import alternativa.tanks.model.garage.Tank3DViewer;
   import alternativa.tanks.service.delaymountcategory.IDelayMountCategoryService;
   import alternativa.tanks.service.delaymountcategory.§override var use§;
   import alternativa.tanks.service.garage.§8!n§;
   import alternativa.tanks.service.garage.GarageService;
   import alternativa.tanks.service.item.§9!R§;
   import alternativa.tanks.service.item.ItemService;
   import alternativa.tanks.service.item.upgradable.speedup.SpeedUpCostCalculatorService;
   import alternativa.tanks.service.item.upgradable.speedup.§`"E§;
   import alternativa.tanks.service.item3d.ITank3DViewer;
   import alternativa.tanks.service.itempropertyparams.§3y§;
   import alternativa.tanks.service.itempropertyparams.ItemPropertyParamsService;
   import alternativa.tanks.service.temporaryitem.ITemporaryItemService;
   import alternativa.tanks.service.temporaryitem.§in do§;
   import alternativa.tanks.service.temporaryitemnotify.§@#e§;
   import alternativa.tanks.service.temporaryitemnotify.ITemporaryItemNotifyService;
   
   public class GarageModelActivator implements IBundleActivator
   {
      public function GarageModelActivator()
      {
         super();
      }
      
      public function start(param1:OSGi) : void
      {
         param1.registerService(ItemService,new §9!R§());
         param1.registerService(ItemPropertyParamsService,new §3y§());
         param1.registerService(ITemporaryItemService,new §in do§());
         param1.registerService(ITemporaryItemNotifyService,new §@#e§());
         param1.registerService(SpeedUpCostCalculatorService,new §`"E§());
         param1.registerService(GarageService,new §8!n§());
         param1.registerService(ITank3DViewer,new Tank3DViewer());
         param1.registerService(IDelayMountCategoryService,new §override var use§());
      }
      
      public function stop(param1:OSGi) : void
      {
      }
   }
}

