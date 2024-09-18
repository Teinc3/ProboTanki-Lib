package alternativa.tanks.loader
{
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   
   public class Renamed2047 extends Sprite
   {
      private var Renamed2065:Sprite;
      
      public function Renamed2047()
      {
         super();
         this.Renamed2065 = new Sprite();
         this.Renamed2065.x = 8;
         this.Renamed2065.y = 9;
         addChild(this.Renamed2065);
      }
      
      public function showTip(param1:DisplayObject) : void
      {
         if(this.Renamed2065.numChildren > 0)
         {
            this.Renamed2065.removeChildAt(0);
         }
         this.Renamed2065.addChild(param1);
      }
   }
}

