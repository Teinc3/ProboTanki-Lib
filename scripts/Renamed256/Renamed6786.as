package Renamed6781
{
   import Renamed439.Renamed3533;
   
   public class Renamed6786
   {
      private var Renamed6792:Vector.<Renamed3533>;
      
      private var Renamed6793:Vector.<Renamed3533>;
      
      public function Renamed6786()
      {
         this.Renamed6792 = new Vector.<Renamed3533>();
         this.Renamed6793 = new Vector.<Renamed3533>();
         super();
      }
      
      public function clear() : void
      {
         this.Renamed6792.length = 0;
         this.Renamed6793.length = 0;
      }
      
      public function Renamed6791() : Vector.<Renamed3533>
      {
         return this.Renamed6793;
      }
      
      public function Renamed597() : Number
      {
         var _loc1_:Renamed3533 = this.Renamed6792[0];
         return _loc1_.Renamed597();
      }
      
      public function isEmpty() : Boolean
      {
         return this.Renamed6792.length == 0;
      }
      
      public function add(param1:Renamed3533) : void
      {
         var _loc2_:Number = NaN;
         var _loc3_:Renamed3533 = null;
         var _loc4_:Renamed3533 = null;
         _loc2_ = 0;
         while(_loc2_ < this.Renamed6792.length)
         {
            _loc3_ = this.Renamed6792[_loc2_];
            if(param1.Renamed597() < _loc3_.Renamed597())
            {
               break;
            }
            _loc2_++;
         }
         this.Renamed6792.splice(_loc2_,0,param1);
         _loc2_ = 0;
         while(_loc2_ < this.Renamed6793.length)
         {
            _loc4_ = this.Renamed6793[_loc2_];
            if(param1.Renamed3429() < _loc4_.Renamed3429())
            {
               break;
            }
            _loc2_++;
         }
         this.Renamed6793.splice(_loc2_,0,param1);
      }
      
      public function Renamed6790(param1:Number) : void
      {
         var _loc2_:Renamed3533 = null;
         while(this.Renamed6792.length > 0)
         {
            _loc2_ = Renamed3533(this.Renamed6792[0]);
            if(_loc2_.Renamed597() > param1)
            {
               break;
            }
            this.Renamed6794(this.Renamed6792[0]);
         }
      }
      
      private function Renamed6794(param1:Renamed3533) : void
      {
         this.Renamed6795(this.Renamed6792,param1);
         this.Renamed6795(this.Renamed6793,param1);
      }
      
      private function Renamed6795(param1:Vector.<Renamed3533>, param2:Renamed3533) : void
      {
         param1.splice(param1.indexOf(param2),1);
      }
   }
}

