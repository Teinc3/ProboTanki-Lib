package Renamed1
{
   import alternativa.math.Vector3;
   import alternativa.tanks.battle.objects.tank.Tank;
   import alternativa.tanks.camera.Renamed842;
   import flash.events.Event;
   import flash.media.Sound;
   import flash.media.SoundChannel;
   
   public class Renamed909 implements Renamed608
   {
      private static const Renamed933:Vector3 = new Vector3();
      
      private var Renamed7062:Tank;
      
      private var Renamed7063:Renamed6961;
      
      private var Renamed7064:Renamed1442;
      
      private var Renamed7065:int = 1;
      
      private var _enabled:Boolean = false;
      
      private var Renamed7066:Boolean;
      
      public function Renamed909(param1:Sound, param2:Sound, param3:Sound, param4:Sound)
      {
         super();
         this.Renamed7063 = new Renamed6961(param1,param2,param3);
         this.Renamed7064 = Renamed1442.create(param4,0.5,500,2000,5);
      }
      
      public function Renamed1041() : void
      {
         this.Renamed7065 = Renamed6961.IDLE;
         if(this._enabled)
         {
            this.Renamed7063.Renamed1041();
         }
      }
      
      public function Renamed1039() : void
      {
         this.Renamed7065 = Renamed6961.Renamed6963;
         if(this._enabled)
         {
            this.Renamed7063.Renamed1039();
         }
      }
      
      public function Renamed1040() : void
      {
         this.Renamed7065 = Renamed6961.Renamed6965;
         if(this._enabled)
         {
            this.Renamed7063.Renamed1040();
         }
      }
      
      public function Renamed994(param1:Tank) : void
      {
         this.Renamed7062 = param1;
      }
      
      public function Renamed1096(param1:Boolean) : void
      {
         var _loc2_:SoundChannel = null;
         if(this._enabled)
         {
            if(param1 && this.Renamed7066)
            {
               if(!this.Renamed7064.Renamed7002())
               {
                  _loc2_ = this.Renamed7064.play(100,0);
                  if(_loc2_ != null)
                  {
                     _loc2_.addEventListener(Event.SOUND_COMPLETE,this.Renamed7067);
                  }
               }
            }
            else if(this.Renamed7064.Renamed7002())
            {
               this.Renamed7064.stop();
            }
         }
      }
      
      private function Renamed7067(param1:Event) : void
      {
         if(this.Renamed7066)
         {
            this.Renamed7064.play(3000,9999);
         }
      }
      
      public function set Renamed1080(param1:Boolean) : void
      {
         if(this.Renamed7066 != param1)
         {
            this.Renamed7066 = param1;
            if(!this.Renamed7066)
            {
               this.Renamed7064.stop();
            }
         }
      }
      
      public function play(param1:int, param2:Renamed842) : void
      {
         if(this.Renamed7062 != null && this._enabled)
         {
            Renamed933.copy(this.Renamed7062.Renamed696().state.position);
            this.Renamed7063.update(param1,param2.position,Renamed933,param2.Renamed594);
            this.Renamed7064.Renamed6974(param2.position,Renamed933,param2.Renamed594);
         }
      }
      
      public function destroy() : void
      {
         this.Renamed7063.stop();
         this.Renamed7064.stop();
      }
      
      public function kill() : void
      {
      }
      
      public function get numSounds() : int
      {
         return 2;
      }
      
      public function readPosition(param1:Vector3) : void
      {
         param1.copy(this.Renamed7062.Renamed696().state.position);
      }
      
      public function set enabled(param1:Boolean) : void
      {
         if(this._enabled != param1)
         {
            this._enabled = param1;
            this.Renamed7068();
         }
      }
      
      private function Renamed7068() : void
      {
         if(this._enabled)
         {
            switch(this.Renamed7065)
            {
               case Renamed6961.IDLE:
                  this.Renamed7063.Renamed1041();
                  break;
               case Renamed6961.Renamed6963:
                  this.Renamed7063.Renamed1039();
                  break;
               case Renamed6961.Renamed6965:
                  this.Renamed7063.Renamed1040();
            }
         }
         else
         {
            this.Renamed7064.stop();
            this.Renamed7063.Renamed6975();
         }
      }
   }
}

