package alternativa.tanks.model.friends.loader
{
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.tanks.gui.friends.FriendsWindow;
   import alternativa.tanks.gui.friends.FriendsWindowState;
   import §const package each§.§,#§;
   import §const package each§.§1#>§;
   import forms.events.MainButtonBarEvents;
   import platform.client.fp10.core.model.ObjectLoadPostListener;
   import platform.client.fp10.core.model.ObjectUnloadListener;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.friend.IFriendInfoService;
   import services.buttonbar.IButtonBarService;
   
   public class FriendsLoaderModel extends §1#>§ implements §,#§, ObjectLoadPostListener, ObjectUnloadListener
   {
      [Inject]
      public static var display:IDisplay;
      
      [Inject]
      public static var friendInfoService:IFriendInfoService;
      
      [Inject]
      public static var buttonBarService:IButtonBarService;
      
      private var friendsWindow:FriendsWindow;
      
      public function FriendsLoaderModel()
      {
         super();
         this.init();
      }
      
      private function init() : void
      {
         this.friendsWindow = new FriendsWindow();
      }
      
      public function objectLoadedPost() : void
      {
         buttonBarService.addEventListener(MainButtonBarEvents.PANEL_BUTTON_PRESSED,this.onButtonBarButtonClick);
      }
      
      private function onButtonBarButtonClick(param1:MainButtonBarEvents) : void
      {
         if(param1.typeButton == MainButtonBarEvents.FRIENDS)
         {
            server.show();
         }
      }
      
      public function objectUnloaded() : void
      {
         this.friendsWindow.destroy();
         buttonBarService.removeEventListener(MainButtonBarEvents.PANEL_BUTTON_PRESSED,this.onButtonBarButtonClick);
      }
      
      public function onUsersLoaded() : void
      {
         if(friendInfoService.newIncomingFriendsLength > 0)
         {
            this.friendsWindow.show(FriendsWindowState.INCOMING);
         }
         else
         {
            this.friendsWindow.show(FriendsWindowState.ACCEPTED);
         }
      }
   }
}

