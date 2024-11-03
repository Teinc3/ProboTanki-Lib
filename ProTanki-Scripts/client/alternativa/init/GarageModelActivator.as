package alternativa.init
{
   import alternativa.osgi.OSGi;
   import alternativa.osgi.bundle.IBundleActivator;
   import alternativa.tanks.model.garage.Tank3DViewer;
   import alternativa.tanks.service.delaymountcategory.IDelayMountCategoryService;
   import alternativa.tanks.service.delaymountcategory.Renamed560;
   import alternativa.tanks.service.garage.Renamed561;
   import alternativa.tanks.service.garage.GarageService;
   import alternativa.tanks.service.item.Renamed562;
   import alternativa.tanks.service.item.ItemService;
   import alternativa.tanks.service.item.upgradable.speedup.SpeedUpCostCalculatorService;
   import alternativa.tanks.service.item.upgradable.speedup.Renamed563;
   import alternativa.tanks.service.item3d.ITank3DViewer;
   import alternativa.tanks.service.itempropertyparams.Renamed564;
   import alternativa.tanks.service.itempropertyparams.ItemPropertyParamsService;
   import alternativa.tanks.service.temporaryitem.ITemporaryItemService;
   import alternativa.tanks.service.temporaryitem.Renamed565;
   import alternativa.tanks.service.temporaryitemnotify.Renamed566;
   import alternativa.tanks.service.temporaryitemnotify.ITemporaryItemNotifyService;
   
   public class GarageModelActivator implements IBundleActivator
   {
      public function GarageModelActivator()
      {
         super();
      }
      
      public function start(param1:OSGi) : void
      {
         param1.registerService(ItemService,new Renamed562());
         param1.registerService(ItemPropertyParamsService,new Renamed564());
         param1.registerService(ITemporaryItemService,new Renamed565());
         param1.registerService(ITemporaryItemNotifyService,new Renamed566());
         param1.registerService(SpeedUpCostCalculatorService,new Renamed563());
         param1.registerService(GarageService,new Renamed561());
         param1.registerService(ITank3DViewer,new Tank3DViewer());
         param1.registerService(IDelayMountCategoryService,new Renamed560());
      }
      
      public function stop(param1:OSGi) : void
      {
      }
   }
}

