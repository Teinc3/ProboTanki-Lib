package §`U§
{
   import §>#m§.§5!"§;
   import alternativa.osgi.service.locale.ILocaleService;
   import controls.base.LabelBase;
   import flash.display.Bitmap;
   import flash.display.Sprite;
   import flash.text.TextFormatAlign;
   import projects.tanks.client.panel.model.dailyquest.§native const in§;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   
   public class § "n§ extends Sprite
   {
      [Inject]
      public static var localeService:ILocaleService;
      
      private var §7#-§:Bitmap;
      
      private var §@!U§:Bitmap;
      
      private var §use set import§:Bitmap;
      
      private var §package const case§:Bitmap;
      
      private var §=#A§:Bitmap;
      
      private var §0!9§:Bitmap;
      
      private var §if extends§:Bitmap;
      
      private var §static catch with§:Bitmap;
      
      private var §extends const do§:Bitmap;
      
      private var §7![§:§5!"§;
      
      private var _width:int;
      
      private var _height:int;
      
      private var §-!v§:LabelBase;
      
      private var §catch const include§:LabelBase;
      
      private var §5#D§:LabelBase;
      
      private var §@"V§:LabelBase;
      
      private var §const set override§:Vector.<LabelBase>;
      
      private const §3X§:int = 5;
      
      private const §native set case§:int = 4;
      
      private const §case override§:int = 14;
      
      private const §for var static§:int = 9;
      
      private const §<M§:int = 50;
      
      private const §finally set case§:int = 14;
      
      private const §continue var if§:int = 8;
      
      private const §implements super§:int = 10;
      
      private const HEADER_COLOR:uint = 5898034;
      
      private const §switch package package§:uint = 16777215;
      
      public function § "n§(param1:§5!"§)
      {
         super();
         this.§7![§ = param1;
         this._width = §6"§.§in const do§ - this.§implements super§ * 2;
         this._height = this.§case catch break§();
         this.§const set override§ = new Vector.<LabelBase>();
         this.§3K§();
         this.§#!y§();
         this.§&#N§();
         this.§with catch class§();
         this.drawBackground();
         this.§default var try§();
         this.§native for throw§();
      }
      
      private function §3K§() : void
      {
         this.§7#-§ = new Bitmap(§null catch throw§.§extends for set§);
         addChild(this.§7#-§);
         this.§@!U§ = new Bitmap(§null catch throw§.§-v§);
         addChild(this.§@!U§);
         this.§use set import§ = new Bitmap(§null catch throw§.§`,§);
         addChild(this.§use set import§);
         this.§@!U§.x = this.§7#-§.width;
         this.§use set import§.x = this._width - this.§use set import§.width;
         this.§@!U§.width = this.§use set import§.x - this.§@!U§.x;
      }
      
      private function §#!y§() : void
      {
         this.§package const case§ = new Bitmap(§null catch throw§.§if for each§);
         this.§package const case§.y = this._height - this.§package const case§.height;
         addChild(this.§package const case§);
         this.§=#A§ = new Bitmap(§null catch throw§.§["&§);
         this.§=#A§.y = this.§package const case§.y;
         this.§=#A§.x = this.§package const case§.width;
         this.§=#A§.width = this.§@!U§.width;
         addChild(this.§=#A§);
         this.§0!9§ = new Bitmap(§null catch throw§.§each package use§);
         this.§0!9§.y = this.§package const case§.y;
         this.§0!9§.x = this.§use set import§.x;
         addChild(this.§0!9§);
      }
      
      private function §&#N§() : void
      {
         this.§if extends§ = new Bitmap(§null catch throw§.§static catch extends§);
         this.§if extends§.y = this.§7#-§.height;
         this.§if extends§.height = this._height - this.§7#-§.height - this.§package const case§.height;
         addChild(this.§if extends§);
      }
      
      private function §with catch class§() : void
      {
         this.§static catch with§ = new Bitmap(§null catch throw§.§return set with§);
         this.§static catch with§.y = this.§if extends§.y;
         this.§static catch with§.x = this.§0!9§.x;
         this.§static catch with§.height = this.§if extends§.height;
         addChild(this.§static catch with§);
      }
      
      private function drawBackground() : void
      {
         this.§extends const do§ = new Bitmap(§null catch throw§.§<"Z§);
         this.§extends const do§.y = this.§7#-§.height + this.§7#-§.y;
         this.§extends const do§.x = this.§7#-§.width;
         this.§extends const do§.height = this._height - this.§package const case§.height - this.§7#-§.height;
         this.§extends const do§.width = this._width - this.§7#-§.width - this.§use set import§.width;
         addChild(this.§extends const do§);
      }
      
      private function §default var try§() : void
      {
         this.§const for const§();
         this.§true const true§();
         this.§##R§();
      }
      
      private function §const for const§() : void
      {
         this.§5#D§ = new LabelBase();
         this.§5#D§.color = this.HEADER_COLOR;
         this.§5#D§.align = TextFormatAlign.LEFT;
         this.§5#D§.text = localeService.getText(TanksLocale.TEXT_DAILY_QUEST_GOAL);
         this.§5#D§.x = this.§3X§;
         this.§5#D§.y = this.§native set case§;
         addChild(this.§5#D§);
      }
      
      private function §true const true§() : void
      {
         this.§catch const include§ = new LabelBase();
         this.§catch const include§.color = this.§switch package package§;
         this.§catch const include§.align = TextFormatAlign.LEFT;
         this.§catch const include§.text = this.§&!d§();
         this.§catch const include§.x = this._width - this.§for var static§ - this.§catch const include§.textWidth;
         this.§catch const include§.y = this.§5#D§.y + this.§case override§;
         addChild(this.§catch const include§);
      }
      
      private function §##R§() : void
      {
         this.§-!v§ = new LabelBase();
         this.§-!v§.color = this.§switch package package§;
         this.§-!v§.align = TextFormatAlign.LEFT;
         this.§-!v§.text = this.§7![§.description;
         this.§-!v§.wordWrap = true;
         this.§-!v§.width = this.§catch const include§.x - this.§implements super§;
         this.§-!v§.x = this.§5#D§.x;
         this.§-!v§.y = this.§catch const include§.y;
         addChild(this.§-!v§);
      }
      
      private function §&!d§() : String
      {
         return this.§7![§.progress + "/" + this.§7![§.§2!O§;
      }
      
      private function §native for throw§() : void
      {
         this.§@"V§ = new LabelBase();
         this.§@"V§.color = this.HEADER_COLOR;
         this.§@"V§.align = TextFormatAlign.LEFT;
         this.§@"V§.text = localeService.getText(TanksLocale.TEXT_DAILY_QUEST_PRIZE);
         this.§@"V§.x = this.§3X§;
         this.§@"V§.y = this.§<M§;
         addChild(this.§@"V§);
         this.§5!m§();
      }
      
      public function §super for each§(param1:§5!"§) : void
      {
         this.§7![§ = param1;
         this.§-!v§.text = this.§7![§.description;
         this.§catch const include§.text = this.§&!d§();
         this.§catch const include§.x = this._width - this.§for var static§ - this.§catch const include§.textWidth;
         this.§const const§(this.§case catch break§());
         this.§package set continue§();
         this.§5!m§();
      }
      
      public function §const const§(param1:int) : void
      {
         this.§package const case§.y = param1 - this.§package const case§.height;
         this.§=#A§.y = this.§package const case§.y;
         this.§0!9§.y = this.§package const case§.y;
         this.§if extends§.height = param1 - this.§7#-§.height - this.§package const case§.height;
         this.§static catch with§.height = this.§if extends§.height;
         this.§extends const do§.height = param1 - this.§package const case§.height - this.§7#-§.height;
      }
      
      private function §package set continue§() : void
      {
         var _loc1_:LabelBase = null;
         for each(_loc1_ in this.§const set override§)
         {
            removeChild(_loc1_);
         }
         this.§const set override§.splice(0,this.§const set override§.length);
      }
      
      private function §5!m§() : void
      {
         var _loc1_:§native const in§ = null;
         var _loc2_:LabelBase = null;
         var _loc3_:int = 0;
         while(_loc3_ < this.§7![§.§,"5§.length)
         {
            _loc1_ = this.§7![§.§,"5§[_loc3_];
            _loc2_ = new LabelBase();
            _loc2_.color = this.§switch package package§;
            _loc2_.align = TextFormatAlign.LEFT;
            _loc2_.text = _loc1_.name + " × " + _loc1_.count;
            _loc2_.x = this.§3X§;
            _loc2_.y = this.§<M§ + this.§case override§ + _loc3_ * this.§finally set case§;
            addChild(_loc2_);
            this.§const set override§.push(_loc2_);
            _loc3_++;
         }
      }
      
      public function §case catch break§() : int
      {
         return this.§<M§ + this.§case override§ + this.§finally set case§ * this.§7![§.§,"5§.length + this.§continue var if§;
      }
   }
}

