package alternativa.tanks.newbieservice
{
   import projects.tanks.clients.fp10.libraries.tanksservices.service.storage.IStorageService;
   
   public class §^#-§ implements NewbieUserService
   {
      [Inject]
      public static var storageService:IStorageService;
      
      public function §^#-§()
      {
         super();
      }
      
      public function get isNewbieUser() : Boolean
      {
         return storageService.getStorage().data.isNewbieUser;
      }
      
      public function set isNewbieUser(param1:Boolean) : void
      {
         storageService.getStorage().data.isNewbieUser = param1;
      }
   }
}

