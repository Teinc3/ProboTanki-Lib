package §]#R§
{
   import alternativa.tanks.battle.objects.tank.Tank;
   import alternativa.tanks.utils.BitMask;
   import alternativa.tanks.utils.MathUtils;
   
   public class §^#Z§
   {
      public static const §function catch finally§:int = 0;
      
      public static const §while for for§:int = 1;
      
      public static const §!#`§:int = 2;
      
      public static const §""?§:int = 3;
      
      public static const §3!%§:int = 4;
      
      protected var §var for if§:int;
      
      protected var §static package throw§:int;
      
      private var tank:Tank;
      
      private var §get static§:BitMask;
      
      public function §^#Z§(param1:Tank)
      {
         this.§get static§ = new BitMask();
         super();
         this.tank = param1;
      }
      
      public function isEnabled() : Boolean
      {
         return this.§get static§.isEmpty();
      }
      
      public function lock(param1:int) : void
      {
         var _loc2_:Boolean = this.isEnabled();
         this.§get static§.setBits(param1);
         if(_loc2_ && !this.isEnabled())
         {
            this.§with catch super§(0);
         }
      }
      
      public function unlock(param1:int) : void
      {
         var _loc2_:Boolean = this.isEnabled();
         this.§get static§.clearBits(param1);
         if(this.isEnabled() && !_loc2_)
         {
            this.§with catch super§(this.§var for if§);
         }
      }
      
      public function §,#I§() : int
      {
         return this.isEnabled() ? int(this.§var for if§) : int(0);
      }
      
      public function §7"2§(param1:int) : void
      {
         this.§var for if§ = param1;
         if(this.isEnabled())
         {
            this.§with catch super§(param1);
         }
      }
      
      private function §with catch super§(param1:int) : void
      {
         var _loc2_:int = this.§static package throw§;
         this.§static package throw§ = param1;
         var _loc3_:int = MathUtils.getBitValue(param1,§function catch finally§) - MathUtils.getBitValue(param1,§while for for§);
         var _loc4_:Number = MathUtils.getBitValue(param1,§!#`§) - MathUtils.getBitValue(param1,§""?§);
         this.tank.§5#2§(_loc3_,_loc4_,MathUtils.getBitValue(param1,§3!%§) == 1);
         if(_loc2_ != this.§static package throw§)
         {
            this.§!q§(this.§static package throw§);
         }
      }
      
      protected function §!q§(param1:int) : void
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

