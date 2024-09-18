package alternativa.tanks.models.battle.battlefield
{
   import Renamed235.Renamed607;
   import flash.media.Sound;
   import flash.media.SoundChannel;
   import flash.media.SoundTransform;
   
   public class Renamed2314
   {
      private var sound:Sound;
      
      private var Renamed633:Renamed607;
      
      private var Renamed2315:SoundChannel;
      
      public function Renamed2314(param1:Sound, param2:Renamed607)
      {
         super();
         this.sound = param1;
         this.Renamed633 = param2;
      }
      
      public function play(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.Renamed2315 == null)
            {
               this.Renamed2315 = this.Renamed633.Renamed2316(this.sound,0,100000,new SoundTransform(0.5));
            }
         }
         else if(this.Renamed2315 != null)
         {
            this.Renamed633.Renamed2317(this.Renamed2315);
            this.Renamed2315 = null;
         }
      }
   }
}

