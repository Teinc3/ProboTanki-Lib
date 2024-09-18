package alternativa.tanks.services.tankregistry
{
   import alternativa.object.ClientObject;
   import alternativa.osgi.OSGi;
   import flash.utils.Dictionary;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.userproperties.IUserPropertiesService;
   
   public class §super const import§ implements TankUsersRegistry
   {
      private var §final while§:Vector.<ClientObject>;
      
      private var §!#A§:int;
      
      private var §^#A§:ClientObject;
      
      public function §super const import§()
      {
         this.users = new Dictionary();
         super();
      }
      
      public function addUser(param1:ClientObject) : void
      {
         this.§final while§ = null;
         if(!this.users[param1.id])
         {
            this.users[param1.id] = param1;
            ++this.§!#A§;
         }
         if(IUserPropertiesService(OSGi.getInstance().getService(IUserPropertiesService)).userName == param1.id)
         {
            this.§^#A§ = param1;
         }
      }
      
      public function removeUser(param1:ClientObject) : void
      {
         this.§final while§ = null;
         if(this.users[param1.id])
         {
            delete this.users[param1.id];
            --this.§!#A§;
         }
         if(IUserPropertiesService(OSGi.getInstance().getService(IUserPropertiesService)).userName == param1.id)
         {
            this.§^#A§ = null;
         }
      }
      
      public function §set var extends§() : int
      {
         return this.§!#A§;
      }
      
      public function § !c§() : Vector.<ClientObject>
      {
         var _loc1_:ClientObject = null;
         if(this.§final while§ == null)
         {
            this.§final while§ = new Vector.<ClientObject>();
            for each(_loc1_ in this.users)
            {
               this.§final while§.push(_loc1_);
            }
         }
         return this.§final while§;
      }
      
      public function §if for with§(param1:String) : ClientObject
      {
         return this.users[param1];
      }
      
      public function §extends set import§() : ClientObject
      {
         return this.§^#A§;
      }
      
      public function §[#V§() : Boolean
      {
         return this.§^#A§ != null;
      }
   }
}

