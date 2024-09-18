package alternativa.tanks.utils
{
   public class Renamed3883
   {
      private var Renamed3884:Vector.<uint>;
      
      public function Renamed3883()
      {
         this.Renamed3884 = new Vector.<uint>();
         super();
      }
      
      public function Renamed3885(param1:uint) : Boolean
      {
         return this.Renamed3884.indexOf(param1) != -1;
      }
      
      public function Renamed3886(param1:uint) : void
      {
         if(this.Renamed3884.indexOf(param1) == -1)
         {
            this.Renamed3884.push(param1);
         }
      }
      
      public function Renamed3887(param1:uint) : void
      {
         var _loc2_:Number = Number(this.Renamed3884.indexOf(param1));
         if(_loc2_ >= 0)
         {
            this.Renamed3884.splice(_loc2_,1);
         }
      }
   }
}

