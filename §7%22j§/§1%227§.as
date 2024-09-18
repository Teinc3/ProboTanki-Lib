package §7"j§
{
   import alternativa.math.Vector3;
   import flash.events.Event;
   import flash.media.Sound;
   import flash.media.SoundChannel;
   
   public class §1"7§
   {
      public static const §@"<§:int = 0;
      
      public static const IDLE:int = 1;
      
      public static const §get const with§:int = 2;
      
      public static const §false for function§:int = 3;
      
      public static const §implements package implements§:int = 4;
      
      private static const §final final§:Number = 0.001;
      
      private static const §^!<§:int = 80;
      
      private var mode:int = 0;
      
      private var §%!h§:§implements for break§;
      
      private var § N§:§implements for break§;
      
      private var §`B§:§implements for break§;
      
      private var §catch const throw§:§implements for break§;
      
      private var channel:SoundChannel;
      
      private var §continue for use§:Boolean;
      
      private var §with for case§:Number = 1;
      
      public function §1"7§(param1:Sound, param2:Sound, param3:Sound)
      {
         super();
         var _loc4_:Number = 1;
         this.§ N§ = §implements for break§.create(param1,2);
         this.§`B§ = §implements for break§.create(param2,_loc4_);
         this.§catch const throw§ = §implements for break§.create(param3,_loc4_);
         this.§%!h§ = this.§ N§;
      }
      
      public function update(param1:int, param2:Vector3, param3:Vector3, param4:Vector3) : void
      {
         if(this.mode != §@"<§)
         {
            if(this.§continue for use§)
            {
               this.§%!h§.volume -= §final final§ * param1;
               if(this.§%!h§.volume < this.§with for case§)
               {
                  this.§continue for use§ = false;
                  this.stop();
                  this.§%!h§ = this.§ N§;
                  this.§%!h§.volume = this.mode == IDLE ? Number(2) : Number(3);
                  this.§%!h§.play(§^!<§,10000);
               }
            }
            this.§%!h§.§class catch switch§(param2,param3,param4);
         }
      }
      
      public function §final var set§() : void
      {
         if(this.mode != §@"<§)
         {
            this.mode = §@"<§;
            this.stop();
         }
      }
      
      public function §null for for§() : void
      {
         if(this.mode != IDLE)
         {
            if(this.mode == §@"<§)
            {
               this.§%!h§ = this.§ N§;
               this.§%!h§.volume = 1;
               this.§%!h§.play(§^!<§,1000);
            }
            else if(this.§%!h§ != this.§ N§)
            {
               this.§continue for use§ = true;
               this.§with for case§ = 0.2;
            }
            this.mode = IDLE;
         }
      }
      
      public function §;#9§() : void
      {
         if(this.mode == §get const with§ || this.mode == §false for function§)
         {
            return;
         }
         this.§continue for use§ = false;
         this.mode = §get const with§;
         this.§%!h§.stop();
         this.§%!h§ = this.§`B§;
         this.§%!h§.volume = 1;
         this.channel = this.§%!h§.play(0,0);
         if(this.channel != null)
         {
            this.channel.addEventListener(Event.SOUND_COMPLETE,this.§>">§);
         }
      }
      
      public function §case set false§() : void
      {
         if(this.mode != §implements package implements§)
         {
            if(this.mode == IDLE)
            {
               if(!this.§continue for use§)
               {
                  this.§%!h§.volume = 3;
               }
            }
            else
            {
               this.§continue for use§ = true;
            }
            this.§with for case§ = 0.6;
            this.mode = §implements package implements§;
         }
      }
      
      public function stop() : void
      {
         if(this.channel != null)
         {
            this.channel.removeEventListener(Event.SOUND_COMPLETE,this.§>">§);
            this.channel = null;
         }
         this.§%!h§.stop();
      }
      
      public function destroy() : void
      {
         this.stop();
         §implements for break§.destroy(this.§ N§);
         this.§ N§ = null;
         §implements for break§.destroy(this.§`B§);
         this.§`B§ = null;
         §implements for break§.destroy(this.§catch const throw§);
         this.§catch const throw§ = null;
      }
      
      private function §>">§(param1:Event) : void
      {
         if(this.channel == null || this.mode != §get const with§)
         {
            return;
         }
         this.channel.removeEventListener(Event.SOUND_COMPLETE,this.§>">§);
         this.mode = §false for function§;
         this.§catch const throw§.volume = this.§`B§.volume;
         this.§%!h§ = this.§catch const throw§;
         this.§%!h§.play(§^!<§,1000);
      }
   }
}

