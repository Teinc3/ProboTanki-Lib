package §static final§
{
   public class §,"o§
   {
      private var _hash:String;
      
      private var _host:String;
      
      public function §,"o§(param1:String = null, param2:String = null)
      {
         super();
         this._hash = param1;
         this._host = param2;
      }
      
      public function get hash() : String
      {
         return this._hash;
      }
      
      public function set hash(param1:String) : void
      {
         this._hash = param1;
      }
      
      public function get host() : String
      {
         return this._host;
      }
      
      public function set host(param1:String) : void
      {
         this._host = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "ReferrerPanelCC [";
         _loc1_ += "hash = " + this.hash + " ";
         _loc1_ += "host = " + this.host + " ";
         return _loc1_ + "]";
      }
   }
}

