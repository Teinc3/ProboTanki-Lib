package alternativa.tanks.services.tankregistry
{
   import alternativa.object.ClientObject;
   import alternativa.osgi.OSGi;
   import flash.utils.Dictionary;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.userproperties.IUserPropertiesService;
   
   public class Renamed529 implements TankUsersRegistry
   {
      private var Renamed3835:Vector.<ClientObject>;
      
      private var Renamed3836:int;
      
      private var Renamed2369:ClientObject;
      
      public function Renamed529()
      {
         this.users = new Dictionary();
         super();
      }
      
      public function addUser(param1:ClientObject) : void
      {
         this.Renamed3835 = null;
         if(!this.users[param1.id])
         {
            this.users[param1.id] = param1;
            ++this.Renamed3836;
         }
         if(IUserPropertiesService(OSGi.getInstance().getService(IUserPropertiesService)).userName == param1.id)
         {
            this.Renamed2369 = param1;
         }
      }
      
      public function removeUser(param1:ClientObject) : void
      {
         this.Renamed3835 = null;
         if(this.users[param1.id])
         {
            delete this.users[param1.id];
            --this.Renamed3836;
         }
         if(IUserPropertiesService(OSGi.getInstance().getService(IUserPropertiesService)).userName == param1.id)
         {
            this.Renamed2369 = null;
         }
      }
      
      public function Renamed2858() : int
      {
         return this.Renamed3836;
      }
      
      public function Renamed2895() : Vector.<ClientObject>
      {
         var _loc1_:ClientObject = null;
         if(this.Renamed3835 == null)
         {
            this.Renamed3835 = new Vector.<ClientObject>();
            for each(_loc1_ in this.users)
            {
               this.Renamed3835.push(_loc1_);
            }
         }
         return this.Renamed3835;
      }
      
      public function Renamed695(param1:String) : ClientObject
      {
         return this.users[param1];
      }
      
      public function Renamed3833() : ClientObject
      {
         return this.Renamed2369;
      }
      
      public function Renamed3834() : Boolean
      {
         return this.Renamed2369 != null;
      }
   }
}

