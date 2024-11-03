package alternativa.osgi.catalogs
{
   import alternativa.osgi.ServiceParamNames;
   import flash.utils.Dictionary;
   
   public class NamedServicesCatalog
   {
      protected var namesDictionary:Dictionary;
      
      private var serviceInterface:Class;
      
      public function NamedServicesCatalog(param1:Class)
      {
         super();
         this.serviceInterface = param1;
         this.namesDictionary = new Dictionary();
      }
      
      public function getService(param1:String) : Object
      {
         if(param1 == null)
         {
            throw new ArgumentError("name can\'t be null");
         }
         return this.namesDictionary[param1];
      }
      
      public function addService(param1:String, param2:Object) : void
      {
         var _loc3_:Object = null;
         if(param1 == null)
         {
            throw new ArgumentError("name can\'t be null");
         }
         _loc3_ = this.namesDictionary[param1];
         if(_loc3_ != null && _loc3_ != param2)
         {
            throw new ArgumentError("Service " + this.serviceInterface + "with name \'" + param1 + "\' is already registered");
         }
         this.namesDictionary[param1] = param2;
      }
      
      public function removeService(param1:String) : Object
      {
         var _loc2_:Object = null;
         if(param1 == null)
         {
            throw new ArgumentError("name can\'t be null");
         }
         _loc2_ = this.namesDictionary[param1];
         delete this.namesDictionary[param1];
         return _loc2_;
      }
      
      public function get serviceList() : Vector.<Object>
      {
         var _loc1_:Object = null;
         var _loc2_:Vector.<Object> = new Vector.<Object>();
         for each(_loc1_ in this.namesDictionary)
         {
            _loc2_.push(_loc1_);
         }
         return _loc2_;
      }
      
      public function getServicesInfo() : Vector.<ServiceInfo>
      {
         var _loc1_:* = undefined;
         var _loc2_:Vector.<ServiceInfo> = new Vector.<ServiceInfo>();
         for(_loc1_ in this.namesDictionary)
         {
            _loc2_.push(new ServiceInfo(this.namesDictionary[_loc1_],Vector.<ServiceParam>([new ServiceParam(ServiceParamNames.PARAM_NAME,_loc1_)])));
         }
         return _loc2_;
      }
   }
}

