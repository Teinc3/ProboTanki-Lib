package alternativa.tanks.models.tank
{
   internal class Renamed2717
   {
      private var Renamed2718:Dictionary;
      
      public function Renamed2717()
      {
         this.Renamed2718 = new Dictionary();
         super();
      }
      
      public function Renamed2719(param1:Tanks3DSResource) : Renamed924
      {
         var _loc2_:Renamed924 = this.Renamed2718[param1.id];
         if(_loc2_ == null)
         {
            _loc2_ = new Renamed924(param1);
            this.Renamed2718[param1.id] = _loc2_;
         }
         return _loc2_;
      }
   }
}

