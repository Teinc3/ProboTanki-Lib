package Renamed479
{
   import alternativa.tanks.battle.objects.tank.Tank;
   import alternativa.tanks.utils.BitMask;
   import alternativa.tanks.utils.MathUtils;
   
   public class Renamed2756
   {
      public static const Renamed7863:int = 0;
      
      public static const Renamed7864:int = 1;
      
      public static const Renamed7865:int = 2;
      
      public static const Renamed7866:int = 3;
      
      public static const Renamed9422:int = 4;
      
      protected var Renamed9425:int;
      
      protected var Renamed9453:int;
      
      private var tank:Tank;
      
      private var Renamed2987:BitMask;
      
      public function Renamed2756(param1:Tank)
      {
         this.Renamed2987 = new BitMask();
         super();
         this.tank = param1;
      }
      
      public function isEnabled() : Boolean
      {
         return this.Renamed2987.isEmpty();
      }
      
      public function lock(param1:int) : void
      {
         var _loc2_:Boolean = this.isEnabled();
         this.Renamed2987.setBits(param1);
         if(_loc2_ && !this.isEnabled())
         {
            this.Renamed9463(0);
         }
      }
      
      public function unlock(param1:int) : void
      {
         var _loc2_:Boolean = this.isEnabled();
         this.Renamed2987.clearBits(param1);
         if(this.isEnabled() && !_loc2_)
         {
            this.Renamed9463(this.Renamed9425);
         }
      }
      
      public function Renamed2913() : int
      {
         return this.isEnabled() ? int(this.Renamed9425) : int(0);
      }
      
      public function Renamed2848(param1:int) : void
      {
         this.Renamed9425 = param1;
         if(this.isEnabled())
         {
            this.Renamed9463(param1);
         }
      }
      
      private function Renamed9463(param1:int) : void
      {
         var _loc2_:int = this.Renamed9453;
         this.Renamed9453 = param1;
         var _loc3_:int = MathUtils.getBitValue(param1,Renamed7863) - MathUtils.getBitValue(param1,Renamed7864);
         var _loc4_:Number = MathUtils.getBitValue(param1,Renamed7865) - MathUtils.getBitValue(param1,Renamed7866);
         this.tank.Renamed1034(_loc3_,_loc4_,MathUtils.getBitValue(param1,Renamed9422) == 1);
         if(_loc2_ != this.Renamed9453)
         {
            this.Renamed9426(this.Renamed9453);
         }
      }
      
      protected function Renamed9426(param1:int) : void
      {
      }
      
      protected function getTank() : Tank
      {
         return this.tank;
      }
      
      [Obfuscation(rename="false")]
      public function close() : void
      {
         this.tank = null;
      }
   }
}

