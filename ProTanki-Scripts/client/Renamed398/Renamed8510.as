package Renamed398
{
   public class Renamed8510
   {
      private var _serverHalt:Boolean;
      
      public function Renamed8510(param1:Boolean = false)
      {
         super();
         this._serverHalt = param1;
      }
      
      public function get serverHalt() : Boolean
      {
         return this._serverHalt;
      }
      
      public function set serverHalt(param1:Boolean) : void
      {
         this._serverHalt = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "ServerHaltEntranceCC [";
         _loc1_ += "serverHalt = " + this.serverHalt + " ";
         return _loc1_ + "]";
      }
   }
}

