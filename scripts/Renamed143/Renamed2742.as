package Renamed143
{
   import alternativa.object.ClientObject;
   import alternativa.osgi.OSGi;
   import alternativa.tanks.battle.objects.tank.Tank;
   import alternativa.tanks.display.usertitle.UserTitle;
   import alternativa.tanks.models.tank.Renamed2407;
   import alternativa.tanks.models.tank.Renamed2408;
   import alternativa.tanks.services.tankregistry.TankUsersRegistry;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.user.IUserInfoLabelUpdater;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.user.IUserInfoService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.user.UserInfoLabelUpdaterEvent;
   
   public class Renamed2742
   {
      [Inject]
      public static var userInfoService:IUserInfoService;
      
      [Inject]
      public static var Renamed2775:TankUsersRegistry;
      
      public function Renamed2742()
      {
         super();
      }
      
      [Obfuscation(rename="false")]
      public function objectLoadedPost(param1:ClientObject) : void
      {
         var _loc2_:IUserInfoLabelUpdater = userInfoService.getOrCreateUpdater(param1.id);
         param1.putParams(IUserInfoLabelUpdater,_loc2_);
         _loc2_.addEventListener(UserInfoLabelUpdaterEvent.CHANGE_PREMIUM_STATUS,this.onChangePremiumStatus);
         this.Renamed4959(_loc2_);
      }
      
      private function Renamed4959(param1:IUserInfoLabelUpdater) : void
      {
         var _loc2_:ClientObject = Renamed2775.Renamed695(param1.uid);
         var _loc3_:Tank = Renamed2407(OSGi.getInstance().getService(Renamed2408)).getTankData(_loc2_).tank;
         var _loc4_:UserTitle = _loc3_.title;
         _loc4_.setPremium(param1.hasPremium());
      }
      
      private function onChangePremiumStatus(param1:UserInfoLabelUpdaterEvent) : void
      {
         var _loc2_:ClientObject = Renamed2775.Renamed695(param1.user);
         if(_loc2_ == null)
         {
            return;
         }
         var _loc3_:IUserInfoLabelUpdater = this.Renamed4960(_loc2_);
         this.Renamed4959(_loc3_);
      }
      
      private function Renamed4960(param1:ClientObject) : IUserInfoLabelUpdater
      {
         return IUserInfoLabelUpdater(param1.getParams(IUserInfoLabelUpdater));
      }
      
      [Obfuscation(rename="false")]
      public function objectUnloaded(param1:ClientObject) : void
      {
         if(param1 == null)
         {
            return;
         }
         var _loc2_:IUserInfoLabelUpdater = this.Renamed4960(param1);
         _loc2_.removeEventListener(UserInfoLabelUpdaterEvent.CHANGE_PREMIUM_STATUS,this.onChangePremiumStatus);
      }
   }
}

