package §for set super§
{
   import alternativa.tanks.utils.BitVector;
   
   public class §#!!§
   {
      private static const §]#f§:int = 64;
      
      private static const instance:§#!!§ = new §#!!§();
      
      private var §for throw§:int;
      
      public function §#!!§()
      {
         this.§override var continue§ = new Vector.<int>(§]#f§,true);
         this.§override throw§ = new BitVector(§]#f§);
         super();
         this.reset();
      }
      
      public static function §catch var package§() : int
      {
         return instance.§try catch switch§();
      }
      
      public static function §8#g§(param1:int) : void
      {
         instance.release(param1);
      }
      
      public static function §catch const native§() : void
      {
         instance.reset();
      }
      
      public function §try catch switch§() : int
      {
         var _loc1_:int = 0;
         if(this.§for throw§ < §]#f§)
         {
            _loc1_ = this.§override var continue§[this.§for throw§++];
            this.§override throw§.setBit(_loc1_);
            return _loc1_;
         }
         throw new Error();
      }
      
      public function release(param1:int) : void
      {
         if(this.§override throw§.getBit(param1) == 1)
         {
            this.§override throw§.clearBit(param1);
            var _loc2_:* = --this.§for throw§;
            this.§override var continue§[_loc2_] = param1;
         }
      }
      
      public function reset() : void
      {
         this.§for throw§ = 0;
         var _loc1_:int = 0;
         while(_loc1_ < §]#f§)
         {
            this.§override var continue§[_loc1_] = _loc1_;
            _loc1_++;
         }
         this.§override throw§.clear();
      }
   }
}

