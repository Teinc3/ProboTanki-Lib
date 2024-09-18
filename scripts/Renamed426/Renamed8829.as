package Renamed426
{
   import Renamed1687.Renamed1688;
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
   import Renamed414.Renamed4785;
   import Renamed421.Renamed5822;
   import Renamed421.Renamed4786;
   
   public class Renamed4788 extends Renamed8731 implements Renamed4786, Renamed1688, ObjectLoadListener, ObjectUnloadListener
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
      
      private var Renamed8826:Renamed4787;
      
      public function Renamed4788()
      {
         super();
      }
      
      public function updateActionElements(param1:DisplayObjectContainer) : void
      {
         Renamed4785(getData(Renamed4785)).updateActionElements(param1);
      }
      
      public function handleDoubleClickOnItemPreview() : void
      {
         if(!this.Renamed8826)
         {
            this.Renamed8826 = new Renamed4787(!partnerService.isRunningInsidePartnerEnvironment());
            this.Renamed8826.addEventListener(Renamed8788.Renamed8789,this.Renamed8827);
         }
         this.Renamed8826.show();
      }
      
      private function Renamed8827(param1:Renamed8788) : void
      {
         server.rename(param1.Renamed8790());
         this.Renamed8826.close();
      }
      
      public function objectLoaded() : void
      {
         var _loc1_:Renamed4785 = new Renamed4785(localeService.getText(TanksLocale.TEXT_RENAME_BUTTON_LABEL_IN_GARAGE),getFunctionWrapper(this.handleDoubleClickOnItemPreview));
         putData(Renamed4785,_loc1_);
      }
      
      public function objectUnloaded() : void
      {
         if(this.Renamed8826)
         {
            this.Renamed8826.removeEventListener(Renamed8788.Renamed8789,this.Renamed8827);
            this.Renamed8826.dispose();
            this.Renamed8826 = null;
         }
      }
      
      public function Renamed5600() : void
      {
         alertService.showOkAlert(localeService.getText(TanksLocale.TEXT_RENAME_FAILED_ALERT));
      }
      
      public function Renamed5602(param1:String, param2:String) : void
      {
         this.Renamed8828(param1,param2);
      }
      
      private function Renamed8828(param1:String, param2:String) : void
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

