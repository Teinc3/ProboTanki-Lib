package alternativa.osgi
{
   import alternativa.osgi.bundle.Renamed604;
   import alternativa.osgi.bundle.IBundleActivator;
   import alternativa.osgi.catalogs.ServiceInfo;
   import alternativa.osgi.catalogs.ServicesCatalog;
   import alternativa.osgi.service.clientlog.IClientLogBase;
   import alternativa.osgi.service.logging.LogService;
   import alternativa.osgi.service.logging.Logger;
   import alternativa.osgi.service.logging.impl.LogServiceImpl;
   import flash.net.SharedObject;
   import flash.utils.Dictionary;
   import flash.utils.getQualifiedClassName;
   
   public class OSGi
   {
      public static var clientLog:IClientLogBase;
      
      private static var instance:OSGi;
      
      private var _serviceList:Vector.<Object>;
      
      private var serivceInterface2injectPoints:Dictionary;
      
      private var logger:Logger;
      
      private var bundleDescriptors:Object;
      
      private var services:ServicesCatalog;
      
      public function OSGi()
      {
         this.bundleDescriptors = {};
         this.services = new ServicesCatalog();
         this.serivceInterface2injectPoints = new Dictionary();
         super();
         if(instance == null)
         {
            instance = this;
            this.initLogging();
            return;
         }
         throw new Error("Only one instance of OSGi class is allowed");
      }
      
      public static function getInstance() : OSGi
      {
         if(instance == null)
         {
            instance = new OSGi();
         }
         return instance;
      }
      
      public static function paramsToString(param1:Dictionary) : String
      {
         var _loc2_:* = undefined;
         var _loc3_:String = "";
         for(_loc2_ in param1)
         {
            _loc3_ += " (" + _loc2_ + " = " + param1[_loc2_] + ")";
         }
         return _loc3_;
      }
      
      public function installBundle(param1:Renamed604) : void
      {
         var _loc2_:int = 0;
         var _loc3_:IBundleActivator = null;
         if(this.bundleDescriptors[param1.name])
         {
            throw new Error("Bundle " + param1.name + " is already installed");
         }
         this.logger.debug("Installing bundle: " + param1.name);
         this.logger.debug("Bundle activators: " + param1.Renamed605);
         this.bundleDescriptors[param1.name] = param1;
         var _loc4_:Vector.<IBundleActivator> = param1.Renamed605;
         if(_loc4_ != null)
         {
            _loc2_ = 0;
            while(_loc2_ < _loc4_.length)
            {
               _loc3_ = _loc4_[_loc2_];
               this.logger.debug("Invoking start() on activator: " + getQualifiedClassName(_loc3_));
               _loc3_.start(this);
               _loc2_++;
            }
         }
         this.logger.debug("Bundle has been installed: " + param1.name);
      }
      
      private function initLogging() : void
      {
         var _loc1_:LogServiceImpl = new LogServiceImpl();
         this.logger = _loc1_.getLogger("osgi");
         this.registerService(LogService,_loc1_);
      }
      
      public function uninstallBundle(param1:String) : void
      {
         var _loc2_:int = 0;
         var _loc3_:IBundleActivator = null;
         if(param1 == null)
         {
            throw new ArgumentError("Bundle name is null");
         }
         var _loc4_:Renamed604 = this.bundleDescriptors[param1];
         if(_loc4_ == null)
         {
            throw new Error("Bundle " + param1 + " not found");
         }
         var _loc5_:Vector.<IBundleActivator> = _loc4_.Renamed605;
         if(_loc5_ != null)
         {
            _loc2_ = 0;
            while(_loc2_ < _loc5_.length)
            {
               _loc3_ = _loc5_[_loc2_];
               this.logger.debug("Invoking stop() on activator " + getQualifiedClassName(_loc3_));
               _loc3_.stop(this);
               _loc2_++;
            }
         }
         delete this.bundleDescriptors[param1];
         this.logger.debug("Bundle has been uninstalled: " + param1);
      }
      
      public function registerService(param1:Class, param2:Object, param3:Dictionary = null) : void
      {
         this.services.addService(param1,param2,param3);
         this.updateInject(param1);
         this.logger.debug("Service has been registered: " + param1 + paramsToString(param3));
      }
      
      private function updateInject(param1:Class) : void
      {
         var _loc2_:Vector.<InjectPoint> = null;
         var _loc3_:InjectPoint = null;
         if(this.serivceInterface2injectPoints[param1] != null)
         {
            _loc2_ = this.serivceInterface2injectPoints[param1];
            for each(_loc3_ in _loc2_)
            {
               _loc3_.injectFunction(this.services.getService(param1,_loc3_.filter));
               this.logger.debug("Service has been injected: " + param1);
            }
         }
      }
      
      public function registerServiceMulti(param1:Array, param2:Object, param3:Dictionary = null) : void
      {
         var _loc4_:Class = null;
         for each(_loc4_ in param1)
         {
            this.registerService(_loc4_,param2,param3);
         }
      }
      
      public function unregisterService(param1:Class, param2:Dictionary = null) : void
      {
         var _loc3_:int = 0;
         var _loc4_:InjectPoint = null;
         var _loc5_:Object = this.services.removeService(param1,param2);
         if(_loc5_ == null)
         {
            return;
         }
         var _loc6_:Vector.<InjectPoint> = this.serivceInterface2injectPoints[param1];
         if(_loc6_ != null)
         {
            _loc3_ = int(_loc6_.length - 1);
            while(_loc3_ >= 0)
            {
               _loc4_ = _loc6_[_loc3_];
               if(_loc4_.valueReturnInjectFunction() == _loc5_)
               {
                  _loc4_.injectFunction(null);
               }
               _loc3_--;
            }
         }
         this.logger.debug("Service has been unregistered: " + param1 + paramsToString(param2));
      }
      
      public function injectService(param1:Class, param2:Function, param3:Function, param4:String = "") : void
      {
         if(!this.serivceInterface2injectPoints[param1])
         {
            this.serivceInterface2injectPoints[param1] = new Vector.<InjectPoint>();
         }
         this.serivceInterface2injectPoints[param1].push(new InjectPoint(param2,param3,param4));
         var _loc5_:Object = this.services.getService(param1,param4);
         param2(_loc5_);
         this.logger.debug("Inject %1 have been processed. Current value is %2",[param1,_loc5_]);
      }
      
      public function getService(param1:Class, param2:String = "") : Object
      {
         return this.services.getService(param1,param2);
      }
      
      public function get bundleList() : Vector.<Renamed604>
      {
         var _loc1_:Renamed604 = null;
         var _loc2_:Vector.<Renamed604> = new Vector.<Renamed604>();
         for each(_loc1_ in this.bundleDescriptors)
         {
            _loc2_.push(_loc1_);
         }
         return _loc2_;
      }
      
      public function get serviceList() : Vector.<Object>
      {
         return this.services.serviceList;
      }
      
      public function getServicesInfo() : Vector.<ServiceInfo>
      {
         return this.services.getServicesInfo();
      }
      
      public function createSharedObject(param1:String, param2:String = null, param3:Boolean = false) : SharedObject
      {
         return SharedObject.getLocal(param1,param2,param3);
      }
   }
}

class InjectPoint
{
   public var injectFunction:Function;
   
   public var valueReturnInjectFunction:Function;
   
   public var filter:String;
   
   public function InjectPoint(param1:Function, param2:Function, param3:String)
   {
      super();
      this.injectFunction = param1;
      this.valueReturnInjectFunction = param2;
      this.filter = param3;
   }
}

