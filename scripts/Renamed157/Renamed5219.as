package Renamed5196
{
   internal class Renamed5219 implements Renamed5216
   {
      private var message:Renamed5199;
      
      private var Renamed5222:int;
      
      private var Renamed4234:int;
      
      private var Renamed5223:Number;
      
      private var Renamed5224:Number;
      
      private var Renamed5225:Number;
      
      public function Renamed5219(param1:Renamed5199, param2:int, param3:Number, param4:Number)
      {
         super();
         this.message = param1;
         this.Renamed5222 = param2;
         this.Renamed5223 = param3;
         this.Renamed5224 = param4;
         this.Renamed5225 = param4 - param3;
      }
      
      public function init() : void
      {
         this.message.setAlpha(this.Renamed5223);
         this.Renamed4234 = this.Renamed5222;
      }
      
      public function update(param1:int) : Boolean
      {
         if(this.Renamed4234 <= 0)
         {
            return false;
         }
         this.Renamed4234 -= param1;
         if(this.Renamed4234 < 0)
         {
            this.Renamed4234 = 0;
         }
         this.message.setAlpha(this.Renamed5224 - this.Renamed5225 * this.Renamed4234 / this.Renamed5222);
         return true;
      }
      
      public function Renamed5221(param1:int) : void
      {
         this.Renamed5222 = param1;
      }
   }
}

