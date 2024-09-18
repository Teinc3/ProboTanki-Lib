package alternativa.tanks.model.useremailandpassword
{
   import §4#U§.§5[§;
   import §4#U§.§[#N§;
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.tanks.service.panel.IPanelView;
   import alternativa.tanks.service.settings.ISettingsService;
   import alternativa.tanks.service.socialnetwork.ISocialNetworkPanelService;
   import platform.client.fp10.core.model.ObjectLoadListener;
   import platform.client.fp10.core.model.ObjectUnloadListener;
   import services.alertservice.Alert;
   
   public class UserEmailAndPasswordModel extends §[#N§ implements §5[§, ObjectLoadListener, ObjectUnloadListener, IUserEmailAndPassword, PasswordService
   {
      [Inject]
      public static var display:IDisplay;
      
      [Inject]
      public static var panelView:IPanelView;
      
      [Inject]
      public static var socialNetworkPanelService:ISocialNetworkPanelService;
      
      [Inject]
      public static var §null import§:ISettingsService;
      
      private var _email:String;
      
      private var unconfirmedEmail:String;
      
      private var §super each§:Function;
      
      private var §break var final§:Function;
      
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
         §null import§.§use for throw§(param1,true);
         this._email = param1;
      }
      
      public function updatePasswordError() : void
      {
         display.dialogsLayer.addChild(new Alert(Alert.ERROR_PASSWORD_CHANGE));
      }
      
      public function §6!B§() : void
      {
         this.§4!=§(this.§super each§,true);
      }
      
      public function §each package each§() : void
      {
         this.§4!=§(this.§super each§,false);
      }
      
      public function §finally package package§() : void
      {
         this.§4!=§(this.§break var final§,false);
      }
      
      public function §use catch use§() : void
      {
         this.§4!=§(this.§break var final§,true);
      }
      
      private function §4!=§(param1:Function, param2:Boolean) : *
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
         §null import§.§use for throw§(param1,false);
         this.unconfirmedEmail = param1;
         server.§<U§(param1);
      }
      
      public function getEmail() : String
      {
         return this._email;
      }
      
      public function sendChangeInstruction() : void
      {
         server.§#!2§();
      }
      
      public function §package catch else§(param1:Function) : void
      {
         this.§break var final§ = param1;
         server.§="x§();
      }
      
      public function §-#f§(param1:String) : void
      {
         server.§-#f§(param1);
      }
      
      public function §true const package§(param1:String, param2:Function) : void
      {
         this.§super each§ = param2;
         server.§in const include§(param1);
      }
      
      public function §false set get§(param1:String, param2:String) : void
      {
         server.§false set get§(param1,param2);
      }
      
      public function objectLoaded() : void
      {
         this._email = getInitParam().email;
         §null import§.§use for throw§(this._email,getInitParam().emailConfirmed);
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

