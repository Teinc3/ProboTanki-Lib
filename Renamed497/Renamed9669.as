package Renamed2615
{
   import Renamed215.Renamed2611;
   import alternativa.osgi.OSGi;
   import alternativa.tanks.models.battle.battlefield.Renamed2305;
   import alternativa.tanks.models.battle.battlefield.BattleUserInfoService;
   import platform.client.fp10.core.type.AutoClosable;
   import platform.client.fp10.core.type.IGameObject;
   import projects.tanks.client.users.services.chatmoderator.ChatModeratorLevel;
   
   public class Renamed9669 implements BattleUserInfoService, AutoClosable
   {
      private var Renamed9663:IGameObject;
      
      public function Renamed9669(param1:IGameObject)
      {
         this.Renamed9670 = new Vector.<Renamed2305>();
         super();
         this.Renamed9663 = param1;
         OSGi.getInstance().registerService(BattleUserInfoService,this);
      }
      
      public function Renamed2300(param1:String) : String
      {
         var _loc2_:Renamed2616 = Renamed2616(OSGi.getInstance().getService(Renamed2616));
         var _loc3_:Renamed2611 = _loc2_.getShortUserInfo(param1);
         if(_loc3_ != null)
         {
            return _loc3_.uid;
         }
         return null;
      }
      
      public function Renamed2301(param1:String) : int
      {
         var _loc2_:Renamed2616 = Renamed2616(OSGi.getInstance().getService(Renamed2616));
         var _loc3_:Renamed2611 = _loc2_.getShortUserInfo(param1);
         if(_loc3_ != null)
         {
            return _loc3_.rank;
         }
         return 1;
      }
      
      public function Renamed2302(param1:String) : Boolean
      {
         var _loc2_:Renamed2616 = Renamed2616(OSGi.getInstance().getService(Renamed2616));
         var _loc3_:Renamed2611 = _loc2_.getShortUserInfo(param1);
         if(_loc3_ != null)
         {
            return _loc3_.suspicious;
         }
         return false;
      }
      
      public function Renamed2303(param1:String) : ChatModeratorLevel
      {
         var _loc2_:Renamed2616 = Renamed2616(OSGi.getInstance().getService(Renamed2616));
         var _loc3_:Renamed2611 = _loc2_.getShortUserInfo(param1);
         return _loc3_ != null ? _loc3_.chatModeratorLevel : ChatModeratorLevel.NONE;
      }
      
      public function Renamed2304(param1:Renamed2305) : void
      {
         var _loc2_:int = int(this.Renamed9670.indexOf(param1));
         if(_loc2_ < 0)
         {
            this.Renamed9670.push(param1);
         }
      }
      
      public function Renamed2306(param1:Renamed2305) : void
      {
         var _loc2_:int = int(this.Renamed9670.indexOf(param1));
         if(_loc2_ >= 0)
         {
            this.Renamed9670.splice(_loc2_,1);
         }
      }
      
      public function Renamed9671(param1:Renamed2611) : void
      {
         var _loc2_:Renamed2305 = null;
         for each(_loc2_ in this.Renamed9670)
         {
            _loc2_.Renamed2307(param1.userId,param1.uid,param1.rank,param1.suspicious);
         }
      }
      
      public function Renamed9672(param1:String, param2:int) : void
      {
         var _loc3_:Renamed2305 = null;
         for each(_loc3_ in this.Renamed9670)
         {
            _loc3_.Renamed2308(param1,param2);
         }
      }
      
      public function Renamed9673(param1:String, param2:Boolean) : void
      {
         var _loc3_:Renamed2305 = null;
         for each(_loc3_ in this.Renamed9670)
         {
            _loc3_.Renamed2309(param1,param2);
         }
      }
      
      [Obfuscation(rename="false")]
      public function close() : void
      {
         this.Renamed9663 = null;
         this.Renamed9670.length = 0;
         OSGi.getInstance().unregisterService(BattleUserInfoService);
      }
      
      public function getUsersCount() : int
      {
         var _loc1_:Renamed2616 = Renamed2616(OSGi.getInstance().getService(Renamed2616));
         return _loc1_.getUsersCount();
      }
   }
}

