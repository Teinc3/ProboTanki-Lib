package Renamed451
{
   import Renamed136.Renamed663;
   import Renamed215.Renamed5725;
   import alternativa.osgi.service.locale.ILocaleService;
   import controls.Label;
   import controls.resultassets.ResultWindowBase;
   import controls.resultassets.ResultWindowBlue;
   import controls.resultassets.ResultWindowBlueHeader;
   import controls.resultassets.ResultWindowGreen;
   import controls.resultassets.ResultWindowGreenHeader;
   import controls.resultassets.ResultWindowRed;
   import controls.resultassets.ResultWindowRedHeader;
   import controls.scroller.blue.ScrollSkinBlue;
   import controls.scroller.blue.ScrollThumbSkinBlue;
   import controls.scroller.green.ScrollSkinGreen;
   import controls.scroller.green.ScrollThumbSkinGreen;
   import controls.scroller.red.ScrollSkinRed;
   import controls.scroller.red.ScrollThumbSkinRed;
   import fl.controls.List;
   import fl.data.DataProvider;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormatAlign;
   import flash.utils.Dictionary;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   
   public class Renamed4718 extends Sprite
   {
      [Inject]
      public static var localeService:ILocaleService;
      
      private static var Renamed9053:Object;
      
      public static const BLUE:int = 0;
      
      public static const RED:int = 1;
      
      public static const GREEN:int = 2;
      
      private static const Renamed9054:int = 52;
      
      private static const Renamed9055:int = 7;
      
      private static const Renamed9056:int = 12;
      
      private static const Renamed9057:int = 20;
      
      private var list:List;
      
      private var dp:DataProvider;
      
      private var inner:ResultWindowBase;
      
      private var type:int;
      
      private var Renamed9058:String;
      
      private var Renamed9059:Boolean;
      
      private var Renamed9060:Renamed663;
      
      private var header:Sprite;
      
      private var Renamed9061:String;
      
      private var Renamed9062:String;
      
      private var Renamed9063:String;
      
      private var Renamed9064:String;
      
      private var Renamed9065:String;
      
      private var Renamed9066:String;
      
      private var Renamed9067:String;
      
      private var Renamed9009:Boolean;
      
      public function Renamed4718(param1:int, param2:String, param3:Boolean, param4:Renamed663, param5:Boolean)
      {
         this.dp = new DataProvider();
         super();
         if(Renamed9053 == null)
         {
            Renamed9068();
         }
         this.type = param1;
         this.Renamed9058 = param2;
         this.Renamed9059 = param3;
         this.Renamed9060 = param4;
         this.tabEnabled = false;
         this.tabChildren = false;
         this.Renamed9009 = param5;
         this.Renamed9061 = localeService.getText(TanksLocale.TEXT_BATTLE_STAT_CALLSIGN);
         this.Renamed9062 = localeService.getText(TanksLocale.TEXT_BATTLE_STAT_SCORE);
         this.Renamed9063 = localeService.getText(TanksLocale.TEXT_BATTLE_STAT_KILLS);
         this.Renamed9064 = localeService.getText(TanksLocale.TEXT_BATTLE_STAT_DEATHS);
         this.Renamed9065 = localeService.getText(TanksLocale.TEXT_BATTLE_STAT_KDRATIO);
         this.Renamed9066 = localeService.getText(TanksLocale.TEXT_BATTLE_STAT_REWARD);
         this.Renamed9067 = localeService.getText(TanksLocale.TEXT_BATTLE_STAT_BONUS_REWARD);
         this.init();
      }
      
      private static function Renamed9068() : void
      {
         Renamed9053 = {};
         Renamed9069("downArrowUpSkin",ScrollSkinGreen.trackBottom,ScrollSkinRed.trackBottom,ScrollSkinBlue.trackBottom);
         Renamed9069("downArrowDownSkin",ScrollSkinGreen.trackBottom,ScrollSkinRed.trackBottom,ScrollSkinBlue.trackBottom);
         Renamed9069("downArrowOverSkin",ScrollSkinGreen.trackBottom,ScrollSkinRed.trackBottom,ScrollSkinBlue.trackBottom);
         Renamed9069("downArrowDisabledSkin",ScrollSkinGreen.trackBottom,ScrollSkinRed.trackBottom,ScrollSkinBlue.trackBottom);
         Renamed9069("upArrowUpSkin",ScrollSkinGreen.trackTop,ScrollSkinRed.trackTop,ScrollSkinBlue.trackTop);
         Renamed9069("upArrowDownSkin",ScrollSkinGreen.trackTop,ScrollSkinRed.trackTop,ScrollSkinBlue.trackTop);
         Renamed9069("upArrowOverSkin",ScrollSkinGreen.trackTop,ScrollSkinRed.trackTop,ScrollSkinBlue.trackTop);
         Renamed9069("upArrowDisabledSkin",ScrollSkinGreen.trackTop,ScrollSkinRed.trackTop,ScrollSkinBlue.trackTop);
         Renamed9069("trackUpSkin",ScrollSkinGreen.track,ScrollSkinRed.track,ScrollSkinBlue.track);
         Renamed9069("trackDownSkin",ScrollSkinGreen.track,ScrollSkinRed.track,ScrollSkinBlue.track);
         Renamed9069("trackOverSkin",ScrollSkinGreen.track,ScrollSkinRed.track,ScrollSkinBlue.track);
         Renamed9069("trackDisabledSkin",ScrollSkinGreen.track,ScrollSkinRed.track,ScrollSkinBlue.track);
         Renamed9069("thumbUpSkin",ScrollThumbSkinGreen,ScrollThumbSkinRed,ScrollThumbSkinBlue);
         Renamed9069("thumbDownSkin",ScrollThumbSkinGreen,ScrollThumbSkinRed,ScrollThumbSkinBlue);
         Renamed9069("thumbOverSkin",ScrollThumbSkinGreen,ScrollThumbSkinRed,ScrollThumbSkinBlue);
         Renamed9069("thumbDisabledSkin",ScrollThumbSkinGreen,ScrollThumbSkinRed,ScrollThumbSkinBlue);
      }
      
      private static function Renamed9069(param1:String, param2:Class, param3:Class, param4:Class) : void
      {
         var _loc5_:Dictionary;
         (_loc5_ = new Dictionary())[Renamed4718.GREEN] = param2;
         _loc5_[Renamed4718.RED] = param3;
         _loc5_[Renamed4718.BLUE] = param4;
         Renamed9053[param1] = _loc5_;
      }
      
      private static function Renamed9070(param1:Sprite, param2:String, param3:uint, param4:String, param5:int, param6:int) : Label
      {
         var _loc7_:Label = null;
         (_loc7_ = new Label()).autoSize = TextFieldAutoSize.NONE;
         _loc7_.text = param2;
         _loc7_.color = param3;
         _loc7_.align = param4;
         _loc7_.x = param6;
         _loc7_.width = param5;
         _loc7_.height = Renamed9015.ROW_HEIGHT;
         param1.addChild(_loc7_);
         return _loc7_;
      }
      
      public function Renamed9049(param1:Renamed5725) : void
      {
         var _loc2_:int = param1.userId == null ? int(-1) : int(this.indexById(param1.userId));
         if(_loc2_ != -1)
         {
            this.dp.replaceItemAt(this.Renamed9071(param1),_loc2_);
            this.sort();
         }
      }
      
      public function Renamed9043(param1:Vector.<Renamed5725>) : void
      {
         this.dp.removeAll();
         var _loc2_:int = int(param1.length);
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            this.dp.addItem(this.Renamed9071(param1[_loc3_]));
            _loc3_++;
         }
         this.sort();
      }
      
      private function sort() : void
      {
         if(this.type == GREEN)
         {
            this.dp.sortOn(["kills","deaths"],[Array.DESCENDING | Array.NUMERIC,Array.NUMERIC]);
         }
         else
         {
            this.dp.sortOn(["score","kills","deaths"],[Array.DESCENDING | Array.NUMERIC,Array.DESCENDING | Array.NUMERIC,Array.NUMERIC]);
         }
      }
      
      private function Renamed9071(param1:Renamed5725) : Object
      {
         var _loc2_:Renamed9018 = new Renamed9018();
         _loc2_.id = param1.userId;
         _loc2_.rank = param1.rank;
         _loc2_.uid = param1.uid;
         _loc2_.kills = param1.kills;
         _loc2_.deaths = param1.deaths;
         _loc2_.score = param1.score;
         _loc2_.reward = param1.reward;
         _loc2_.Renamed4213 = param1.Renamed4213;
         _loc2_.Renamed4212 = param1.Renamed4212;
         _loc2_.type = this.type;
         _loc2_.self = param1.userId == this.Renamed9058;
         _loc2_.loaded = param1.loaded;
         _loc2_.suspicious = param1.suspicious;
         return _loc2_;
      }
      
      public function Renamed5748(param1:String) : void
      {
         var _loc2_:int = this.indexById(param1);
         this.dp.removeItemAt(_loc2_);
      }
      
      public function resize(param1:Number) : void
      {
         var _loc2_:Number = (this.dp.length + 1) * Renamed9015.ROW_HEIGHT + Renamed9056;
         if(_loc2_ > param1)
         {
            _loc2_ = int(param1 / this.header.height) * this.header.height + Renamed9056;
         }
         this.inner.height = _loc2_ < Renamed9054 ? Number(Renamed9054) : Number(_loc2_);
         this.list.setSize(this.inner.width - 2 * Renamed9015.Renamed9055,this.inner.height - this.header.y - this.header.height - 5);
      }
      
      [Obfuscation(rename="false")]
      override public function get height() : Number
      {
         return this.inner.height;
      }
      
      private function indexById(param1:String) : int
      {
         var _loc2_:Renamed9018 = null;
         var _loc3_:int = int(this.dp.length);
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc2_ = this.dp.getItemAt(_loc4_) as Renamed9018;
            if(_loc2_ != null && _loc2_.id == param1)
            {
               return _loc4_;
            }
            _loc4_++;
         }
         return -1;
      }
      
      private function Renamed9072() : void
      {
         this.Renamed9073("downArrowUpSkin");
         this.Renamed9073("downArrowDownSkin");
         this.Renamed9073("downArrowOverSkin");
         this.Renamed9073("downArrowDisabledSkin");
         this.Renamed9073("upArrowUpSkin");
         this.Renamed9073("upArrowDownSkin");
         this.Renamed9073("upArrowOverSkin");
         this.Renamed9073("upArrowDisabledSkin");
         this.Renamed9073("trackUpSkin");
         this.Renamed9073("trackDownSkin");
         this.Renamed9073("trackOverSkin");
         this.Renamed9073("trackDisabledSkin");
         this.Renamed9073("thumbUpSkin");
         this.Renamed9073("thumbDownSkin");
         this.Renamed9073("thumbOverSkin");
         this.Renamed9073("thumbDisabledSkin");
      }
      
      private function Renamed9073(param1:String) : void
      {
         this.list.setStyle(param1,Renamed9053[param1][this.type]);
      }
      
      private function init() : void
      {
         switch(this.type)
         {
            case RED:
               this.inner = new ResultWindowRed();
               break;
            case GREEN:
               this.inner = new ResultWindowGreen();
               break;
            case BLUE:
               this.inner = new ResultWindowBlue();
         }
         this.inner.width = Renamed9015.Renamed9074 + 2 * Renamed9015.Renamed9055 + Renamed9015.Renamed9019 + Renamed9015.Renamed9020 + Renamed9015.Renamed9022 + Renamed9015.Renamed9023 + Renamed9015.Renamed9024 + (this.type != GREEN ? Renamed9015.Renamed9021 : 0) + (this.Renamed9059 ? Renamed9015.Renamed9025 + Renamed9015.Renamed9017 : 0) + Renamed9057;
         this.inner.height = Renamed9054;
         addChild(this.inner);
         this.header = this.Renamed9075();
         this.inner.addChild(this.header);
         this.header.x = Renamed9055;
         this.header.y = Renamed9055;
         this.dp = new DataProvider();
         this.list = new List();
         this.Renamed9072();
         this.inner.addChild(this.list);
         this.list.rowHeight = Renamed9015.ROW_HEIGHT;
         this.list.x = Renamed9055;
         Renamed4717.Renamed9009 = this.Renamed9009;
         this.list.setStyle("cellRenderer",Renamed4717);
         this.list.y = this.header.y + this.header.height;
         this.list.focusEnabled = false;
         this.list.dataProvider = this.dp;
      }
      
      private function Renamed9075() : Sprite
      {
         var _loc1_:DisplayObject = null;
         var _loc2_:uint = 0;
         var _loc3_:Label = null;
         switch(this.type)
         {
            case BLUE:
               _loc1_ = new ResultWindowBlueHeader();
               _loc2_ = 11590;
               break;
            case GREEN:
               _loc1_ = new ResultWindowGreenHeader();
               _loc2_ = 83457;
               break;
            case RED:
               _loc1_ = new ResultWindowRedHeader();
               _loc2_ = 4655104;
         }
         var _loc4_:Sprite = new Sprite();
         _loc4_.addChild(_loc1_);
         var _loc5_:int = Renamed9015.Renamed9019;
         _loc3_ = Renamed9070(_loc4_,this.Renamed9061,_loc2_,TextFormatAlign.LEFT,Renamed9015.Renamed9020,_loc5_);
         _loc5_ += _loc3_.width;
         if(this.type != GREEN)
         {
            _loc3_ = Renamed9070(_loc4_,this.Renamed9062,_loc2_,TextFormatAlign.RIGHT,Renamed9015.Renamed9021,_loc5_);
            _loc5_ += _loc3_.width;
         }
         _loc3_ = Renamed9070(_loc4_,this.Renamed9063,_loc2_,TextFormatAlign.RIGHT,Renamed9015.Renamed9022,_loc5_);
         _loc5_ += _loc3_.width;
         _loc3_ = Renamed9070(_loc4_,this.Renamed9064,_loc2_,TextFormatAlign.RIGHT,Renamed9015.Renamed9023,_loc5_);
         _loc5_ += _loc3_.width;
         _loc3_ = Renamed9070(_loc4_,this.Renamed9065,_loc2_,TextFormatAlign.RIGHT,Renamed9015.Renamed9024,_loc5_);
         _loc5_ += _loc3_.width;
         if(this.Renamed9059)
         {
            _loc3_ = Renamed9070(_loc4_,this.Renamed9066,_loc2_,TextFormatAlign.RIGHT,Renamed9015.Renamed9025,_loc5_);
            _loc5_ += _loc3_.width;
            if(this.Renamed9009)
            {
               Renamed9070(_loc4_,this.Renamed9067,_loc2_,TextFormatAlign.RIGHT,Renamed9015.Renamed9017,_loc5_);
            }
         }
         _loc1_.width = width - 2 * Renamed9055;
         _loc1_.height = Renamed9015.ROW_HEIGHT - 2;
         return _loc4_;
      }
   }
}

