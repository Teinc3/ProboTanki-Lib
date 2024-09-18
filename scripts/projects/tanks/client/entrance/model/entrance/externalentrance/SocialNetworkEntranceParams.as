package projects.tanks.client.entrance.model.entrance.externalentrance
{
   public class SocialNetworkEntranceParams
   {
      private var _authorizationUrl:String;
      
      private var _snId:String;
      
      public function SocialNetworkEntranceParams(param1:String = null, param2:String = null)
      {
         super();
         this._authorizationUrl = param1;
         this._snId = param2;
      }
      
      public function get authorizationUrl() : String
      {
         return this._authorizationUrl;
      }
      
      public function set authorizationUrl(param1:String) : void
      {
         this._authorizationUrl = param1;
      }
      
      public function get snId() : String
      {
         return this._snId;
      }
      
      public function set snId(param1:String) : void
      {
         this._snId = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "SocialNetworkEntranceParams [";
         _loc1_ += "authorizationUrl = " + this.authorizationUrl + " ";
         _loc1_ += "snId = " + this.snId + " ";
         return _loc1_ + "]";
      }
   }
}

