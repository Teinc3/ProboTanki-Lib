package Renamed501
{
   import alternativa.tanks.service.Renamed555;
   import org.robotlegs.mvcs.Actor;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.storage.IStorageService;
   
   public class Renamed548 extends Actor implements Renamed555
   {
      [Inject]
      public var storageService:IStorageService;
      
      public function Renamed548()
      {
         super();
      }
      
      public function get Renamed1566() : Boolean
      {
         return this.storageService.getStorage().data.alreadyPlayedTanks != null ? Boolean(this.storageService.getStorage().data.alreadyPlayedTanks) : Boolean(false);
      }
      
      public function set Renamed1566(param1:Boolean) : void
      {
         this.storageService.getStorage().data.alreadyPlayedTanks = true;
      }
      
      public function get Renamed1567() : String
      {
         return this.storageService.getStorage().data.userName;
      }
      
      public function set Renamed1567(param1:String) : void
      {
         this.storageService.getStorage().data.userName = param1;
      }
      
      public function get entranceHash() : String
      {
         return this.storageService.getStorage().data.userHash;
      }
   }
}

