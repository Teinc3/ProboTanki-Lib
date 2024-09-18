package alternativa.tanks.service.settings
{
   import flash.events.EventDispatcher;
   import flash.media.SoundMixer;
   import flash.media.SoundTransform;
   import flash.net.SharedObject;
   import projects.tanks.clients.flash.commons.models.gpu.GPUCapabilities;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.friend.battleinvite.IBattleInviteService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.storage.IStorageService;
   
   public class §;!Y§ extends EventDispatcher implements ISettingsService
   {
      [Inject]
      public static var storageService:IStorageService;
      
      [Inject]
      public static var battleInviteService:IBattleInviteService;
      
      private static const §true switch§:Number = 0.7;
      
      private static const §catch const class§:int = 8;
      
      private var email:String;
      
      private var emailConfirmed:Boolean;
      
      private var §in set false§:Boolean = false;
      
      public function §;!Y§()
      {
         super();
      }
      
      private static function §break for try§(param1:Boolean, param2:Number) : void
      {
         SoundMixer.soundTransform = new SoundTransform(param1 ? Number(0) : Number(param2));
      }
      
      public function get showDropZones() : Boolean
      {
         return this.getBoolean(§[!;§.§'"V§,true);
      }
      
      public function set showDropZones(param1:Boolean) : void
      {
         this.§for function§(§[!;§.§'"V§,param1);
      }
      
      public function get showSkyBox() : Boolean
      {
         return this.getBoolean(§[!;§.§2!_§,true);
      }
      
      public function get showFPS() : Boolean
      {
         return this.getBoolean(§[!;§.§<!r§,true);
      }
      
      public function get showChat() : Boolean
      {
         return this.getBoolean(§[!;§.§case for with§,true);
      }
      
      public function get mipMapping() : Boolean
      {
         return this.getBoolean(§[!;§.§set for false§,true);
      }
      
      public function get alternateCamera() : Boolean
      {
         return this.getBoolean(§[!;§.§true set var§,false);
      }
      
      public function get adaptiveFPS() : Boolean
      {
         return this.getBoolean(§[!;§.§each package implements§,false);
      }
      
      public function get inverseBackDriving() : Boolean
      {
         return this.getBoolean(§[!;§.§dynamic package continue§,false);
      }
      
      public function get bgSound() : Boolean
      {
         return this.getBoolean(§[!;§.§super const with§,true);
      }
      
      public function get muteSound() : Boolean
      {
         return this.getBoolean(§[!;§.§!g§,false);
      }
      
      public function set muteSound(param1:Boolean) : void
      {
         §;!Y§.§break for try§(param1,this.§super for false§);
         this.§for function§(§[!;§.§!g§,param1);
      }
      
      public function get shadows() : Boolean
      {
         return GPUCapabilities.gpuEnabled && !GPUCapabilities.constrained && this.getBoolean(§[!;§.§"$#§,true);
      }
      
      public function get §catch package throw§() : Boolean
      {
         return GPUCapabilities.gpuEnabled && !GPUCapabilities.constrained && this.getBoolean(§[!;§.§`&§,false);
      }
      
      public function get dust() : Boolean
      {
         return GPUCapabilities.gpuEnabled && !GPUCapabilities.constrained && this.getBoolean(§[!;§.§`&§,false) && this.getBoolean(§[!;§.§%S§,false);
      }
      
      public function get ssao() : Boolean
      {
         return GPUCapabilities.gpuEnabled && !GPUCapabilities.constrained && this.getBoolean(§[!;§.SSAO,false);
      }
      
      public function get fog() : Boolean
      {
         return GPUCapabilities.gpuEnabled && !GPUCapabilities.constrained && this.getBoolean(§[!;§.FOG,true);
      }
      
      public function get dynamicShadows() : Boolean
      {
         return GPUCapabilities.gpuEnabled && !GPUCapabilities.constrained && this.getBoolean(§[!;§.§]w§,false);
      }
      
      public function get dynamicLighting() : Boolean
      {
         var _loc1_:Boolean = this.dynamicShadows || this.ssao || this.§catch package throw§;
         return GPUCapabilities.gpuEnabled && !GPUCapabilities.constrained && this.getBoolean(§[!;§.§get for dynamic§,_loc1_);
      }
      
      public function get antialiasing() : Boolean
      {
         return GPUCapabilities.gpuEnabled && !GPUCapabilities.constrained && this.getBoolean(§[!;§.§;5§,false);
      }
      
      public function get graphicsAutoQuality() : Boolean
      {
         if(this.§,"+§(§[!;§.§finally var set§))
         {
            return GPUCapabilities.gpuEnabled && !GPUCapabilities.constrained && this.getBoolean(§[!;§.§finally var set§,false);
         }
         return GPUCapabilities.gpuEnabled && !GPUCapabilities.constrained;
      }
      
      private function §,"+§(param1:§[!;§) : Boolean
      {
         return storageService.getStorage().data[param1.name] != null;
      }
      
      public function get §super for false§() : Number
      {
         return this.getNumber(§[!;§.§final import§,§true switch§);
      }
      
      public function set §super for false§(param1:Number) : void
      {
         §break for try§(this.muteSound,param1);
         this.§for function§(§[!;§.§final import§,param1);
      }
      
      public function §]l§() : void
      {
         §break for try§(this.muteSound,this.§super for false§);
      }
      
      private function getBoolean(param1:§[!;§, param2:Boolean) : Boolean
      {
         var _loc3_:* = storageService.getStorage().data[param1.name];
         return _loc3_ == null ? Boolean(param2) : Boolean(_loc3_);
      }
      
      private function storeBoolean(param1:§[!;§, param2:Boolean) : void
      {
         storageService.getStorage().data[param1.name] = param2;
      }
      
      private function getNumber(param1:§[!;§, param2:Number = 0) : Number
      {
         var _loc3_:Number = Number(storageService.getStorage().data[param1.name]);
         return isNaN(_loc3_) ? Number(param2) : Number(_loc3_);
      }
      
      private function §override package with§(param1:§[!;§, param2:Number) : void
      {
         storageService.getStorage().data[param1.name] = param2;
      }
      
      public function §use for throw§(param1:String, param2:Boolean) : void
      {
         this.email = param1;
         this.emailConfirmed = param2;
      }
      
      public function §4"H§() : Boolean
      {
         return this.email != null && this.email != "";
      }
      
      public function §throw const dynamic§() : Boolean
      {
         return !this.§switch throw§();
      }
      
      public function getEmail() : String
      {
         return this.email != null ? this.email : "";
      }
      
      public function §switch throw§() : Boolean
      {
         return this.emailConfirmed;
      }
      
      public function §0#v§(param1:Boolean) : void
      {
         this.emailConfirmed = param1;
      }
      
      public function get mouseControl() : Boolean
      {
         return this.getBoolean(§[!;§.§0$#§,true);
      }
      
      public function get mouseSensitivity() : int
      {
         return this.getNumber(§[!;§.§catch default§,§catch const class§);
      }
      
      public function get mouseYInverse() : Boolean
      {
         return this.getBoolean(§[!;§.§true for each§,false);
      }
      
      public function get mouseYInverseShaftAim() : Boolean
      {
         return this.getBoolean(§[!;§.§,#_§,false);
      }
      
      public function get § Y§() : Boolean
      {
         return this.§in set false§;
      }
      
      public function set § Y§(param1:Boolean) : void
      {
         this.§in set false§ = param1;
      }
      
      public function get showDamage() : Boolean
      {
         return this.getBoolean(§[!;§.SHOW_DAMAGE,true);
      }
      
      public function §for function§(param1:§[!;§, param2:Object) : void
      {
         var _loc3_:SharedObject = storageService.getStorage();
         _loc3_.data[param1.name] = param2;
         _loc3_.flush();
         dispatchEvent(new SettingsServiceEvent(SettingsServiceEvent.SETTINGS_CHANGED,param1));
      }
   }
}

