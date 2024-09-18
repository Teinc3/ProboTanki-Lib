package Renamed61
{
   import Renamed15.Renamed4542;
   import Renamed15.Renamed5076;
   import Renamed17.MessageColor;
   import Renamed1.Renamed7055;
   import Renamed602.3DPositionVector;
   import alternativa.math.Vector3;
   import alternativa.object.ClientObject;
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.models.battle.battlefield.BattleUserInfoService;
   import alternativa.tanks.models.battle.gui.Renamed2553;
   import platform.client.fp10.core.model.ObjectLoadListener;
   import platform.client.fp10.core.type.IGameObject;
   import platform.client.fp10.core.type.ISpace;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.userproperties.IUserPropertiesService;
   
   public class Renamed62 extends Renamed5076 implements Renamed4542, ObjectLoadListener
   {
      [Inject]
      public static var localeService:ILocaleService;
      
      [Inject]
      public static var battleService:BattleService;
      
      [Inject]
      public static var userInfoService:BattleUserInfoService;
      
      [Inject]
      public static var userPropertiesService:IUserPropertiesService;
      
      public static const Renamed10134:int = 800;
      
      public function Renamed62()
      {
         super();
      }
      
      [Obfuscation(rename="false")]
      public function Renamed6233(param1:ClientObject) : void
      {
         if(param1 != null)
         {
            this.Renamed10135(param1,TanksLocale.TEXT_BATTLE_GOLD_TAKEN);
         }
      }
      
      private function Renamed10135(param1:ClientObject, param2:String) : void
      {
         var _loc3_:ISpace = null;
         var _loc4_:IGameObject = null;
         var _loc5_:Renamed2553 = null;
         var _loc6_:3DPositionVector = Renamed7055.Renamed694(param1);
         var _loc7_:Vector3 = new Vector3(_loc6_.x,_loc6_.y,_loc6_.z + 300);
         var _loc8_:String = userInfoService.Renamed2300(param1.id);
         if(_loc8_ != null)
         {
            _loc5_ = Renamed2553(OSGi.getInstance().getService(Renamed2553));
            _loc5_.Renamed2561(MessageColor.Renamed5390,_loc8_ + " " + localeService.getText(param2));
            _loc5_.Renamed2554(param1.id,localeService.getText(param2),null);
         }
      }
      
      [Obfuscation(rename="false")]
      public function objectLoaded() : void
      {
      }
   }
}

