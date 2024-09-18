package §each catch§
{
   import §!A§.§@"8§;
   import §!A§.§[!Z§;
   import §%3§.MessageColor;
   import §7"j§.§static catch true§;
   import §;"?§.§#">§;
   import alternativa.math.Vector3;
   import alternativa.object.ClientObject;
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.models.battle.battlefield.BattleUserInfoService;
   import alternativa.tanks.models.battle.gui.§&"4§;
   import platform.client.fp10.core.model.ObjectLoadListener;
   import platform.client.fp10.core.type.IGameObject;
   import platform.client.fp10.core.type.ISpace;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.userproperties.IUserPropertiesService;
   
   public class §<#=§ extends §[!Z§ implements §@"8§, ObjectLoadListener
   {
      [Inject]
      public static var localeService:ILocaleService;
      
      [Inject]
      public static var battleService:BattleService;
      
      [Inject]
      public static var userInfoService:BattleUserInfoService;
      
      [Inject]
      public static var userPropertiesService:IUserPropertiesService;
      
      public static const §get var while§:int = 800;
      
      public function §<#=§()
      {
         super();
      }
      
      [Obfuscation(rename="false")]
      public function §extends set super§(param1:ClientObject) : void
      {
         if(param1 != null)
         {
            this.§##G§(param1,TanksLocale.TEXT_BATTLE_GOLD_TAKEN);
         }
      }
      
      private function §##G§(param1:ClientObject, param2:String) : void
      {
         var _loc3_:ISpace = null;
         var _loc4_:IGameObject = null;
         var _loc5_:§&"4§ = null;
         var _loc6_:§#">§ = §static catch true§.§case package§(param1);
         var _loc7_:Vector3 = new Vector3(_loc6_.x,_loc6_.y,_loc6_.z + 300);
         var _loc8_:String = userInfoService.§include for package§(param1.id);
         if(_loc8_ != null)
         {
            _loc5_ = §&"4§(OSGi.getInstance().getService(§&"4§));
            _loc5_.§@e§(MessageColor.§%#K§,_loc8_ + " " + localeService.getText(param2));
            _loc5_.§catch catch if§(param1.id,localeService.getText(param2),null);
         }
      }
      
      [Obfuscation(rename="false")]
      public function objectLoaded() : void
      {
      }
   }
}

