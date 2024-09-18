package alternativa.tanks.model.info
{
   import alternativa.types.Long;
   import platform.client.fp10.core.service.address.AddressService;
   import platform.clients.fp10.libraries.alternativapartners.service.IPartnerService;
   
   public class Renamed2126
   {
      [Inject]
      public static var addressService:AddressService;
      
      [Inject]
      public static var partnersService:IPartnerService;
      
      public function Renamed2126()
      {
         super();
      }
      
      public static function Renamed2127() : String
      {
         return "";
      }
      
      public static function Renamed2128(param1:Long) : String
      {
         return intToUhex(param1.high) + intToUhex(param1.low);
      }
      
      private static function intToUhex(param1:int) : String
      {
         var _loc2_:String = null;
         var _loc3_:uint = 0;
         if(param1 >= 0)
         {
            _loc2_ = param1.toString(16);
         }
         else
         {
            _loc3_ = uint(param1 & ~2147483648 | 2147483648);
            _loc2_ = _loc3_.toString(16);
         }
         var _loc4_:int = 8 - _loc2_.length;
         while(_loc4_ > 0)
         {
            _loc2_ = "0" + _loc2_;
            _loc4_--;
         }
         return _loc2_;
      }
   }
}

