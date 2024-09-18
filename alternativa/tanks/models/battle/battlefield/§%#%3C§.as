package alternativa.tanks.models.battle.battlefield
{
   import §14§.§7"]§;
   import flash.media.Sound;
   import flash.media.SoundChannel;
   import flash.media.SoundTransform;
   
   public class §%#<§
   {
      private var sound:Sound;
      
      private var §&S§:§7"]§;
      
      private var §>#n§:SoundChannel;
      
      public function §%#<§(param1:Sound, param2:§7"]§)
      {
         super();
         this.sound = param1;
         this.§&S§ = param2;
      }
      
      public function play(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.§>#n§ == null)
            {
               this.§>#n§ = this.§&S§.§finally package get§(this.sound,0,100000,new SoundTransform(0.5));
            }
         }
         else if(this.§>#n§ != null)
         {
            this.§&S§.§set const var§(this.§>#n§);
            this.§>#n§ = null;
         }
      }
   }
}

