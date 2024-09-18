package alternativa.tanks.gui.friends.battleLink
{
   import Renamed223.Renamed1925;
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.gui.friends.list.renderer.FriendsAcceptedListRenderer;
   import alternativa.tanks.locale.constants.TextConst;
   import controls.base.LabelBase;
   import flash.display.Bitmap;
   import flash.display.Sprite;
   import forms.ColorConstants;
   import forms.contextmenu.BattleInviteContextMenuLabel;
   import projects.tanks.clients.fp10.libraries.tanksservices.model.notifier.battle.BattleLinkData;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.layout.ILobbyLayoutService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.user.IUserInfoLabelUpdater;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.user.IUserInfoService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.user.UserInfoLabelUpdaterEvent;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.userproperties.IUserPropertiesService;
   
   public class BattleLink extends Sprite
   {
      [Inject]
      public static var userInfoService:IUserInfoService;
      
      [Inject]
      [Inject]
      public static var lobbyLayoutService:ILobbyLayoutService;
      
      [Inject]
      public static var localeService:ILocaleService;
      
      [Inject]
      public static var userPropertiesService:IUserPropertiesService;
      
      private var _userId:String;
      
      private var _data:BattleLinkData;
      
      private var _noSuppliesIcon:Bitmap;
      
      private var _label:LabelBase;
      
      private var _labelCont:Sprite;
      
      private var _userInfoUpdater:IUserInfoLabelUpdater;
      
      private var _availableBattleIcon:Bitmap;
      
      public function BattleLink(param1:String)
      {
         super();
         this._userId = param1;
         this.init();
      }
      
      private function init() : void
      {
         this.tabChildren = false;
         this.tabEnabled = false;
         this._availableBattleIcon = new Bitmap(BattleInviteContextMenuLabel.battleInviteBitmapData);
         this._availableBattleIcon.y = (FriendsAcceptedListRenderer.ROW_HEIGHT - this._availableBattleIcon.height) / 2;
         this._availableBattleIcon.visible = false;
         addChild(this._availableBattleIcon);
         this._noSuppliesIcon = new Bitmap(Renamed1925.Renamed1926(true,false));
         this._noSuppliesIcon.visible = false;
         this._noSuppliesIcon.y = (FriendsAcceptedListRenderer.ROW_HEIGHT - this._noSuppliesIcon.height) / 2;
         addChild(this._noSuppliesIcon);
         this._labelCont = new Sprite();
         addChild(this._labelCont);
         this._label = new LabelBase();
         this._label.color = ColorConstants.GREEN_LABEL;
         this._label.mouseEnabled = false;
         this._labelCont.addChild(this._label);
         this._labelCont.y = -1;
         this._noSuppliesIcon.x = 0;
         this._availableBattleIcon.x = this._noSuppliesIcon.x + this._noSuppliesIcon.width + 5;
         this._labelCont.x = this._availableBattleIcon.x + this._availableBattleIcon.width + 2;
         this._userInfoUpdater = userInfoService.getOrCreateUpdater(this._userId);
         this._userInfoUpdater.addEventListener(UserInfoLabelUpdaterEvent.CHANGE_BATTLE_LINK,this.onChangeBattleLink);
         if(this._userInfoUpdater.hasData())
         {
            this.updateBattleLink(this._userInfoUpdater.battleLink);
         }
      }
      
      private function onChangeBattleLink(param1:UserInfoLabelUpdaterEvent) : void
      {
         this.updateBattleLink(this._userInfoUpdater.battleLink);
      }
      
      private function updateBattleLink(param1:BattleLinkData) : void
      {
         var _loc2_:* = false;
         var _loc3_:Boolean = false;
         this._data = param1;
         this._noSuppliesIcon.visible = false;
         this._availableBattleIcon.visible = false;
         var _loc4_:* = "";
         if(this.hasData())
         {
            _loc3_ = this._data.isSelfBattle();
            if(this._data.isShowBattle())
            {
               if(_loc3_)
               {
                  _loc4_ = param1.mapName + " " + localeService.getText(TextConst.STRING_FRIENDS_YOU_ARE_HERE_BATTLE_INDICATOR);
               }
               else
               {
                  _loc4_ = "<u>" + param1.mapName + "</u>";
               }
               this._noSuppliesIcon.visible = this._data.proBattle;
               this._availableBattleIcon.visible = this._data.availableRank();
            }
            _loc2_ = !_loc3_;
         }
         this._labelCont.buttonMode = this._labelCont.useHandCursor = _loc2_;
         this._label.htmlText = _loc4_;
      }
      
      public function get data() : BattleLinkData
      {
         return this._data;
      }
      
      public function hasData() : Boolean
      {
         return this._data != null;
      }
      
      public function removeEvents() : void
      {
         this._userInfoUpdater.removeEventListener(UserInfoLabelUpdaterEvent.CHANGE_BATTLE_LINK,this.onChangeBattleLink);
      }
      
      public function get labelCont() : Sprite
      {
         return this._labelCont;
      }
   }
}

