package alternativa.tanks.battle.scene3d
{
   public class Renamed1292
   {
      public static const Renamed1293:Renamed1292 = new Renamed1292("without_rotation");
      
      public static const Renamed1294:Renamed1292 = new Renamed1292("use_random_rotation");
      
      private var _state:String;
      
      public function Renamed1292(param1:String)
      {
         super();
         this._state = param1;
      }
      
      public function get state() : String
      {
         return this._state;
      }
      
      public function toString() : String
      {
         return "RotationState{_state=" + String(this._state) + "}";
      }
   }
}

