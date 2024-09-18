package projects.tanks.clients.fp10.libraries.tanksservices.model.uidcheck
{
   import §7!S§.§#!d§;
   import §7!S§.§3!y§;
   import alternativa.osgi.OSGi;
   import platform.client.fp10.core.model.ObjectLoadListener;
   import platform.client.fp10.core.model.ObjectUnloadListener;
   import platform.client.models.commons.types.ValidationStatus;
   
   public class UidCheckModel extends §3!y§ implements §#!d§, ObjectLoadListener, ObjectUnloadListener, UidCheckService
   {
      private var validateCallback:Function;
      
      public function UidCheckModel()
      {
         super();
      }
      
      public function objectLoaded() : void
      {
         OSGi.getInstance().registerService(UidCheckService,this);
      }
      
      public function objectUnloaded() : void
      {
         OSGi.getInstance().unregisterService(UidCheckService);
      }
      
      public function validateResult(param1:ValidationStatus) : void
      {
         if(Boolean(this.validateCallback))
         {
            this.validateCallback(param1);
         }
         this.validateCallback = null;
      }
      
      public function getMaxLength() : int
      {
         return 20;
      }
      
      public function exist(param1:String, param2:Function) : void
      {
         var uid:String = param1;
         var callback:Function = param2;
         this.validate(uid,function(param1:ValidationStatus):void
         {
            callback(param1 == ValidationStatus.NOT_UNIQUE);
         });
      }
      
      public function validate(param1:String, param2:Function) : void
      {
         this.validateCallback = param2;
         server.§<#V§(param1);
      }
   }
}

