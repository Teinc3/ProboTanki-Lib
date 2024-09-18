package §-!z§
{
   import § !g§.§class for case§;
   import projects.tanks.client.users.services.chatmoderator.ChatModeratorLevel;
   
   public class §final package dynamic§
   {
      private var _userId:String;
      
      private var _uid:String;
      
      private var _rank:int;
      
      private var _loaded:Boolean;
      
      private var _suspicious:Boolean;
      
      private var §throw package default§:§class for case§;
      
      private var _chatModeratorLevel:ChatModeratorLevel;
      
      public function §final package dynamic§(param1:String, param2:String, param3:int, param4:Boolean, param5:Boolean, param6:§class for case§, param7:ChatModeratorLevel)
      {
         super();
         this._userId = param1;
         this._uid = param2;
         this._rank = param3;
         this._loaded = param4;
         this._suspicious = param5;
         this.§throw package default§ = param6;
         this._chatModeratorLevel = param7;
      }
      
      public function get userId() : String
      {
         return this._userId;
      }
      
      public function set userId(param1:String) : void
      {
         this._userId = param1;
      }
      
      public function get uid() : String
      {
         return this._uid;
      }
      
      public function set uid(param1:String) : void
      {
         this._uid = param1;
      }
      
      public function get rank() : int
      {
         return this._rank;
      }
      
      public function set rank(param1:int) : void
      {
         this._rank = param1;
      }
      
      public function get loaded() : Boolean
      {
         return this._loaded;
      }
      
      public function set loaded(param1:Boolean) : void
      {
         this._loaded = param1;
      }
      
      public function get suspicious() : Boolean
      {
         return this._suspicious;
      }
      
      public function set suspicious(param1:Boolean) : void
      {
         this._suspicious = param1;
      }
      
      public function get teamType() : §class for case§
      {
         return this.§throw package default§;
      }
      
      public function set teamType(param1:§class for case§) : void
      {
         this.§throw package default§ = param1;
      }
      
      public function get chatModeratorLevel() : ChatModeratorLevel
      {
         return this._chatModeratorLevel;
      }
      
      public function set chatModeratorLevel(param1:ChatModeratorLevel) : void
      {
         this._chatModeratorLevel = param1;
      }
      
      public function getShortUserInfo() : §!"L§
      {
         var _loc1_:§!"L§ = new §!"L§();
         _loc1_.userId = this._userId;
         _loc1_.uid = this._uid;
         _loc1_.rank = this._rank;
         _loc1_.suspicious = this._suspicious;
         _loc1_.teamType = this.§throw package default§;
         _loc1_.chatModeratorLevel = this._chatModeratorLevel;
         return _loc1_;
      }
   }
}

