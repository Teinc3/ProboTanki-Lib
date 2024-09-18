package projects.tanks.clients.flash.commons.services.validate
{
   public class ChinaCardIdValidator
   {
      private static const KEY:Vector.<int> = Vector.<int>([7,9,10,5,8,4,2,1,6,3,7,9,10,5,8,4,2]);
      
      private static const AUTH:Vector.<String> = Vector.<String>(["1","0","x","9","8","7","6","5","4","3","2"]);
      
      private static const REGIONSLIST:Vector.<String> = Vector.<String>(["11","12","13","14","15","21","22","23","31","32","33","34","35","36","37","41","42","43","44","45","46","50","51","52","53","54","61","62","63","64","65","71","81","82","91"]);
      
      public function ChinaCardIdValidator()
      {
         super();
      }
      
      public static function isValidIdNumber(param1:String) : Boolean
      {
         var _loc2_:Number = NaN;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = param1.length;
         if(_loc5_ != 15 && _loc5_ != 18)
         {
            return false;
         }
         _loc5_ = _loc5_ == 15 ? int(15) : int(17);
         var _loc6_:int = 0;
         while(_loc6_ < _loc5_ - 1)
         {
            _loc2_ = Number(param1.charCodeAt(_loc6_));
            if(_loc2_ < 48 || _loc2_ > 57)
            {
               return false;
            }
            _loc6_++;
         }
         var _loc7_:String = _loc5_ == 17 ? param1 : param1.substr(0,6) + "19" + param1.substr(6,9);
         var _loc8_:String = _loc7_.substr(0,2);
         if(REGIONSLIST.indexOf(_loc8_) == -1)
         {
            return false;
         }
         var _loc9_:Date = new Date();
         var _loc10_:Number = _loc9_.fullYear;
         var _loc11_:int = parseInt(_loc7_.substr(6,4));
         if(_loc11_ < 1900 || _loc11_ > _loc10_)
         {
            return false;
         }
         var _loc12_:int = parseInt(_loc7_.substr(10,2));
         var _loc13_:int = parseInt(_loc7_.substr(12,2));
         if(_loc12_ < 1 || _loc12_ > 12 || _loc13_ < 1 || _loc13_ > 31)
         {
            return false;
         }
         if(_loc5_ == 17)
         {
            _loc3_ = 0;
            _loc4_ = 0;
            while(_loc4_ < _loc5_)
            {
               _loc3_ += KEY[_loc4_] * parseInt(_loc7_.substr(_loc4_,1));
               _loc4_++;
            }
            if(_loc7_.charAt(17).toLowerCase() != AUTH[_loc3_ % 11])
            {
               return false;
            }
         }
         return true;
      }
   }
}

