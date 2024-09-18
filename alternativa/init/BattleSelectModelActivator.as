package alternativa.init
{
   import alternativa.osgi.OSGi;
   import alternativa.osgi.bundle.IBundleActivator;
   import alternativa.tanks.service.battle.BattleUserInfoService;
   import alternativa.tanks.service.battle.IBattleUserInfoService;
   import alternativa.tanks.service.battlecreate.§ #-§;
   import alternativa.tanks.service.battlecreate.IBattleCreateFormService;
   import alternativa.tanks.service.battleinfo.IBattleInfoFormService;
   import alternativa.tanks.service.battleinfo.§override set const§;
   import alternativa.tanks.service.battlelist.IBattleListFormService;
   import alternativa.tanks.service.battlelist.§while for do§;
   
   public class BattleSelectModelActivator implements IBundleActivator
   {
      public function BattleSelectModelActivator()
      {
         super();
      }
      
      public function start(param1:OSGi) : void
      {
         param1.registerService(IBattleCreateFormService,new § #-§());
         param1.registerService(IBattleListFormService,new §while for do§());
         param1.registerService(IBattleInfoFormService,new §override set const§());
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

