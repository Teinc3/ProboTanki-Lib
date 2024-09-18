package alternativa.tanks.service.settings
{
   import flash.events.EventDispatcher;
   import flash.media.SoundMixer;
   import flash.media.SoundTransform;
   import flash.net.SharedObject;
   import projects.tanks.clients.flash.commons.models.gpu.GPUCapabilities;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.friend.battleinvite.IBattleInviteService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.storage.IStorageService;
   
   public class Renamed574 extends EventDispatcher implements ISettingsService
   {
      [Inject]
      public static var storageService:IStorageService;
      
      [Inject]
      public static var battleInviteService:IBattleInviteService;
      
      private static const Renamed3728:Number = 0.7;
      
      private static const Renamed3729:int = 8;
      
      private var email:String;
      
      private var emailConfirmed:Boolean;
      
      private var Renamed3730:Boolean = false;
      
      public function Renamed574()
      {
         super();
      }
      
      private static function Renamed3731(param1:Boolean, param2:Number) : void
      {
         SoundMixer.soundTransform = new SoundTransform(param1 ? Number(0) : Number(param2));
      }
      
      public function get showDropZones() : Boolean
      {
         return this.getBoolean(Renamed2069.Renamed3732,true);
      }
      
      public function set showDropZones(param1:Boolean) : void
      {
         this.Renamed3726(Renamed2069.Renamed3732,param1);
      }
      
      public function get showSkyBox() : Boolean
      {
         return this.getBoolean(Renamed2069.Renamed3733,true);
      }
      
      public function get showFPS() : Boolean
      {
         return this.getBoolean(Renamed2069.Renamed3734,true);
      }
      
      public function get showChat() : Boolean
      {
         return this.getBoolean(Renamed2069.Renamed2071,true);
      }
      
      public function get mipMapping() : Boolean
      {
         return this.getBoolean(Renamed2069.Renamed3735,true);
      }
      
      public function get alternateCamera() : Boolean
      {
         return this.getBoolean(Renamed2069.Renamed3736,false);
      }
      
      public function get adaptiveFPS() : Boolean
      {
         return this.getBoolean(Renamed2069.Renamed3737,false);
      }
      
      public function get inverseBackDriving() : Boolean
      {
         return this.getBoolean(Renamed2069.Renamed3738,false);
      }
      
      public function get bgSound() : Boolean
      {
         return this.getBoolean(Renamed2069.Renamed3739,true);
      }
      
      public function get muteSound() : Boolean
      {
         return this.getBoolean(Renamed2069.Renamed3740,false);
      }
      
      public function set muteSound(param1:Boolean) : void
      {
         Renamed574.Renamed3731(param1,this.Renamed3722);
         this.Renamed3726(Renamed2069.Renamed3740,param1);
      }
      
      public function get shadows() : Boolean
      {
         return GPUCapabilities.gpuEnabled && !GPUCapabilities.constrained && this.getBoolean(Renamed2069.Renamed3741,true);
      }
      
      public function get Renamed2472() : Boolean
      {
         return GPUCapabilities.gpuEnabled && !GPUCapabilities.constrained && this.getBoolean(Renamed2069.Renamed3742,false);
      }
      
      public function get dust() : Boolean
      {
         return GPUCapabilities.gpuEnabled && !GPUCapabilities.constrained && this.getBoolean(Renamed2069.Renamed3742,false) && this.getBoolean(Renamed2069.Renamed3743,false);
      }
      
      public function get ssao() : Boolean
      {
         return GPUCapabilities.gpuEnabled && !GPUCapabilities.constrained && this.getBoolean(Renamed2069.SSAO,false);
      }
      
      public function get fog() : Boolean
      {
         return GPUCapabilities.gpuEnabled && !GPUCapabilities.constrained && this.getBoolean(Renamed2069.FOG,true);
      }
      
      public function get dynamicShadows() : Boolean
      {
         return GPUCapabilities.gpuEnabled && !GPUCapabilities.constrained && this.getBoolean(Renamed2069.Renamed3744,false);
      }
      
      public function get dynamicLighting() : Boolean
      {
         var _loc1_:Boolean = this.dynamicShadows || this.ssao || this.Renamed2472;
         return GPUCapabilities.gpuEnabled && !GPUCapabilities.constrained && this.getBoolean(Renamed2069.Renamed3745,_loc1_);
      }
      
      public function get antialiasing() : Boolean
      {
         return GPUCapabilities.gpuEnabled && !GPUCapabilities.constrained && this.getBoolean(Renamed2069.Renamed3746,false);
      }
      
      public function get graphicsAutoQuality() : Boolean
      {
         if(this.Renamed3747(Renamed2069.Renamed3748))
         {
            return GPUCapabilities.gpuEnabled && !GPUCapabilities.constrained && this.getBoolean(Renamed2069.Renamed3748,false);
         }
         return GPUCapabilities.gpuEnabled && !GPUCapabilities.constrained;
      }
      
      private function Renamed3747(param1:Renamed2069) : Boolean
      {
         return storageService.getStorage().data[param1.name] != null;
      }
      
      public function get Renamed3722() : Number
      {
         return this.getNumber(Renamed2069.Renamed3749,Renamed3728);
      }
      
      public function set Renamed3722(param1:Number) : void
      {
         Renamed3731(this.muteSound,param1);
         this.Renamed3726(Renamed2069.Renamed3749,param1);
      }
      
      public function Renamed2205() : void
      {
         Renamed3731(this.muteSound,this.Renamed3722);
      }
      
      private function getBoolean(param1:Renamed2069, param2:Boolean) : Boolean
      {
         var _loc3_:* = storageService.getStorage().data[param1.name];
         return _loc3_ == null ? Boolean(param2) : Boolean(_loc3_);
      }
      
      private function storeBoolean(param1:Renamed2069, param2:Boolean) : void
      {
         storageService.getStorage().data[param1.name] = param2;
      }
      
      private function getNumber(param1:Renamed2069, param2:Number = 0) : Number
      {
         var _loc3_:Number = Number(storageService.getStorage().data[param1.name]);
         return isNaN(_loc3_) ? Number(param2) : Number(_loc3_);
      }
      
      private function Renamed3750(param1:Renamed2069, param2:Number) : void
      {
         storageService.getStorage().data[param1.name] = param2;
      }
      
      public function Renamed2286(param1:String, param2:Boolean) : void
      {
         this.email = param1;
         this.emailConfirmed = param2;
      }
      
      public function Renamed3723() : Boolean
      {
         return this.email != null && this.email != "";
      }
      
      public function Renamed3724() : Boolean
      {
         return !this.Renamed2184();
      }
      
      public function getEmail() : String
      {
         return this.email != null ? this.email : "";
      }
      
      public function Renamed2184() : Boolean
      {
         return this.emailConfirmed;
      }
      
      public function Renamed3725(param1:Boolean) : void
      {
         this.emailConfirmed = param1;
      }
      
      public function get mouseControl() : Boolean
      {
         return this.getBoolean(Renamed2069.Renamed3751,true);
      }
      
      public function get mouseSensitivity() : int
      {
         return this.getNumber(Renamed2069.Renamed3752,Renamed3729);
      }
      
      public function get mouseYInverse() : Boolean
      {
         return this.getBoolean(Renamed2069.Renamed3753,false);
      }
      
      public function get mouseYInverseShaftAim() : Boolean
      {
         return this.getBoolean(Renamed2069.Renamed3754,false);
      }
      
      public function get Renamed2195() : Boolean
      {
         return this.Renamed3730;
      }
      
      public function set Renamed2195(param1:Boolean) : void
      {
         this.Renamed3730 = param1;
      }
      
      public function get showDamage() : Boolean
      {
         return this.getBoolean(Renamed2069.SHOW_DAMAGE,true);
      }
      
      public function Renamed3726(param1:Renamed2069, param2:Object) : void
      {
         var _loc3_:SharedObject = storageService.getStorage();
         _loc3_.data[param1.name] = param2;
         _loc3_.flush();
         dispatchEvent(new SettingsServiceEvent(SettingsServiceEvent.SETTINGS_CHANGED,param1));
      }
   }
}

