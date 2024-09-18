package projects.tanks.client.entrance.model.entrance.entrance
{
   public class EntranceModelCC
   {
      private var _antiAddictionEnabled:Boolean;
      
      private var _inGameRegistration:Boolean;
      
      public function EntranceModelCC(param1:Boolean = false, param2:Boolean = false)
      {
         super();
         this._antiAddictionEnabled = param1;
         this._inGameRegistration = param2;
      }
      
      public function get antiAddictionEnabled() : Boolean
      {
         return this._antiAddictionEnabled;
      }
      
      public function set antiAddictionEnabled(param1:Boolean) : void
      {
         this._antiAddictionEnabled = param1;
      }
      
      public function get inGameRegistration() : Boolean
      {
         return this._inGameRegistration;
      }
      
      public function set inGameRegistration(param1:Boolean) : void
      {
         this._inGameRegistration = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "EntranceModelCC [";
         _loc1_ += "antiAddictionEnabled = " + this.antiAddictionEnabled + " ";
         _loc1_ += "inGameRegistration = " + this.inGameRegistration + " ";
         return _loc1_ + "]";
      }
   }
}

