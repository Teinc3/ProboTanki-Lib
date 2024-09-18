package Renamed431
{
   import Renamed230.Renamed2587;
   import Renamed230.Renamed2588;
   import Renamed496.Renamed2589;
   
   public class Renamed8858 extends Renamed2587
   {
      public var Renamed8865:int = 10;
      
      public function Renamed8858()
      {
         super();
         Renamed6474 = 6;
      }
      
      public function addLine(param1:Renamed2588) : void
      {
         var _loc2_:Renamed2588 = null;
         Renamed2601(param1);
         if(container.numChildren > this.Renamed8865)
         {
            _loc2_ = Renamed2605();
            if(_loc2_ != null)
            {
               _loc2_.removeEventListener(Renamed2589.Renamed2598,this.Renamed2599);
               _loc2_.removeEventListener(Renamed2589.Renamed8864,this.updateUid);
            }
         }
         param1.addEventListener(Renamed2589.Renamed2598,this.Renamed2599);
         param1.addEventListener(Renamed2589.Renamed8864,this.updateUid);
         param1.x = -param1.width - 10;
      }
      
      private function Renamed2599(param1:Renamed2589) : void
      {
         if(container.contains(param1.line))
         {
            Renamed2605();
         }
         param1.line.removeEventListener(Renamed2589.Renamed2598,this.Renamed2599);
      }
      
      private function updateUid(param1:Renamed2589) : void
      {
         var _loc2_:Renamed2588 = param1.line;
         _loc2_.x = -_loc2_.width - 10;
         _loc2_.removeEventListener(Renamed2589.Renamed8864,this.Renamed2599);
      }
   }
}

