package controls
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol299")]
   public class TankWindowHeader extends MovieClip
   {
      public static const REGISTER:int = 1;
      
      public static const LOGIN:int = 2;
      
      public static const RECOVER:int = 3;
      
      public static const CHANGEPASSWORD:int = 4;
      
      public static const CHAT:int = 5;
      
      public static const CURRENT_BATTLES:int = 6;
      
      public static const BATTLE_INFO:int = 7;
      
      public static const CREATE_BATTLE:int = 8;
      
      public static const YOUR_TANK:int = 9;
      
      public static const INFORMATION:int = 10;
      
      public static const ATTANTION:int = 11;
      
      public static const HALL_OF_FAME:int = 13;
      
      public static const BUG_REPORT:int = 14;
      
      public static const HELP:int = 15;
      
      public static const SYSTEM_MESSAGE:int = 16;
      
      public static const FRIENDS:int = 17;
      
      public static const SELL_CRYSTALS:int = 18;
      
      public static const ACCOUNT:int = 19;
      
      public static const SETTINGS:int = 20;
      
      public static const REFERALS:int = 21;
      
      public static const CONGRATULATIONS:int = 22;
      
      public static const LINK:int = 23;
      
      public static const YOUR_ITEMS:int = 24;
      
      public static const SHOP:int = 25;
      
      public function TankWindowHeader(param1:int = 0, param2:String = "en")
      {
         super();
         var _loc3_:int = 0;
         if(param2 == "ru")
         {
            _loc3_ = 25;
         }
         else if(param2 == "cn")
         {
            _loc3_ = 50;
         }
         else if(param2 == "de")
         {
            _loc3_ = 75;
         }
         else if(param2 == "ua")
         {
            _loc3_ = 100;
         }
         if(param1 > 0)
         {
            gotoAndStop(param1 + _loc3_);
         }
      }
   }
}

