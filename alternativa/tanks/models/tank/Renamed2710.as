package alternativa.tanks.models.tank
{
   internal class Renamed2707
   {
      private var Renamed2708:Dictionary;
      
      public function Renamed2707()
      {
         this.Renamed2708 = new Dictionary();
         super();
      }
      
      public function Renamed2709(param1:Tanks3DSResource) : Renamed918
      {
         var _loc2_:Renamed918 = this.Renamed2708[param1.id];
         if(_loc2_ == null)
         {
            _loc2_ = new Renamed918(param1);
            this.Renamed2708[param1.id] = _loc2_;
         }
         return _loc2_;
      }
   }
}

