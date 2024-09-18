package controls.friends
{
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.Sprite;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.friend.IFriendInfoService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.friend.NewFriendEvent;
   
   public class NewRequestIndicator extends Sprite
   {
      [Inject]
      public static var friendInfoService:IFriendInfoService;
      
      public static var attentionIconClass:Class = NewRequestIndicator_attentionIconClass;
      
      private static var attentionIconBitmapData:BitmapData = Bitmap(new attentionIconClass()).bitmapData;
      
      private var _attentionIcon:Bitmap;
      
      public function NewRequestIndicator()
      {
         super();
         this.init();
      }
      
      private function init() : void
      {
         this._attentionIcon = new Bitmap(attentionIconBitmapData);
         addChild(this._attentionIcon);
         this.updateVisible();
         friendInfoService.addEventListener(NewFriendEvent.ACCEPTED_CHANGE,this.onUpdateAcceptedCounter);
         friendInfoService.addEventListener(NewFriendEvent.INCOMING_CHANGE,this.onUpdateIncomingCounter);
      }
      
      private function updateVisible() : void
      {
         this.visible = friendInfoService.newAcceptedFriendsLength + friendInfoService.newIncomingFriendsLength > 0;
      }
      
      private function onUpdateIncomingCounter(param1:NewFriendEvent) : void
      {
         this.updateVisible();
      }
      
      private function onUpdateAcceptedCounter(param1:NewFriendEvent) : void
      {
         this.updateVisible();
      }
   }
}

