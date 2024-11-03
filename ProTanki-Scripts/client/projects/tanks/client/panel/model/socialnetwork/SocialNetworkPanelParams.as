package projects.tanks.client.panel.model.socialnetwork
{
   public class SocialNetworkPanelParams
   {
      private var _authorizationUrl:String;
      
      private var _linkExists:Boolean;
      
      private var _snId:String;
      
      public function SocialNetworkPanelParams(param1:String = null, param2:Boolean = false, param3:String = null)
      {
         super();
         this._authorizationUrl = param1;
         this._linkExists = param2;
         this._snId = param3;
      }
      
      public function get authorizationUrl() : String
      {
         return this._authorizationUrl;
      }
      
      public function set authorizationUrl(param1:String) : void
      {
         this._authorizationUrl = param1;
      }
      
      public function get linkExists() : Boolean
      {
         return this._linkExists;
      }
      
      public function set linkExists(param1:Boolean) : void
      {
         this._linkExists = param1;
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
         var _loc1_:String = "SocialNetworkPanelParams [";
         _loc1_ += "authorizationUrl = " + this.authorizationUrl + " ";
         _loc1_ += "linkExists = " + this.linkExists + " ";
         _loc1_ += "snId = " + this.snId + " ";
         return _loc1_ + "]";
      }
   }
}

