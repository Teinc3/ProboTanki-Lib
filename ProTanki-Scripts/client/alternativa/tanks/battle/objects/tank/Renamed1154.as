package alternativa.tanks.battle.objects.tank
{
   public class Renamed1154 implements Renamed947
   {
      private var currentValue:Number;
      
      private var Renamed1155:Number;
      
      private var Renamed1156:Number;
      
      private var Renamed1157:Number;
      
      public function Renamed1154(param1:Number, param2:Number, param3:Number, param4:Number)
      {
         super();
         this.Renamed1156 = param1;
         this.Renamed1157 = param2;
         this.Renamed1155 = param3;
         this.currentValue = param4;
      }
      
      public function reset(param1:Number) : void
      {
         this.currentValue = param1;
         this.Renamed1155 = param1;
      }
      
      public function update(param1:Number) : Number
      {
         if(this.currentValue < this.Renamed1155)
         {
            this.currentValue += this.Renamed1156 * param1;
            if(this.currentValue > this.Renamed1155)
            {
               this.currentValue = this.Renamed1155;
            }
         }
         else if(this.currentValue > this.Renamed1155)
         {
            this.currentValue -= this.Renamed1157 * param1;
            if(this.currentValue < this.Renamed1155)
            {
               this.currentValue = this.Renamed1155;
            }
         }
         return this.currentValue;
      }
      
      public function Renamed1088(param1:Number) : void
      {
         this.Renamed1155 = param1;
      }
      
      public function Renamed1081() : Number
      {
         return this.Renamed1155;
      }
   }
}

