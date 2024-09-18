package §!!y§
{
   import alternativa.object.ClientObject;
   import alternativa.osgi.OSGi;
   import alternativa.tanks.battle.objects.tank.Tank;
   import alternativa.tanks.display.usertitle.UserTitle;
   import alternativa.tanks.models.tank.§2!s§;
   import alternativa.tanks.models.tank.§finally var return§;
   import alternativa.tanks.services.tankregistry.TankUsersRegistry;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.user.IUserInfoLabelUpdater;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.user.IUserInfoService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.user.UserInfoLabelUpdaterEvent;
   
   public class §2!Y§
   {
      [Inject]
      public static var userInfoService:IUserInfoService;
      
      [Inject]
      public static var §9#A§:TankUsersRegistry;
      
      public function §2!Y§()
      {
         super();
      }
      
      [Obfuscation(rename="false")]
      public function objectLoadedPost(param1:ClientObject) : void
      {
         var _loc2_:IUserInfoLabelUpdater = userInfoService.getOrCreateUpdater(param1.id);
         param1.putParams(IUserInfoLabelUpdater,_loc2_);
         _loc2_.addEventListener(UserInfoLabelUpdaterEvent.CHANGE_PREMIUM_STATUS,this.onChangePremiumStatus);
         this.§finally catch import§(_loc2_);
      }
      
      private function §finally catch import§(param1:IUserInfoLabelUpdater) : void
      {
         var _loc2_:ClientObject = §9#A§.§if for with§(param1.uid);
         var _loc3_:Tank = §2!s§(OSGi.getInstance().getService(§finally var return§)).getTankData(_loc2_).tank;
         var _loc4_:UserTitle = _loc3_.title;
         _loc4_.setPremium(param1.hasPremium());
      }
      
      private function onChangePremiumStatus(param1:UserInfoLabelUpdaterEvent) : void
      {
         var _loc2_:ClientObject = §9#A§.§if for with§(param1.user);
         if(_loc2_ == null)
         {
            return;
         }
         var _loc3_:IUserInfoLabelUpdater = this.§;c§(_loc2_);
         this.§finally catch import§(_loc3_);
      }
      
      private function §;c§(param1:ClientObject) : IUserInfoLabelUpdater
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
         var _loc2_:IUserInfoLabelUpdater = this.§;c§(param1);
         _loc2_.removeEventListener(UserInfoLabelUpdaterEvent.CHANGE_PREMIUM_STATUS,this.onChangePremiumStatus);
      }
   }
}

