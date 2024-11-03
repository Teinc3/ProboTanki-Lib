package Renamed356
{
   import flash.utils.Dictionary;
   
   public class Renamed616
   {
      private var Renamed8142:Dictionary;
      
      public function Renamed616()
      {
         this.Renamed8142 = new Dictionary();
         super();
      }
      
      public function getObject(param1:Class) : Object
      {
         return this.Renamed8143(param1).getObject();
      }
      
      public function clear() : void
      {
         var _loc1_:* = undefined;
         for(_loc1_ in this.Renamed8142)
         {
            Renamed1443(this.Renamed8142[_loc1_]).clear();
            delete this.Renamed8142[_loc1_];
         }
      }
      
      public function Renamed8144(param1:Class) : void
      {
         var _loc2_:Renamed1443 = this.Renamed8142[param1];
         if(_loc2_ != null)
         {
            _loc2_.clear();
         }
      }
      
      [Obfuscation(rename="false")]
      public function toString() : String
      {
         var _loc1_:* = undefined;
         var _loc2_:Renamed1443 = null;
         var _loc3_:String = "";
         for(_loc1_ in this.Renamed8142)
         {
            _loc2_ = this.Renamed8142[_loc1_];
            _loc3_ += _loc1_ + ": " + _loc2_.Renamed8140() + "\n";
         }
         return _loc3_;
      }
      
      private function Renamed8143(param1:Class) : Renamed1443
      {
         var _loc2_:Renamed1443 = this.Renamed8142[param1];
         if(_loc2_ == null)
         {
            _loc2_ = new Renamed1443(param1);
            this.Renamed8142[param1] = _loc2_;
         }
         return _loc2_;
      }
   }
}

