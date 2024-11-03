package alternativa.tanks.model.info
{
   import Renamed1583.Renamed1584;
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.service.battleinfo.IBattleInfoFormService;
   import alternativa.tanks.service.battlelist.IBattleListFormService;
   import alternativa.tanks.view.battleinfo.BattleInfoViewEvent;
   import platform.client.fp10.core.model.IObjectLoadListener;
   import platform.client.fp10.core.registry.ResourceRegistry;
   import platform.client.fp10.core.resource.types.ImageResource;
   import projects.tanks.client.battleselect.model.info.Renamed2116;
   import projects.tanks.client.battleselect.model.info.Renamed2117;
   import projects.tanks.client.battleselect.model.info.Renamed2118;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.alertservices.IAlertService;
   import services.alertservice.Renamed1616;
   
   public class Renamed2119 extends Renamed2117 implements Renamed2116, IObjectLoadListener, Renamed2120
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
      
      public function Renamed2119()
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
         battleInfoFormService.Renamed2121();
      }
      
      public function objectUnloadedPost() : void
      {
      }
      
      private function onEnterSpectator(param1:BattleInfoViewEvent) : void
      {
         server.Renamed2122();
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
      
      public function Renamed2123() : void
      {
         battleAlertService.showAlert(localeService.getText(TanksLocale.TEXT_SERVER_IS_RESTARTING_CREATE_BATTLE_TEXT),Vector.<String>([localeService.getText(Renamed1616.OK)]));
      }
      
      public function updateName(param1:String) : void
      {
         battleInfoFormService.updateName(param1);
      }
      
      public function getConstructor() : Renamed2118
      {
         return getInitParam();
      }
      
      public function getPreviewResource() : ImageResource
      {
         return Renamed1584(getInitParam().map.adapt(Renamed1584)).getPreviewResource();
      }
   }
}

