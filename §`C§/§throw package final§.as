package §`C§
{
   import alternativa.tanks.service.§each package super§;
   import org.robotlegs.mvcs.Actor;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.storage.IStorageService;
   
   public class §throw package final§ extends Actor implements §each package super§
   {
      [Inject]
      public var storageService:IStorageService;
      
      public function §throw package final§()
      {
         super();
      }
      
      public function get §use catch switch§() : Boolean
      {
         return this.storageService.getStorage().data.alreadyPlayedTanks != null ? Boolean(this.storageService.getStorage().data.alreadyPlayedTanks) : Boolean(false);
      }
      
      public function set §use catch switch§(param1:Boolean) : void
      {
         this.storageService.getStorage().data.alreadyPlayedTanks = true;
      }
      
      public function get §+"d§() : String
      {
         return this.storageService.getStorage().data.userName;
      }
      
      public function set §+"d§(param1:String) : void
      {
         this.storageService.getStorage().data.userName = param1;
      }
      
      public function get entranceHash() : String
      {
         return this.storageService.getStorage().data.userHash;
      }
   }
}

