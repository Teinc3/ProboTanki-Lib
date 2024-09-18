package Renamed373
{
   import alternativa.tanks.utils.BitVector;
   
   public class Renamed776
   {
      private static const Renamed8287:int = 64;
      
      private static const instance:Renamed776 = new Renamed776();
      
      private var Renamed8288:int;
      
      public function Renamed776()
      {
         this.Renamed8289 = new Vector.<int>(Renamed8287,true);
         this.Renamed8290 = new BitVector(Renamed8287);
         super();
         this.reset();
      }
      
      public static function Renamed1120() : int
      {
         return instance.Renamed8291();
      }
      
      public static function Renamed1069(param1:int) : void
      {
         instance.release(param1);
      }
      
      public static function Renamed800() : void
      {
         instance.reset();
      }
      
      public function Renamed8291() : int
      {
         var _loc1_:int = 0;
         if(this.Renamed8288 < Renamed8287)
         {
            _loc1_ = this.Renamed8289[this.Renamed8288++];
            this.Renamed8290.setBit(_loc1_);
            return _loc1_;
         }
         throw new Error();
      }
      
      public function release(param1:int) : void
      {
         if(this.Renamed8290.getBit(param1) == 1)
         {
            this.Renamed8290.clearBit(param1);
            var _loc2_:* = --this.Renamed8288;
            this.Renamed8289[_loc2_] = param1;
         }
      }
      
      public function reset() : void
      {
         this.Renamed8288 = 0;
         var _loc1_:int = 0;
         while(_loc1_ < Renamed8287)
         {
            this.Renamed8289[_loc1_] = _loc1_;
            _loc1_++;
         }
         this.Renamed8290.clear();
      }
   }
}

