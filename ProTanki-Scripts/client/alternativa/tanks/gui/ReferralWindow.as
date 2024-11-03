package alternativa.tanks.gui
{
   import Renamed1804.Renamed1805;
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
   import Renamed420.Renamed1806;
   
   public class ReferralWindow extends Sprite
   {
      [Inject]
      public static var localeService:ILocaleService;
      
      private static const Renamed1807:String = "tankiref.swf";
      
      private static const CHANNEL:String = "ReferralWindow";
      
      private static const Renamed1808:Class = Renamed1809;
      
      private static const Renamed1810:BitmapData = new Renamed1808().bitmapData;
      
      private static const Renamed1811:Class = Renamed1812;
      
      private static const Renamed1813:BitmapData = new Renamed1811().bitmapData;
      
      private static const Renamed1814:Class = Renamed1815;
      
      private static const Renamed1816:BitmapData = new Renamed1814().bitmapData;
      
      private static const Renamed1817:Class = Renamed1818;
      
      private static const Renamed1819:BitmapData = new Renamed1817().bitmapData;
      
      private var Renamed1820:Renamed1805;
      
      private var Renamed1821:Renamed1805;
      
      private var Renamed1822:Renamed1805;
      
      public var closeButton:DefaultButtonBase;
      
      public var statButton:Renamed1823;
      
      private var Renamed1824:DefaultButtonBase;
      
      private var Renamed1825:DefaultButtonBase;
      
      private var sendButton:DefaultButtonBase;
      
      private var window:TankWindow;
      
      private var Renamed1826:TankWindowInner;
      
      private var Renamed1827:TankWindowInner;
      
      private var Renamed1828:TankWindowInner;
      
      private var Renamed1829:TankWindowInner;
      
      private var Renamed1830:TankWindowInner;
      
      private var Renamed1831:TankWindowInner;
      
      private var Renamed1832:Bitmap;
      
      private var Renamed1833:Bitmap;
      
      public var Renamed1834:Renamed1835;
      
      private var Renamed1836:Sprite;
      
      private var Renamed1837:Sprite;
      
      private var Renamed1838:Sprite;
      
      private var Renamed1839:Sprite;
      
      private var Renamed1840:Sprite;
      
      private var banner:DisplayObject;
      
      private var Renamed1841:InputCheckIcon;
      
      private var infoLabel:LabelBase;
      
      private var Renamed1842:LabelBase;
      
      private var Renamed1843:TankInputBase;
      
      private var Renamed1844:TextArea;
      
      private var Renamed1845:LabelBase;
      
      public var Renamed1846:TankInputBase;
      
      private var Renamed1847:LabelBase;
      
      private var Renamed1848:LabelBase;
      
      private var Renamed1849:TankInputBase;
      
      private var Renamed1850:TextArea;
      
      private var Renamed1851:LabelBase;
      
      private var Renamed1852:LabelBase;
      
      private var crystalLabel:LabelBase;
      
      private var Renamed1853:LabelBase;
      
      private var loader:Loader;
      
      public var windowSize:Point;
      
      private const windowMargin:int = 12;
      
      private const margin:int = 9;
      
      private const Renamed1854:int = 4;
      
      private const space:int = 0;
      
      private var state:int;
      
      private const Renamed1855:int = 0;
      
      private const Renamed1856:int = 1;
      
      private const Renamed1857:int = 2;
      
      private const Renamed1858:int = 3;
      
      private const Renamed1859:int = 4;
      
      private var Renamed1860:String;
      
      private const Renamed1861:int = 104;
      
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
         var Renamed1860:String = param4;
         var host:String = param5;
         var hash:String = param6;
         this.buttonSize = new Point(104,33);
         this.bannerSize = new Point(468,120);
         tableLinkURL = null;
         super();
         this.userName = userName;
         this.Renamed1860 = Renamed1860.split("\n\r").join("\n").split("\r\n").join("\n");
         this.window = new TankWindow();
         addChild(this.window);
         this.window.headerLang = localeService.getText(TanksLocale.TEXT_GUI_LANG);
         this.window.header = TankWindowHeader.REFERALS;
         this.Renamed1820 = new Renamed1805();
         this.Renamed1820.icon = Renamed1816;
         addChild(this.Renamed1820);
         this.Renamed1820.label = localeService.getText(TanksLocale.TEXT_REFERAL_WINDOW_BUTTON_GET_LINK_TEXT);
         this.Renamed1820.addEventListener(MouseEvent.CLICK,this.Renamed1862);
         this.Renamed1821 = new Renamed1805();
         this.Renamed1821.icon = Renamed1819;
         addChild(this.Renamed1821);
         this.Renamed1821.label = localeService.getText(TanksLocale.TEXT_REFERAL_WINDOW_BUTTON_GET_BANNER_TEXT);
         this.Renamed1821.addEventListener(MouseEvent.CLICK,this.Renamed1863);
         this.Renamed1822 = new Renamed1805();
         this.Renamed1822.icon = Renamed1813;
         addChild(this.Renamed1822);
         this.Renamed1822.label = localeService.getText(TanksLocale.TEXT_REFERAL_WINDOW_BUTTON_INVITE_BY_EMAIL_TEXT);
         this.Renamed1822.addEventListener(MouseEvent.CLICK,this.Renamed1864);
         this.statButton = new Renamed1823();
         addChild(this.statButton);
         this.statButton.label = localeService.getText(TanksLocale.TEXT_REFERAL_WINDOW_BUTTON_STATISTICS_TEXT);
         this.statButton.addEventListener(MouseEvent.CLICK,this.Renamed1865);
         this.closeButton = new DefaultButtonBase();
         addChild(this.closeButton);
         this.closeButton.label = localeService.getText(TanksLocale.TEXT_REFERAL_WINDOW_BUTTON_CLOSE_TEXT);
         this.Renamed1831 = new TankWindowInner(0,0,TankWindowInner.GREEN);
         this.Renamed1831.x = this.windowMargin;
         this.Renamed1831.y = this.windowMargin;
         addChild(this.Renamed1831);
         this.Renamed1831.visible = false;
         this.Renamed1842 = new LabelBase();
         this.Renamed1842.color = 381208;
         this.Renamed1842.multiline = true;
         this.Renamed1842.wordWrap = true;
         addChild(this.Renamed1842);
         this.Renamed1842.visible = false;
         this.Renamed1826 = new TankWindowInner(0,0,TankWindowInner.TRANSPARENT);
         this.Renamed1826.x = this.windowMargin;
         addChild(this.Renamed1826);
         this.Renamed1826.visible = false;
         this.Renamed1836 = new Sprite();
         addChild(this.Renamed1836);
         this.Renamed1827 = new TankWindowInner(0,0,TankWindowInner.GREEN);
         this.Renamed1827.x = this.windowMargin;
         this.Renamed1827.y = this.windowMargin;
         this.Renamed1836.addChild(this.Renamed1827);
         headerBd = localeService.getImage(TanksLocale.IMAGE_REFERAL_WINDOW_HEADER_IMAGE);
         this.Renamed1832 = new Bitmap(headerBd);
         this.Renamed1836.addChild(this.Renamed1832);
         this.Renamed1833 = new Bitmap(Renamed1810);
         this.Renamed1836.addChild(this.Renamed1833);
         this.infoLabel = new LabelBase();
         this.infoLabel.color = 381208;
         this.infoLabel.multiline = true;
         this.infoLabel.wordWrap = true;
         this.Renamed1836.addChild(this.infoLabel);
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
         this.Renamed1840 = new Sprite();
         addChild(this.Renamed1840);
         this.Renamed1828 = new TankWindowInner(0,0,TankWindowInner.GREEN);
         this.Renamed1840.addChild(this.Renamed1828);
         this.Renamed1829 = new TankWindowInner(0,0,TankWindowInner.GREEN);
         this.Renamed1840.addChild(this.Renamed1829);
         this.Renamed1830 = new TankWindowInner(0,0,TankWindowInner.GREEN);
         this.Renamed1840.addChild(this.Renamed1830);
         this.Renamed1852 = new LabelBase();
         this.Renamed1852.text = localeService.getText(TanksLocale.TEXT_REFERAL_WINDOW_COUNT_LABEL);
         this.Renamed1840.addChild(this.Renamed1852);
         this.Renamed1851 = new LabelBase();
         this.Renamed1851.autoSize = TextFieldAutoSize.RIGHT;
         this.Renamed1851.color = 381208;
         this.Renamed1851.text = "0";
         this.Renamed1840.addChild(this.Renamed1851);
         this.Renamed1853 = new LabelBase();
         this.Renamed1853.text = localeService.getText(TanksLocale.TEXT_REFERAL_WINDOW_SUMMARY_LABEL);
         this.Renamed1840.addChild(this.Renamed1853);
         this.crystalIcon = new Diamond();
         this.Renamed1840.addChild(this.crystalIcon);
         this.crystalLabel = new LabelBase();
         this.crystalLabel.autoSize = TextFieldAutoSize.RIGHT;
         this.crystalLabel.color = 381208;
         this.crystalLabel.text = "0";
         this.Renamed1840.addChild(this.crystalLabel);
         this.Renamed1834 = new Renamed1835();
         this.Renamed1840.addChild(this.Renamed1834);
         this.Renamed1837 = new Sprite();
         addChild(this.Renamed1837);
         this.Renamed1843 = new TankInputBase();
         this.Renamed1843.textField.type = TextFieldType.DYNAMIC;
         this.Renamed1837.addChild(this.Renamed1843);
         this.Renamed1843.textField.text = url;
         this.Renamed1824 = new DefaultButtonBase();
         this.Renamed1837.addChild(this.Renamed1824);
         this.Renamed1824.width = 220;
         this.Renamed1824.label = localeService.getText(TanksLocale.TEXT_REFERAL_WINDOW_BUTTON_COPY_LINK_TEXT);
         this.Renamed1824.addEventListener(MouseEvent.CLICK,this.Renamed1866);
         this.Renamed1838 = new Sprite();
         addChild(this.Renamed1838);
         context = new LoaderContext(false,ApplicationDomain.currentDomain);
         this.loader = new Loader();
         bannerXmlPath = "http://" + host + "/" + Renamed1807 + "?hash=" + hash + "&server=" + host;
         this.loader.load(new URLRequest(bannerXmlPath),context);
         this.loader.contentLoaderInfo.addEventListener(Event.COMPLETE,this.Renamed1867);
         this.banner = new Sprite();
         this.Renamed1838.addChild(this.banner);
         with(this.banner as Sprite)
         {
            graphics.beginFill(0,0.5);
            graphics.drawRect(0,0,bannerSize.x,bannerSize.y);
         }
         this.Renamed1841 = new InputCheckIcon();
         this.Renamed1841.gotoAndStop(CallsignIconStates.CALLSIGN_ICON_STATE_PROGRESS);
         this.Renamed1838.addChild(this.Renamed1841);
         this.Renamed1844 = new TextArea();
         this.Renamed1844.tf.text = bannerCodeString;
         this.Renamed1838.addChild(this.Renamed1844);
         this.Renamed1825 = new DefaultButtonBase();
         this.Renamed1838.addChild(this.Renamed1825);
         this.Renamed1825.label = localeService.getText(TanksLocale.TEXT_REFERAL_WINDOW_BUTTON_COPY_BANNER_TEXT);
         this.Renamed1825.addEventListener(MouseEvent.CLICK,this.Renamed1868);
         this.Renamed1825.width = 200;
         this.Renamed1839 = new Sprite();
         addChild(this.Renamed1839);
         this.Renamed1845 = new LabelBase();
         this.Renamed1845.multiline = true;
         this.Renamed1845.wordWrap = true;
         this.Renamed1845.htmlText = localeService.getText(TanksLocale.TEXT_INVITATION_SENDER_NAME_LABEL_TEXT);
         this.Renamed1839.addChild(this.Renamed1845);
         this.Renamed1846 = new TankInputBase();
         this.Renamed1846.textField.type = TextFieldType.INPUT;
         this.Renamed1839.addChild(this.Renamed1846);
         this.Renamed1846.textField.text = userName;
         this.Renamed1846.textField.addEventListener(Event.CHANGE,this.Renamed1869);
         this.Renamed1847 = new LabelBase();
         this.Renamed1847.multiline = true;
         this.Renamed1847.wordWrap = true;
         this.Renamed1847.htmlText = localeService.getText(TanksLocale.TEXT_REFERAL_WINDOW_EMAIL_LABEL_TEXT);
         this.Renamed1839.addChild(this.Renamed1847);
         this.Renamed1849 = new TankInputBase();
         this.Renamed1839.addChild(this.Renamed1849);
         this.Renamed1848 = new LabelBase();
         this.Renamed1848.htmlText = localeService.getText(TanksLocale.TEXT_REFERAL_WINDOW_LETTER_LABEL_TEXT);
         this.Renamed1839.addChild(this.Renamed1848);
         this.Renamed1850 = new TextArea();
         this.Renamed1850.tf.type = TextFieldType.DYNAMIC;
         this.Renamed1850.tf.text = this.Renamed1860.replace("%1",userName);
         this.Renamed1839.addChild(this.Renamed1850);
         this.sendButton = new DefaultButtonBase();
         this.Renamed1839.addChild(this.sendButton);
         this.sendButton.label = localeService.getText(TanksLocale.TEXT_REFERAL_WINDOW_BUTTON_SEND_TEXT);
         this.sendButton.addEventListener(MouseEvent.CLICK,this.Renamed1870);
         this.windowSize = new Point(468 + this.windowMargin * 2 + 4,492);
         this.window.width = this.windowSize.x;
         this.window.height = this.windowSize.y;
         this.Renamed1831.width = this.windowSize.x - this.windowMargin * 2;
         this.Renamed1831.height = 75;
         this.Renamed1842.x = this.Renamed1831.x + this.margin;
         this.Renamed1842.y = this.Renamed1831.y + this.margin;
         this.Renamed1842.width = this.windowSize.x - this.windowMargin * 2 - this.margin * 2;
         this.Renamed1826.y = this.Renamed1831.y + this.Renamed1831.height + this.margin;
         this.Renamed1826.width = this.windowSize.x - this.windowMargin * 2;
         this.Renamed1826.height = this.windowSize.y - this.Renamed1861 - this.margin - this.Renamed1826.y;
         this.Renamed1827.width = this.windowSize.x - this.windowMargin * 2;
         this.Renamed1827.height = this.windowSize.y - this.windowMargin - this.Renamed1861 - this.margin;
         this.Renamed1832.x = this.Renamed1827.x + int((this.Renamed1827.width - this.Renamed1832.width) * 0.5);
         this.Renamed1832.y = this.Renamed1827.y + this.margin * 2;
         this.Renamed1833.x = this.Renamed1827.x + int((this.Renamed1827.width - this.Renamed1833.width) * 0.5);
         this.Renamed1833.y = this.Renamed1827.y + int(this.Renamed1827.height * (1 - 0.618) - this.Renamed1833.height * 0.5);
         this.infoLabel.x = this.Renamed1827.x + this.margin;
         this.infoLabel.width = this.windowSize.x - this.windowMargin * 2 - this.margin * 2;
         this.infoLabel.y = this.Renamed1827.y + this.Renamed1827.height - this.infoLabel.height - this.margin * 2;
         this.Renamed1852.x = this.windowMargin;
         this.Renamed1829.width = 100;
         this.Renamed1829.height = 26;
         this.Renamed1829.x = this.Renamed1852.x + this.Renamed1852.width + this.margin;
         this.Renamed1829.y = this.windowMargin;
         this.Renamed1851.x = this.Renamed1829.x + this.Renamed1829.width - this.margin - this.Renamed1851.width;
         this.Renamed1852.y = this.windowMargin + int((this.Renamed1829.height - this.Renamed1852.height) * 0.5);
         this.Renamed1851.y = this.Renamed1852.y;
         this.Renamed1830.width = 100;
         this.Renamed1830.height = 26;
         this.Renamed1830.x = this.windowSize.x - this.windowMargin - this.Renamed1830.width;
         this.Renamed1830.y = this.windowMargin;
         this.Renamed1853.x = this.Renamed1830.x - this.margin - this.Renamed1853.width;
         this.crystalIcon.x = this.windowSize.x - this.windowMargin - this.margin - this.crystalIcon.width;
         this.crystalLabel.x = this.crystalIcon.x - 2 - this.crystalLabel.width;
         this.Renamed1853.y = this.windowMargin + int((this.Renamed1830.height - this.Renamed1853.height) * 0.5);
         this.crystalLabel.y = this.Renamed1853.y;
         this.crystalIcon.y = this.windowMargin + int((this.Renamed1830.height - this.crystalIcon.height) * 0.5);
         this.Renamed1828.x = this.windowMargin;
         this.Renamed1828.y = this.windowMargin + this.margin + this.Renamed1830.height - 3;
         this.Renamed1828.width = this.windowSize.x - this.windowMargin * 2;
         this.Renamed1828.height = this.windowSize.y - this.Renamed1828.y - this.Renamed1861 - this.margin + 1;
         this.Renamed1834.x = this.windowMargin + this.Renamed1854;
         this.Renamed1834.y = this.Renamed1828.y + this.Renamed1854;
         this.Renamed1843.width = this.windowSize.x - this.windowMargin * 2 - this.margin * 2;
         this.Renamed1843.x = this.Renamed1826.x + this.margin;
         this.Renamed1843.y = this.Renamed1826.y + this.margin;
         this.Renamed1824.x = this.windowSize.x - this.Renamed1824.width >> 1;
         this.Renamed1824.y = this.Renamed1826.y + this.margin * 2 + this.buttonSize.y;
         this.sendButton.x = this.windowSize.x - this.windowMargin - this.margin - this.buttonSize.x + 8;
         this.sendButton.y = this.Renamed1826.y + this.Renamed1826.height - this.margin - this.buttonSize.y;
         this.Renamed1845.x = this.Renamed1826.x + this.margin;
         this.Renamed1846.y = this.Renamed1826.y + this.margin;
         this.Renamed1845.width = 100;
         this.Renamed1846.x = this.Renamed1845.x + 100;
         this.Renamed1845.y = this.Renamed1846.y;
         this.Renamed1846.width = this.windowSize.x - this.windowMargin - this.margin - this.Renamed1846.x;
         this.Renamed1849.x = this.Renamed1846.x;
         this.Renamed1849.y = Math.round(this.Renamed1846.y + this.Renamed1846.height + this.margin);
         this.Renamed1849.width = this.windowSize.x - this.windowMargin - this.margin - this.Renamed1846.x;
         this.Renamed1850.x = this.Renamed1846.x;
         this.Renamed1850.y = Math.round(this.Renamed1849.y + this.Renamed1849.height + this.margin);
         this.Renamed1850.width = this.windowSize.x - this.windowMargin - this.margin - this.Renamed1846.x;
         this.Renamed1850.height = Math.round(this.Renamed1826.y + this.Renamed1826.height - this.Renamed1850.y - this.margin * 2 - this.buttonSize.y);
         this.Renamed1848.x = this.Renamed1826.x + this.margin;
         this.Renamed1848.y = this.Renamed1850.y;
         this.Renamed1848.width = 100;
         this.Renamed1847.x = this.Renamed1826.x + this.margin;
         this.Renamed1847.y = this.Renamed1849.y;
         this.Renamed1847.width = 100;
         this.Renamed1850.tf.type = TextFieldType.DYNAMIC;
         this.Renamed1850.text = Renamed1860.replace("{0}",userName);
         this.Renamed1820.x = (this.windowSize.x - this.Renamed1820.width >> 1) + 3;
         this.Renamed1820.y = this.windowSize.y - this.Renamed1861;
         this.Renamed1822.x = this.windowMargin;
         this.Renamed1822.y = this.windowSize.y - this.Renamed1861;
         this.Renamed1821.x = this.Renamed1820.x + this.Renamed1820.width - 4;
         this.Renamed1821.y = this.windowSize.y - this.Renamed1861;
         this.closeButton.x = this.windowSize.x - this.windowMargin - this.buttonSize.x + 8;
         this.closeButton.y = this.windowSize.y - this.windowMargin - this.buttonSize.y;
         this.statButton.x = this.windowMargin;
         this.statButton.y = this.closeButton.y;
         this.statButton.width = 240;
         this.Renamed1871();
         this.Renamed1872();
         this.state = this.Renamed1855;
         this.Renamed1836.visible = true;
      }
      
      public function Renamed1873(param1:Vector.<Renamed1806>) : void
      {
         var _loc2_:int = 0;
         this.Renamed1851.text = param1.length.toString();
         var _loc3_:int = 0;
         while(_loc3_ < param1.length)
         {
            _loc2_ += Renamed1806(param1[_loc3_]).income;
            _loc3_++;
         }
         this.crystalLabel.text = _loc2_.toString();
         this.statButton.label = localeService.getText(TanksLocale.TEXT_REFERAL_WINDOW_BUTTON_STATISTICS_TEXT) + " " + _loc2_.toString();
         this.Renamed1834.Renamed1874(param1);
         this.Renamed1834.width = this.windowSize.x - this.windowMargin * 2 - this.Renamed1854 * 2 + 2;
         this.Renamed1834.height = this.windowSize.y - this.Renamed1828.y - this.Renamed1861 - this.margin - this.Renamed1854 * 2;
      }
      
      private function Renamed1869(param1:Event) : void
      {
         if(this.Renamed1846.textField.text.length)
         {
            this.Renamed1850.tf.text = this.Renamed1860.replace("{0}",this.Renamed1846.textField.text);
         }
         else
         {
            this.Renamed1850.tf.text = this.Renamed1860.replace("{0}",this.userName);
         }
      }
      
      private function Renamed1867(param1:Event) : void
      {
         this.Renamed1841.gotoAndStop(CallsignIconStates.CALLSIGN_ICON_STATE_OFF);
         this.Renamed1838.removeChild(this.Renamed1841);
         this.Renamed1838.removeChild(this.banner);
         this.banner = this.loader as DisplayObject;
         this.Renamed1838.addChildAt(this.banner,0);
         this.Renamed1871();
      }
      
      private function Renamed1871() : void
      {
         this.banner.x = this.Renamed1826.x + 2;
         this.banner.y = this.Renamed1826.y + 2;
         this.Renamed1825.x = this.windowSize.x - this.Renamed1825.width >> 1;
         this.Renamed1825.y = this.Renamed1826.y + this.Renamed1826.height - this.margin - this.buttonSize.y;
         this.Renamed1844.x = this.windowMargin + this.margin;
         this.Renamed1844.y = this.banner.y + this.banner.height + this.margin;
         this.Renamed1844.width = this.windowSize.x - this.windowMargin * 2 - this.margin * 2;
         this.Renamed1844.height = this.Renamed1825.y - this.margin - this.Renamed1844.y;
         if(this.Renamed1838.contains(this.Renamed1841))
         {
            this.Renamed1841.x = this.banner.x + int((this.bannerSize.x - this.Renamed1841.width) * 0.5);
            this.Renamed1841.y = this.banner.y + int((this.bannerSize.y - this.Renamed1841.height) * 0.5);
         }
      }
      
      private function Renamed1872() : void
      {
         this.Renamed1836.visible = false;
         this.Renamed1837.visible = false;
         this.Renamed1838.visible = false;
         this.Renamed1839.visible = false;
         this.Renamed1840.visible = false;
      }
      
      private function Renamed1865(param1:MouseEvent) : void
      {
         this.Renamed1820.enabled = true;
         this.Renamed1821.enabled = true;
         this.Renamed1822.enabled = true;
         this.statButton.enable = false;
         this.Renamed1872();
         this.state = this.Renamed1859;
         this.Renamed1840.visible = true;
         this.Renamed1831.visible = false;
         this.Renamed1826.visible = false;
         this.Renamed1842.visible = false;
      }
      
      private function Renamed1862(param1:MouseEvent) : void
      {
         this.Renamed1820.enabled = false;
         this.Renamed1821.enabled = true;
         this.Renamed1822.enabled = true;
         this.statButton.enable = true;
         this.Renamed1872();
         this.state = this.Renamed1856;
         this.Renamed1837.visible = true;
         this.Renamed1831.visible = true;
         this.Renamed1826.visible = true;
         this.Renamed1842.visible = true;
         this.Renamed1842.text = localeService.getText(TanksLocale.TEXT_REFERAL_WINDOW_LINK_DESCRIPTION);
      }
      
      private function Renamed1863(param1:MouseEvent) : void
      {
         this.Renamed1820.enabled = true;
         this.Renamed1821.enabled = false;
         this.Renamed1822.enabled = true;
         this.statButton.enable = true;
         this.Renamed1872();
         this.state = this.Renamed1857;
         this.Renamed1838.visible = true;
         this.Renamed1831.visible = true;
         this.Renamed1826.visible = true;
         this.Renamed1842.visible = true;
         this.Renamed1842.text = localeService.getText(TanksLocale.TEXT_REFERAL_WINDOW_BANNER_DESCRIPTION);
      }
      
      private function Renamed1864(param1:MouseEvent) : void
      {
         this.Renamed1820.enabled = true;
         this.Renamed1821.enabled = true;
         this.Renamed1822.enabled = false;
         this.statButton.enable = true;
         this.Renamed1872();
         this.state = this.Renamed1858;
         this.Renamed1839.visible = true;
         this.Renamed1831.visible = true;
         this.Renamed1826.visible = true;
         this.Renamed1842.visible = true;
         this.Renamed1842.text = localeService.getText(TanksLocale.TEXT_REFERAL_WINDOW_MAIL_DESCRIPTION);
      }
      
      private function Renamed1866(param1:MouseEvent) : void
      {
         System.setClipboard(this.Renamed1843.textField.text);
      }
      
      private function Renamed1868(param1:MouseEvent) : void
      {
         System.setClipboard(this.Renamed1844.tf.text);
      }
      
      private function Renamed1870(param1:MouseEvent) : void
      {
         dispatchEvent(new Renamed1875(Renamed1875.Renamed1876,this.Renamed1849.value,this.Renamed1850.text));
      }
      
      public function Renamed1877() : void
      {
         if(this.Renamed1849 != null)
         {
            this.Renamed1849.value = "";
         }
      }
   }
}

