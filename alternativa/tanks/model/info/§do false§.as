package alternativa.tanks.model.info
{
   import §>6§.§null for do§;
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.service.battleinfo.IBattleInfoFormService;
   import alternativa.tanks.service.battlelist.IBattleListFormService;
   import alternativa.tanks.view.battleinfo.BattleInfoViewEvent;
   import platform.client.fp10.core.model.IObjectLoadListener;
   import platform.client.fp10.core.registry.ResourceRegistry;
   import platform.client.fp10.core.resource.types.ImageResource;
   import projects.tanks.client.battleselect.model.info.§ !t§;
   import projects.tanks.client.battleselect.model.info.§;#i§;
   import projects.tanks.client.battleselect.model.info.§?S§;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.alertservices.IAlertService;
   import services.alertservice.§get const use§;
   
   public class §do false§ extends §;#i§ implements § !t§, IObjectLoadListener, §with var while§
   {
      [Inject]
      public static var battleInfoFormService:IBattleInfoFormService;
      
      [Inject]
      public static var battleListFormService:IBattleListFormService;
      
      [Inject]
      public static var resourceRegistry:ResourceRegistry;
      
      [Inject]
      public static var battleAlertService:IAlertService;
      
      [Inject]
      public static var localeService:ILocaleService;
      
      public function §do false§()
      {
         super();
      }
      
      public function objectLoaded() : void
      {
         battleInfoFormService.addEventListener(BattleInfoViewEvent.ENTER_SPECTATOR,getFunctionWrapper(this.onEnterSpectator));
      }
      
      public function objectLoadedPost() : void
      {
      }
      
      public function objectUnloaded() : void
      {
         battleInfoFormService.removeEventListener(BattleInfoViewEvent.ENTER_SPECTATOR,getFunctionWrapper(this.onEnterSpectator));
         battleInfoFormService.§+!x§();
      }
      
      public function objectUnloadedPost() : void
      {
      }
      
      private function onEnterSpectator(param1:BattleInfoViewEvent) : void
      {
         server.§catch return§();
      }
      
      public function removeUser(param1:String) : void
      {
         battleInfoFormService.removeUser(param1);
      }
      
      public function roundStart() : void
      {
         battleInfoFormService.roundStart();
      }
      
      public function roundFinish() : void
      {
         battleInfoFormService.roundFinish();
      }
      
      public function battleStop() : void
      {
         battleInfoFormService.battleStop();
      }
      
      public function updateUserSuspiciousState(param1:String, param2:Boolean) : void
      {
         battleInfoFormService.updateUserSuspiciousState(param1,param2);
      }
      
      public function §-#J§() : void
      {
         battleAlertService.showAlert(localeService.getText(TanksLocale.TEXT_SERVER_IS_RESTARTING_CREATE_BATTLE_TEXT),Vector.<String>([localeService.getText(§get const use§.OK)]));
      }
      
      public function updateName(param1:String) : void
      {
         battleInfoFormService.updateName(param1);
      }
      
      public function getConstructor() : §?S§
      {
         return getInitParam();
      }
      
      public function getPreviewResource() : ImageResource
      {
         return §null for do§(getInitParam().map.adapt(§null for do§)).getPreviewResource();
      }
   }
}

