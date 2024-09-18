package Renamed504
{
   import Renamed4808.Renamed5536;
   import alternativa.osgi.service.locale.ILocaleService;
   import controls.base.LabelBase;
   import flash.display.Bitmap;
   import flash.display.Sprite;
   import flash.text.TextFormatAlign;
   import projects.tanks.client.panel.model.dailyquest.Renamed4365;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   
   public class Renamed4811 extends Sprite
   {
      [Inject]
      public static var localeService:ILocaleService;
      
      private var Renamed9878:Bitmap;
      
      private var Renamed9879:Bitmap;
      
      private var Renamed9880:Bitmap;
      
      private var Renamed9881:Bitmap;
      
      private var Renamed9882:Bitmap;
      
      private var Renamed9883:Bitmap;
      
      private var Renamed9884:Bitmap;
      
      private var Renamed9885:Bitmap;
      
      private var Renamed9886:Bitmap;
      
      private var Renamed6464:Renamed5536;
      
      private var _width:int;
      
      private var _height:int;
      
      private var Renamed9887:LabelBase;
      
      private var Renamed9888:LabelBase;
      
      private var Renamed9889:LabelBase;
      
      private var Renamed9890:LabelBase;
      
      private var Renamed9891:Vector.<LabelBase>;
      
      private const Renamed9892:int = 5;
      
      private const Renamed9893:int = 4;
      
      private const Renamed9894:int = 14;
      
      private const Renamed9895:int = 9;
      
      private const Renamed9896:int = 50;
      
      private const Renamed9897:int = 14;
      
      private const Renamed9898:int = 8;
      
      private const Renamed9899:int = 10;
      
      private const HEADER_COLOR:uint = 5898034;
      
      private const Renamed9900:uint = 16777215;
      
      public function Renamed4811(param1:Renamed5536)
      {
         super();
         this.Renamed6464 = param1;
         this._width = Renamed4812.Renamed9901 - this.Renamed9899 * 2;
         this._height = this.Renamed746();
         this.Renamed9891 = new Vector.<LabelBase>();
         this.Renamed9902();
         this.Renamed9903();
         this.Renamed9904();
         this.Renamed9905();
         this.drawBackground();
         this.Renamed9906();
         this.Renamed9907();
      }
      
      private function Renamed9902() : void
      {
         this.Renamed9878 = new Bitmap(Renamed9908.Renamed9909);
         addChild(this.Renamed9878);
         this.Renamed9879 = new Bitmap(Renamed9908.Renamed9910);
         addChild(this.Renamed9879);
         this.Renamed9880 = new Bitmap(Renamed9908.Renamed9911);
         addChild(this.Renamed9880);
         this.Renamed9879.x = this.Renamed9878.width;
         this.Renamed9880.x = this._width - this.Renamed9880.width;
         this.Renamed9879.width = this.Renamed9880.x - this.Renamed9879.x;
      }
      
      private function Renamed9903() : void
      {
         this.Renamed9881 = new Bitmap(Renamed9908.Renamed9912);
         this.Renamed9881.y = this._height - this.Renamed9881.height;
         addChild(this.Renamed9881);
         this.Renamed9882 = new Bitmap(Renamed9908.Renamed9913);
         this.Renamed9882.y = this.Renamed9881.y;
         this.Renamed9882.x = this.Renamed9881.width;
         this.Renamed9882.width = this.Renamed9879.width;
         addChild(this.Renamed9882);
         this.Renamed9883 = new Bitmap(Renamed9908.Renamed9914);
         this.Renamed9883.y = this.Renamed9881.y;
         this.Renamed9883.x = this.Renamed9880.x;
         addChild(this.Renamed9883);
      }
      
      private function Renamed9904() : void
      {
         this.Renamed9884 = new Bitmap(Renamed9908.Renamed9915);
         this.Renamed9884.y = this.Renamed9878.height;
         this.Renamed9884.height = this._height - this.Renamed9878.height - this.Renamed9881.height;
         addChild(this.Renamed9884);
      }
      
      private function Renamed9905() : void
      {
         this.Renamed9885 = new Bitmap(Renamed9908.Renamed9916);
         this.Renamed9885.y = this.Renamed9884.y;
         this.Renamed9885.x = this.Renamed9883.x;
         this.Renamed9885.height = this.Renamed9884.height;
         addChild(this.Renamed9885);
      }
      
      private function drawBackground() : void
      {
         this.Renamed9886 = new Bitmap(Renamed9908.Renamed9917);
         this.Renamed9886.y = this.Renamed9878.height + this.Renamed9878.y;
         this.Renamed9886.x = this.Renamed9878.width;
         this.Renamed9886.height = this._height - this.Renamed9881.height - this.Renamed9878.height;
         this.Renamed9886.width = this._width - this.Renamed9878.width - this.Renamed9880.width;
         addChild(this.Renamed9886);
      }
      
      private function Renamed9906() : void
      {
         this.Renamed9918();
         this.Renamed9919();
         this.Renamed9920();
      }
      
      private function Renamed9918() : void
      {
         this.Renamed9889 = new LabelBase();
         this.Renamed9889.color = this.HEADER_COLOR;
         this.Renamed9889.align = TextFormatAlign.LEFT;
         this.Renamed9889.text = localeService.getText(TanksLocale.TEXT_DAILY_QUEST_GOAL);
         this.Renamed9889.x = this.Renamed9892;
         this.Renamed9889.y = this.Renamed9893;
         addChild(this.Renamed9889);
      }
      
      private function Renamed9919() : void
      {
         this.Renamed9888 = new LabelBase();
         this.Renamed9888.color = this.Renamed9900;
         this.Renamed9888.align = TextFormatAlign.LEFT;
         this.Renamed9888.text = this.Renamed9921();
         this.Renamed9888.x = this._width - this.Renamed9895 - this.Renamed9888.textWidth;
         this.Renamed9888.y = this.Renamed9889.y + this.Renamed9894;
         addChild(this.Renamed9888);
      }
      
      private function Renamed9920() : void
      {
         this.Renamed9887 = new LabelBase();
         this.Renamed9887.color = this.Renamed9900;
         this.Renamed9887.align = TextFormatAlign.LEFT;
         this.Renamed9887.text = this.Renamed6464.description;
         this.Renamed9887.wordWrap = true;
         this.Renamed9887.width = this.Renamed9888.x - this.Renamed9899;
         this.Renamed9887.x = this.Renamed9889.x;
         this.Renamed9887.y = this.Renamed9888.y;
         addChild(this.Renamed9887);
      }
      
      private function Renamed9921() : String
      {
         return this.Renamed6464.progress + "/" + this.Renamed6464.Renamed5545;
      }
      
      private function Renamed9907() : void
      {
         this.Renamed9890 = new LabelBase();
         this.Renamed9890.color = this.HEADER_COLOR;
         this.Renamed9890.align = TextFormatAlign.LEFT;
         this.Renamed9890.text = localeService.getText(TanksLocale.TEXT_DAILY_QUEST_PRIZE);
         this.Renamed9890.x = this.Renamed9892;
         this.Renamed9890.y = this.Renamed9896;
         addChild(this.Renamed9890);
         this.Renamed9922();
      }
      
      public function Renamed9923(param1:Renamed5536) : void
      {
         this.Renamed6464 = param1;
         this.Renamed9887.text = this.Renamed6464.description;
         this.Renamed9888.text = this.Renamed9921();
         this.Renamed9888.x = this._width - this.Renamed9895 - this.Renamed9888.textWidth;
         this.Renamed9924(this.Renamed746());
         this.Renamed9925();
         this.Renamed9922();
      }
      
      public function Renamed9924(param1:int) : void
      {
         this.Renamed9881.y = param1 - this.Renamed9881.height;
         this.Renamed9882.y = this.Renamed9881.y;
         this.Renamed9883.y = this.Renamed9881.y;
         this.Renamed9884.height = param1 - this.Renamed9878.height - this.Renamed9881.height;
         this.Renamed9885.height = this.Renamed9884.height;
         this.Renamed9886.height = param1 - this.Renamed9881.height - this.Renamed9878.height;
      }
      
      private function Renamed9925() : void
      {
         var _loc1_:LabelBase = null;
         for each(_loc1_ in this.Renamed9891)
         {
            removeChild(_loc1_);
         }
         this.Renamed9891.splice(0,this.Renamed9891.length);
      }
      
      private function Renamed9922() : void
      {
         var _loc1_:Renamed4365 = null;
         var _loc2_:LabelBase = null;
         var _loc3_:int = 0;
         while(_loc3_ < this.Renamed6464.Renamed5546.length)
         {
            _loc1_ = this.Renamed6464.Renamed5546[_loc3_];
            _loc2_ = new LabelBase();
            _loc2_.color = this.Renamed9900;
            _loc2_.align = TextFormatAlign.LEFT;
            _loc2_.text = _loc1_.name + " × " + _loc1_.count;
            _loc2_.x = this.Renamed9892;
            _loc2_.y = this.Renamed9896 + this.Renamed9894 + _loc3_ * this.Renamed9897;
            addChild(_loc2_);
            this.Renamed9891.push(_loc2_);
            _loc3_++;
         }
      }
      
      public function Renamed746() : int
      {
         return this.Renamed9896 + this.Renamed9894 + this.Renamed9897 * this.Renamed6464.Renamed5546.length + this.Renamed9898;
      }
   }
}

