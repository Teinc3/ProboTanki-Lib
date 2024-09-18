package alternativa.tanks.controller.commands
{
   import alternativa.osgi.service.launcherparams.ILauncherParams;
   import alternativa.tanks.controller.events.NavigationEvent;
   import alternativa.tanks.model.EntranceUrlParamsModel;
   import flash.utils.Dictionary;
   import org.robotlegs.mvcs.Command;
   import platform.client.fp10.core.service.address.AddressService;
   
   public class ParseUrlParamsCommand extends Command
   {
      private static const IFENG_PARAM_PREFIX:String = "ifeng_";
      
      [Inject]
      public var paramsModel:EntranceUrlParamsModel;
      
      [Inject]
      public var launcherParams:ILauncherParams;
      
      [Inject]
      public var addressService:AddressService;
      
      public function ParseUrlParamsCommand()
      {
         super();
      }
      
      override public function execute() : void
      {
         dispatch(new NavigationEvent(NavigationEvent.GO_TO_STAND_ALONE_CAPTCHA));
      }
      
      private function parseTutorialHash() : String
      {
         var _loc1_:String = this.getAddressParams()["tutorial"];
         if(_loc1_ == null)
         {
            _loc1_ = this.launcherParams.getParameter("tutorial");
         }
         return _loc1_;
      }
      
      private function parseReferralHash() : String
      {
         var _loc1_:String = this.getAddressParams()["friend"];
         if(_loc1_ == null)
         {
            _loc1_ = this.launcherParams.getParameter("friend");
         }
         return _loc1_;
      }
      
      private function parseEmail() : String
      {
         var _loc1_:String = this.getAddressParams()["userEmail"];
         if(_loc1_ == null)
         {
            _loc1_ = this.launcherParams.getParameter("userEmail");
         }
         return _loc1_;
      }
      
      private function parseEntranceHash() : String
      {
         var _loc1_:String = this.getAddressParams()["hash"];
         if(_loc1_ == null)
         {
            _loc1_ = this.launcherParams.getParameter("hash");
         }
         return _loc1_;
      }
      
      private function parseSingleUseHash() : String
      {
         var _loc1_:String = this.getAddressParams()["singleUseHash"];
         if(_loc1_ == null)
         {
            _loc1_ = this.launcherParams.getParameter("singleUseHash");
         }
         return _loc1_;
      }
      
      private function parseEmailConfirmHash() : String
      {
         var _loc1_:String = this.getAddressParams()["emailConfirmHash"];
         if(_loc1_ == null)
         {
            _loc1_ = this.launcherParams.getParameter("emailConfirmHash");
         }
         return _loc1_;
      }
      
      private function parseEmailChangeHash() : String
      {
         var _loc1_:String = this.getAddressParams()["emailChangeHash"];
         if(_loc1_ == null)
         {
            _loc1_ = this.launcherParams.getParameter("emailChangeHash");
         }
         return _loc1_;
      }
      
      private function getAddressParams() : Dictionary
      {
         var _loc1_:String = null;
         var _loc2_:Array = null;
         var _loc3_:int = 0;
         var _loc4_:Array = null;
         var _loc5_:Dictionary = new Dictionary();
         if(this.addressService != null)
         {
            _loc1_ = this.addressService.getValue();
            if(_loc1_ != null)
            {
               _loc2_ = _loc1_.split("&");
               _loc3_ = 0;
               while(_loc3_ < _loc2_.length)
               {
                  _loc4_ = (_loc2_[_loc3_] as String).split("=");
                  _loc5_[_loc4_[0]] = _loc4_[1];
                  _loc3_++;
               }
            }
         }
         return _loc5_;
      }
   }
}

