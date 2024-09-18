package alternativa.tanks.camera
{
   public class Renamed1493
   {
      private var Renamed1494:Vector.<Renamed1453>;
      
      public function Renamed1493(param1:int)
      {
         super();
         this.Renamed1494 = new Vector.<Renamed1453>(param1);
      }
      
      public function getBookmark(param1:uint) : Renamed1453
      {
         if(param1 < this.Renamed1494.length)
         {
            return this.Renamed1494[param1];
         }
         return null;
      }
      
      public function saveCurrentPositionCameraToBookmark(param1:uint) : void
      {
         if(param1 < this.Renamed1494.length)
         {
            this.Renamed1495(param1).Renamed1455();
         }
      }
      
      private function Renamed1495(param1:uint) : Renamed1453
      {
         if(this.Renamed1494[param1] == null)
         {
            this.Renamed1494[param1] = new Renamed1453();
         }
         return this.Renamed1494[param1];
      }
   }
}

