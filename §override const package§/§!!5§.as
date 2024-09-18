package §override const package§
{
   import §#"D§.§case set extends§;
   import §,#a§.§each package default§;
   import alternativa.math.Vector3;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.PixelSnapping;
   import flash.display.Sprite;
   import utils.graphics.SectorMask;
   
   public class §!!5§ extends Sprite
   {
      private var §finally catch extends§:§case set extends§;
      
      private var §override for switch§:Bitmap;
      
      private var §##V§:Bitmap;
      
      private var sectorMask:SectorMask;
      
      private var score:Number = 0;
      
      private var container:Sprite;
      
      public function §!!5§(param1:§case set extends§)
      {
         this.container = new Sprite();
         super();
         this.§finally catch extends§ = param1;
         this.§override catch finally§();
      }
      
      private static function §^#C§(param1:§each package default§) : Bitmap
      {
         return new Bitmap(§9!m§.§get catch with§(param1),PixelSnapping.AUTO,true);
      }
      
      private function §override catch finally§() : void
      {
         this.§override for switch§ = §^#C§(§each package default§.BLUE);
         this.§##V§ = §^#C§(§each package default§.RED);
         addChild(§^#C§(§each package default§.NEUTRAL));
         addChild(this.container);
         this.sectorMask = new SectorMask(this.§override for switch§.width);
         this.container.addChild(this.sectorMask);
         addChild(new Bitmap(§9!m§.§4!2§(this.§finally catch extends§.getName().charAt(0))));
         this.§1"Y§();
      }
      
      public function §=K§(param1:Vector3) : void
      {
         this.§finally catch extends§.readPosition(param1);
      }
      
      public function update() : void
      {
         this.§in var switch§(this.§finally catch extends§.§+!I§());
      }
      
      public function §3#v§() : §case set extends§
      {
         return this.§finally catch extends§;
      }
      
      private function §in var switch§(param1:Number) : void
      {
         var _loc2_:Number = NaN;
         if(param1 < -100)
         {
            param1 = -100;
         }
         else if(param1 > 100)
         {
            param1 = 100;
         }
         if(this.score != param1)
         {
            if(param1 == 0)
            {
               this.§1"Y§();
            }
            else
            {
               _loc2_ = Math.abs(param1) / 100;
               this.sectorMask.setProgress(1 - _loc2_,1);
               if(param1 < 0)
               {
                  this.§,"[§();
               }
               else if(param1 > 0)
               {
                  this.§1"§();
               }
            }
            this.score = param1;
         }
      }
      
      private function §1"Y§() : void
      {
         this.container.visible = false;
      }
      
      private function §,"[§() : void
      {
         this.container.visible = true;
         this.§5]§(this.§override for switch§,this.§##V§);
         this.container.mask = this.sectorMask;
      }
      
      private function §1"§() : void
      {
         this.container.visible = true;
         this.§5]§(this.§##V§,this.§override for switch§);
         this.container.mask = this.sectorMask;
      }
      
      private function §5]§(param1:DisplayObject, param2:DisplayObject) : void
      {
         if(param2.parent == null)
         {
            if(param1.parent != null)
            {
               this.container.removeChild(param1);
            }
            this.container.addChild(param2);
         }
      }
   }
}

