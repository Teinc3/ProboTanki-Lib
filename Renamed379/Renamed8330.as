package Renamed379
{
   import alternativa.object.ClientObject;
   import alternativa.osgi.OSGi;
   import alternativa.tanks.battle.objects.tank.Tank;
   import alternativa.tanks.battle.objects.tank.Renamed841;
   import alternativa.tanks.models.battle.battlefield.BattleUserInfoService;
   import alternativa.tanks.models.tank.Renamed2408;
   import alternativa.tanks.services.tankregistry.TankUsersRegistry;
   import controls.base.LabelBase;
   import filters.Filters;
   import flash.events.MouseEvent;
   import flash.text.AntiAliasType;
   import forms.userlabel.ChatUserLabel;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.battle.IBattleInfoService;
   
   public class Renamed2647 extends ChatUserLabel
   {
      [Inject]
      public static var battleInfoService:IBattleInfoService;
      
      [Inject]
      public static var Renamed2775:TankUsersRegistry;
      
      [Inject]
      public static var userInfoService:BattleUserInfoService;
      
      private var Renamed8328:LabelBase;
      
      public function Renamed2647(param1:String, param2:Boolean = true)
      {
         var _loc3_:ClientObject = null;
         var _loc4_:Tank = null;
         _uid = userInfoService.Renamed2300(param1);
         _rank = userInfoService.Renamed2301(param1);
         _chatModeratorLevel = userInfoService.Renamed2303(param1);
         _writeInChat = false;
         _blockUserEnable = param2;
         var _loc5_:* = false;
         if(battleInfoService.isSpectatorMode())
         {
            _loc3_ = Renamed2775.Renamed695(param1);
            if(_loc3_ != null)
            {
               _loc4_ = Renamed2408(OSGi.getInstance().getService(Renamed2408)).getTankData(_loc3_).tank;
               if(_loc4_ != null)
               {
                  _loc5_ = _loc4_.state == Renamed841.Renamed854;
               }
            }
         }
         this._focusOnUserEnabled = _loc5_;
         super(param1);
         if(!self)
         {
            addEventListener(MouseEvent.MOUSE_OVER,this.onMouseOver);
            addEventListener(MouseEvent.MOUSE_OUT,this.onMouseOut);
         }
      }
      
      [Obfuscation(rename="false")]
      override protected function getShadowFilters() : Array
      {
         return Filters.SHADOW_FILTERS;
      }
      
      [Obfuscation(rename="false")]
      protected function Renamed8329() : Array
      {
         return Filters.SHADOW_ON_OVER_FILTERS;
      }
      
      private function onMouseOut(param1:MouseEvent) : void
      {
         shadowContainer.filters = this.getShadowFilters();
      }
      
      private function onMouseOver(param1:MouseEvent) : void
      {
         shadowContainer.filters = this.Renamed8329();
      }
      
      [Obfuscation(rename="false")]
      override protected function onMouseClick(param1:MouseEvent) : void
      {
         super.onMouseClick(param1);
      }
      
      [Obfuscation(rename="false")]
      override protected function updateProperties() : void
      {
         setUid(_uid);
         setRank(_rank);
         setFriendState(_friendInfoUpdater.state);
      }
      
      [Obfuscation(rename="false")]
      override protected function createUidLabel() : void
      {
         super.createUidLabel();
         _uidLabel.antiAliasType = AntiAliasType.ADVANCED;
         _uidLabel.thickness = 150;
         _uidLabel.sharpness = 200;
      }
   }
}

