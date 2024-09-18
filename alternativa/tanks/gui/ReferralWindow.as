package alternativa.tanks.gui
{
   import §^#l§.§,#l§;
   import alternativa.osgi.service.locale.ILocaleService;
   import assets.Diamond;
   import assets.icons.InputCheckIcon;
   import controls.TankWindow;
   import controls.TankWindowHeader;
   import controls.TankWindowInner;
   import controls.TextArea;
   import controls.base.DefaultButtonBase;
   import controls.base.LabelBase;
   import controls.base.TankInputBase;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.display.Loader;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.net.URLRequest;
   import flash.system.ApplicationDomain;
   import flash.system.LoaderContext;
   import flash.system.System;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFieldType;
   import forms.registration.CallsignIconStates;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   import §static final§.§continue package do§;
   
   public class ReferralWindow extends Sprite
   {
      [Inject]
      public static var localeService:ILocaleService;
      
      private static const §`"Z§:String = "tankiref.swf";
      
      private static const CHANNEL:String = "ReferralWindow";
      
      private static const §final throw§:Class = §return package import§;
      
      private static const §include null§:BitmapData = new §final throw§().bitmapData;
      
      private static const §implements var var§:Class = §dynamic package super§;
      
      private static const §`!5§:BitmapData = new §implements var var§().bitmapData;
      
      private static const §3#b§:Class = §class const case§;
      
      private static const §5!=§:BitmapData = new §3#b§().bitmapData;
      
      private static const §]"'§:Class = §continue set extends§;
      
      private static const §class package null§:BitmapData = new §]"'§().bitmapData;
      
      private var §switch const switch§:§,#l§;
      
      private var §const catch for§:§,#l§;
      
      private var §continue package override§:§,#l§;
      
      public var closeButton:DefaultButtonBase;
      
      public var statButton:§8#k§;
      
      private var §2"Q§:DefaultButtonBase;
      
      private var §;v§:DefaultButtonBase;
      
      private var sendButton:DefaultButtonBase;
      
      private var window:TankWindow;
      
      private var §%#U§:TankWindowInner;
      
      private var §static set each§:TankWindowInner;
      
      private var §extends package return§:TankWindowInner;
      
      private var §2!S§:TankWindowInner;
      
      private var §super set finally§:TankWindowInner;
      
      private var §each var static§:TankWindowInner;
      
      private var §in for implements§:Bitmap;
      
      private var §continue static§:Bitmap;
      
      public var § !k§:§#"M§;
      
      private var §3"H§:Sprite;
      
      private var §"d§:Sprite;
      
      private var §super for function§:Sprite;
      
      private var §override const super§:Sprite;
      
      private var §true set use§:Sprite;
      
      private var banner:DisplayObject;
      
      private var §package package each§:InputCheckIcon;
      
      private var infoLabel:LabelBase;
      
      private var §throw const break§:LabelBase;
      
      private var §+"W§:TankInputBase;
      
      private var §each catch get§:TextArea;
      
      private var §case for in§:LabelBase;
      
      public var §["[§:TankInputBase;
      
      private var §in package null§:LabelBase;
      
      private var §super set override§:LabelBase;
      
      private var §implements const set§:TankInputBase;
      
      private var §7"+§:TextArea;
      
      private var §import set final§:LabelBase;
      
      private var §!"?§:LabelBase;
      
      private var crystalLabel:LabelBase;
      
      private var §use var switch§:LabelBase;
      
      private var loader:Loader;
      
      public var windowSize:Point;
      
      private const windowMargin:int = 12;
      
      private const margin:int = 9;
      
      private const §^#m§:int = 4;
      
      private const space:int = 0;
      
      private var state:int;
      
      private const §final class§:int = 0;
      
      private const §^#3§:int = 1;
      
      private const §break var switch§:int = 2;
      
      private const §!"v§:int = 3;
      
      private const §false catch function§:int = 4;
      
      private var §false var switch§:String;
      
      private const §switch package continue§:int = 104;
      
      public var crystalIcon:Diamond;
      
      private var userName:String;
      
      public function ReferralWindow(param1:String, param2:String, param3:String, param4:String, param5:String, param6:String)
      {
         var tableLinkURL:String;
         var headerBd:BitmapData;
         var bannerXmlPath:String;
         var context:LoaderContext = null;
         var userName:String = param1;
         var bannerCodeString:String = param2;
         var url:String = param3;
         var §false var switch§:String = param4;
         var host:String = param5;
         var hash:String = param6;
         this.buttonSize = new Point(104,33);
         this.bannerSize = new Point(468,120);
         tableLinkURL = null;
         super();
         this.userName = userName;
         this.§false var switch§ = §false var switch§.split("\n\r").join("\n").split("\r\n").join("\n");
         this.window = new TankWindow();
         addChild(this.window);
         this.window.headerLang = localeService.getText(TanksLocale.TEXT_GUI_LANG);
         this.window.header = TankWindowHeader.REFERALS;
         this.§switch const switch§ = new §,#l§();
         this.§switch const switch§.icon = §5!=§;
         addChild(this.§switch const switch§);
         this.§switch const switch§.label = localeService.getText(TanksLocale.TEXT_REFERAL_WINDOW_BUTTON_GET_LINK_TEXT);
         this.§switch const switch§.addEventListener(MouseEvent.CLICK,this.§-W§);
         this.§const catch for§ = new §,#l§();
         this.§const catch for§.icon = §class package null§;
         addChild(this.§const catch for§);
         this.§const catch for§.label = localeService.getText(TanksLocale.TEXT_REFERAL_WINDOW_BUTTON_GET_BANNER_TEXT);
         this.§const catch for§.addEventListener(MouseEvent.CLICK,this.§continue switch§);
         this.§continue package override§ = new §,#l§();
         this.§continue package override§.icon = §`!5§;
         addChild(this.§continue package override§);
         this.§continue package override§.label = localeService.getText(TanksLocale.TEXT_REFERAL_WINDOW_BUTTON_INVITE_BY_EMAIL_TEXT);
         this.§continue package override§.addEventListener(MouseEvent.CLICK,this.§,R§);
         this.statButton = new §8#k§();
         addChild(this.statButton);
         this.statButton.label = localeService.getText(TanksLocale.TEXT_REFERAL_WINDOW_BUTTON_STATISTICS_TEXT);
         this.statButton.addEventListener(MouseEvent.CLICK,this.§for set for§);
         this.closeButton = new DefaultButtonBase();
         addChild(this.closeButton);
         this.closeButton.label = localeService.getText(TanksLocale.TEXT_REFERAL_WINDOW_BUTTON_CLOSE_TEXT);
         this.§each var static§ = new TankWindowInner(0,0,TankWindowInner.GREEN);
         this.§each var static§.x = this.windowMargin;
         this.§each var static§.y = this.windowMargin;
         addChild(this.§each var static§);
         this.§each var static§.visible = false;
         this.§throw const break§ = new LabelBase();
         this.§throw const break§.color = 381208;
         this.§throw const break§.multiline = true;
         this.§throw const break§.wordWrap = true;
         addChild(this.§throw const break§);
         this.§throw const break§.visible = false;
         this.§%#U§ = new TankWindowInner(0,0,TankWindowInner.TRANSPARENT);
         this.§%#U§.x = this.windowMargin;
         addChild(this.§%#U§);
         this.§%#U§.visible = false;
         this.§3"H§ = new Sprite();
         addChild(this.§3"H§);
         this.§static set each§ = new TankWindowInner(0,0,TankWindowInner.GREEN);
         this.§static set each§.x = this.windowMargin;
         this.§static set each§.y = this.windowMargin;
         this.§3"H§.addChild(this.§static set each§);
         headerBd = localeService.getImage(TanksLocale.IMAGE_REFERAL_WINDOW_HEADER_IMAGE);
         this.§in for implements§ = new Bitmap(headerBd);
         this.§3"H§.addChild(this.§in for implements§);
         this.§continue static§ = new Bitmap(§include null§);
         this.§3"H§.addChild(this.§continue static§);
         this.infoLabel = new LabelBase();
         this.infoLabel.color = 381208;
         this.infoLabel.multiline = true;
         this.infoLabel.wordWrap = true;
         this.§3"H§.addChild(this.infoLabel);
         switch(localeService.language)
         {
            case "ru":
               tableLinkURL = "https://wiki.pro-tanki.com/ru/Реферальная_система";
               break;
            case "en":
               tableLinkURL = "https://wiki.pro-tanki.com/en/Referral_system";
               break;
            case "pt_BR":
               tableLinkURL = "https://wiki.pro-tanki.com/br/Sistema_de_indicação";
               break;
            case "ua":
               tableLinkURL = "https://wiki.pro-tanki.com/ua/Реферальна_система";
               break;
            default:
               tableLinkURL = "";
         }
         this.infoLabel.htmlText = localeService.getText(TanksLocale.TEXT_REFERAL_WINDOW_INFO_TEXT,tableLinkURL);
         this.§true set use§ = new Sprite();
         addChild(this.§true set use§);
         this.§extends package return§ = new TankWindowInner(0,0,TankWindowInner.GREEN);
         this.§true set use§.addChild(this.§extends package return§);
         this.§2!S§ = new TankWindowInner(0,0,TankWindowInner.GREEN);
         this.§true set use§.addChild(this.§2!S§);
         this.§super set finally§ = new TankWindowInner(0,0,TankWindowInner.GREEN);
         this.§true set use§.addChild(this.§super set finally§);
         this.§!"?§ = new LabelBase();
         this.§!"?§.text = localeService.getText(TanksLocale.TEXT_REFERAL_WINDOW_COUNT_LABEL);
         this.§true set use§.addChild(this.§!"?§);
         this.§import set final§ = new LabelBase();
         this.§import set final§.autoSize = TextFieldAutoSize.RIGHT;
         this.§import set final§.color = 381208;
         this.§import set final§.text = "0";
         this.§true set use§.addChild(this.§import set final§);
         this.§use var switch§ = new LabelBase();
         this.§use var switch§.text = localeService.getText(TanksLocale.TEXT_REFERAL_WINDOW_SUMMARY_LABEL);
         this.§true set use§.addChild(this.§use var switch§);
         this.crystalIcon = new Diamond();
         this.§true set use§.addChild(this.crystalIcon);
         this.crystalLabel = new LabelBase();
         this.crystalLabel.autoSize = TextFieldAutoSize.RIGHT;
         this.crystalLabel.color = 381208;
         this.crystalLabel.text = "0";
         this.§true set use§.addChild(this.crystalLabel);
         this.§ !k§ = new §#"M§();
         this.§true set use§.addChild(this.§ !k§);
         this.§"d§ = new Sprite();
         addChild(this.§"d§);
         this.§+"W§ = new TankInputBase();
         this.§+"W§.textField.type = TextFieldType.DYNAMIC;
         this.§"d§.addChild(this.§+"W§);
         this.§+"W§.textField.text = url;
         this.§2"Q§ = new DefaultButtonBase();
         this.§"d§.addChild(this.§2"Q§);
         this.§2"Q§.width = 220;
         this.§2"Q§.label = localeService.getText(TanksLocale.TEXT_REFERAL_WINDOW_BUTTON_COPY_LINK_TEXT);
         this.§2"Q§.addEventListener(MouseEvent.CLICK,this.§catch package include§);
         this.§super for function§ = new Sprite();
         addChild(this.§super for function§);
         context = new LoaderContext(false,ApplicationDomain.currentDomain);
         this.loader = new Loader();
         bannerXmlPath = "http://" + host + "/" + §`"Z§ + "?hash=" + hash + "&server=" + host;
         this.loader.load(new URLRequest(bannerXmlPath),context);
         this.loader.contentLoaderInfo.addEventListener(Event.COMPLETE,this.§import package static§);
         this.banner = new Sprite();
         this.§super for function§.addChild(this.banner);
         with(this.banner as Sprite)
         {
            graphics.beginFill(0,0.5);
            graphics.drawRect(0,0,bannerSize.x,bannerSize.y);
         }
         this.§package package each§ = new InputCheckIcon();
         this.§package package each§.gotoAndStop(CallsignIconStates.CALLSIGN_ICON_STATE_PROGRESS);
         this.§super for function§.addChild(this.§package package each§);
         this.§each catch get§ = new TextArea();
         this.§each catch get§.tf.text = bannerCodeString;
         this.§super for function§.addChild(this.§each catch get§);
         this.§;v§ = new DefaultButtonBase();
         this.§super for function§.addChild(this.§;v§);
         this.§;v§.label = localeService.getText(TanksLocale.TEXT_REFERAL_WINDOW_BUTTON_COPY_BANNER_TEXT);
         this.§;v§.addEventListener(MouseEvent.CLICK,this.§,d§);
         this.§;v§.width = 200;
         this.§override const super§ = new Sprite();
         addChild(this.§override const super§);
         this.§case for in§ = new LabelBase();
         this.§case for in§.multiline = true;
         this.§case for in§.wordWrap = true;
         this.§case for in§.htmlText = localeService.getText(TanksLocale.TEXT_INVITATION_SENDER_NAME_LABEL_TEXT);
         this.§override const super§.addChild(this.§case for in§);
         this.§["[§ = new TankInputBase();
         this.§["[§.textField.type = TextFieldType.INPUT;
         this.§override const super§.addChild(this.§["[§);
         this.§["[§.textField.text = userName;
         this.§["[§.textField.addEventListener(Event.CHANGE,this.§^#n§);
         this.§in package null§ = new LabelBase();
         this.§in package null§.multiline = true;
         this.§in package null§.wordWrap = true;
         this.§in package null§.htmlText = localeService.getText(TanksLocale.TEXT_REFERAL_WINDOW_EMAIL_LABEL_TEXT);
         this.§override const super§.addChild(this.§in package null§);
         this.§implements const set§ = new TankInputBase();
         this.§override const super§.addChild(this.§implements const set§);
         this.§super set override§ = new LabelBase();
         this.§super set override§.htmlText = localeService.getText(TanksLocale.TEXT_REFERAL_WINDOW_LETTER_LABEL_TEXT);
         this.§override const super§.addChild(this.§super set override§);
         this.§7"+§ = new TextArea();
         this.§7"+§.tf.type = TextFieldType.DYNAMIC;
         this.§7"+§.tf.text = this.§false var switch§.replace("%1",userName);
         this.§override const super§.addChild(this.§7"+§);
         this.sendButton = new DefaultButtonBase();
         this.§override const super§.addChild(this.sendButton);
         this.sendButton.label = localeService.getText(TanksLocale.TEXT_REFERAL_WINDOW_BUTTON_SEND_TEXT);
         this.sendButton.addEventListener(MouseEvent.CLICK,this.§use var§);
         this.windowSize = new Point(468 + this.windowMargin * 2 + 4,492);
         this.window.width = this.windowSize.x;
         this.window.height = this.windowSize.y;
         this.§each var static§.width = this.windowSize.x - this.windowMargin * 2;
         this.§each var static§.height = 75;
         this.§throw const break§.x = this.§each var static§.x + this.margin;
         this.§throw const break§.y = this.§each var static§.y + this.margin;
         this.§throw const break§.width = this.windowSize.x - this.windowMargin * 2 - this.margin * 2;
         this.§%#U§.y = this.§each var static§.y + this.§each var static§.height + this.margin;
         this.§%#U§.width = this.windowSize.x - this.windowMargin * 2;
         this.§%#U§.height = this.windowSize.y - this.§switch package continue§ - this.margin - this.§%#U§.y;
         this.§static set each§.width = this.windowSize.x - this.windowMargin * 2;
         this.§static set each§.height = this.windowSize.y - this.windowMargin - this.§switch package continue§ - this.margin;
         this.§in for implements§.x = this.§static set each§.x + int((this.§static set each§.width - this.§in for implements§.width) * 0.5);
         this.§in for implements§.y = this.§static set each§.y + this.margin * 2;
         this.§continue static§.x = this.§static set each§.x + int((this.§static set each§.width - this.§continue static§.width) * 0.5);
         this.§continue static§.y = this.§static set each§.y + int(this.§static set each§.height * (1 - 0.618) - this.§continue static§.height * 0.5);
         this.infoLabel.x = this.§static set each§.x + this.margin;
         this.infoLabel.width = this.windowSize.x - this.windowMargin * 2 - this.margin * 2;
         this.infoLabel.y = this.§static set each§.y + this.§static set each§.height - this.infoLabel.height - this.margin * 2;
         this.§!"?§.x = this.windowMargin;
         this.§2!S§.width = 100;
         this.§2!S§.height = 26;
         this.§2!S§.x = this.§!"?§.x + this.§!"?§.width + this.margin;
         this.§2!S§.y = this.windowMargin;
         this.§import set final§.x = this.§2!S§.x + this.§2!S§.width - this.margin - this.§import set final§.width;
         this.§!"?§.y = this.windowMargin + int((this.§2!S§.height - this.§!"?§.height) * 0.5);
         this.§import set final§.y = this.§!"?§.y;
         this.§super set finally§.width = 100;
         this.§super set finally§.height = 26;
         this.§super set finally§.x = this.windowSize.x - this.windowMargin - this.§super set finally§.width;
         this.§super set finally§.y = this.windowMargin;
         this.§use var switch§.x = this.§super set finally§.x - this.margin - this.§use var switch§.width;
         this.crystalIcon.x = this.windowSize.x - this.windowMargin - this.margin - this.crystalIcon.width;
         this.crystalLabel.x = this.crystalIcon.x - 2 - this.crystalLabel.width;
         this.§use var switch§.y = this.windowMargin + int((this.§super set finally§.height - this.§use var switch§.height) * 0.5);
         this.crystalLabel.y = this.§use var switch§.y;
         this.crystalIcon.y = this.windowMargin + int((this.§super set finally§.height - this.crystalIcon.height) * 0.5);
         this.§extends package return§.x = this.windowMargin;
         this.§extends package return§.y = this.windowMargin + this.margin + this.§super set finally§.height - 3;
         this.§extends package return§.width = this.windowSize.x - this.windowMargin * 2;
         this.§extends package return§.height = this.windowSize.y - this.§extends package return§.y - this.§switch package continue§ - this.margin + 1;
         this.§ !k§.x = this.windowMargin + this.§^#m§;
         this.§ !k§.y = this.§extends package return§.y + this.§^#m§;
         this.§+"W§.width = this.windowSize.x - this.windowMargin * 2 - this.margin * 2;
         this.§+"W§.x = this.§%#U§.x + this.margin;
         this.§+"W§.y = this.§%#U§.y + this.margin;
         this.§2"Q§.x = this.windowSize.x - this.§2"Q§.width >> 1;
         this.§2"Q§.y = this.§%#U§.y + this.margin * 2 + this.buttonSize.y;
         this.sendButton.x = this.windowSize.x - this.windowMargin - this.margin - this.buttonSize.x + 8;
         this.sendButton.y = this.§%#U§.y + this.§%#U§.height - this.margin - this.buttonSize.y;
         this.§case for in§.x = this.§%#U§.x + this.margin;
         this.§["[§.y = this.§%#U§.y + this.margin;
         this.§case for in§.width = 100;
         this.§["[§.x = this.§case for in§.x + 100;
         this.§case for in§.y = this.§["[§.y;
         this.§["[§.width = this.windowSize.x - this.windowMargin - this.margin - this.§["[§.x;
         this.§implements const set§.x = this.§["[§.x;
         this.§implements const set§.y = Math.round(this.§["[§.y + this.§["[§.height + this.margin);
         this.§implements const set§.width = this.windowSize.x - this.windowMargin - this.margin - this.§["[§.x;
         this.§7"+§.x = this.§["[§.x;
         this.§7"+§.y = Math.round(this.§implements const set§.y + this.§implements const set§.height + this.margin);
         this.§7"+§.width = this.windowSize.x - this.windowMargin - this.margin - this.§["[§.x;
         this.§7"+§.height = Math.round(this.§%#U§.y + this.§%#U§.height - this.§7"+§.y - this.margin * 2 - this.buttonSize.y);
         this.§super set override§.x = this.§%#U§.x + this.margin;
         this.§super set override§.y = this.§7"+§.y;
         this.§super set override§.width = 100;
         this.§in package null§.x = this.§%#U§.x + this.margin;
         this.§in package null§.y = this.§implements const set§.y;
         this.§in package null§.width = 100;
         this.§7"+§.tf.type = TextFieldType.DYNAMIC;
         this.§7"+§.text = §false var switch§.replace("{0}",userName);
         this.§switch const switch§.x = (this.windowSize.x - this.§switch const switch§.width >> 1) + 3;
         this.§switch const switch§.y = this.windowSize.y - this.§switch package continue§;
         this.§continue package override§.x = this.windowMargin;
         this.§continue package override§.y = this.windowSize.y - this.§switch package continue§;
         this.§const catch for§.x = this.§switch const switch§.x + this.§switch const switch§.width - 4;
         this.§const catch for§.y = this.windowSize.y - this.§switch package continue§;
         this.closeButton.x = this.windowSize.x - this.windowMargin - this.buttonSize.x + 8;
         this.closeButton.y = this.windowSize.y - this.windowMargin - this.buttonSize.y;
         this.statButton.x = this.windowMargin;
         this.statButton.y = this.closeButton.y;
         this.statButton.width = 240;
         this.§native catch catch§();
         this.§use native§();
         this.state = this.§final class§;
         this.§3"H§.visible = true;
      }
      
      public function §&"t§(param1:Vector.<§continue package do§>) : void
      {
         var _loc2_:int = 0;
         this.§import set final§.text = param1.length.toString();
         var _loc3_:int = 0;
         while(_loc3_ < param1.length)
         {
            _loc2_ += §continue package do§(param1[_loc3_]).income;
            _loc3_++;
         }
         this.crystalLabel.text = _loc2_.toString();
         this.statButton.label = localeService.getText(TanksLocale.TEXT_REFERAL_WINDOW_BUTTON_STATISTICS_TEXT) + " " + _loc2_.toString();
         this.§ !k§.§^"G§(param1);
         this.§ !k§.width = this.windowSize.x - this.windowMargin * 2 - this.§^#m§ * 2 + 2;
         this.§ !k§.height = this.windowSize.y - this.§extends package return§.y - this.§switch package continue§ - this.margin - this.§^#m§ * 2;
      }
      
      private function §^#n§(param1:Event) : void
      {
         if(this.§["[§.textField.text.length)
         {
            this.§7"+§.tf.text = this.§false var switch§.replace("{0}",this.§["[§.textField.text);
         }
         else
         {
            this.§7"+§.tf.text = this.§false var switch§.replace("{0}",this.userName);
         }
      }
      
      private function §import package static§(param1:Event) : void
      {
         this.§package package each§.gotoAndStop(CallsignIconStates.CALLSIGN_ICON_STATE_OFF);
         this.§super for function§.removeChild(this.§package package each§);
         this.§super for function§.removeChild(this.banner);
         this.banner = this.loader as DisplayObject;
         this.§super for function§.addChildAt(this.banner,0);
         this.§native catch catch§();
      }
      
      private function §native catch catch§() : void
      {
         this.banner.x = this.§%#U§.x + 2;
         this.banner.y = this.§%#U§.y + 2;
         this.§;v§.x = this.windowSize.x - this.§;v§.width >> 1;
         this.§;v§.y = this.§%#U§.y + this.§%#U§.height - this.margin - this.buttonSize.y;
         this.§each catch get§.x = this.windowMargin + this.margin;
         this.§each catch get§.y = this.banner.y + this.banner.height + this.margin;
         this.§each catch get§.width = this.windowSize.x - this.windowMargin * 2 - this.margin * 2;
         this.§each catch get§.height = this.§;v§.y - this.margin - this.§each catch get§.y;
         if(this.§super for function§.contains(this.§package package each§))
         {
            this.§package package each§.x = this.banner.x + int((this.bannerSize.x - this.§package package each§.width) * 0.5);
            this.§package package each§.y = this.banner.y + int((this.bannerSize.y - this.§package package each§.height) * 0.5);
         }
      }
      
      private function §use native§() : void
      {
         this.§3"H§.visible = false;
         this.§"d§.visible = false;
         this.§super for function§.visible = false;
         this.§override const super§.visible = false;
         this.§true set use§.visible = false;
      }
      
      private function §for set for§(param1:MouseEvent) : void
      {
         this.§switch const switch§.enabled = true;
         this.§const catch for§.enabled = true;
         this.§continue package override§.enabled = true;
         this.statButton.enable = false;
         this.§use native§();
         this.state = this.§false catch function§;
         this.§true set use§.visible = true;
         this.§each var static§.visible = false;
         this.§%#U§.visible = false;
         this.§throw const break§.visible = false;
      }
      
      private function §-W§(param1:MouseEvent) : void
      {
         this.§switch const switch§.enabled = false;
         this.§const catch for§.enabled = true;
         this.§continue package override§.enabled = true;
         this.statButton.enable = true;
         this.§use native§();
         this.state = this.§^#3§;
         this.§"d§.visible = true;
         this.§each var static§.visible = true;
         this.§%#U§.visible = true;
         this.§throw const break§.visible = true;
         this.§throw const break§.text = localeService.getText(TanksLocale.TEXT_REFERAL_WINDOW_LINK_DESCRIPTION);
      }
      
      private function §continue switch§(param1:MouseEvent) : void
      {
         this.§switch const switch§.enabled = true;
         this.§const catch for§.enabled = false;
         this.§continue package override§.enabled = true;
         this.statButton.enable = true;
         this.§use native§();
         this.state = this.§break var switch§;
         this.§super for function§.visible = true;
         this.§each var static§.visible = true;
         this.§%#U§.visible = true;
         this.§throw const break§.visible = true;
         this.§throw const break§.text = localeService.getText(TanksLocale.TEXT_REFERAL_WINDOW_BANNER_DESCRIPTION);
      }
      
      private function §,R§(param1:MouseEvent) : void
      {
         this.§switch const switch§.enabled = true;
         this.§const catch for§.enabled = true;
         this.§continue package override§.enabled = false;
         this.statButton.enable = true;
         this.§use native§();
         this.state = this.§!"v§;
         this.§override const super§.visible = true;
         this.§each var static§.visible = true;
         this.§%#U§.visible = true;
         this.§throw const break§.visible = true;
         this.§throw const break§.text = localeService.getText(TanksLocale.TEXT_REFERAL_WINDOW_MAIL_DESCRIPTION);
      }
      
      private function §catch package include§(param1:MouseEvent) : void
      {
         System.setClipboard(this.§+"W§.textField.text);
      }
      
      private function §,d§(param1:MouseEvent) : void
      {
         System.setClipboard(this.§each catch get§.tf.text);
      }
      
      private function §use var§(param1:MouseEvent) : void
      {
         dispatchEvent(new §-0§(§-0§.§package package super§,this.§implements const set§.value,this.§7"+§.text));
      }
      
      public function §-#d§() : void
      {
         if(this.§implements const set§ != null)
         {
            this.§implements const set§.value = "";
         }
      }
   }
}

