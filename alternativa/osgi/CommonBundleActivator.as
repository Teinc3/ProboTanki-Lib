package alternativa.osgi
{
   import alternativa.model.IModel;
   import alternativa.osgi.bundle.IBundleActivator;
   import alternativa.service.IModelService;
   
   public class CommonBundleActivator implements IBundleActivator
   {
      protected var models:Vector.<IModel>;
      
      public function CommonBundleActivator()
      {
         this.models = new Vector.<IModel>();
         super();
      }
      
      public function start(param1:OSGi) : void
      {
      }
      
      public function stop(param1:OSGi) : void
      {
         var _loc3_:IModel = null;
         var _loc4_:IBundleListener = null;
         var _loc2_:IModelService = IModelService(param1.getService(IModelService));
         while(_loc3_ = this.models.pop(), _loc3_ != null)
         {
            _loc4_ = _loc3_ as IBundleListener;
            if(_loc4_ != null)
            {
               _loc4_.bundleStop();
            }
            _loc2_.remove(_loc3_.id);
         }
      }
      
      protected function registerModel(param1:IModel, param2:OSGi) : void
      {
         var _loc3_:IModelService = IModelService(param2.getService(IModelService));
         _loc3_.add(param1);
         this.models.push(param1);
         var _loc4_:IBundleListener = param1 as IBundleListener;
         if(_loc4_ != null)
         {
            _loc4_.bundleStart();
         }
      }
   }
}

