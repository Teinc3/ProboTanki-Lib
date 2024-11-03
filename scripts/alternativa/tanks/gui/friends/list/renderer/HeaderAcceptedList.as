package alternativa.tanks.gui.friends.list.renderer
{
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.locale.constants.TextConst;
   import controls.base.LabelBase;
   import flash.display.Sprite;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormatAlign;
   import platform.clients.fp10.libraries.alternativapartners.service.IPartnerService;
   
   public class HeaderAcceptedList extends Sprite
   {
      [Inject]
      public static var localeService:ILocaleService;
      
      [Inject]
      public static var partnersService:IPartnerService;
      
      public static var HEADERS:Vector.<HeaderData>;
      
      protected var tabs:Vector.<Number>;
      
      protected var _width:int = 800;
      
      private var _serverNumberColumnName:LabelBase;
      
      public function HeaderAcceptedList()
      {
         var _loc1_:FriendsHeaderItem = null;
         this.tabs = new Vector.<Number>();
         super();
         HEADERS = Vector.<HeaderData>([new HeaderData(localeService.getText(TextConst.STRING_FRIENDS_NAME),TextFormatAlign.LEFT,2),new HeaderData(localeService.getText(TextConst.STRING_FRIENDS_BATTLE),TextFormatAlign.LEFT,2)]);
         var _loc2_:int = int(HEADERS.length);
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc1_ = new FriendsHeaderItem(HEADERS[_loc3_].align);
            _loc1_.label = HEADERS[_loc3_].text;
            _loc1_.setLabelPosX(HEADERS[_loc3_].posX);
            _loc1_.height = 18;
            addChild(_loc1_);
            _loc3_++;
         }
         this._serverNumberColumnName = new LabelBase();
         this._serverNumberColumnName.color = 860685;
         this._serverNumberColumnName.mouseEnabled = false;
         this._serverNumberColumnName.text = localeService.getText(TextConst.STRING_SERVER_LABEL_UPPERCASE);
         this._serverNumberColumnName.autoSize = TextFieldAutoSize.NONE;
         this._serverNumberColumnName.align = TextFormatAlign.RIGHT;
         this._serverNumberColumnName.width = 100;
         addChild(this._serverNumberColumnName);
         this.draw();
      }
      
      protected function draw() : void
      {
         var _loc1_:FriendsHeaderItem = null;
         this.tabs = Vector.<Number>([0,this._width / 2,this._width - 1]);
         var _loc2_:int = int(HEADERS.length);
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc1_ = getChildAt(_loc3_) as FriendsHeaderItem;
            _loc1_.width = this.tabs[_loc3_ + 1] - this.tabs[_loc3_] - 2;
            _loc1_.x = this.tabs[_loc3_];
            _loc3_++;
         }
         if(this._serverNumberColumnName != null)
         {
            this._serverNumberColumnName.x = this._width - this._serverNumberColumnName.width - 6;
         }
      }
      
      override public function set width(param1:Number) : void
      {
         this._width = Math.floor(param1);
         this.draw();
      }
   }
}

class HeaderData
{
   public var text:String;
   
   public var align:String;
   
   public var posX:int;
   
   public function HeaderData(param1:String, param2:String, param3:int)
   {
      super();
      this.text = param1;
      this.align = param2;
      this.posX = param3;
   }
}

