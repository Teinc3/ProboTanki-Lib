package §static set try§
{
   import §0#<§.§6<§;
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.service.garage.GarageService;
   import flash.display.DisplayObjectContainer;
   import flash.net.SharedObject;
   import mx.utils.StringUtil;
   import platform.client.fp10.core.model.ObjectLoadListener;
   import platform.client.fp10.core.model.ObjectUnloadListener;
   import platform.clients.fp10.libraries.alternativapartners.service.IPartnerService;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.alertservices.IAlertService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.storage.IStorageService;
   import §return set dynamic§.§ "i§;
   import §static import§.§<§;
   import §static import§.§true var package§;
   
   public class §@"@§ extends §<#8§ implements §true var package§, §6<§, ObjectLoadListener, ObjectUnloadListener
   {
      [Inject]
      public static var localeService:ILocaleService;
      
      [Inject]
      public static var alertService:IAlertService;
      
      [Inject]
      public static var storageService:IStorageService;
      
      [Inject]
      public static var partnerService:IPartnerService;
      
      [Inject]
      public static var garageService:GarageService;
      
      private var §9#Y§:§3#_§;
      
      public function §@"@§()
      {
         super();
      }
      
      public function updateActionElements(param1:DisplayObjectContainer) : void
      {
         § "i§(getData(§ "i§)).updateActionElements(param1);
      }
      
      public function handleDoubleClickOnItemPreview() : void
      {
         if(!this.§9#Y§)
         {
            this.§9#Y§ = new §3#_§(!partnerService.isRunningInsidePartnerEnvironment());
            this.§9#Y§.addEventListener(§ !I§.§function for use§,this.§switch set switch§);
         }
         this.§9#Y§.show();
      }
      
      private function §switch set switch§(param1:§ !I§) : void
      {
         server.rename(param1.§case package default§());
         this.§9#Y§.close();
      }
      
      public function objectLoaded() : void
      {
         var _loc1_:§ "i§ = new § "i§(localeService.getText(TanksLocale.TEXT_RENAME_BUTTON_LABEL_IN_GARAGE),getFunctionWrapper(this.handleDoubleClickOnItemPreview));
         putData(§ "i§,_loc1_);
      }
      
      public function objectUnloaded() : void
      {
         if(this.§9#Y§)
         {
            this.§9#Y§.removeEventListener(§ !I§.§function for use§,this.§switch set switch§);
            this.§9#Y§.dispose();
            this.§9#Y§ = null;
         }
      }
      
      public function §1"U§() : void
      {
         alertService.showOkAlert(localeService.getText(TanksLocale.TEXT_RENAME_FAILED_ALERT));
      }
      
      public function §break for else§(param1:String, param2:String) : void
      {
         this.§#"@§(param1,param2);
      }
      
      private function §#"@§(param1:String, param2:String) : void
      {
         var _loc3_:SharedObject = storageService.getStorage();
         var _loc4_:String = StringUtil.trim(_loc3_.data.userName);
         if(_loc4_.length != 0 && _loc4_ == param1)
         {
            _loc3_.data.userName = param2;
            _loc3_.flush();
         }
      }
   }
}

