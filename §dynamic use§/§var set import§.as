package §dynamic use§
{
   public class §var set import§
   {
      private var _enabled:Boolean;
      
      public function §var set import§(param1:Boolean = false)
      {
         super();
         this._enabled = param1;
      }
      
      public function get enabled() : Boolean
      {
         return this._enabled;
      }
      
      public function set enabled(param1:Boolean) : void
      {
         this._enabled = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "InviteEntranceCC [";
         _loc1_ += "enabled = " + this.enabled + " ";
         return _loc1_ + "]";
      }
   }
}

