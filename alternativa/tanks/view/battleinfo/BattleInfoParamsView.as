package alternativa.tanks.view.battleinfo
{
   import §9"o§.§implements const true§;
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.types.Long;
   import assets.icons.BattleInfoIcons;
   import assets.icons.InputCheckIcon;
   import controls.TankWindowInner;
   import controls.base.DefaultButtonBase;
   import controls.base.LabelBase;
   import controls.base.TankInputBase;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.Graphics;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.filters.GlowFilter;
   import flash.geom.Rectangle;
   import flash.net.URLRequest;
   import flash.net.navigateToURL;
   import flash.system.System;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFieldType;
   import forms.ranks.SmallRankIcon;
   import forms.registration.CallsignIconStates;
   import projects.tanks.client.battleservice.§final package import§;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   
   public class BattleInfoParamsView extends Sprite
   {
      [Inject]
      public static var localeService:ILocaleService;
      
      private static var waitIcon:InputCheckIcon = new InputCheckIcon();
      
      private var _width:int;
      
      private var _height:int;
      
      private var iconBar:Sprite;
      
      private var autoBalanceIcon:Bitmap;
      
      private var friendlyFireIcon:Bitmap;
      
      private var iconTL:BattleInfoIcons;
      
      private var battleModeIcon:Bitmap;
      
      private var iconCTF:Bitmap;
      
      private var iconCP:Bitmap;
      
      private var suppliesIcon:Bitmap;
      
      private var bonusesIcon:Bitmap;
      
      private var crystalBonusesIcon:Bitmap;
      
      private var upgradesIcon:Bitmap;
      
      private var proBattleIcon:Bitmap;
      
      private var §1#2§:Bitmap;
      
      private var reArmorIcon:Bitmap;
      
      private var killLimitLabel:LabelBase;
      
      private var timeLimitLabel:LabelBase;
      
      private var rangBar:Sprite;
      
      private var bg:TankWindowInner;
      
      private var nameTF:LabelBase;
      
      private var preview:Sprite;
      
      private var clan:Sprite;
      
      private var clanName:LabelBase;
      
      private var rect:Rectangle;
      
      private var urlString:TankInputBase;
      
      private var urlCopyButton:DefaultButtonBase;
      
      private var copyLinkText:String;
      
      private var spectatorButton:DefaultButtonBase;
      
      private var _spectatorEnabled:Boolean;
      
      public var killlimit:int = 0;
      
      private var _clanName:String;
      
      private var _clanLink:String;
      
      private var §native const native§:Number;
      
      private var ICON_VERTICAL_MARGIN:int = 6;
      
      private var _previewLoadingId:Long;
      
      public function BattleInfoParamsView()
      {
         var _loc1_:Array = null;
         this.iconBar = new Sprite();
         this.autoBalanceIcon = new Bitmap(§implements const true§.§!+§);
         this.friendlyFireIcon = new Bitmap(§implements const true§.§throw set switch§);
         this.iconTL = new BattleInfoIcons();
         this.battleModeIcon = new Bitmap(§implements const true§.§+"w§);
         this.iconCTF = new Bitmap(§implements const true§.§%#3§);
         this.iconCP = new Bitmap(§implements const true§.§]#x§);
         this.suppliesIcon = new Bitmap(§implements const true§.§var var class§);
         this.bonusesIcon = new Bitmap(§implements const true§.§do package while§);
         this.crystalBonusesIcon = new Bitmap(§implements const true§.§&"u§);
         this.upgradesIcon = new Bitmap(§implements const true§.§%# §);
         this.proBattleIcon = new Bitmap(§implements const true§.§override package false§);
         this.reArmorIcon = new Bitmap(§implements const true§.§return var continue§);
         this.§1#2§ = new Bitmap(§implements const true§.§in const finally§);
         this.killLimitLabel = new LabelBase();
         this.timeLimitLabel = new LabelBase();
         this.rangBar = new Sprite();
         this.bg = new TankWindowInner(100,100,TankWindowInner.TRANSPARENT);
         this.nameTF = new LabelBase();
         this.preview = new Sprite();
         this.clan = new Sprite();
         this.clanName = new LabelBase();
         this.rect = new Rectangle(0,0,400,300);
         this.spectatorButton = new DefaultButtonBase();
         super();
         _loc1_ = [new GlowFilter(0,1,6,6)];
         addChild(this.preview);
         addChild(this.bg);
         addChild(this.nameTF);
         addChild(this.rangBar);
         addChild(this.iconBar);
         addChild(this.spectatorButton);
         addChild(this.clan);
         this.clanName.multiline = true;
         this.clanName.autoSize = TextFieldAutoSize.LEFT;
         this.clanName.mouseEnabled = false;
         this.spectatorButton.label = "Spectator";
         this.spectatorEnabled = false;
         this.iconTL.type = BattleInfoIcons.TIME_LIMIT;
         this.nameTF.size = 18;
         this.nameTF.height = 25;
         this.nameTF.thickness = 0;
         this.nameTF.autoSize = TextFieldAutoSize.NONE;
         this.nameTF.filters = _loc1_;
         this.iconBar.filters = _loc1_;
         this.clan.filters = _loc1_;
         this.preview.scrollRect = this.rect;
         this.copyLinkText = localeService.getText(TanksLocale.TEXT_BATTLEINFO_PANEL_COPY_LINK_TEXT);
         this.spectatorButton.visible = false;
      }
      
      public function setPreview(param1:BitmapData) : void
      {
         if(this.preview.numChildren > 0)
         {
            this.preview.removeChildAt(0);
         }
         if(param1 == null)
         {
            this.preview.addChild(waitIcon);
            waitIcon.gotoAndStop(CallsignIconStates.CALLSIGN_ICON_STATE_PROGRESS);
            waitIcon.x = int(375 - waitIcon.width / 2);
            waitIcon.y = int(250 - waitIcon.height / 2);
            this.preview.scrollRect = this.rect;
         }
         else
         {
            this.preview.addChild(new Bitmap(param1));
            this.preview.scrollRect = this.rect;
         }
         this.width = this._width;
         this.height = this._height;
      }
      
      private function onClanClick(param1:MouseEvent) : void
      {
         navigateToURL(new URLRequest(this._clanLink));
      }
      
      public function setClanName(param1:String, param2:String) : void
      {
         var _loc3_:Graphics = null;
         this._clanLink = param2;
         var _loc4_:Boolean = this._clanLink != null && this._clanLink != "" && this._clanLink != "null";
         this._clanName = _loc4_ ? "\"<u>" + param1 + "</u>\"" : param1;
         if(this.clan.hasEventListener(MouseEvent.MOUSE_UP))
         {
            this.clan.removeEventListener(MouseEvent.MOUSE_UP,this.onClanClick);
            this.clan.buttonMode = false;
         }
         if(param1 != null && this.clanName.text != param1)
         {
            this.clanName.htmlText = localeService.getText(TanksLocale.TEXT_BATTLE_SELECT_MAP_OWNER_TEXT) + "\n" + this._clanName;
            this.clanName.y = 103;
            this.clan.visible = true;
            this.clan.addChild(this.clanName);
            if(_loc4_)
            {
               this.clan.addEventListener(MouseEvent.MOUSE_UP,this.onClanClick);
               this.clan.buttonMode = true;
            }
            _loc3_ = this.clan.graphics;
            _loc3_.clear();
            _loc3_.beginFill(0,0);
            _loc3_.drawRect(0,0,this.clan.width,this.clan.height);
            this.width = this._width;
            this.height = this._height;
         }
         else
         {
            this.clanName.text = "";
         }
      }
      
      public function setUp(param1:String, param2:int, param3:int, param4:int, param5:int, param6:Boolean, param7:Boolean, param8:String, param9:§final package import§, param10:Boolean, param11:Boolean, param12:Boolean, param13:Boolean, param14:Boolean, param15:Boolean, param16:Boolean, param17:Boolean, param18:String) : void
      {
         var _loc22_:int = 0;
         var _loc19_:SmallRankIcon = null;
         var _loc20_:int = 0;
         var _loc21_:int = 0;
         _loc22_ = 0;
         while(this.rangBar.numChildren > 0)
         {
            this.rangBar.removeChildAt(0);
         }
         if(param2 != 0 && param3 != 0)
         {
            _loc20_ = param3;
            while(_loc20_ >= param2)
            {
               (_loc19_ = new SmallRankIcon(_loc20_)).x = _loc21_ * 15;
               _loc19_.y = _loc22_ * 16;
               this.rangBar.addChild(_loc19_);
               if(--_loc21_ < -15)
               {
                  _loc22_--;
                  _loc21_ = 0;
               }
               _loc20_--;
            }
         }
         this.§native const native§ = _loc22_ * 14;
         if(param8.length > 0 && this.urlString == null)
         {
            this.urlString = new TankInputBase();
            this.urlCopyButton = new DefaultButtonBase();
            addChild(this.urlString);
            addChild(this.urlCopyButton);
         }
         if(param8.length > 0)
         {
            this.urlString.value = param8;
            this.urlString.textField.type = TextFieldType.DYNAMIC;
            this.urlCopyButton.width = this.copyLinkText.length * 7;
            this.urlCopyButton.label = this.copyLinkText;
            this.urlCopyButton.addEventListener(MouseEvent.CLICK,this.copyURL);
         }
         this.nameTF.text = param1;
         if(param17)
         {
            this.nameTF.text = this.nameTF.text + " " + param18;
         }
         this.§1#2§.x = this.proBattleIcon.x;
         this.§1#2§.y = this.proBattleIcon.y + 1;
         this.§1#2§.visible = param14 && param17;
         while(this.iconBar.numChildren > 0)
         {
            this.iconBar.removeChildAt(0);
         }
         if(param5 != 0)
         {
            this.iconBar.addChild(this.iconTL);
            this.iconBar.addChild(this.timeLimitLabel);
            this.timeLimitLabel.x = 18;
            this.timeLimitLabel.autoSize = TextFieldAutoSize.NONE;
            this.timeLimitLabel.size = 14;
            this.timeLimitLabel.width = 50;
            this.timeLimitLabel.height = 20;
         }
         if(param4 > 0)
         {
            if(param9 == §final package import§.DM || param9 == §final package import§.TDM)
            {
               this.battleModeIcon = new Bitmap(§implements const true§.§+"w§);
            }
            if(param9 == §final package import§.CTF)
            {
               this.battleModeIcon = new Bitmap(§implements const true§.§%#3§);
            }
            if(param9 == §final package import§.CP)
            {
               this.battleModeIcon = new Bitmap(§implements const true§.§]#x§);
            }
            if(param9 == §final package import§.AS)
            {
               this.battleModeIcon = new Bitmap(§implements const true§.§]#x§);
            }
            this.battleModeIcon.x = this.iconBar.numChildren > 0 ? Number(this.iconBar.width + this.ICON_VERTICAL_MARGIN) : Number(0);
            this.iconBar.addChild(this.battleModeIcon);
            this.iconBar.addChild(this.killLimitLabel);
            this.killLimitLabel.size = 14;
            this.killLimitLabel.text = String(param4);
            this.killLimitLabel.x = this.battleModeIcon.x + 16;
         }
         this.killlimit = param4;
         this.addIcon(this.proBattleIcon,param13);
         this.addIcon(this.bonusesIcon,!param11);
         this.addIcon(this.crystalBonusesIcon,!param14);
         this.addIcon(this.suppliesIcon,!param10);
         this.addIcon(this.reArmorIcon,param15);
         if(param9 != §final package import§.DM)
         {
            this.addIcon(this.autoBalanceIcon,param6);
            this.addIcon(this.friendlyFireIcon,param7);
         }
         this.width = this._width;
         this.height = this._height;
      }
      
      private function addIcon(param1:Bitmap, param2:Boolean) : void
      {
         if(this.iconBar.numChildren > 0)
         {
            param1.x = this.iconBar.width + this.ICON_VERTICAL_MARGIN;
         }
         else
         {
            param1.x = 0;
         }
         param1.alpha = param2 ? Number(1) : Number(0.5);
         this.iconBar.addChild(param1);
      }
      
      private function copyURL(param1:MouseEvent) : void
      {
         System.setClipboard(this.urlString.value);
      }
      
      override public function set width(param1:Number) : void
      {
         this._width = int(param1);
         this.bg.width = this._width;
         this.preview.x = 1;
         this.clan.x = 10;
         this.rect.x = int(375 - this._width / 2);
         this.rect.width = this._width - 2;
         this.preview.scrollRect = this.rect;
         this.rangBar.x = this._width - 23;
         this.nameTF.x = 10;
         this.nameTF.width = this._width - 20;
         this.iconBar.x = 12;
         this.spectatorButton.x = this._width - this.spectatorButton.width - 9;
         if(this.urlString != null)
         {
            this.urlString.width = this._width - this.urlCopyButton.width - 3;
            this.urlCopyButton.x = this._width - this.urlCopyButton.width;
         }
      }
      
      override public function set height(param1:Number) : void
      {
         this._height = int(param1);
         this.bg.height = this.urlString != null ? Number(this._height - this.urlString.height - 3) : Number(this._height);
         this.preview.y = 1;
         this.clan.y = this.bg.height - this.clan.height - 10;
         this.rect.y = int(250 - this._height / 2);
         this.rect.height = this.bg.height - 2;
         this.preview.scrollRect = this.rect;
         this.rangBar.y = this.bg.height - 23;
         this.nameTF.y = 10;
         this.iconBar.y = 40;
         this.spectatorButton.y = this.rangBar.y + this.§native const native§ - this.spectatorButton.height - 9;
         if(this.urlString != null)
         {
            this.urlString.y = this._height - this.urlCopyButton.height;
            this.urlCopyButton.y = this._height - this.urlCopyButton.height;
         }
      }
      
      override public function get width() : Number
      {
         return this._width;
      }
      
      override public function get height() : Number
      {
         return this._height;
      }
      
      public function set spectatorEnabled(param1:Boolean) : void
      {
         if(this._spectatorEnabled && !param1)
         {
            this.spectatorButton.removeEventListener(MouseEvent.CLICK,this.spectatorButton_clickHandler);
         }
         if(!this._spectatorEnabled && param1)
         {
            this.spectatorButton.addEventListener(MouseEvent.CLICK,this.spectatorButton_clickHandler);
         }
         this._spectatorEnabled = param1;
         this.spectatorButton.visible = this._spectatorEnabled;
      }
      
      private function spectatorButton_clickHandler(param1:MouseEvent) : void
      {
         dispatchEvent(new BattleInfoViewEvent(BattleInfoViewEvent.ENTER_SPECTATOR));
      }
      
      public function updateBattleName(param1:String) : void
      {
         this.nameTF.text = param1;
      }
      
      public function setTime(param1:String) : void
      {
         this.timeLimitLabel.text = param1;
      }
   }
}

