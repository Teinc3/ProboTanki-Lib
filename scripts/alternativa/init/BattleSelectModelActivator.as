package alternativa.init
{
   import alternativa.osgi.OSGi;
   import alternativa.osgi.bundle.IBundleActivator;
   import alternativa.tanks.service.battle.BattleUserInfoService;
   import alternativa.tanks.service.battle.IBattleUserInfoService;
   import alternativa.tanks.service.battlecreate.Renamed542;
   import alternativa.tanks.service.battlecreate.IBattleCreateFormService;
   import alternativa.tanks.service.battleinfo.IBattleInfoFormService;
   import alternativa.tanks.service.battleinfo.Renamed543;
   import alternativa.tanks.service.battlelist.IBattleListFormService;
   import alternativa.tanks.service.battlelist.Renamed544;
   
   public class BattleSelectModelActivator implements IBundleActivator
   {
      public function BattleSelectModelActivator()
      {
         super();
      }
      
      public function start(param1:OSGi) : void
      {
         param1.registerService(IBattleCreateFormService,new Renamed542());
         param1.registerService(IBattleListFormService,new Renamed544());
         param1.registerService(IBattleInfoFormService,new Renamed543());
         param1.registerService(IBattleUserInfoService,new BattleUserInfoService());
      }
      
      public function stop(param1:OSGi) : void
      {
         param1.unregisterService(IBattleCreateFormService);
         param1.unregisterService(IBattleListFormService);
         param1.unregisterService(IBattleInfoFormService);
         param1.unregisterService(IBattleUserInfoService);
      }
   }
}

