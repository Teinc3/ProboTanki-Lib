package alternativa.tanks.loader
{
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   
   public class §[!`§ extends Sprite
   {
      private var §in set override§:Sprite;
      
      public function §[!`§()
      {
         super();
         this.§in set override§ = new Sprite();
         this.§in set override§.x = 8;
         this.§in set override§.y = 9;
         addChild(this.§in set override§);
      }
      
      public function showTip(param1:DisplayObject) : void
      {
         if(this.§in set override§.numChildren > 0)
         {
            this.§in set override§.removeChildAt(0);
         }
         this.§in set override§.addChild(param1);
      }
   }
}

