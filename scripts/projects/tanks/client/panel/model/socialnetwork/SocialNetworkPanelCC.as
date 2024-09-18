package projects.tanks.client.panel.model.socialnetwork
{
   public class SocialNetworkPanelCC
   {
      private var _passwordCreated:Boolean;
      
      private var _socialNetworkParams:Vector.<SocialNetworkPanelParams>;
      
      public function SocialNetworkPanelCC(param1:Boolean = false, param2:Vector.<SocialNetworkPanelParams> = null)
      {
         super();
         this._passwordCreated = param1;
         this._socialNetworkParams = param2;
      }
      
      public function get passwordCreated() : Boolean
      {
         return this._passwordCreated;
      }
      
      public function set passwordCreated(param1:Boolean) : void
      {
         this._passwordCreated = param1;
      }
      
      public function get socialNetworkParams() : Vector.<SocialNetworkPanelParams>
      {
         return this._socialNetworkParams;
      }
      
      public function set socialNetworkParams(param1:Vector.<SocialNetworkPanelParams>) : void
      {
         this._socialNetworkParams = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "SocialNetworkPanelCC [";
         _loc1_ += "passwordCreated = " + this.passwordCreated + " ";
         _loc1_ += "socialNetworkParams = " + this.socialNetworkParams + " ";
         return _loc1_ + "]";
      }
   }
}

