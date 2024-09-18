package Renamed199
{
   import Renamed136.Renamed663;
   
   public final class Renamed3820
   {
      private var Renamed5953:Renamed3823;
      
      private var Renamed5954:Renamed3823;
      
      private var Renamed5955:Renamed3823;
      
      private var attenuationBegin:Number;
      
      private var Renamed5956:Number;
      
      public function Renamed3820(param1:Renamed3823, param2:Renamed3823, param3:Renamed3823, param4:Number, param5:Number)
      {
         super();
         this.Renamed5953 = param1;
         this.Renamed5954 = param2;
         this.Renamed5955 = param3;
         this.attenuationBegin = param4;
         this.Renamed5956 = param5;
      }
      
      public function Renamed5102(param1:Renamed663) : Renamed3823
      {
         switch(param1.value)
         {
            case Renamed663.BLUE.value:
               return this.Renamed5954;
            case Renamed663.NONE.value:
               return this.Renamed5955;
            case Renamed663.RED.value:
               return this.Renamed5953;
            default:
               return null;
         }
      }
      
      public function Renamed5111() : Number
      {
         return this.attenuationBegin;
      }
      
      public function Renamed5112() : Number
      {
         return this.Renamed5956;
      }
   }
}

