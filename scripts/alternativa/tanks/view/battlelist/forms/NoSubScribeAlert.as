package alternativa.tanks.view.battlelist.forms
{
   import controls.base.LabelBase;
   import controls.statassets.BlackRoundRect;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.Sprite;
   
   public class NoSubScribeAlert extends Sprite
   {
      private static const bitmapBezpripasov:Class = NoSubScribeAlert_bitmapBezpripasov;
      
      private static const bezpripasov:BitmapData = new bitmapBezpripasov().bitmapData;
      
      private var bg:BlackRoundRect;
      
      private var label:LabelBase;
      
      private var prizBitmap:Bitmap;
      
      public function NoSubScribeAlert(param1:String)
      {
         super();
         this.bg = new BlackRoundRect();
         this.bg.height = 69;
         addChild(this.bg);
         this.prizBitmap = new Bitmap(bezpripasov);
         addChild(this.prizBitmap);
         this.prizBitmap.x = 12;
         this.prizBitmap.y = 10;
         this.label = new LabelBase();
         this.label.text = param1;
         this.label.x = 100;
         this.label.multiline = true;
         this.label.wordWrap = true;
         addChild(this.label);
      }
      
      override public function set width(param1:Number) : void
      {
         this.bg.width = param1;
         this.label.width = param1 - 112;
         this.label.y = 70 - this.label.height >> 1;
      }
      
      override public function set height(param1:Number) : void
      {
      }
   }
}

