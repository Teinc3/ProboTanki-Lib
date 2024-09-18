package projects.tanks.client.battleservice.model.statistics
{
   import projects.tanks.client.users.services.chatmoderator.ChatModeratorLevel;
   
   public class §in for for§ extends §%q§
   {
      private var _chatModeratorLevel:ChatModeratorLevel;
      
      private var _rank:int;
      
      private var _uid:String;
      
      public function §in for for§(param1:ChatModeratorLevel = null, param2:int = 0, param3:String = null)
      {
         super();
         this._chatModeratorLevel = param1;
         this._rank = param2;
         this._uid = param3;
      }
      
      public function get chatModeratorLevel() : ChatModeratorLevel
      {
         return this._chatModeratorLevel;
      }
      
      public function set chatModeratorLevel(param1:ChatModeratorLevel) : void
      {
         this._chatModeratorLevel = param1;
      }
      
      public function get rank() : int
      {
         return this._rank;
      }
      
      public function set rank(param1:int) : void
      {
         this._rank = param1;
      }
      
      public function get uid() : String
      {
         return this._uid;
      }
      
      public function set uid(param1:String) : void
      {
         this._uid = param1;
      }
      
      override public function toString() : String
      {
         var _loc1_:String = "UserInfo [";
         _loc1_ += "chatModeratorLevel = " + this.chatModeratorLevel + " ";
         _loc1_ += "rank = " + this.rank + " ";
         _loc1_ += "uid = " + this.uid + " ";
         _loc1_ += super.toString();
         return _loc1_ + "]";
      }
   }
}

