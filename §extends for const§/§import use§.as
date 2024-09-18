package §extends for const§
{
   import flash.utils.Dictionary;
   
   public class §import use§
   {
      private var §null package try§:Dictionary;
      
      public function §import use§()
      {
         this.§null package try§ = new Dictionary();
         super();
      }
      
      public function getObject(param1:Class) : Object
      {
         return this.§super set implements§(param1).getObject();
      }
      
      public function clear() : void
      {
         var _loc1_:* = undefined;
         for(_loc1_ in this.§null package try§)
         {
            §1Q§(this.§null package try§[_loc1_]).clear();
            delete this.§null package try§[_loc1_];
         }
      }
      
      public function §^Q§(param1:Class) : void
      {
         var _loc2_:§1Q§ = this.§null package try§[param1];
         if(_loc2_ != null)
         {
            _loc2_.clear();
         }
      }
      
      [Obfuscation(rename="false")]
      public function toString() : String
      {
         var _loc1_:* = undefined;
         var _loc2_:§1Q§ = null;
         var _loc3_:String = "";
         for(_loc1_ in this.§null package try§)
         {
            _loc2_ = this.§null package try§[_loc1_];
            _loc3_ += _loc1_ + ": " + _loc2_.§0!4§() + "\n";
         }
         return _loc3_;
      }
      
      private function §super set implements§(param1:Class) : §1Q§
      {
         var _loc2_:§1Q§ = this.§null package try§[param1];
         if(_loc2_ == null)
         {
            _loc2_ = new §1Q§(param1);
            this.§null package try§[param1] = _loc2_;
         }
         return _loc2_;
      }
   }
}

