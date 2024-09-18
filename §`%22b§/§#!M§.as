package §`"b§
{
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.battle.events.BattleEventDispatcher;
   import alternativa.tanks.battle.events.§throw package continue§;
   import alternativa.tanks.models.battle.gui.§&"4§;
   import §class catch import§.§,"V§;
   import §class catch import§.§`!K§;
   import §class catch import§.§switch package extends§;
   import platform.client.fp10.core.type.AutoClosable;
   import platform.client.fp10.core.type.IGameObject;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   
   public class §#!M§ implements AutoClosable, §throw package continue§
   {
      [Inject]
      public static var battleEventDispatcher:BattleEventDispatcher;
      
      [Inject]
      public static var localeService:ILocaleService;
      
      private var §const extends§:IGameObject;
      
      private var §include catch super§:String;
      
      private var §%#u§:String;
      
      private var §%$"§:String;
      
      public function §#!M§()
      {
         super();
         this.init();
      }
      
      private function init() : void
      {
         this.§include catch super§ = localeService.getText(TanksLocale.TEXT_BATTLE_PLAYER_SUICIDED);
         this.§%#u§ = localeService.getText(TanksLocale.TEXT_BATTLE_PLAYER_KILLED);
         this.§%$"§ = localeService.getText(TanksLocale.TEXT_REARM_BATTLE_EVENT);
         battleEventDispatcher.§set for each§(§switch package extends§,this);
         battleEventDispatcher.§set for each§(§,"V§,this);
         battleEventDispatcher.§set for each§(§`!K§,this);
      }
      
      public function handleBattleEvent(param1:Object) : void
      {
         var _loc2_:§switch package extends§ = null;
         var _loc3_:§,"V§ = null;
         var _loc4_:§`!K§ = null;
         var _loc5_:§&"4§ = §&"4§(OSGi.getInstance().getService(§&"4§));
         if(param1 is §switch package extends§)
         {
            _loc2_ = §switch package extends§(param1);
            if(_loc2_.§in for throw§ != _loc2_.§get var var§)
            {
               _loc5_.§catch catch if§(_loc2_.§in for throw§,this.§%#u§,_loc2_.§get var var§);
            }
            else
            {
               _loc5_.§catch catch if§(_loc2_.§get var var§,this.§include catch super§,null);
            }
         }
         else if(param1 is §,"V§)
         {
            _loc3_ = §,"V§(param1);
            _loc5_.§catch catch if§(_loc3_.§%#w§.id,this.§include catch super§,null);
         }
         else if(param1 is §`!K§)
         {
            _loc4_ = §`!K§(param1);
            _loc5_.§&#B§(_loc4_.userId,this.§%$"§);
         }
      }
      
      [Obfuscation(rename="false")]
      public function close() : void
      {
         this.§const extends§ = null;
         battleEventDispatcher.§7!3§(§switch package extends§,this);
         battleEventDispatcher.§7!3§(§,"V§,this);
         battleEventDispatcher.§7!3§(§`!K§,this);
      }
   }
}

