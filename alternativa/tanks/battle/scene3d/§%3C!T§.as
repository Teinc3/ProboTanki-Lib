package alternativa.tanks.battle.scene3d
{
   public class §<!T§
   {
      public static const §6"t§:§<!T§ = new §<!T§("without_rotation");
      
      public static const §true set§:§<!T§ = new §<!T§("use_random_rotation");
      
      private var _state:String;
      
      public function §<!T§(param1:String)
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

