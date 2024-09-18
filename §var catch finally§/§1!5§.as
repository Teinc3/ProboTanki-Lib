package §var catch finally§
{
   import § !g§.§class for case§;
   import §-!z§.§;"8§;
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
   
   public class §1!5§ extends Sprite
   {
      [Inject]
      public static var localeService:ILocaleService;
      
      private static var §try for finally§:Object;
      
      public static const BLUE:int = 0;
      
      public static const RED:int = 1;
      
      public static const GREEN:int = 2;
      
      private static const §1^§:int = 52;
      
      private static const §import package implements§:int = 7;
      
      private static const §switch catch break§:int = 12;
      
      private static const §false var function§:int = 20;
      
      private var list:List;
      
      private var dp:DataProvider;
      
      private var inner:ResultWindowBase;
      
      private var type:int;
      
      private var §set const switch§:String;
      
      private var §set catch false§:Boolean;
      
      private var §`#Y§:§class for case§;
      
      private var header:Sprite;
      
      private var §override finally§:String;
      
      private var §^q§:String;
      
      private var §get var throw§:String;
      
      private var §^!5§:String;
      
      private var §^#t§:String;
      
      private var §case set for§:String;
      
      private var §class set finally§:String;
      
      private var §const const switch§:Boolean;
      
      public function §1!5§(param1:int, param2:String, param3:Boolean, param4:§class for case§, param5:Boolean)
      {
         this.dp = new DataProvider();
         super();
         if(§try for finally§ == null)
         {
            §<"o§();
         }
         this.type = param1;
         this.§set const switch§ = param2;
         this.§set catch false§ = param3;
         this.§`#Y§ = param4;
         this.tabEnabled = false;
         this.tabChildren = false;
         this.§const const switch§ = param5;
         this.§override finally§ = localeService.getText(TanksLocale.TEXT_BATTLE_STAT_CALLSIGN);
         this.§^q§ = localeService.getText(TanksLocale.TEXT_BATTLE_STAT_SCORE);
         this.§get var throw§ = localeService.getText(TanksLocale.TEXT_BATTLE_STAT_KILLS);
         this.§^!5§ = localeService.getText(TanksLocale.TEXT_BATTLE_STAT_DEATHS);
         this.§^#t§ = localeService.getText(TanksLocale.TEXT_BATTLE_STAT_KDRATIO);
         this.§case set for§ = localeService.getText(TanksLocale.TEXT_BATTLE_STAT_REWARD);
         this.§class set finally§ = localeService.getText(TanksLocale.TEXT_BATTLE_STAT_BONUS_REWARD);
         this.init();
      }
      
      private static function §<"o§() : void
      {
         §try for finally§ = {};
         §do set do§("downArrowUpSkin",ScrollSkinGreen.trackBottom,ScrollSkinRed.trackBottom,ScrollSkinBlue.trackBottom);
         §do set do§("downArrowDownSkin",ScrollSkinGreen.trackBottom,ScrollSkinRed.trackBottom,ScrollSkinBlue.trackBottom);
         §do set do§("downArrowOverSkin",ScrollSkinGreen.trackBottom,ScrollSkinRed.trackBottom,ScrollSkinBlue.trackBottom);
         §do set do§("downArrowDisabledSkin",ScrollSkinGreen.trackBottom,ScrollSkinRed.trackBottom,ScrollSkinBlue.trackBottom);
         §do set do§("upArrowUpSkin",ScrollSkinGreen.trackTop,ScrollSkinRed.trackTop,ScrollSkinBlue.trackTop);
         §do set do§("upArrowDownSkin",ScrollSkinGreen.trackTop,ScrollSkinRed.trackTop,ScrollSkinBlue.trackTop);
         §do set do§("upArrowOverSkin",ScrollSkinGreen.trackTop,ScrollSkinRed.trackTop,ScrollSkinBlue.trackTop);
         §do set do§("upArrowDisabledSkin",ScrollSkinGreen.trackTop,ScrollSkinRed.trackTop,ScrollSkinBlue.trackTop);
         §do set do§("trackUpSkin",ScrollSkinGreen.track,ScrollSkinRed.track,ScrollSkinBlue.track);
         §do set do§("trackDownSkin",ScrollSkinGreen.track,ScrollSkinRed.track,ScrollSkinBlue.track);
         §do set do§("trackOverSkin",ScrollSkinGreen.track,ScrollSkinRed.track,ScrollSkinBlue.track);
         §do set do§("trackDisabledSkin",ScrollSkinGreen.track,ScrollSkinRed.track,ScrollSkinBlue.track);
         §do set do§("thumbUpSkin",ScrollThumbSkinGreen,ScrollThumbSkinRed,ScrollThumbSkinBlue);
         §do set do§("thumbDownSkin",ScrollThumbSkinGreen,ScrollThumbSkinRed,ScrollThumbSkinBlue);
         §do set do§("thumbOverSkin",ScrollThumbSkinGreen,ScrollThumbSkinRed,ScrollThumbSkinBlue);
         §do set do§("thumbDisabledSkin",ScrollThumbSkinGreen,ScrollThumbSkinRed,ScrollThumbSkinBlue);
      }
      
      private static function §do set do§(param1:String, param2:Class, param3:Class, param4:Class) : void
      {
         var _loc5_:Dictionary;
         (_loc5_ = new Dictionary())[§1!5§.GREEN] = param2;
         _loc5_[§1!5§.RED] = param3;
         _loc5_[§1!5§.BLUE] = param4;
         §try for finally§[param1] = _loc5_;
      }
      
      private static function §false for catch§(param1:Sprite, param2:String, param3:uint, param4:String, param5:int, param6:int) : Label
      {
         var _loc7_:Label = null;
         (_loc7_ = new Label()).autoSize = TextFieldAutoSize.NONE;
         _loc7_.text = param2;
         _loc7_.color = param3;
         _loc7_.align = param4;
         _loc7_.x = param6;
         _loc7_.width = param5;
         _loc7_.height = §while set case§.ROW_HEIGHT;
         param1.addChild(_loc7_);
         return _loc7_;
      }
      
      public function §var for catch§(param1:§;"8§) : void
      {
         var _loc2_:int = param1.userId == null ? int(-1) : int(this.indexById(param1.userId));
         if(_loc2_ != -1)
         {
            this.dp.replaceItemAt(this.§ "f§(param1),_loc2_);
            this.sort();
         }
      }
      
      public function §6!=§(param1:Vector.<§;"8§>) : void
      {
         this.dp.removeAll();
         var _loc2_:int = int(param1.length);
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            this.dp.addItem(this.§ "f§(param1[_loc3_]));
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
      
      private function § "f§(param1:§;"8§) : Object
      {
         var _loc2_:§"R§ = new §"R§();
         _loc2_.id = param1.userId;
         _loc2_.rank = param1.rank;
         _loc2_.uid = param1.uid;
         _loc2_.kills = param1.kills;
         _loc2_.deaths = param1.deaths;
         _loc2_.score = param1.score;
         _loc2_.reward = param1.reward;
         _loc2_.§do const use§ = param1.§do const use§;
         _loc2_.§true for try§ = param1.§true for try§;
         _loc2_.type = this.type;
         _loc2_.self = param1.userId == this.§set const switch§;
         _loc2_.loaded = param1.loaded;
         _loc2_.suspicious = param1.suspicious;
         return _loc2_;
      }
      
      public function §set for while§(param1:String) : void
      {
         var _loc2_:int = this.indexById(param1);
         this.dp.removeItemAt(_loc2_);
      }
      
      public function resize(param1:Number) : void
      {
         var _loc2_:Number = (this.dp.length + 1) * §while set case§.ROW_HEIGHT + §switch catch break§;
         if(_loc2_ > param1)
         {
            _loc2_ = int(param1 / this.header.height) * this.header.height + §switch catch break§;
         }
         this.inner.height = _loc2_ < §1^§ ? Number(§1^§) : Number(_loc2_);
         this.list.setSize(this.inner.width - 2 * §while set case§.§import package implements§,this.inner.height - this.header.y - this.header.height - 5);
      }
      
      [Obfuscation(rename="false")]
      override public function get height() : Number
      {
         return this.inner.height;
      }
      
      private function indexById(param1:String) : int
      {
         var _loc2_:§"R§ = null;
         var _loc3_:int = int(this.dp.length);
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc2_ = this.dp.getItemAt(_loc4_) as §"R§;
            if(_loc2_ != null && _loc2_.id == param1)
            {
               return _loc4_;
            }
            _loc4_++;
         }
         return -1;
      }
      
      private function §get var static§() : void
      {
         this.§3"X§("downArrowUpSkin");
         this.§3"X§("downArrowDownSkin");
         this.§3"X§("downArrowOverSkin");
         this.§3"X§("downArrowDisabledSkin");
         this.§3"X§("upArrowUpSkin");
         this.§3"X§("upArrowDownSkin");
         this.§3"X§("upArrowOverSkin");
         this.§3"X§("upArrowDisabledSkin");
         this.§3"X§("trackUpSkin");
         this.§3"X§("trackDownSkin");
         this.§3"X§("trackOverSkin");
         this.§3"X§("trackDisabledSkin");
         this.§3"X§("thumbUpSkin");
         this.§3"X§("thumbDownSkin");
         this.§3"X§("thumbOverSkin");
         this.§3"X§("thumbDisabledSkin");
      }
      
      private function §3"X§(param1:String) : void
      {
         this.list.setStyle(param1,§try for finally§[param1][this.type]);
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
         this.inner.width = §while set case§.§while include§ + 2 * §while set case§.§import package implements§ + §while set case§.§`"<§ + §while set case§.§include set package§ + §while set case§.§implements var with§ + §while set case§.§#"i§ + §while set case§.§?!b§ + (this.type != GREEN ? §while set case§.§import for continue§ : 0) + (this.§set catch false§ ? §while set case§.§const var try§ + §while set case§.§include var extends§ : 0) + §false var function§;
         this.inner.height = §1^§;
         addChild(this.inner);
         this.header = this.§=F§();
         this.inner.addChild(this.header);
         this.header.x = §import package implements§;
         this.header.y = §import package implements§;
         this.dp = new DataProvider();
         this.list = new List();
         this.§get var static§();
         this.inner.addChild(this.list);
         this.list.rowHeight = §while set case§.ROW_HEIGHT;
         this.list.x = §import package implements§;
         §!f§.§const const switch§ = this.§const const switch§;
         this.list.setStyle("cellRenderer",§!f§);
         this.list.y = this.header.y + this.header.height;
         this.list.focusEnabled = false;
         this.list.dataProvider = this.dp;
      }
      
      private function §=F§() : Sprite
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
         var _loc5_:int = §while set case§.§`"<§;
         _loc3_ = §false for catch§(_loc4_,this.§override finally§,_loc2_,TextFormatAlign.LEFT,§while set case§.§include set package§,_loc5_);
         _loc5_ += _loc3_.width;
         if(this.type != GREEN)
         {
            _loc3_ = §false for catch§(_loc4_,this.§^q§,_loc2_,TextFormatAlign.RIGHT,§while set case§.§import for continue§,_loc5_);
            _loc5_ += _loc3_.width;
         }
         _loc3_ = §false for catch§(_loc4_,this.§get var throw§,_loc2_,TextFormatAlign.RIGHT,§while set case§.§implements var with§,_loc5_);
         _loc5_ += _loc3_.width;
         _loc3_ = §false for catch§(_loc4_,this.§^!5§,_loc2_,TextFormatAlign.RIGHT,§while set case§.§#"i§,_loc5_);
         _loc5_ += _loc3_.width;
         _loc3_ = §false for catch§(_loc4_,this.§^#t§,_loc2_,TextFormatAlign.RIGHT,§while set case§.§?!b§,_loc5_);
         _loc5_ += _loc3_.width;
         if(this.§set catch false§)
         {
            _loc3_ = §false for catch§(_loc4_,this.§case set for§,_loc2_,TextFormatAlign.RIGHT,§while set case§.§const var try§,_loc5_);
            _loc5_ += _loc3_.width;
            if(this.§const const switch§)
            {
               §false for catch§(_loc4_,this.§class set finally§,_loc2_,TextFormatAlign.RIGHT,§while set case§.§include var extends§,_loc5_);
            }
         }
         _loc1_.width = width - 2 * §import package implements§;
         _loc1_.height = §while set case§.ROW_HEIGHT - 2;
         return _loc4_;
      }
   }
}

