package forms.userlabel
{
   import flash.display.Bitmap;
   import flash.utils.Dictionary;
   import projects.tanks.client.users.services.chatmoderator.ChatModeratorLevel;
   
   public class ChatUserLabel extends UserLabel
   {
      public static const CHAT_MODERATOR_STATUS_ICON_CONT_WIDTH:int = 16;
      
      private static const cmStatusIconClass:Class = ChatUserLabel_cmStatusIconClass;
      
      private static const goldStatusIconClass:Class = ChatUserLabel_goldStatusIconClass;
      
      private static const silverStatusIconClass:Class = ChatUserLabel_silverStatusIconClass;
      
      private static const bronzeStatusIconClass:Class = ChatUserLabel_bronzeStatusIconClass;
      
      private static const bitmapDatas:Dictionary = new Dictionary();
      
      bitmapDatas[ChatModeratorLevel.COMMUNITY_MANAGER] = new cmStatusIconClass().bitmapData;
      bitmapDatas[ChatModeratorLevel.ADMINISTRATOR] = new goldStatusIconClass().bitmapData;
      bitmapDatas[ChatModeratorLevel.MODERATOR] = new silverStatusIconClass().bitmapData;
      bitmapDatas[ChatModeratorLevel.CANDIDATE] = new bronzeStatusIconClass().bitmapData;
      
      protected var _chatModeratorLevel:ChatModeratorLevel;
      
      protected var _needDrawAdditionalIcons:Boolean;
      
      public function ChatUserLabel(param1:String, param2:Boolean = true)
      {
         this._needDrawAdditionalIcons = this._chatModeratorLevel != ChatModeratorLevel.NONE;
         super(param1);
      }
      
      override protected function createAdditionalIcons() : void
      {
         var _loc1_:Bitmap = null;
         _loc1_ = null;
         if(this._needDrawAdditionalIcons)
         {
            _loc1_ = new Bitmap(bitmapDatas[this._chatModeratorLevel]);
            _loc1_.x = RANK_ICON_CONT_WIDTH + 1;
            _loc1_.y = 3;
            shadowContainer.addChild(_loc1_);
         }
      }
      
      override protected function getAdditionalIconsWidth() : Number
      {
         return this._needDrawAdditionalIcons ? Number(CHAT_MODERATOR_STATUS_ICON_CONT_WIDTH) : Number(0);
      }
   }
}

