package projects.tanks.client.chat.types
{
   import projects.tanks.client.users.services.chatmoderator.ChatModeratorLevel;
   
   public class UserStatus
   {
      private var _chatModeratorLevel:ChatModeratorLevel;
      
      private var _ip:String;
      
      private var _rankIndex:int;
      
      private var _uid:String;
      
      private var _userId:String;
      
      public function UserStatus(param1:ChatModeratorLevel = null, param2:String = null, param3:int = 0, param4:String = null, param5:String = null)
      {
         super();
         this._chatModeratorLevel = param1;
         this._ip = param2;
         this._rankIndex = param3;
         this._uid = param4;
         this._userId = param5;
      }
      
      public function get chatModeratorLevel() : ChatModeratorLevel
      {
         return this._chatModeratorLevel;
      }
      
      public function set chatModeratorLevel(param1:ChatModeratorLevel) : void
      {
         this._chatModeratorLevel = param1;
      }
      
      public function get ip() : String
      {
         return this._ip;
      }
      
      public function set ip(param1:String) : void
      {
         this._ip = param1;
      }
      
      public function get rankIndex() : int
      {
         return this._rankIndex;
      }
      
      public function set rankIndex(param1:int) : void
      {
         this._rankIndex = param1;
      }
      
      public function get uid() : String
      {
         return this._uid;
      }
      
      public function set uid(param1:String) : void
      {
         this._uid = param1;
      }
      
      public function get userId() : String
      {
         return this._userId;
      }
      
      public function set userId(param1:String) : void
      {
         this._userId = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "UserStatus [";
         _loc1_ += "chatModeratorLevel = " + this.chatModeratorLevel + " ";
         _loc1_ += "ip = " + this.ip + " ";
         _loc1_ += "rankIndex = " + this.rankIndex + " ";
         _loc1_ += "uid = " + this.uid + " ";
         _loc1_ += "userId = " + this.userId + " ";
         return _loc1_ + "]";
      }
   }
}

