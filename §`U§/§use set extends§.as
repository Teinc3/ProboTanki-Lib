package §`U§
{
   import alternativa.osgi.service.locale.ILocaleService;
   import controls.TankWindowInner;
   import controls.base.LabelBase;
   import flash.display.Bitmap;
   import flash.display.Sprite;
   import flash.text.TextFormatAlign;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   
   public class §use set extends§ extends Sprite
   {
      [Inject]
      public static var localeService:ILocaleService;
      
      private const §"!D§:uint = 16777215;
      
      private const §while set each§:int = 120;
      
      private const §^"J§:int = 280;
      
      private const §override extends§:int = 10;
      
      private const BOTTOM_MARGIN:int = 5;
      
      private var §null var super§:TankWindowInner;
      
      private var §class var if§:LabelBase;
      
      public function §use set extends§()
      {
         super();
         this.§2! §();
         this.§3#W§();
         this.§]#>§();
         this.§,"M§();
      }
      
      private function §2! §() : void
      {
         this.§null var super§ = new TankWindowInner(0,0,TankWindowInner.GREEN);
         this.§null var super§.width = §6"§.§in set for§;
         addChild(this.§null var super§);
      }
      
      private function §3#W§() : void
      {
         var _loc1_:Bitmap = new Bitmap();
         _loc1_.x = int(this.§null var super§.width / 2 - this.§^"J§ / 2);
         _loc1_.y = this.§override extends§;
         _loc1_.bitmapData = §null catch throw§.§?G§;
         this.§null var super§.addChild(_loc1_);
      }
      
      private function §]#>§() : void
      {
         this.§class var if§ = new LabelBase();
         this.§class var if§.color = this.§"!D§;
         this.§class var if§.align = TextFormatAlign.CENTER;
         this.§class var if§.text = localeService.getText(TanksLocale.TEXT_DAILY_QUEST_ALL_MISSIONS_COMPLETED);
         this.§class var if§.x = int(§6"§.§in set for§ / 2 - this.§class var if§.width / 2);
         this.§class var if§.y = this.§while set each§ + this.§override extends§ * 2;
         this.§null var super§.addChild(this.§class var if§);
      }
      
      private function §,"M§() : void
      {
         this.§null var super§.height = this.§class var if§.height + this.§while set each§ + this.§override extends§ * 3;
      }
      
      public function §case catch break§() : int
      {
         return this.§null var super§.height + this.BOTTOM_MARGIN;
      }
   }
}

