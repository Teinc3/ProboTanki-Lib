package §var catch finally§
{
   import controls.Label;
   import controls.statassets.BlackRoundRect;
   
   public class §<x§ extends BlackRoundRect
   {
      private static const §[b§:int = 18;
      
      private static const PADDING:int = 3;
      
      private var label:Label;
      
      public function §<x§(param1:String)
      {
         super();
         this.label = new Label();
         this.label.size = §[b§;
         this.label.text = param1;
         addChild(this.label);
         this.label.y = PADDING;
         height = 2 * PADDING + this.label.height;
      }
      
      [Obfuscation(rename="false")]
      override public function set width(param1:Number) : void
      {
         super.width = param1;
         this.label.x = int(width - this.label.width) >> 1;
      }
   }
}

