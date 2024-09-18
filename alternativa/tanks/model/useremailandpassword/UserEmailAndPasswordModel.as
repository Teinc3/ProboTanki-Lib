package alternativa.tanks.model.useremailandpassword
{
   import Renamed245.Renamed2282;
   import Renamed245.Renamed2283;
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.tanks.service.panel.IPanelView;
   import alternativa.tanks.service.settings.ISettingsService;
   import alternativa.tanks.service.socialnetwork.ISocialNetworkPanelService;
   import platform.client.fp10.core.model.ObjectLoadListener;
   import platform.client.fp10.core.model.ObjectUnloadListener;
   import services.alertservice.Alert;
   
   public class UserEmailAndPasswordModel extends Renamed2283 implements Renamed2282, ObjectLoadListener, ObjectUnloadListener, IUserEmailAndPassword, PasswordService
   {
      [Inject]
      public static var display:IDisplay;
      
      [Inject]
      public static var panelView:IPanelView;
      
      [Inject]
      public static var socialNetworkPanelService:ISocialNetworkPanelService;
      
      [Inject]
      public static var Renamed2284:ISettingsService;
      
      private var _email:String;
      
      private var unconfirmedEmail:String;
      
      private var Renamed2186:Function;
      
      private var Renamed2285:Function;
      
      public function UserEmailAndPasswordModel()
      {
         super();
      }
      
      public function incorrectEmail() : void
      {
         display.dialogsLayer.addChild(new Alert(Alert.ERROR_EMAIL_INVALID));
      }
      
      public function emailAlreadyUsed() : void
      {
         display.dialogsLayer.addChild(new Alert(Alert.ERROR_EMAIL_UNIQUE));
      }
      
      public function activateMessage(param1:String) : void
      {
         panelView.showAlert(param1);
         this._email = this.unconfirmedEmail;
      }
      
      public function emailConfirmed(param1:String) : void
      {
         Renamed2284.Renamed2286(param1,true);
         this._email = param1;
      }
      
      public function updatePasswordError() : void
      {
         display.dialogsLayer.addChild(new Alert(Alert.ERROR_PASSWORD_CHANGE));
      }
      
      public function Renamed2287() : void
      {
         this.Renamed2288(this.Renamed2186,true);
      }
      
      public function Renamed2289() : void
      {
         this.Renamed2288(this.Renamed2186,false);
      }
      
      public function Renamed2290() : void
      {
         this.Renamed2288(this.Renamed2285,false);
      }
      
      public function Renamed2291() : void
      {
         this.Renamed2288(this.Renamed2285,true);
      }
      
      private function Renamed2288(param1:Function, param2:Boolean) : *
      {
         if(Boolean(param1))
         {
            param1(param2);
         }
         param1 = null;
      }
      
      public function passwordChanged() : void
      {
         socialNetworkPanelService.passwordCreated = true;
      }
      
      public function changePassword(param1:String) : void
      {
      }
      
      public function changeEmail(param1:String) : void
      {
         Renamed2284.Renamed2286(param1,false);
         this.unconfirmedEmail = param1;
         server.Renamed2292(param1);
      }
      
      public function getEmail() : String
      {
         return this._email;
      }
      
      public function sendChangeInstruction() : void
      {
         server.Renamed2293();
      }
      
      public function Renamed2196(param1:Function) : void
      {
         this.Renamed2285 = param1;
         server.Renamed2294();
      }
      
      public function Renamed2204(param1:String) : void
      {
         server.Renamed2204(param1);
      }
      
      public function Renamed2198(param1:String, param2:Function) : void
      {
         this.Renamed2186 = param2;
         server.Renamed2295(param1);
      }
      
      public function Renamed2182(param1:String, param2:String) : void
      {
         server.Renamed2182(param1,param2);
      }
      
      public function objectLoaded() : void
      {
         this._email = getInitParam().email;
         Renamed2284.Renamed2286(this._email,getInitParam().emailConfirmed);
         OSGi.getInstance().registerService(PasswordService,this);
      }
      
      public function objectLoadedPost() : void
      {
      }
      
      public function objectUnloaded() : void
      {
         OSGi.getInstance().unregisterService(PasswordService);
      }
      
      public function objectUnloadedPost() : void
      {
      }
   }
}

