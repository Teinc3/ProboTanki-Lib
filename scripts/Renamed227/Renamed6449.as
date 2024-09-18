package Renamed4739
{
   public class Renamed6449
   {
      private var _clanLink:String;
      
      private var _clanName:String;
      
      public function Renamed6449(param1:String = null, param2:String = null)
      {
         super();
         this._clanLink = param1;
         this._clanName = param2;
      }
      
      public function get clanLink() : String
      {
         return this._clanLink;
      }
      
      public function set clanLink(param1:String) : void
      {
         this._clanLink = param1;
      }
      
      public function get clanName() : String
      {
         return this._clanName;
      }
      
      public function set clanName(param1:String) : void
      {
         this._clanName = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "ClanInfoCC [";
         _loc1_ += "clanLink = " + this.clanLink + " ";
         _loc1_ += "clanName = " + this.clanName + " ";
         return _loc1_ + "]";
      }
   }
}

