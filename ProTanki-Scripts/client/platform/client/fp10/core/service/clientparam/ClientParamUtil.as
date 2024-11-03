package platform.client.fp10.core.service.clientparam
{
   import flash.external.ExternalInterface;
   import flash.system.Capabilities;
   import flash.utils.Dictionary;
   
   public class ClientParamUtil
   {
      public function ClientParamUtil()
      {
         super();
      }
      
      public static function collectClientParams() : Dictionary
      {
         var _loc1_:Dictionary = new Dictionary();
         var _loc2_:Array = Capabilities.version.split(" ");
         if(_loc2_.length === 2)
         {
            _loc1_[ClientParamEnum.OS] = _loc2_[0];
            _loc1_[ClientParamEnum.FLASH_PLAYER_VERSION] = _loc2_[1];
         }
         _loc1_[ClientParamEnum.FLASH_PLAYER_TYPE] = Capabilities.playerType;
         if(ExternalInterface.available)
         {
            _loc1_[ClientParamEnum.BROWSER_USER_AGENT] = ExternalInterface.call("window.navigator.userAgent.toString").replace(/;/gi,",");
         }
         return _loc1_;
      }
   }
}

