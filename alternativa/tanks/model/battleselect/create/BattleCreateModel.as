package alternativa.tanks.model.battleselect.create
{
   import Renamed1583.Renamed1584;
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.controllers.battlecreate.CheckBattleNameEvent;
   import alternativa.tanks.controllers.battlecreate.CreateBattleEvent;
   import alternativa.tanks.controllers.battlecreate.CreateBattleFormController;
   import alternativa.tanks.service.battlecreate.BattleCreateFormServiceEvent;
   import alternativa.tanks.service.battlecreate.IBattleCreateFormService;
   import alternativa.tanks.tracker.ITrackerService;
   import alternativa.tanks.view.battlecreate.CreateBattleFormView;
   import alternativa.tanks.view.battlecreate.LocaleCreateBattleForm;
   import flash.events.Event;
   import platform.client.fp10.core.model.IObjectLoadListener;
   import platform.client.fp10.core.registry.ModelRegistry;
   import platform.client.fp10.core.type.IGameObject;
   import projects.tanks.client.battleselect.model.battleselect.create.BattleCreateModelBase;
   import projects.tanks.client.battleselect.model.battleselect.create.IBattleCreateModelBase;
   import projects.tanks.client.battleservice.Renamed1579;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.alertservices.IAlertService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.userproperties.IUserPropertiesService;
   import services.alertservice.Renamed1616;
   
   public class BattleCreateModel extends BattleCreateModelBase implements IBattleCreateModelBase, IObjectLoadListener
   {
      [Inject]
      public static var display:IDisplay;
      
      [Inject]
      public static var modelRegistry:ModelRegistry;
      
      [Inject]
      public static var trackerService:ITrackerService;
      
      [Inject]
      public static var battleCreateFormService:IBattleCreateFormService;
      
      [Inject]
      public static var userPropertiesService:IUserPropertiesService;
      
      [Inject]
      public static var battleAlertService:IAlertService;
      
      [Inject]
      public static var localeService:ILocaleService;
      
      public function BattleCreateModel()
      {
         super();
      }
      
      public function setFilteredBattleName(param1:String) : void
      {
         this.getCreateBattleFormController().checkedBattleNameResult(param1);
      }
      
      public function createFailedYouAreBanned() : void
      {
         battleAlertService.showAlert(localeService.getText(TanksLocale.TEXT_CREATE_FAILED_YOU_ARE_BANNED),Vector.<String>([localeService.getText(Renamed1616.OK)]));
      }
      
      public function createFailedServerIsHalting() : void
      {
         battleAlertService.showAlert(localeService.getText(TanksLocale.TEXT_SERVER_IS_RESTARTING_CREATE_BATTLE_TEXT),Vector.<String>([localeService.getText(Renamed1616.OK)]));
      }
      
      public function createFailedTooManyBattlesFromYou() : void
      {
         battleAlertService.showAlert(localeService.getText(TanksLocale.TEXT_BATTLE_CREATE_PANEL_FLOOD_ALERT_TEXT),Vector.<String>([localeService.getText(Renamed1616.OK)]));
      }
      
      public function createFailedBattleCreateDisabled() : void
      {
      }
      
      public function objectLoaded() : void
      {
         battleCreateFormService.battleCreationDisabled = getInitParam().battleCreationDisabled;
      }
      
      public function objectLoadedPost() : void
      {
         var _loc1_:Renamed1584 = Renamed1584(modelRegistry.getModelsByInterface(Renamed1584)[0]);
         var _loc2_:Vector.<IGameObject> = _loc1_.Renamed2080();
         var _loc3_:CreateBattleFormController = new CreateBattleFormController(getInitParam().battlesLimits,getInitParam().maxRangeLength,_loc2_,new CreateBattleFormView(display.stage,display.systemLayer,new LocaleCreateBattleForm()));
         putData(CreateBattleFormController,_loc3_);
         battleCreateFormService.addEventListener(BattleCreateFormServiceEvent.SHOW_FORM,getFunctionWrapper(this.onShowForm));
         battleCreateFormService.addEventListener(BattleCreateFormServiceEvent.HIDE_FORM,getFunctionWrapper(this.onHideForm));
      }
      
      public function objectUnloaded() : void
      {
         battleCreateFormService.hideForm();
         battleCreateFormService.removeEventListener(BattleCreateFormServiceEvent.SHOW_FORM,getFunctionWrapper(this.onShowForm));
         battleCreateFormService.removeEventListener(BattleCreateFormServiceEvent.HIDE_FORM,getFunctionWrapper(this.onHideForm));
         this.removeControllersListeners();
         this.getCreateBattleFormController().destroy();
         clearData(CreateBattleFormController);
      }
      
      public function objectUnloadedPost() : void
      {
      }
      
      private function onShowForm(param1:Event) : void
      {
         var _loc2_:CreateBattleFormController = this.getCreateBattleFormController();
         _loc2_.showForm(userPropertiesService.rank);
         _loc2_.addEventListener(CreateBattleEvent.CREATE_BATTLE,getFunctionWrapper(this.onCreateBattle));
         _loc2_.addEventListener(CheckBattleNameEvent.CHECK_NAME,getFunctionWrapper(this.onCheckName));
      }
      
      private function onHideForm(param1:Event) : void
      {
         this.removeControllersListeners();
         this.getCreateBattleFormController().hideForm();
      }
      
      private function removeControllersListeners() : void
      {
         var _loc1_:CreateBattleFormController = this.getCreateBattleFormController();
         _loc1_.removeEventListener(CreateBattleEvent.CREATE_BATTLE,getFunctionWrapper(this.onCreateBattle));
         _loc1_.removeEventListener(CheckBattleNameEvent.CHECK_NAME,getFunctionWrapper(this.onCheckName));
      }
      
      private function onCheckName(param1:CheckBattleNameEvent) : void
      {
         server.checkBattleNameForForbiddenWords(param1.battleName);
      }
      
      private function onCreateBattle(param1:CreateBattleEvent) : void
      {
         var _loc2_:Renamed1579 = param1.battleCreateParams;
         trackerService.trackEvent("battleList","createBattle",_loc2_.mapId.toString());
         server.createBattle(_loc2_);
      }
      
      private function getCreateBattleFormController() : CreateBattleFormController
      {
         return CreateBattleFormController(getData(CreateBattleFormController));
      }
   }
}

