package §-!z§
{
   import § !g§.§class for case§;
   import flash.utils.Dictionary;
   import projects.tanks.client.battleservice.model.statistics.§%q§;
   import projects.tanks.client.battleservice.model.statistics.§2$ §;
   import projects.tanks.client.battleservice.model.statistics.§in for for§;
   
   public class §switch const var§
   {
      public function §switch const var§()
      {
         super();
      }
      
      public static function §&3§(param1:Dictionary, param2:Vector.<§in for for§>) : Vector.<§;"8§>
      {
         var _loc3_:§in for for§ = null;
         var _loc4_:§;"8§ = null;
         var _loc5_:Vector.<§;"8§> = new Vector.<§;"8§>();
         var _loc6_:int = int(param2.length);
         var _loc7_:int = 0;
         while(_loc7_ < _loc6_)
         {
            _loc3_ = param2[_loc7_];
            _loc4_ = new §;"8§();
            _loc4_.§`#1§(_loc3_,param1[_loc3_.user]);
            _loc5_.push(_loc4_);
            _loc7_++;
         }
         return _loc5_;
      }
      
      public static function §4"c§(param1:Dictionary, param2:Vector.<§%q§>) : Vector.<§;"8§>
      {
         var _loc3_:§%q§ = null;
         var _loc4_:§;"8§ = null;
         var _loc5_:Vector.<§;"8§> = new Vector.<§;"8§>();
         var _loc6_:int = int(param2.length);
         var _loc7_:int = 0;
         while(_loc7_ < _loc6_)
         {
            _loc3_ = param2[_loc7_];
            _loc4_ = new §;"8§();
            _loc4_.§<"8§(_loc3_,param1[_loc3_.user]);
            _loc5_.push(_loc4_);
            _loc7_++;
         }
         return _loc5_;
      }
      
      public static function §1!q§(param1:§in for for§, param2:§class for case§) : §final package dynamic§
      {
         return new §final package dynamic§(param1.user,param1.uid,param1.rank,false,false,param2,param1.chatModeratorLevel);
      }
      
      public static function §,m§(param1:String, param2:Vector.<§in for for§>) : §in for for§
      {
         var _loc3_:§in for for§ = null;
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
      
      public static function §#"=§(param1:Vector.<§;"8§>, param2:String) : Vector.<§;"8§>
      {
         var _loc3_:§;"8§ = null;
         var _loc4_:Vector.<§;"8§> = new Vector.<§;"8§>();
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
      
      public static function §finally for return§(param1:Vector.<§;"8§>, param2:Vector.<§2$ §>, param3:int) : void
      {
         var _loc4_:§2$ § = null;
         var _loc5_:§;"8§ = null;
         var _loc6_:int = int(param2.length);
         var _loc7_:int = 0;
         while(_loc7_ < _loc6_)
         {
            _loc4_ = param2[_loc7_];
            _loc5_ = §^"=§(param1,_loc4_.userId);
            if(_loc5_ != null)
            {
               _loc5_.reward = _loc4_.reward;
               _loc5_.§do const use§ = _loc4_.§do const use§;
               _loc5_.§true for try§ = _loc4_.§true for try§;
               if(_loc5_.§do const use§ <= 0)
               {
                  _loc5_.§do const use§ = §null set if§(_loc4_.reward,param3);
               }
            }
            _loc7_++;
         }
      }
      
      public static function §^"=§(param1:Vector.<§;"8§>, param2:String) : §;"8§
      {
         var _loc3_:§;"8§ = null;
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
      
      public static function §var const native§(param1:Vector.<§;"8§>, param2:§%q§) : §;"8§
      {
         var _loc3_:§;"8§ = null;
         var _loc4_:int = int(param1.length);
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_)
         {
            _loc3_ = param1[_loc5_];
            if(_loc3_.userId == param2.user)
            {
               _loc3_.§try package break§(param2);
               return _loc3_;
            }
            _loc5_++;
         }
         return null;
      }
      
      public static function §include for implements§(param1:String, param2:Vector.<§2$ §>) : int
      {
         var _loc3_:§2$ § = null;
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
      
      public static function §>3§(param1:Vector.<§;"8§>, param2:String) : int
      {
         var _loc3_:§;"8§ = null;
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
      
      public static function §null set if§(param1:int, param2:int) : int
      {
         return Math.ceil(param1 * param2 / 100);
      }
   }
}

