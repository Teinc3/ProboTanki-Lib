package Renamed215
{
   import Renamed136.Renamed663;
   import flash.utils.Dictionary;
   import projects.tanks.client.battleservice.model.statistics.Renamed4207;
   import projects.tanks.client.battleservice.model.statistics.Renamed4209;
   import projects.tanks.client.battleservice.model.statistics.Renamed2737;
   
   public class Renamed5727
   {
      public function Renamed5727()
      {
         super();
      }
      
      public static function Renamed5737(param1:Dictionary, param2:Vector.<Renamed2737>) : Vector.<Renamed5725>
      {
         var _loc3_:Renamed2737 = null;
         var _loc4_:Renamed5725 = null;
         var _loc5_:Vector.<Renamed5725> = new Vector.<Renamed5725>();
         var _loc6_:int = int(param2.length);
         var _loc7_:int = 0;
         while(_loc7_ < _loc6_)
         {
            _loc3_ = param2[_loc7_];
            _loc4_ = new Renamed5725();
            _loc4_.Renamed6243(_loc3_,param1[_loc3_.user]);
            _loc5_.push(_loc4_);
            _loc7_++;
         }
         return _loc5_;
      }
      
      public static function Renamed5745(param1:Dictionary, param2:Vector.<Renamed4207>) : Vector.<Renamed5725>
      {
         var _loc3_:Renamed4207 = null;
         var _loc4_:Renamed5725 = null;
         var _loc5_:Vector.<Renamed5725> = new Vector.<Renamed5725>();
         var _loc6_:int = int(param2.length);
         var _loc7_:int = 0;
         while(_loc7_ < _loc6_)
         {
            _loc3_ = param2[_loc7_];
            _loc4_ = new Renamed5725();
            _loc4_.Renamed6241(_loc3_,param1[_loc3_.user]);
            _loc5_.push(_loc4_);
            _loc7_++;
         }
         return _loc5_;
      }
      
      public static function Renamed5734(param1:Renamed2737, param2:Renamed663) : Renamed5726
      {
         return new Renamed5726(param1.user,param1.uid,param1.rank,false,false,param2,param1.chatModeratorLevel);
      }
      
      public static function Renamed2739(param1:String, param2:Vector.<Renamed2737>) : Renamed2737
      {
         var _loc3_:Renamed2737 = null;
         var _loc4_:int = int(param2.length);
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_)
         {
            _loc3_ = param2[_loc5_];
            if(param1 == _loc3_.user)
            {
               return _loc3_;
            }
            _loc5_++;
         }
         return null;
      }
      
      public static function Renamed5749(param1:Vector.<Renamed5725>, param2:String) : Vector.<Renamed5725>
      {
         var _loc3_:Renamed5725 = null;
         var _loc4_:Vector.<Renamed5725> = new Vector.<Renamed5725>();
         var _loc5_:int = int(param1.length);
         var _loc6_:int = 0;
         while(_loc6_ < _loc5_)
         {
            _loc3_ = param1[_loc6_];
            if(_loc3_.userId != param2)
            {
               _loc4_.push(_loc3_);
            }
            _loc6_++;
         }
         return _loc4_;
      }
      
      public static function Renamed5752(param1:Vector.<Renamed5725>, param2:Vector.<Renamed4209>, param3:int) : void
      {
         var _loc4_:Renamed4209 = null;
         var _loc5_:Renamed5725 = null;
         var _loc6_:int = int(param2.length);
         var _loc7_:int = 0;
         while(_loc7_ < _loc6_)
         {
            _loc4_ = param2[_loc7_];
            _loc5_ = Renamed5757(param1,_loc4_.userId);
            if(_loc5_ != null)
            {
               _loc5_.reward = _loc4_.reward;
               _loc5_.Renamed4213 = _loc4_.Renamed4213;
               _loc5_.Renamed4212 = _loc4_.Renamed4212;
               if(_loc5_.Renamed4213 <= 0)
               {
                  _loc5_.Renamed4213 = Renamed5754(_loc4_.reward,param3);
               }
            }
            _loc7_++;
         }
      }
      
      public static function Renamed5757(param1:Vector.<Renamed5725>, param2:String) : Renamed5725
      {
         var _loc3_:Renamed5725 = null;
         var _loc4_:int = int(param1.length);
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_)
         {
            _loc3_ = param1[_loc5_];
            if(_loc3_.userId == param2)
            {
               return _loc3_;
            }
            _loc5_++;
         }
         return null;
      }
      
      public static function Renamed5744(param1:Vector.<Renamed5725>, param2:Renamed4207) : Renamed5725
      {
         var _loc3_:Renamed5725 = null;
         var _loc4_:int = int(param1.length);
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_)
         {
            _loc3_ = param1[_loc5_];
            if(_loc3_.userId == param2.user)
            {
               _loc3_.Renamed6242(param2);
               return _loc3_;
            }
            _loc5_++;
         }
         return null;
      }
      
      public static function Renamed5753(param1:String, param2:Vector.<Renamed4209>) : int
      {
         var _loc3_:Renamed4209 = null;
         var _loc4_:int = int(param2.length);
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_)
         {
            _loc3_ = param2[_loc5_];
            if(param1 == _loc3_.userId)
            {
               return _loc3_.reward;
            }
            _loc5_++;
         }
         return -1;
      }
      
      public static function Renamed5756(param1:Vector.<Renamed5725>, param2:String) : int
      {
         var _loc3_:Renamed5725 = null;
         var _loc4_:int = int(param1.length);
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_)
         {
            _loc3_ = param1[_loc5_];
            if(_loc3_.userId == param2)
            {
               return _loc5_;
            }
            _loc5_++;
         }
         return -1;
      }
      
      public static function Renamed5754(param1:int, param2:int) : int
      {
         return Math.ceil(param1 * param2 / 100);
      }
   }
}

