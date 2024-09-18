package Renamed2615
{
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.battle.events.BattleEventDispatcher;
   import alternativa.tanks.battle.events.Renamed511;
   import alternativa.tanks.models.battle.gui.Renamed2553;
   import Renamed329.Renamed5080;
   import Renamed329.Renamed7820;
   import Renamed329.Renamed2760;
   import platform.client.fp10.core.type.AutoClosable;
   import platform.client.fp10.core.type.IGameObject;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   
   public class Renamed4647 implements AutoClosable, Renamed511
   {
      [Inject]
      public static var battleEventDispatcher:BattleEventDispatcher;
      
      [Inject]
      public static var localeService:ILocaleService;
      
      private var Renamed9663:IGameObject;
      
      private var Renamed9664:String;
      
      private var Renamed9665:String;
      
      private var Renamed9666:String;
      
      public function Renamed4647()
      {
         super();
         this.init();
      }
      
      private function init() : void
      {
         this.Renamed9664 = localeService.getText(TanksLocale.TEXT_BATTLE_PLAYER_SUICIDED);
         this.Renamed9665 = localeService.getText(TanksLocale.TEXT_BATTLE_PLAYER_KILLED);
         this.Renamed9666 = localeService.getText(TanksLocale.TEXT_REARM_BATTLE_EVENT);
         battleEventDispatcher.Renamed539(Renamed2760,this);
         battleEventDispatcher.Renamed539(Renamed5080,this);
         battleEventDispatcher.Renamed539(Renamed7820,this);
      }
      
      public function handleBattleEvent(param1:Object) : void
      {
         var _loc2_:Renamed2760 = null;
         var _loc3_:Renamed5080 = null;
         var _loc4_:Renamed7820 = null;
         var _loc5_:Renamed2553 = Renamed2553(OSGi.getInstance().getService(Renamed2553));
         if(param1 is Renamed2760)
         {
            _loc2_ = Renamed2760(param1);
            if(_loc2_.Renamed7818 != _loc2_.Renamed7819)
            {
               _loc5_.Renamed2554(_loc2_.Renamed7818,this.Renamed9665,_loc2_.Renamed7819);
            }
            else
            {
               _loc5_.Renamed2554(_loc2_.Renamed7819,this.Renamed9664,null);
            }
         }
         else if(param1 is Renamed5080)
         {
            _loc3_ = Renamed5080(param1);
            _loc5_.Renamed2554(_loc3_.Renamed5508.id,this.Renamed9664,null);
         }
         else if(param1 is Renamed7820)
         {
            _loc4_ = Renamed7820(param1);
            _loc5_.Renamed2564(_loc4_.userId,this.Renamed9666);
         }
      }
      
      [Obfuscation(rename="false")]
      public function close() : void
      {
         this.Renamed9663 = null;
         battleEventDispatcher.Renamed866(Renamed2760,this);
         battleEventDispatcher.Renamed866(Renamed5080,this);
         battleEventDispatcher.Renamed866(Renamed7820,this);
      }
   }
}

