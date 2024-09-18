package projects.tanks.clients.flash.resourcesflash
{
   import alternativa.osgi.OSGi;
   import alternativa.osgi.bundle.IBundleActivator;
   import platform.client.fp10.core.registry.ModelRegistry;
   import platform.client.fp10.core.registry.ResourceRegistry;
   import platform.client.fp10.core.service.localstorage.IResourceLocalStorage;
   import projects.tanks.client.garage.models.item.object3ds.IObject3DSModelBase;
   import projects.tanks.clients.flash.resources.object3ds.IObject3DS;
   import projects.tanks.clients.flash.resources.object3ds.IObject3DSAdapt;
   import projects.tanks.clients.flash.resources.object3ds.IObject3DSEvents;
   import projects.tanks.clients.flash.resources.object3ds.Object3DSModel;
   import projects.tanks.clients.flash.resources.resource.MapResource;
   import projects.tanks.clients.flash.resources.resource.PropLibResource;
   import projects.tanks.clients.flash.resources.resource.Tanks3DSResource;
   
   public class Activator implements IBundleActivator
   {
      public static var osgi:OSGi;
      
      public function Activator()
      {
         super();
      }
      
      public function start(param1:OSGi) : void
      {
         var modelRegister:ModelRegistry;
         var modelRegisterAdapt:ModelRegistry;
         var _osgi:OSGi = param1;
         osgi = _osgi;
         osgi.injectService(IResourceLocalStorage,function(param1:Object):void
         {
            Tanks3DSResource.resourceLocalStorage = IResourceLocalStorage(param1);
         },function():IResourceLocalStorage
         {
            return Tanks3DSResource.resourceLocalStorage;
         });
         osgi.injectService(ResourceRegistry,function(param1:Object):void
         {
            MapResource.resourceRegistry = ResourceRegistry(param1);
         },function():ResourceRegistry
         {
            return MapResource.resourceRegistry;
         });
         osgi.injectService(IResourceLocalStorage,function(param1:Object):void
         {
            PropLibResource.resourceLocalStorage = IResourceLocalStorage(param1);
         },function():IResourceLocalStorage
         {
            return PropLibResource.resourceLocalStorage;
         });
         osgi.injectService(ResourceRegistry,function(param1:Object):void
         {
            Object3DSModel.resourceRegistry = ResourceRegistry(param1);
         },function():ResourceRegistry
         {
            return Object3DSModel.resourceRegistry;
         });
         modelRegister = osgi.getService(ModelRegistry) as ModelRegistry;
         modelRegister.add(new Object3DSModel(),Vector.<Class>([IObject3DSModelBase,IObject3DS]));
         modelRegisterAdapt = osgi.getService(ModelRegistry) as ModelRegistry;
         modelRegisterAdapt.registerAdapt(IObject3DS,IObject3DSAdapt);
         modelRegisterAdapt.registerEvents(IObject3DS,IObject3DSEvents);
      }
      
      public function stop(param1:OSGi) : void
      {
      }
   }
}

