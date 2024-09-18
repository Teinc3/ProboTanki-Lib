package Renamed1
{
   import alternativa.math.Vector3;
   import flash.events.Event;
   import flash.media.Sound;
   import flash.media.SoundChannel;
   
   public class Renamed6961
   {
      public static const Renamed6962:int = 0;
      
      public static const IDLE:int = 1;
      
      public static const Renamed6963:int = 2;
      
      public static const Renamed6964:int = 3;
      
      public static const Renamed6965:int = 4;
      
      private static const Renamed6966:Number = 0.001;
      
      private static const Renamed6967:int = 80;
      
      private var mode:int = 0;
      
      private var Renamed6968:Renamed1442;
      
      private var Renamed6969:Renamed1442;
      
      private var Renamed6970:Renamed1442;
      
      private var Renamed6971:Renamed1442;
      
      private var channel:SoundChannel;
      
      private var Renamed6972:Boolean;
      
      private var Renamed6973:Number = 1;
      
      public function Renamed6961(param1:Sound, param2:Sound, param3:Sound)
      {
         super();
         var _loc4_:Number = 1;
         this.Renamed6969 = Renamed1442.create(param1,2);
         this.Renamed6970 = Renamed1442.create(param2,_loc4_);
         this.Renamed6971 = Renamed1442.create(param3,_loc4_);
         this.Renamed6968 = this.Renamed6969;
      }
      
      public function update(param1:int, param2:Vector3, param3:Vector3, param4:Vector3) : void
      {
         if(this.mode != Renamed6962)
         {
            if(this.Renamed6972)
            {
               this.Renamed6968.volume -= Renamed6966 * param1;
               if(this.Renamed6968.volume < this.Renamed6973)
               {
                  this.Renamed6972 = false;
                  this.stop();
                  this.Renamed6968 = this.Renamed6969;
                  this.Renamed6968.volume = this.mode == IDLE ? Number(2) : Number(3);
                  this.Renamed6968.play(Renamed6967,10000);
               }
            }
            this.Renamed6968.Renamed6974(param2,param3,param4);
         }
      }
      
      public function Renamed6975() : void
      {
         if(this.mode != Renamed6962)
         {
            this.mode = Renamed6962;
            this.stop();
         }
      }
      
      public function Renamed1041() : void
      {
         if(this.mode != IDLE)
         {
            if(this.mode == Renamed6962)
            {
               this.Renamed6968 = this.Renamed6969;
               this.Renamed6968.volume = 1;
               this.Renamed6968.play(Renamed6967,1000);
            }
            else if(this.Renamed6968 != this.Renamed6969)
            {
               this.Renamed6972 = true;
               this.Renamed6973 = 0.2;
            }
            this.mode = IDLE;
         }
      }
      
      public function Renamed1039() : void
      {
         if(this.mode == Renamed6963 || this.mode == Renamed6964)
         {
            return;
         }
         this.Renamed6972 = false;
         this.mode = Renamed6963;
         this.Renamed6968.stop();
         this.Renamed6968 = this.Renamed6970;
         this.Renamed6968.volume = 1;
         this.channel = this.Renamed6968.play(0,0);
         if(this.channel != null)
         {
            this.channel.addEventListener(Event.SOUND_COMPLETE,this.Renamed6976);
         }
      }
      
      public function Renamed1040() : void
      {
         if(this.mode != Renamed6965)
         {
            if(this.mode == IDLE)
            {
               if(!this.Renamed6972)
               {
                  this.Renamed6968.volume = 3;
               }
            }
            else
            {
               this.Renamed6972 = true;
            }
            this.Renamed6973 = 0.6;
            this.mode = Renamed6965;
         }
      }
      
      public function stop() : void
      {
         if(this.channel != null)
         {
            this.channel.removeEventListener(Event.SOUND_COMPLETE,this.Renamed6976);
            this.channel = null;
         }
         this.Renamed6968.stop();
      }
      
      public function destroy() : void
      {
         this.stop();
         Renamed1442.destroy(this.Renamed6969);
         this.Renamed6969 = null;
         Renamed1442.destroy(this.Renamed6970);
         this.Renamed6970 = null;
         Renamed1442.destroy(this.Renamed6971);
         this.Renamed6971 = null;
      }
      
      private function Renamed6976(param1:Event) : void
      {
         if(this.channel == null || this.mode != Renamed6963)
         {
            return;
         }
         this.channel.removeEventListener(Event.SOUND_COMPLETE,this.Renamed6976);
         this.mode = Renamed6964;
         this.Renamed6971.volume = this.Renamed6970.volume;
         this.Renamed6968 = this.Renamed6971;
         this.Renamed6968.play(Renamed6967,1000);
      }
   }
}

