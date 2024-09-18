package §switch native§
{
   import flash.utils.ByteArray;
   
   public class §override set native§ implements §throw set true§
   {
      private static var §?!E§:int = 8;
      
      private var §;!L§:Vector.<int>;
      
      private var §include catch while§:Vector.<int>;
      
      private var §continue catch with§:int = 0;
      
      private var §[!h§:int = 0;
      
      private var §1o§:int;
      
      public function §override set native§(param1:Vector.<int>)
      {
         this.§;!L§ = new Vector.<int>(§?!E§,true);
         this.§include catch while§ = new Vector.<int>(§?!E§,true);
         super();
         var _loc2_:int = 0;
         while(_loc2_ < param1.length)
         {
            this.§1o§ ^= param1[_loc2_];
            _loc2_++;
         }
         var _loc3_:int = 0;
         while(_loc3_ < §?!E§)
         {
            this.§include catch while§[_loc3_] = this.§1o§ ^ _loc3_ << 3;
            this.§;!L§[_loc3_] = this.§1o§ ^ _loc3_ << 3 ^ 0x57;
            _loc3_++;
         }
      }
      
      public function encrypt(param1:ByteArray) : void
      {
         var _loc3_:int = 0;
         var _loc2_:int = 0;
         while(_loc2_ < param1.length)
         {
            _loc3_ = int(param1[_loc2_]);
            param1[_loc2_] = _loc3_ ^ this.§;!L§[this.§continue catch with§];
            this.§;!L§[this.§continue catch with§] = _loc3_;
            this.§continue catch with§ ^= _loc3_ & 7;
            _loc2_++;
         }
      }
      
      public function decrypt(param1:ByteArray) : void
      {
         var _loc3_:int = 0;
         var _loc2_:int = 0;
         while(_loc2_ < param1.length)
         {
            _loc3_ = int(param1[_loc2_]);
            this.§include catch while§[this.§[!h§] = _loc3_ ^ this.§include catch while§[this.§[!h§];
            param1[_loc2_] = this.§include catch while§[this.§[!h§];
            this.§[!h§ ^= this.§include catch while§[this.§[!h§] & 7;
            _loc2_++;
         }
      }
   }
}

