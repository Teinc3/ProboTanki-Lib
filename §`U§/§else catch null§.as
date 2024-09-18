package §`U§
{
   import §0#W§.§&h§;
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.gui.effects.BlinkEffect;
   import controls.TankWindowInner;
   import controls.labels.MouseDisabledLabel;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.BlendMode;
   import flash.display.Graphics;
   import flash.display.Shape;
   import flash.display.Sprite;
   import flash.geom.Matrix;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   
   public class §else catch null§ extends Sprite
   {
      [Inject]
      public static var localeService:ILocaleService;
      
      private static const leftProgressResource:Class = §get catch var§;
      
      private static const centerProgressResource:Class = §super set include§;
      
      private static const §include catch extends§:int = 570;
      
      public static const HEIGHT:int = 50;
      
      private static const §[!x§:int = 7;
      
      private static const SPACE:int = 5;
      
      private static const §include var false§:int = 5;
      
      private static const §^"J§:int = 44;
      
      private var leftProgressPart:Bitmap;
      
      private var centerProgressPart:Bitmap;
      
      private var §,!"§:TankWindowInner;
      
      private var §6"Q§:Bitmap;
      
      private var §extends const get§:Bitmap;
      
      private var §case for continue§:MouseDisabledLabel;
      
      private var §function for while§:int;
      
      private var §use const final§:Boolean;
      
      private var §#"8§:Bitmap;
      
      private var §each const while§:Bitmap;
      
      private var blinkEffect:BlinkEffect;
      
      private var §while const get§:int;
      
      public function §else catch null§()
      {
         this.leftProgressPart = new Bitmap(new leftProgressResource().bitmapData);
         this.centerProgressPart = new Bitmap(new centerProgressResource().bitmapData);
         this.§6"Q§ = new Bitmap();
         this.§extends const get§ = new Bitmap();
         this.§case for continue§ = new MouseDisabledLabel();
         this.§#"8§ = new Bitmap();
         this.§each const while§ = new Bitmap();
         this.blinkEffect = new BlinkEffect(0.3,0.6);
         super();
      }
      
      public function init(param1:§&h§) : void
      {
         this.§function for while§ = param1.§function for while§;
         this.§use const final§ = param1.§3"a§;
         this.§&$!§(param1);
      }
      
      private function §&$!§(param1:§&h§) : void
      {
         this.§#"8§.bitmapData = param1.§#"8§.data;
         this.§#"8§.x = 0;
         this.§#"8§.y = SPACE + 4;
         addChild(this.§#"8§);
         this.§each const while§.bitmapData = param1.§each const while§.data;
         this.§each const while§.x = this.§while const get§ - SPACE;
         this.§each const while§.y = 2 * SPACE + 4;
         addChild(this.§each const while§);
      }
      
      public function redraw(param1:int) : void
      {
         this.§while const get§ = param1 - 2 * §^"J§ - 2 * §include var false§;
         this.§%!3§();
      }
      
      public function §;U§(param1:int) : void
      {
         if(!this.§use const final§)
         {
            ++this.§function for while§;
            this.§use const final§ = true;
         }
         this.redraw(param1);
      }
      
      private function §%!3§() : void
      {
         this.§,"c§();
         this.§2#`§();
         this.§class set if§();
         this.§2"9§();
      }
      
      private function §2"9§() : void
      {
         this.§case for continue§.visible = this.§while const get§ > §include catch extends§;
      }
      
      private function §,"c§() : void
      {
         this.§each const while§.x = this.§while const get§ + §^"J§ + 2 * §include var false§;
      }
      
      private function §2#`§() : void
      {
         if(this.§,!"§ == null)
         {
            this.§,!"§ = new TankWindowInner(this.§while const get§,HEIGHT,TankWindowInner.GREEN);
            this.§,!"§.x = §^"J§ + §include var false§;
            this.§,!"§.y = SPACE;
            addChild(this.§,!"§);
            this.§6"Q§.x = §^"J§ + §include var false§ + 1;
            this.§6"Q§.y = SPACE + 1;
            this.§6"Q§.blendMode = BlendMode.OVERLAY;
            addChild(this.§6"Q§);
            this.§extends const get§.y = SPACE + 1;
            this.§extends const get§.blendMode = BlendMode.OVERLAY;
            addChild(this.§extends const get§);
            this.§case for continue§.x = §^"J§ + §include var false§ + SPACE;
            this.§case for continue§.y = 4 * SPACE;
            this.§case for continue§.text = localeService.getText(TanksLocale.TEXT_WEEKLY_QUEST_HINT);
            addChild(this.§case for continue§);
         }
         this.§,!"§.width = this.§while const get§;
      }
      
      private function §class set if§() : void
      {
         var _loc1_:Shape = null;
         var _loc2_:Graphics = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:Shape = null;
         var _loc6_:Graphics = null;
         this.blinkEffect.stop();
         var _loc7_:Number = this.§while const get§ * 1 / §[!x§;
         var _loc8_:int = _loc7_ * this.§function for while§;
         if(this.§function for while§ != 0)
         {
            this.§6"Q§.bitmapData = new BitmapData(_loc8_,this.leftProgressPart.height,true,0);
            this.§6"Q§.bitmapData.draw(this.leftProgressPart);
            if(_loc8_ > this.leftProgressPart.width)
            {
               this.centerProgressPart.width = Math.min(_loc8_ - this.leftProgressPart.width,this.§while const get§ - this.leftProgressPart.width * 2) - 2;
               _loc1_ = new Shape();
               _loc2_ = _loc1_.graphics;
               _loc2_.beginBitmapFill(this.centerProgressPart.bitmapData);
               _loc2_.drawRect(this.leftProgressPart.width,0,this.centerProgressPart.width,this.centerProgressPart.height);
               _loc2_.endFill();
               this.§6"Q§.bitmapData.draw(_loc1_);
            }
            if(this.§function for while§ == §[!x§)
            {
               this.§6"Q§.bitmapData.draw(this.leftProgressPart,new Matrix(-1,0,0,1,this.§while const get§ - 2,0));
            }
         }
         if(!this.§use const final§)
         {
            _loc3_ = _loc7_;
            _loc4_ = 0;
            this.§extends const get§.bitmapData = new BitmapData(this.§while const get§ - _loc8_,this.leftProgressPart.height,true,0);
            if(this.§function for while§ == 0)
            {
               this.§extends const get§.bitmapData.draw(this.leftProgressPart);
               _loc3_ = _loc7_ - this.leftProgressPart.width;
               _loc4_ = this.leftProgressPart.width;
            }
            if(this.§function for while§ == 6)
            {
               this.§extends const get§.bitmapData.draw(this.leftProgressPart,new Matrix(-1,0,0,1,this.§while const get§ - _loc8_,0));
               _loc3_ = this.§while const get§ - _loc8_ - this.leftProgressPart.width;
            }
            this.centerProgressPart.width = _loc3_;
            _loc5_ = new Shape();
            (_loc6_ = _loc5_.graphics).beginBitmapFill(this.centerProgressPart.bitmapData);
            _loc6_.drawRect(_loc4_,0,this.centerProgressPart.width,this.centerProgressPart.height);
            _loc6_.endFill();
            this.§extends const get§.bitmapData.draw(_loc5_);
            this.§extends const get§.x = this.§6"Q§.x + this.§6"Q§.width - (this.§function for while§ == 0 ? 0 : 2);
            this.blinkEffect.start(this.§extends const get§);
         }
         else
         {
            this.§extends const get§.visible = false;
         }
      }
   }
}

