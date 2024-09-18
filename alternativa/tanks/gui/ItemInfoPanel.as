package alternativa.tanks.gui
{
   import §0#<§.§6<§;
   import alternativa.osgi.service.clientlog.IClientLog;
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.gui.buttons.§0#j§;
   import alternativa.tanks.gui.buttons.§6`§;
   import alternativa.tanks.gui.buttons.GarageButton;
   import alternativa.tanks.gui.effects.BlinkEffect;
   import alternativa.tanks.gui.effects.GlowEffect;
   import alternativa.tanks.gui.upgrade.ItemPropertyUpgradeEvent;
   import alternativa.tanks.gui.upgrade.SelectUpgradeWindow;
   import alternativa.tanks.gui.upgrade.UpgradeButton;
   import alternativa.tanks.gui.upgrade.UpgradeColors;
   import alternativa.tanks.model.item.kit.GarageKit;
   import alternativa.tanks.model.item.present.PresentItem;
   import alternativa.tanks.model.item.properties.ItemPropertyValue;
   import alternativa.tanks.model.item.temporary.ITemporaryItem;
   import alternativa.tanks.model.item.upgradable.UpgradableItem;
   import alternativa.tanks.model.item.upgradable.UpgradableItemPropertyValue;
   import alternativa.tanks.service.delaymountcategory.IDelayMountCategoryService;
   import alternativa.tanks.service.dialogs.IDialogsService;
   import alternativa.tanks.service.item.ItemService;
   import alternativa.tanks.service.item3d.ITank3DViewer;
   import alternativa.tanks.service.itempropertyparams.ItemPropertyParamsService;
   import alternativa.tanks.service.itempropertyparams.§else package implements§;
   import alternativa.tanks.service.money.IMoneyService;
   import alternativa.tanks.service.panel.IPanelView;
   import alternativa.types.Long;
   import alternativa.utils.removeDisplayObject;
   import assets.scroller.color.ScrollThumbSkinGreen;
   import assets.scroller.color.ScrollTrackGreen;
   import base.DiscreteSprite;
   import controls.Money;
   import controls.NumStepper;
   import controls.TankWindow;
   import controls.TankWindowHeader;
   import controls.TankWindowInner;
   import controls.base.LabelBase;
   import controls.buttons.h50px.GreyBigButton;
   import controls.timer.CountDownTimer;
   import fl.containers.ScrollPane;
   import fl.controls.ScrollPolicy;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.display.Shape;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.filters.DropShadowFilter;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.text.TextFieldType;
   import flash.text.TextFormat;
   import flash.text.TextFormatAlign;
   import platform.client.fp10.core.resource.Resource;
   import platform.client.fp10.core.resource.types.ImageResource;
   import platform.client.fp10.core.type.IGameObject;
   import projects.tanks.client.commons.types.ItemCategoryEnum;
   import projects.tanks.client.garage.models.item.properties.ItemGarageProperty;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.battle.IBattleInfoService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.layout.ILobbyLayoutService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.userproperties.IUserPropertiesService;
   import projects.tanks.clients.fp10.libraries.tanksservices.utils.removeChildrenFrom;
   import §throw var throw§.§>P§;
   import §true catch final§.§#!q§;
   import utils.resource.IResourceLoadingComplete;
   import utils.resource.ResourceLoadingWrapper;
   
   public class ItemInfoPanel extends Sprite implements IResourceLoadingComplete
   {
      [Inject]
      public static var localeService:ILocaleService;
      
      [Inject]
      public static var userPropertiesService:IUserPropertiesService;
      
      [Inject]
      public static var itemService:ItemService;
      
      [Inject]
      public static var clientLog:IClientLog;
      
      [Inject]
      public static var moneyService:IMoneyService;
      
      [Inject]
      public static var panelView:IPanelView;
      
      [Inject]
      public static var propertyService:ItemPropertyParamsService;
      
      [Inject]
      public static var dialogService:IDialogsService;
      
      [Inject]
      public static var lobbyLayoutService:ILobbyLayoutService;
      
      [Inject]
      public static var §var set function§:ITank3DViewer;
      
      [Inject]
      public static var battleInfoService:IBattleInfoService;
      
      [Inject]
      public static var §super set dynamic§:IDelayMountCategoryService;
      
      public static const INVENTORY_MAX_VALUE:int = 9999;
      
      private static const TOP_PREVIEW_WITH_NAME_PENETRATION_SIZE:int = 15;
      
      private static const BOTTOM_MARGIN:int = 64;
      
      private static const BUTTON_SIZE:Point = new Point(120,50);
      
      private static const ICON_SPACING_H:int = 10;
      
      private static const HORIZONTAL_MARGIN:int = 12;
      
      private static const VERTICAL_MARGIN:int = 9;
      
      private static const MODULE_SPACING:int = 3;
      
      private static const PREVIEW_OFFSET_X:int = 0;
      
      private static const §in set each§:int = 10;
      
      public const margin:int = 11;
      
      public var size:Point;
      
      public var inventoryNumStepper:NumStepper;
      
      public var buyButton:GarageButton;
      
      public var equipButton:§0#j§;
      
      public var upgradeButton:UpgradeButton;
      
      public var §^!&§:GreyBigButton;
      
      private var §3"6§:GreyBigButton;
      
      private var itemNameLabel:LabelBase;
      
      private var itemDescriptionLabel:LabelBase;
      
      private var window:TankWindow;
      
      private var inner:TankWindowInner;
      
      private var §[#O§:Bitmap;
      
      private var §7=§:DiscreteSprite;
      
      private var §use set native§:Bitmap;
      
      private var §while package true§:Bitmap;
      
      private var leftPreview:Bitmap;
      
      private var _leftPreviewEnabled:Boolean = true;
      
      private var topPreview:Bitmap;
      
      private var propertiesParams:Vector.<§else package implements§>;
      
      private var scrollPane:ScrollPane;
      
      private var scrollContainer:Sprite;
      
      private var propertiesPanel:Sprite;
      
      private var propertiesPanelLeft:Bitmap;
      
      private var propertiesPanelCenter:Bitmap;
      
      private var propertiesPanelRight:Bitmap;
      
      private var area:Shape;
      
      private var areaRect:Rectangle;
      
      private var areaRect2:Rectangle;
      
      private var timeIndicator:LabelBase;
      
      private var modTable:ModTable;
      
      private var §`"n§:§#!q§;
      
      private var §in var default§:Sprite;
      
      private var §finally var package§:Bitmap;
      
      private var §finally const super§:Bitmap;
      
      private var §5l§:Bitmap;
      
      private var §8!f§:Bitmap;
      
      private var §each var throw§:Bitmap;
      
      private var §+#A§:Bitmap;
      
      private var §`"K§:Bitmap;
      
      private var §+!O§:Bitmap;
      
      private var §set for with§:Bitmap;
      
      private var §false set native§:Bitmap;
      
      private var §<!]§:Bitmap;
      
      private var §import var native§:Bitmap;
      
      private var §>#'§:Bitmap;
      
      private var §null for each§:Shape;
      
      private var §4!i§:Shape;
      
      private var §2"J§:Boolean;
      
      private var §import for switch§:LabelBase;
      
      private var item:IGameObject;
      
      private var itemCategory:ItemCategoryEnum;
      
      private var itemPrice:int;
      
      private var isCountable:Boolean = false;
      
      private var previewResource:ImageResource;
      
      private var maxRankIndex:int;
      
      private var minRankIndex:int;
      
      private var §import for do§:Long;
      
      private var _topPreviewLoadingId:Long;
      
      private var §#F§:Long;
      
      private var §4I§:Long;
      
      private var selectWindow:SelectUpgradeWindow;
      
      private var blinkEffect:BlinkEffect;
      
      private var enabledUpgrades:Boolean;
      
      private var §class catch var§:§8!>§;
      
      private var §in set try§:DiscreteSprite;
      
      private var §2"1§:DiscreteSprite;
      
      public function ItemInfoPanel(param1:Boolean, param2:int)
      {
         var _loc3_:TextFormat = null;
         this.propertiesParams = new Vector.<§else package implements§>();
         this.blinkEffect = new BlinkEffect();
         this.§in set try§ = new DiscreteSprite();
         this.§2"1§ = new DiscreteSprite();
         super();
         this.enabledUpgrades = param1;
         this.size = new Point(400,300);
         this.window = new TankWindow(this.size.x,this.size.y);
         addChild(this.window);
         this.window.headerLang = localeService.getText(TanksLocale.TEXT_GUI_LANG);
         this.window.header = TankWindowHeader.INFORMATION;
         this.inner = new TankWindowInner(164,106,TankWindowInner.GREEN);
         this.inner.showBlink = true;
         addChild(this.inner);
         this.inner.x = this.margin;
         this.inner.y = this.margin;
         this.area = new Shape();
         this.areaRect = new Rectangle();
         this.areaRect2 = new Rectangle(HORIZONTAL_MARGIN,VERTICAL_MARGIN,0,0);
         this.areaRect.width = param2 - this.margin * 2 - 2;
         this.areaRect2.width = this.areaRect.width - HORIZONTAL_MARGIN * 2;
         this.scrollContainer = new Sprite();
         this.scrollContainer.x = this.margin + 1;
         this.scrollContainer.y = this.margin + 1;
         this.scrollContainer.addChild(this.area);
         this.scrollPane = new ScrollPane();
         addChild(this.scrollPane);
         this.confScroll();
         this.scrollPane.horizontalScrollPolicy = ScrollPolicy.OFF;
         this.scrollPane.verticalScrollPolicy = ScrollPolicy.AUTO;
         this.scrollPane.source = this.scrollContainer;
         this.scrollPane.focusEnabled = false;
         this.scrollPane.x = this.margin + 1;
         this.scrollPane.y = this.margin + 1 + MODULE_SPACING;
         var _loc4_:String = userPropertiesService.userName;
         this.itemNameLabel = new LabelBase();
         this.itemNameLabel.type = TextFieldType.DYNAMIC;
         this.itemNameLabel.text = "Hello, " + _loc4_ + "!";
         this.itemNameLabel.size = 18;
         this.itemNameLabel.color = 381208;
         this.scrollContainer.addChild(this.itemNameLabel);
         this.itemNameLabel.x = HORIZONTAL_MARGIN - 3;
         this.itemNameLabel.y = VERTICAL_MARGIN - 7;
         this.itemDescriptionLabel = new LabelBase();
         var _loc5_:String = localeService.language;
         if(_loc5_ == "cn")
         {
            _loc3_ = this.itemDescriptionLabel.getTextFormat();
            _loc3_.leading = 3;
            this.itemDescriptionLabel.defaultTextFormat = _loc3_;
         }
         this.itemDescriptionLabel.multiline = true;
         this.itemDescriptionLabel.wordWrap = true;
         this.itemDescriptionLabel.color = 381208;
         this.itemDescriptionLabel.text = "Description";
         this.itemDescriptionLabel.mouseWheelEnabled = false;
         this.scrollContainer.addChild(this.itemDescriptionLabel);
         this.itemDescriptionLabel.x = HORIZONTAL_MARGIN - 3;
         this.§7=§ = new DiscreteSprite();
         this.scrollContainer.addChild(this.§7=§);
         this.§class catch var§ = new §8!>§(this.areaRect2.width);
         this.§class catch var§.x = 9;
         this.§[#O§ = new Bitmap();
         this.§use set native§ = new Bitmap();
         this.§while package true§ = new Bitmap();
         this.leftPreview = new Bitmap();
         this.topPreview = new Bitmap();
         this.buyButton = new GarageButton();
         this.upgradeButton = new UpgradeButton();
         this.upgradeButton.addEventListener(MouseEvent.CLICK,this.onButtonUpgradeClick);
         this.equipButton = new §0#j§();
         this.equipButton.label = localeService.getText(TanksLocale.TEXT_GARAGE_INFO_PANEL_BUTTON_EQUIP_TEXT);
         this.§3"6§ = new GreyBigButton();
         this.§3"6§.label = localeService.getText(TanksLocale.TEXT_FITTING_BUTTON_TEXT);
         this.§3"6§.visible = false;
         this.§3"6§.addEventListener(MouseEvent.CLICK,this.§dynamic catch package§);
         addChild(this.§2"1§);
         this.§^!&§ = new GreyBigButton();
         this.§^!&§.label = localeService.getText(TanksLocale.TEXT_DELETE_PRESENT_BUTTON);
         this.§^!&§.visible = false;
         this.buyButton.visible = false;
         this.upgradeButton.visible = false;
         this.equipButton.visible = false;
         this.§2"1§.addChild(this.buyButton);
         this.§2"1§.addChild(this.upgradeButton);
         this.§2"1§.addChild(this.equipButton);
         this.§2"1§.addChild(this.§3"6§);
         this.§2"1§.addChild(this.§^!&§);
         addChild(this.§in set try§);
         this.inventoryNumStepper = new NumStepper();
         this.§2"1§.addChild(this.inventoryNumStepper);
         this.inventoryNumStepper.value = 1;
         this.inventoryNumStepper.minValue = 1;
         this.inventoryNumStepper.maxValue = INVENTORY_MAX_VALUE;
         this.inventoryNumStepper.visible = false;
         this.inventoryNumStepper.mouseEnabled = false;
         this.inventoryNumStepper.addEventListener(Event.CHANGE,this.inventoryNumChanged);
         this.propertiesPanel = new Sprite();
         this.propertiesPanelLeft = new Bitmap(ItemInfoPanelBitmaps.propertiesLeft);
         this.propertiesPanel.addChild(this.propertiesPanelLeft);
         this.propertiesPanelCenter = new Bitmap(ItemInfoPanelBitmaps.propertiesCenter);
         this.propertiesPanel.addChild(this.propertiesPanelCenter);
         this.propertiesPanelRight = new Bitmap(ItemInfoPanelBitmaps.propertiesRight);
         this.propertiesPanel.addChild(this.propertiesPanelRight);
         this.propertiesPanelCenter.x = this.propertiesPanelLeft.width;
         this.propertiesPanel.x = HORIZONTAL_MARGIN;
         this.propertiesPanel.y = Math.round(VERTICAL_MARGIN * 2 + this.itemNameLabel.textHeight - 7);
         this.§extends throw§();
         this.timeIndicator = new LabelBase();
         this.timeIndicator.size = 18;
         this.timeIndicator.color = 381208;
         this.modTable = new ModTable(this.areaRect2.width);
         this.modTable.x = HORIZONTAL_MARGIN;
         this.§import for switch§ = new LabelBase();
         this.§import for switch§.color = 16777215;
         this.§import for switch§.align = TextFormatAlign.CENTER;
         this.§import for switch§.size = 23;
         this.§import for switch§.bold = true;
         if(_loc5_ == "cn")
         {
            this.§import for switch§.size = 20;
         }
      }
      
      private static function getRequiredRank(param1:int, param2:int, param3:int) : int
      {
         var _loc4_:int = param2;
         if(param1 < param2)
         {
            _loc4_ = -param2;
         }
         else if(param1 > param3)
         {
            _loc4_ = -param3;
         }
         return _loc4_;
      }
      
      private function §extends throw§() : void
      {
         this.§in var default§ = new Sprite();
         this.§finally var package§ = new Bitmap(ItemInfoPanelBitmaps.§false package override§);
         this.§in var default§.addChild(this.§finally var package§);
         this.§finally const super§ = new Bitmap(ItemInfoPanelBitmaps.§]#"§);
         this.§in var default§.addChild(this.§finally const super§);
         this.§5l§ = new Bitmap(ItemInfoPanelBitmaps.§function set include§);
         this.§in var default§.addChild(this.§5l§);
         this.§finally const super§.x = this.§finally var package§.width;
         this.§8!f§ = new Bitmap(ItemInfoPanelBitmaps.§case for static§);
         this.§in var default§.addChild(this.§8!f§);
         this.§each var throw§ = new Bitmap(ItemInfoPanelBitmaps.§get catch return§);
         this.§in var default§.addChild(this.§each var throw§);
         this.§import var native§ = new Bitmap(ItemInfoPanelBitmaps.§5#j§);
         this.§in var default§.addChild(this.§import var native§);
         this.§>#'§ = new Bitmap(ItemInfoPanelBitmaps.§set var while§);
         this.§in var default§.addChild(this.§>#'§);
         this.§false set native§ = new Bitmap(ItemInfoPanelBitmaps.§]#"§);
         this.§in var default§.addChild(this.§false set native§);
         this.§+#A§ = new Bitmap(ItemInfoPanelBitmaps.§var try§);
         this.§in var default§.addChild(this.§+#A§);
         this.§`"K§ = new Bitmap(ItemInfoPanelBitmaps.§=!4§);
         this.§in var default§.addChild(this.§`"K§);
         this.§<!]§ = new Bitmap(ItemInfoPanelBitmaps.§if const override§);
         this.§in var default§.addChild(this.§<!]§);
         this.§+!O§ = new Bitmap(ItemInfoPanelBitmaps.§case for static§);
         this.§in var default§.addChild(this.§+!O§);
         this.§set for with§ = new Bitmap(ItemInfoPanelBitmaps.§get catch return§);
         this.§in var default§.addChild(this.§set for with§);
         this.§null for each§ = new Shape();
         this.§in var default§.addChild(this.§null for each§);
         this.§4!i§ = new Shape();
         this.§in var default§.addChild(this.§4!i§);
         this.§in var default§.x = HORIZONTAL_MARGIN;
         this.§`"n§ = new §#!q§(this.areaRect2.width);
         this.§`"n§.x = HORIZONTAL_MARGIN;
      }
      
      public function destroy() : void
      {
         this.window = null;
         this.inner = null;
         this.leftPreview = null;
         this.topPreview = null;
         this.§use set native§ = null;
         this.§7=§ = null;
         this.§[#O§ = null;
         this.§while package true§ = null;
         this.item = null;
         this.itemNameLabel = null;
         this.itemDescriptionLabel = null;
         this.scrollPane = null;
         this.scrollContainer = null;
         this.propertiesPanel = null;
         this.propertiesPanelLeft = null;
         this.propertiesPanelCenter = null;
         this.propertiesPanelRight = null;
         this.§in var default§ = null;
         this.§finally var package§ = null;
         this.§finally const super§ = null;
         this.§5l§ = null;
         this.§8!f§ = null;
         this.area = null;
         this.areaRect = null;
         this.areaRect2 = null;
         this.§2"1§ = null;
         this.buyButton = null;
         this.§3"6§.removeEventListener(MouseEvent.CLICK,this.§dynamic catch package§);
         this.§3"6§ = null;
         if(this.equipButton != null)
         {
            this.equipButton.removeEventListener(§6`§.§super for while§,this.§1!N§);
            this.equipButton.hideTime();
            this.equipButton = null;
         }
         if(this.upgradeButton != null)
         {
            this.upgradeButton.removeEventListener(MouseEvent.CLICK,this.onButtonUpgradeClick);
         }
         this.upgradeButton = null;
         this.§import for do§ = null;
         this.blinkEffect.stop();
         if(this.selectWindow)
         {
            dialogService.removeDialog(this.selectWindow);
            this.selectWindow = null;
         }
         this.§class catch var§.destroy();
         this.§class catch var§ = null;
         this.§in set try§ = null;
      }
      
      private function §dynamic catch package§(param1:MouseEvent) : void
      {
         §>P§(this.item.adapt(§>P§)).fit();
         this.§3"6§.enabled = false;
      }
      
      private function confScroll() : void
      {
         this.scrollPane.setStyle("downArrowUpSkin",ScrollArrowDownGreen);
         this.scrollPane.setStyle("downArrowDownSkin",ScrollArrowDownGreen);
         this.scrollPane.setStyle("downArrowOverSkin",ScrollArrowDownGreen);
         this.scrollPane.setStyle("downArrowDisabledSkin",ScrollArrowDownGreen);
         this.scrollPane.setStyle("upArrowUpSkin",ScrollArrowUpGreen);
         this.scrollPane.setStyle("upArrowDownSkin",ScrollArrowUpGreen);
         this.scrollPane.setStyle("upArrowOverSkin",ScrollArrowUpGreen);
         this.scrollPane.setStyle("upArrowDisabledSkin",ScrollArrowUpGreen);
         this.scrollPane.setStyle("trackUpSkin",ScrollTrackGreen);
         this.scrollPane.setStyle("trackDownSkin",ScrollTrackGreen);
         this.scrollPane.setStyle("trackOverSkin",ScrollTrackGreen);
         this.scrollPane.setStyle("trackDisabledSkin",ScrollTrackGreen);
         this.scrollPane.setStyle("thumbUpSkin",ScrollThumbSkinGreen);
         this.scrollPane.setStyle("thumbDownSkin",ScrollThumbSkinGreen);
         this.scrollPane.setStyle("thumbOverSkin",ScrollThumbSkinGreen);
         this.scrollPane.setStyle("thumbDisabledSkin",ScrollThumbSkinGreen);
      }
      
      private function hideIcons() : void
      {
         var _loc1_:§else package implements§ = null;
         for each(_loc1_ in this.propertiesParams)
         {
            if(this.propertiesPanel.contains(_loc1_.icon))
            {
               this.propertiesPanel.removeChild(_loc1_.icon);
            }
         }
      }
      
      private function showIcons() : void
      {
         var _loc1_:§else package implements§ = null;
         for each(_loc1_ in this.propertiesParams)
         {
            if(!this.propertiesPanel.contains(_loc1_.icon))
            {
               this.propertiesPanel.addChild(_loc1_.icon);
            }
         }
      }
      
      public function onLoadingComplete(param1:Resource) : void
      {
         if(this.§import for do§ == param1.id)
         {
            if(!this.§2"J§ && !itemService.§while try§(this.item))
            {
               this.§[#O§.bitmapData = ImageResource(param1).data;
               this.resize(this.size.x,this.size.y);
            }
         }
         if(this._topPreviewLoadingId == param1.id)
         {
            this.topPreview.bitmapData = ImageResource(param1).data;
            this.showBitmap(this.topPreview);
            this.resize(this.size.x,this.size.y);
         }
         if(this.§#F§ == param1.id)
         {
            if(this.§2"J§)
            {
               this.§use set native§.bitmapData = ImageResource(param1).data;
               this.showBitmap(this.§use set native§);
               this.resize(this.size.x,this.size.y);
            }
         }
         if(this.§4I§ == param1.id)
         {
            if(itemService.§while try§(this.item))
            {
               this.§while package true§.bitmapData = ImageResource(param1).data;
               this.showBitmap(this.§while package true§);
               this.resize(this.size.x,this.size.y);
            }
         }
      }
      
      public function showItemInfo(param1:IGameObject, param2:Boolean) : void
      {
         var _loc3_:ImageResource = null;
         var _loc4_:Boolean = false;
         var _loc5_:int = 0;
         var _loc6_:ItemPropertyValue = null;
         var _loc7_:§else package implements§ = null;
         var _loc8_:int = 0;
         var _loc9_:Vector.<IGameObject> = null;
         var _loc10_:Vector.<String> = null;
         var _loc11_:int = 0;
         var _loc12_:IGameObject = null;
         var _loc13_:ModInfoRow = null;
         var _loc14_:int = 0;
         var _loc15_:Vector.<UpgradableItemPropertyValue> = null;
         var _loc16_:int = 0;
         var _loc17_:int = 0;
         var _loc18_:int = 0;
         var _loc19_:Number = NaN;
         var _loc20_:int = 0;
         var _loc21_:IGameObject = null;
         var _loc22_:int = 0;
         var _loc23_:PresentItem = null;
         var _loc24_:ImageResource = null;
         var _loc25_:ImageResource = null;
         this.§use set native§.bitmapData = null;
         this.§while package true§.bitmapData = null;
         this.§[#O§.bitmapData = null;
         if(!param2 && !itemService.§while try§(param1))
         {
            this.updateUpgradeButton(param1);
         }
         removeChildrenFrom(this.§7=§);
         removeChildrenFrom(this.§in set try§);
         this.§`#r§(param2,this.item,param1);
         if(this.item != param1)
         {
            §var set function§.§3![§();
            this.item = param1;
         }
         if(param2 || !itemService.§!"p§(param1))
         {
            this.buyButton.setText(localeService.getText(TanksLocale.TEXT_GARAGE_INFO_PANEL_BUTTON_BUY_TEXT));
         }
         else
         {
            this.buyButton.setText(localeService.getText(TanksLocale.TEXT_GARAGE_INFO_PANEL_BUTTON_BUY_TEXT) + " M" + (itemService.getModificationIndex(param1) + 1));
         }
         this.itemNameLabel.text = itemService.getName(param1);
         this.itemDescriptionLabel.visible = !itemService.§while try§(param1);
         this.itemDescriptionLabel.htmlText = itemService.getDescription(param1);
         this.previewResource = itemService.getPreviewResource(param1);
         if(itemService.§2"J§(param1))
         {
            _loc3_ = GarageKit(param1.adapt(GarageKit)).getImage();
            this.§#F§ = _loc3_.id;
            if(_loc3_.isLazy && !_loc3_.isLoaded)
            {
               _loc3_.loadLazyResource(new ResourceLoadingWrapper(this));
            }
            this.§use set native§.bitmapData = _loc3_.data;
            if(this.§use set native§.bitmapData != null)
            {
               this.showBitmap(this.§use set native§);
            }
            else
            {
               removeDisplayObject(this.§use set native§);
            }
         }
         else if(itemService.§while try§(param1))
         {
            this.leftPreviewEnabled = false;
            _loc24_ = PresentItem(param1.adapt(PresentItem)).getImage();
            this.§4I§ = _loc24_.id;
            if(_loc24_.isLazy && !_loc24_.isLoaded)
            {
               _loc24_.loadLazyResource(new ResourceLoadingWrapper(this));
            }
            this.§while package true§.bitmapData = _loc24_.data;
            if(this.§while package true§.bitmapData != null)
            {
               this.showBitmap(this.§while package true§);
            }
            else
            {
               removeDisplayObject(this.§while package true§);
            }
         }
         else
         {
            _loc25_ = itemService.getPreviewResource(param1);
            this.§import for do§ = _loc25_.id;
            if(_loc25_.isLazy && !_loc25_.isLoaded)
            {
               _loc25_.loadLazyResource(new ResourceLoadingWrapper(this));
            }
            this.§[#O§.bitmapData = _loc25_.data;
         }
         this.maxRankIndex = itemService.§[!@§(param1);
         this.minRankIndex = itemService.§,$!§(param1);
         this.hideIcons();
         this.itemCategory = itemService.getCategory(param1);
         this.itemPrice = itemService.getPrice(param1);
         this.isCountable = itemService.isCountable(param1);
         var _loc26_:Boolean = this.itemCategory != ItemCategoryEnum.ARMOR && this.itemCategory != ItemCategoryEnum.WEAPON;
         var _loc27_:Vector.<ItemPropertyValue> = itemService.getProperties(param1);
         if(_loc27_ != null && _loc27_.length > 0)
         {
            this.propertiesParams.length = _loc27_.length;
            _loc4_ = false;
            _loc5_ = 0;
            while(_loc5_ < _loc27_.length)
            {
               _loc6_ = _loc27_[_loc5_];
               _loc7_ = propertyService.getParams(_loc6_.getProperty());
               this.propertiesParams[_loc5_] = _loc7_;
               if(_loc6_.isUpgradable() && _loc6_.getUpgradableValue().getMaxLevel() > 0)
               {
                  _loc4_ = true;
               }
               if(_loc26_)
               {
                  _loc8_ = UpgradeColors.getColorForValue(_loc6_);
                  _loc7_.icon.setValue(_loc6_.getValue(),_loc8_);
               }
               else
               {
                  _loc7_.icon.removeValue();
               }
               _loc5_++;
            }
            this.upgradeButton.visible = this.enabledUpgrades && !param2 && _loc4_;
            this.showIcons();
            if(!this.scrollContainer.contains(this.propertiesPanel))
            {
               this.scrollContainer.addChild(this.propertiesPanel);
            }
         }
         else
         {
            this.upgradeButton.visible = false;
            this.propertiesParams.length = 0;
            if(this.scrollContainer.contains(this.propertiesPanel))
            {
               this.scrollContainer.removeChild(this.propertiesPanel);
            }
         }
         if(itemService.§while try§(param1))
         {
            _loc23_ = PresentItem(param1.adapt(PresentItem));
            this.§class catch var§.update(_loc23_.getPresenterId(),_loc23_.getDate(),_loc23_.getText());
            this.§7=§.addChild(this.§class catch var§);
         }
         else
         {
            this.§class catch var§.§true for class§();
         }
         if(itemService.§2"J§(param1))
         {
            this.§2"J§ = true;
            this.§9#E§(param1);
         }
         else
         {
            this.§2"J§ = false;
            this.§break const final§();
            if(this.scrollContainer.contains(this.§import for switch§))
            {
               this.scrollContainer.removeChild(this.§import for switch§);
            }
         }
         if(this.itemCategory == ItemCategoryEnum.ARMOR || this.itemCategory == ItemCategoryEnum.WEAPON)
         {
            this.propertiesPanelLeft.bitmapData = ItemInfoPanelBitmaps.upgradeTableLeft;
            this.propertiesPanelCenter.bitmapData = ItemInfoPanelBitmaps.upgradeTableCenter;
            this.propertiesPanelRight.bitmapData = ItemInfoPanelBitmaps.upgradeTableRight;
            this.showModTable();
            this.modTable.select(itemService.getModificationIndex(param1));
            _loc9_ = itemService.§;#U§(param1);
            _loc10_ = new Vector.<String>(this.propertiesParams.length);
            if(_loc9_.length == 1)
            {
               _loc11_ = 0;
               while(_loc11_ < this.modTable.rows.length)
               {
                  _loc13_ = ModInfoRow(this.modTable.rows[_loc11_]);
                  if(_loc11_ > 0)
                  {
                     _loc13_.visible = false;
                  }
                  _loc11_++;
               }
            }
            else
            {
               _loc11_ = 0;
               while(_loc11_ < this.modTable.rows.length)
               {
                  (_loc13_ = ModInfoRow(this.modTable.rows[_loc11_])).visible = true;
                  _loc11_++;
               }
            }
            _loc11_ = 0;
            while(_loc11_ < _loc9_.length)
            {
               _loc12_ = _loc9_[_loc11_];
               _loc13_ = ModInfoRow(this.modTable.rows[_loc11_]);
               _loc13_.upgradeIndicator.visible = _loc9_.length != 1;
               _loc13_.costLabel.text = Money.numToString(itemService.getPriceWithoutDiscount(_loc12_),false);
               if(_loc14_ < _loc13_.costLabel.width)
               {
                  _loc14_ = _loc13_.costLabel.width;
               }
               this.modTable.maxCostWidth = _loc14_;
               _loc13_.rankIcon.setRank(itemService.§,$!§(_loc12_));
               _loc15_ = itemService.getUpgradableProperties(_loc12_);
               _loc5_ = 0;
               while(_loc5_ < _loc15_.length)
               {
                  _loc6_ = UpgradableItemPropertyValue(_loc15_[_loc5_]);
                  _loc7_ = propertyService.getParams(_loc6_.getProperty());
                  if(_loc7_ != null)
                  {
                     _loc10_[_loc5_] = _loc6_.getValue();
                  }
                  _loc5_++;
               }
               _loc13_.setLabelsNum(_loc15_.length);
               _loc13_.setLabelsText(_loc15_);
               _loc11_++;
            }
            this.modTable.correctNonintegralValues();
         }
         else
         {
            this.propertiesPanelLeft.bitmapData = ItemInfoPanelBitmaps.propertiesLeft;
            this.propertiesPanelCenter.bitmapData = ItemInfoPanelBitmaps.propertiesCenter;
            this.propertiesPanelRight.bitmapData = ItemInfoPanelBitmaps.propertiesRight;
            this.hideModTable();
         }
         if(itemService.§while try§(param1))
         {
            this.§^!&§.visible = true;
            this.§^!&§.enabled = true;
            this.buyButton.visible = false;
            this.equipButton.visible = false;
         }
         else
         {
            this.§^!&§.visible = false;
            if(param2)
            {
               this.buyButton.visible = true;
               this.equipButton.visible = false;
            }
            else if(this.itemCategory == ItemCategoryEnum.INVENTORY)
            {
               this.buyButton.visible = true;
               this.equipButton.visible = false;
            }
            else
            {
               this.buyButton.visible = false;
               if(this.itemCategory == ItemCategoryEnum.PLUGIN || this.itemCategory == ItemCategoryEnum.EMBLEM)
               {
                  this.equipButton.visible = false;
               }
               else
               {
                  this.equipButton.visible = true;
                  if(this.itemCategory == ItemCategoryEnum.ARMOR || this.itemCategory == ItemCategoryEnum.WEAPON)
                  {
                     this.buyButton.visible = itemService.getModificationIndex(param1) < 3 && _loc9_.length > 1;
                  }
               }
            }
         }
         if(this.buyButton.visible)
         {
            _loc16_ = getRequiredRank(userPropertiesService.rank,itemService.§,$!§(param1),itemService.§[!@§(param1));
            _loc17_ = 1;
            if(this.isCountable)
            {
               this.inventoryNumStepper.visible = true;
               _loc20_ = Math.min(INVENTORY_MAX_VALUE,Math.floor(moneyService.crystal / this.itemPrice));
               if(_loc16_ > 0)
               {
                  if(_loc20_ > 0)
                  {
                     this.inventoryNumStepper.enabled = true;
                     this.inventoryNumStepper.alpha = 1;
                  }
                  else
                  {
                     this.inventoryNumStepper.enabled = false;
                     this.inventoryNumStepper.alpha = 0.7;
                  }
               }
               else
               {
                  this.inventoryNumStepper.enabled = false;
                  this.inventoryNumStepper.alpha = 0.7;
                  this.inventoryNumStepper.value = 1;
               }
               _loc18_ = itemService.getPrice(param1);
               _loc19_ = itemService.getDiscount(param1);
               _loc17_ = this.inventoryNumStepper.value;
            }
            else if(!param2 && itemService.§!"p§(param1))
            {
               this.inventoryNumStepper.visible = false;
               this.inventoryNumStepper.enabled = false;
               _loc21_ = itemService.§6#y§(param1);
               _loc18_ = itemService.getPrice(_loc21_);
               _loc19_ = itemService.getDiscount(_loc21_);
               _loc22_ = itemService.§,$!§(_loc21_);
               _loc16_ = userPropertiesService.rank >= _loc22_ ? int(_loc22_) : int(-_loc22_);
            }
            else
            {
               _loc18_ = itemService.getPrice(param1);
               _loc19_ = itemService.getDiscount(param1);
               this.inventoryNumStepper.visible = false;
               this.inventoryNumStepper.enabled = false;
            }
            this.buyButton.setInfo(_loc18_,_loc17_,_loc16_,itemService.§static set default§(param1));
         }
         else
         {
            this.inventoryNumStepper.visible = false;
         }
         this.updateBlinkEffect();
         this.setButtonsPosition();
         this.updateEquipButton();
         if(this.itemCategory == ItemCategoryEnum.PLUGIN && !param2)
         {
            if(!this.scrollContainer.contains(this.timeIndicator))
            {
               this.scrollContainer.addChild(this.timeIndicator);
            }
            this.setTimeRemaining(ITemporaryItem(param1.adapt(ITemporaryItem)).getStopDate());
         }
         else if(this.scrollContainer.contains(this.timeIndicator))
         {
            this.scrollContainer.removeChild(this.timeIndicator);
         }
         if(!(this.§2"1§.visible = !param1.hasModel(§6<§)))
         {
            §6<§(param1.event(§6<§)).updateActionElements(this.§in set try§);
         }
      }
      
      private function §9#E§(param1:IGameObject) : void
      {
         if(!this.scrollContainer.contains(this.§in var default§))
         {
            this.scrollContainer.addChild(this.§in var default§);
         }
         if(!this.scrollContainer.contains(this.§`"n§))
         {
            this.scrollContainer.addChild(this.§`"n§);
         }
         this.§`"n§.show(param1);
      }
      
      private function §break const final§() : void
      {
         if(this.scrollContainer.contains(this.§in var default§))
         {
            this.scrollContainer.removeChild(this.§in var default§);
         }
         if(this.scrollContainer.contains(this.§`"n§))
         {
            this.scrollContainer.removeChild(this.§`"n§);
         }
      }
      
      public function updateEquipButton() : void
      {
         this.§1J§();
         if(Boolean(lobbyLayoutService.inBattle()) && !battleInfoService.reArmorEnabled)
         {
            this.equipButton.enabled = false;
            return;
         }
         if(this.§else for else§())
         {
            this.§for try§();
         }
         else
         {
            this.equipButton.enabled = false;
            this.equipButton.hideTime();
         }
      }
      
      private function §else for else§() : Boolean
      {
         return itemService.§include for each§(this.item) && itemService.§null var continue§(this.item) && !itemService.§,!S§(this.item);
      }
      
      private function §for try§() : void
      {
         var _loc1_:CountDownTimer = §super set dynamic§.§+N§(this.item);
         if(Boolean(lobbyLayoutService.inBattle()) && _loc1_.getRemainingSeconds() > 0 && !itemService.§,!S§(this.item))
         {
            this.equipButton.startTimer(_loc1_);
            this.equipButton.addEventListener(§6`§.§super for while§,this.§1!N§);
         }
         else
         {
            this.equipButton.hideTime();
            this.equipButton.enabled = true;
         }
      }
      
      private function §1J§() : void
      {
         if(this.§else for else§())
         {
            this.equipButton.label = localeService.getText(TanksLocale.TEXT_GARAGE_INFO_PANEL_BUTTON_EQUIP_TEXT);
         }
         else
         {
            this.equipButton.label = localeService.getText(TanksLocale.TEXT_GARAGE_EQUIPPED_TEXT);
         }
      }
      
      private function §1!N§(param1:§6`§) : void
      {
         this.equipButton.enabled = true;
         this.equipButton.removeEventListener(§6`§.§super for while§,this.§1!N§);
      }
      
      private function §`#r§(param1:Boolean, param2:IGameObject, param3:IGameObject) : void
      {
         if(param1 && itemService.getCategory(param3) == ItemCategoryEnum.COLOR && !battleInfoService.isInBattle())
         {
            this.§3"6§.visible = true;
            if(param2 != param3)
            {
               this.§3"6§.enabled = true;
            }
         }
         else
         {
            this.§3"6§.visible = false;
         }
      }
      
      private function onButtonUpgradeClick(param1:MouseEvent) : void
      {
         var _loc2_:UpgradableItemPropertyValue = null;
         var _loc3_:UpgradableItem = UpgradableItem(this.item.adapt(UpgradableItem));
         var _loc4_:Vector.<UpgradableItemPropertyValue> = itemService.getUpgradableProperties(this.item);
         if(_loc3_.isUpgrading())
         {
            _loc2_ = _loc3_.getUpgradingValue();
            if(moneyService.§while package dynamic§(_loc2_.getSpeedUpCost()))
            {
               dispatchEvent(new ItemPropertyUpgradeEvent(ItemPropertyUpgradeEvent.SPEED_UP,_loc2_));
            }
         }
         else
         {
            this.showSelectUpgradeWindow(_loc4_);
         }
      }
      
      private function showSelectUpgradeWindow(param1:Vector.<UpgradableItemPropertyValue>) : void
      {
         if(itemService.§!"p§(this.item))
         {
            this.selectWindow = new SelectUpgradeWindow(param1,itemService.getModificationIndex(this.item),itemService.hasNextModification(this.item));
         }
         else
         {
            this.selectWindow = new SelectUpgradeWindow(param1);
         }
         this.selectWindow.addEventListener(ItemPropertyUpgradeEvent.SELECT_WINDOW_CLOSED,this.onSelectWindowClosed);
         this.selectWindow.addEventListener(ItemPropertyUpgradeEvent.SPEED_UP,this.onSpeedUp);
         this.selectWindow.addEventListener(ItemPropertyUpgradeEvent.UPGRADE_STARTED,this.onUpgradeStarted);
         this.selectWindow.addEventListener(ItemPropertyUpgradeEvent.FLUSH_UPGRADES,this.onFlushUpgrades);
         dialogService.addDialog(this.selectWindow);
      }
      
      private function onSelectWindowClosed(param1:Event) : void
      {
         this.selectWindow.removeEventListener(ItemPropertyUpgradeEvent.SELECT_WINDOW_CLOSED,this.onSelectWindowClosed);
         this.selectWindow.removeEventListener(ItemPropertyUpgradeEvent.SPEED_UP,this.onSpeedUp);
         this.selectWindow.removeEventListener(ItemPropertyUpgradeEvent.UPGRADE_STARTED,this.onUpgradeStarted);
         this.selectWindow.removeEventListener(ItemPropertyUpgradeEvent.FLUSH_UPGRADES,this.onFlushUpgrades);
         dialogService.removeDialog(this.selectWindow);
         this.selectWindow = null;
      }
      
      private function updateUpgradeButton(param1:IGameObject) : void
      {
         var _loc2_:UpgradableItem = null;
         var _loc3_:UpgradableItemPropertyValue = null;
         if(param1.hasModel(UpgradableItem))
         {
            _loc2_ = UpgradableItem(param1.adapt(UpgradableItem));
            if(_loc2_.isUpgrading())
            {
               _loc3_ = _loc2_.getUpgradingValue();
               this.upgradeButton.setUpgradingButton(_loc2_.getCountDownTimer(),_loc3_);
            }
            else if(itemService.isFullUpgraded(param1))
            {
               this.upgradeButton.setUpgradedButton();
            }
            else
            {
               this.upgradeButton.setUpgradeButton();
            }
         }
      }
      
      private function onFlushUpgrades(param1:ItemPropertyUpgradeEvent) : void
      {
         dispatchEvent(new ItemPropertyUpgradeEvent(param1.type));
      }
      
      private function onSpeedUp(param1:ItemPropertyUpgradeEvent) : void
      {
         dispatchEvent(new ItemPropertyUpgradeEvent(param1.type,param1.getPropertyValue()));
      }
      
      private function onUpgradeStarted(param1:ItemPropertyUpgradeEvent) : void
      {
         this.upgradeButton.setUpgradingButton(param1.getTimer(),param1.getPropertyValue());
         dispatchEvent(new ItemPropertyUpgradeEvent(param1.type,param1.getPropertyValue(),param1.getTimer()));
         this.startBlinkEffect(param1.getPropertyValue().getProperty());
      }
      
      private function setButtonsPosition() : void
      {
         var _loc1_:int = this.§in set try§.y;
         if(this.buyButton.visible)
         {
            this.buyButton.y = _loc1_;
            if(this.isCountable)
            {
               this.inventoryNumStepper.x = -7;
               this.inventoryNumStepper.y = this.buyButton.y + Math.round((BUTTON_SIZE.y - this.inventoryNumStepper.height) * 0.5);
               this.buyButton.x = this.inventoryNumStepper.x + this.inventoryNumStepper.width + 10;
            }
            else
            {
               this.buyButton.x = this.margin;
            }
         }
         if(this.equipButton.visible)
         {
            this.equipButton.y = _loc1_;
            this.equipButton.x = this.size.x - this.margin - BUTTON_SIZE.x;
         }
         if(this.§3"6§.visible)
         {
            this.§3"6§.y = _loc1_;
            this.§3"6§.x = this.size.x - this.margin - BUTTON_SIZE.x;
         }
         this.upgradeButton.y = _loc1_;
         this.upgradeButton.x = this.margin + BUTTON_SIZE.x + 15;
         this.§^!&§.x = this.margin;
         this.§^!&§.y = _loc1_;
      }
      
      public function resize(param1:int, param2:int) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:ItemPropertyIcon = null;
         var _loc10_:ModInfoRow = null;
         var _loc11_:Vector.<Number> = null;
         var _loc12_:BitmapData = null;
         this.scrollPane.update();
         this.size.x = param1;
         this.size.y = param2;
         this.window.width = param1;
         this.window.height = param2;
         this.inner.width = param1 - this.margin * 2;
         this.inner.height = param2 - this.margin - BOTTOM_MARGIN;
         this.areaRect.width = param1 - this.margin * 2 - 2;
         this.areaRect2.width = this.areaRect.width - HORIZONTAL_MARGIN * 2;
         this.itemDescriptionLabel.x = HORIZONTAL_MARGIN - 3;
         this.itemDescriptionLabel.width = this.areaRect2.width;
         var _loc13_:int = int(this.propertiesParams.length);
         if(_loc13_ > 0)
         {
            _loc3_ = this.propertiesPanel.y + this.propertiesPanel.height + VERTICAL_MARGIN;
            this.propertiesPanelRight.x = this.areaRect2.width - this.propertiesPanelRight.width;
            this.propertiesPanelCenter.width = this.propertiesPanelRight.x - this.propertiesPanelCenter.x;
            _loc4_ = 6;
            _loc6_ = _loc5_ = ItemInfoPanelBitmaps.armor.width * _loc13_ + ICON_SPACING_H * (_loc13_ - 1);
            if(this.scrollContainer.contains(this.modTable))
            {
               _loc6_ += this.modTable.constWidth;
            }
            _loc7_ = Math.round((this.propertiesPanel.width - _loc6_) * 0.5);
            if(this.itemCategory == ItemCategoryEnum.COLOR || this.itemCategory == ItemCategoryEnum.INVENTORY)
            {
               _loc8_ = 0;
               while(_loc8_ < _loc13_)
               {
                  (_loc9_ = this.propertiesParams[_loc8_].icon).x = _loc7_ + _loc8_ * (ItemInfoPanelBitmaps.armor.width + ICON_SPACING_H);
                  _loc9_.y = _loc4_;
                  _loc8_++;
               }
            }
            else
            {
               for each(_loc10_ in this.modTable.rows)
               {
                  _loc10_.updatePositions();
               }
               _loc11_ = _loc10_.getPositions();
               _loc8_ = 0;
               while(_loc8_ < _loc11_.length)
               {
                  (_loc9_ = this.propertiesParams[_loc8_].icon).x = _loc11_[_loc8_] - _loc9_.width / 2;
                  _loc9_.y = _loc4_;
                  _loc8_++;
               }
               this.modTable.y = this.propertiesPanel.y + _loc9_.height + 2;
            }
            this.itemDescriptionLabel.y = this.propertiesPanel.y + this.propertiesPanel.height + VERTICAL_MARGIN - 4;
         }
         else
         {
            this.itemDescriptionLabel.y = this.areaRect2.y + 24 - 7;
         }
         if(this.§use set native§.bitmapData != null)
         {
            this.§use set native§.y = this.itemNameLabel.y + this.itemNameLabel.height + VERTICAL_MARGIN - TOP_PREVIEW_WITH_NAME_PENETRATION_SIZE;
            this.§use set native§.x = this.scrollContainer.width - this.§use set native§.width >> 1;
            this.itemDescriptionLabel.y += this.§use set native§.bitmapData.height + VERTICAL_MARGIN - TOP_PREVIEW_WITH_NAME_PENETRATION_SIZE;
         }
         if(this.§while package true§.bitmapData != null)
         {
            this.§while package true§.y = this.itemNameLabel.y + this.itemNameLabel.height + VERTICAL_MARGIN - TOP_PREVIEW_WITH_NAME_PENETRATION_SIZE;
            this.§while package true§.x = this.scrollContainer.width - this.§while package true§.width >> 1;
            this.itemDescriptionLabel.y += this.§while package true§.bitmapData.height + VERTICAL_MARGIN - TOP_PREVIEW_WITH_NAME_PENETRATION_SIZE;
         }
         _loc3_ += VERTICAL_MARGIN + this.itemDescriptionLabel.textHeight - 4;
         var _loc14_:int = _loc3_;
         var _loc15_:* = this.§[#O§.bitmapData != null;
         if(_loc15_)
         {
            this.§[#O§.x = PREVIEW_OFFSET_X;
            if(_loc13_ > 0)
            {
               this.§[#O§.y = this.propertiesPanel.y + this.propertiesPanel.height + VERTICAL_MARGIN;
            }
            else
            {
               this.§[#O§.y = this.areaRect2.y + 24;
            }
            this.itemDescriptionLabel.x = this.§[#O§.x + this.§[#O§.width + PREVIEW_OFFSET_X - 3;
            this.itemDescriptionLabel.width = this.areaRect2.width - this.itemDescriptionLabel.x - 3;
            _loc3_ = Math.max(this.itemDescriptionLabel.y + 3 + this.itemDescriptionLabel.textHeight + VERTICAL_MARGIN,this.§[#O§.y + this.§[#O§.height + VERTICAL_MARGIN);
         }
         else
         {
            _loc3_ = this.itemDescriptionLabel.y + 3 + this.itemDescriptionLabel.textHeight + VERTICAL_MARGIN;
         }
         var _loc16_:int = Math.max(_loc3_,param2 - this.margin - BOTTOM_MARGIN - 2 - MODULE_SPACING * 2);
         this.areaRect.height = _loc16_;
         this.areaRect2.height = this.area.height - VERTICAL_MARGIN * 2;
         if(_loc16_ > param2 - this.margin - BOTTOM_MARGIN - 2 - MODULE_SPACING * 2)
         {
            _loc15_ = false;
            this.itemDescriptionLabel.x = HORIZONTAL_MARGIN - 3;
            this.itemDescriptionLabel.width = this.areaRect2.width;
            _loc3_ = _loc14_;
            _loc16_ = Math.max(_loc3_,param2 - this.margin - BOTTOM_MARGIN - 2 - MODULE_SPACING * 2);
            this.areaRect.height = _loc16_;
            this.areaRect2.height = this.area.height - VERTICAL_MARGIN * 2;
         }
         if(this.§2"J§)
         {
            this.§native for finally§(this.§use set native§);
            this.§in var default§.y = this.§use set native§.bitmapData != null && this.scrollContainer.contains(this.§use set native§) ? Number(int(this.§use set native§.height + this.itemNameLabel.height + §in set each§ * 2)) : Number(int(this.itemNameLabel.height) + §in set each§);
            this.§`"n§.y = this.§in var default§.y;
            this.itemDescriptionLabel.y = this.§in var default§.y + this.§`"n§.§'!Z§() + 10;
            this.§5l§.x = this.areaRect2.width - this.§5l§.width;
            this.§finally const super§.width = this.§5l§.x - this.§finally const super§.x;
            this.§8!f§.y = this.§finally var package§.height;
            this.§8!f§.height = this.§`"n§.§get set with§();
            this.§each var throw§.y = this.§5l§.height;
            this.§each var throw§.height = this.§8!f§.height;
            this.§each var throw§.x = this.areaRect2.width - this.§each var throw§.width;
            this.§import var native§.y = this.§8!f§.height + this.§finally var package§.height;
            this.§>#'§.y = this.§import var native§.y;
            this.§>#'§.x = this.§each var throw§.x;
            this.§false set native§.x = this.§import var native§.width;
            this.§false set native§.y = this.§>#'§.y;
            this.§false set native§.width = this.§>#'§.x - this.§false set native§.x;
            this.§+!O§.y = this.§false set native§.y + this.§false set native§.height;
            this.§+!O§.height = this.§`"n§.§null for override§();
            this.§set for with§.y = this.§+!O§.y;
            this.§set for with§.height = this.§+!O§.height;
            this.§set for with§.x = this.§each var throw§.x;
            this.§+#A§.y = this.§+!O§.y + this.§+!O§.height;
            this.§`"K§.y = this.§+#A§.y;
            this.§`"K§.x = this.§>#'§.x;
            this.§<!]§.y = this.§+#A§.y + this.§+#A§.height - this.§<!]§.height;
            this.§<!]§.x = this.§+#A§.width;
            this.§<!]§.width = this.§finally const super§.width;
            _loc12_ = ItemInfoPanelBitmaps.§null const in§;
            this.§null for each§.graphics.clear();
            this.§null for each§.graphics.beginBitmapFill(_loc12_);
            this.§null for each§.graphics.drawRect(this.§finally var package§.width,this.§finally var package§.height,this.§finally const super§.width,this.§8!f§.height);
            this.§4!i§.graphics.clear();
            this.§4!i§.graphics.beginBitmapFill(_loc12_);
            this.§4!i§.graphics.drawRect(this.§import var native§.width,this.§import var native§.y + this.§import var native§.height,this.§<!]§.width,this.§+!O§.height);
         }
         if(Boolean(this.item) && itemService.§while try§(this.item))
         {
            this.§class catch var§.y = this.§while package true§.bitmapData != null && this.scrollContainer.contains(this.§while package true§) ? Number(this.§while package true§.height + this.itemNameLabel.height + 20) : Number(this.itemNameLabel.height + 10);
            this.§class catch var§.§import package switch§(this.areaRect2.width);
         }
         this.area.graphics.clear();
         this.area.graphics.beginFill(16711680,0);
         this.area.graphics.drawRect(this.areaRect.x,this.areaRect.y,this.areaRect.width,this.areaRect.height);
         if(_loc15_)
         {
            if(this.item != null && this.§[#O§ != null && this.§[#O§.parent == null)
            {
               this.showBitmap(this.§[#O§);
            }
         }
         else
         {
            removeDisplayObject(this.§[#O§);
         }
         this.§in set try§.y = this.size.y - this.margin - BUTTON_SIZE.y + 1;
         this.setButtonsPosition();
         this.scrollPane.setSize(param1 - this.margin * 2 - 2 + 6,param2 - this.margin - BOTTOM_MARGIN - 2 - MODULE_SPACING * 2);
         this.scrollPane.update();
         if(this.scrollContainer.contains(this.timeIndicator))
         {
            this.timeIndicator.x = this.areaRect2.x + this.areaRect2.width - this.timeIndicator.width + 3;
            this.timeIndicator.y = this.areaRect2.y - 7;
         }
      }
      
      public function hideModTable() : void
      {
         if(this.scrollContainer.contains(this.modTable))
         {
            this.scrollContainer.removeChild(this.modTable);
         }
      }
      
      public function showModTable() : void
      {
         if(!this.scrollContainer.contains(this.modTable))
         {
            this.scrollContainer.addChild(this.modTable);
         }
      }
      
      private function §native for finally§(param1:Bitmap) : void
      {
         if(this.§use set native§.height > 0)
         {
            param1.y += §in set each§;
            this.§import for switch§.text = "-" + String(itemService.getDiscount(this.item)) + "%";
            this.§import for switch§.filters = [new DropShadowFilter(1,45,0,0.7,1,1,1)];
            this.§import for switch§.x = 302;
            this.§import for switch§.y = int(this.itemNameLabel.height + §in set each§) + 168;
            if(localeService.language == "cn")
            {
               this.§import for switch§.x = 300;
            }
            if(!this.scrollContainer.contains(this.§import for switch§))
            {
               this.scrollContainer.addChild(this.§import for switch§);
            }
            else
            {
               this.scrollContainer.removeChild(this.§import for switch§);
               this.scrollContainer.addChild(this.§import for switch§);
            }
         }
      }
      
      private function §extends for switch§(param1:Bitmap) : void
      {
         this.hideBitmap(param1);
         if(this.scrollContainer.contains(this.§import for switch§))
         {
            this.scrollContainer.removeChild(this.§import for switch§);
         }
      }
      
      private function showBitmap(param1:Bitmap) : void
      {
         if(param1.bitmapData != null && !this.§7=§.contains(param1))
         {
            this.§7=§.addChild(param1);
         }
      }
      
      private function hideBitmap(param1:Bitmap) : void
      {
         if(this.scrollContainer.contains(param1))
         {
            this.scrollContainer.removeChild(param1);
         }
      }
      
      public function get leftPreviewEnabled() : Boolean
      {
         return this._leftPreviewEnabled;
      }
      
      public function set leftPreviewEnabled(param1:Boolean) : void
      {
         this._leftPreviewEnabled = param1;
      }
      
      private function setTimeRemaining(param1:Date) : void
      {
         var _loc2_:String = null;
         var _loc3_:String = null;
         var _loc4_:String = null;
         var _loc5_:String = null;
         if(isNaN(param1.date))
         {
            this.timeIndicator.text = " ";
         }
         else
         {
            _loc2_ = (param1.hours < 10 ? "0" + String(param1.hours) : String(param1.hours)) + ":" + (param1.minutes < 10 ? "0" + String(param1.minutes) : String(param1.minutes));
            _loc3_ = param1.month + 1 < 10 ? "0" + String(param1.month + 1) : String(param1.month + 1);
            _loc4_ = param1.date < 10 ? "0" + String(param1.date) : String(param1.date);
            if(localeService.getText(TanksLocale.TEXT_GUI_LANG) == "ru")
            {
               _loc5_ = _loc4_ + "-" + _loc3_ + "-" + String(param1.fullYear);
            }
            else
            {
               _loc5_ = _loc3_ + "-" + _loc4_ + "-" + String(param1.fullYear);
            }
            this.timeIndicator.text = _loc2_ + "  " + _loc5_;
         }
         this.resize(this.size.x,this.size.y);
      }
      
      private function inventoryNumChanged(param1:Event = null) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = getRequiredRank(userPropertiesService.rank,this.minRankIndex,this.maxRankIndex);
         var _loc4_:int = this.isCountable ? int(this.inventoryNumStepper.value) : int(1);
         if(moneyService.crystal >= this.itemPrice * _loc4_)
         {
            _loc2_ = this.itemPrice * _loc4_;
         }
         else
         {
            _loc2_ = -this.itemPrice * _loc4_;
         }
         this.buyButton.setInfo(itemService.getPrice(this.item),_loc4_,_loc3_,itemService.§static set default§(this.item));
         this.setButtonsPosition();
      }
      
      public function propertyUpgraded(param1:UpgradableItemPropertyValue) : void
      {
         if(this.selectWindow != null)
         {
            this.selectWindow.propertyUpgraded(param1);
         }
         this.showItemInfo(this.item,false);
         this.resize(this.size.x,this.size.y);
         GlowEffect.glow(this.getLabelByProperty(param1.getProperty()),UpgradeColors.getColorForValue(param1));
         this.blinkEffect.stop();
      }
      
      private function updateBlinkEffect() : void
      {
         if(itemService.isUpgrading(this.item))
         {
            this.startBlinkEffect(itemService.getUpgradingProperty(this.item));
         }
         else
         {
            this.blinkEffect.stop();
         }
      }
      
      private function startBlinkEffect(param1:ItemGarageProperty) : void
      {
         this.blinkEffect.start(this.getLabelByProperty(param1));
      }
      
      private function getLabelByProperty(param1:ItemGarageProperty) : DisplayObject
      {
         var _loc2_:int = 0;
         var _loc3_:ModInfoRow = null;
         var _loc4_:Vector.<ItemPropertyValue> = null;
         var _loc5_:int = 0;
         if(itemService.§!"p§(this.item))
         {
            _loc2_ = itemService.getModificationIndex(this.item);
            _loc3_ = this.modTable.rows[_loc2_];
            _loc4_ = itemService.getProperties(this.item);
            _loc5_ = 0;
            return _loc3_.labels[_loc5_];
         }
         return propertyService.getParams(param1).icon.getLabel();
      }
   }
}

