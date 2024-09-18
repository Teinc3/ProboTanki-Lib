package platform.clients.fp10.commonsflash
{
   import alternativa.model.description.DescriptionModel;
   import alternativa.model.description.IDescription;
   import alternativa.model.description.IDescriptionAdapt;
   import alternativa.model.description.IDescriptionEvents;
   import alternativa.model.timeperiod.TimePeriod;
   import alternativa.model.timeperiod.TimePeriodAdapt;
   import alternativa.model.timeperiod.TimePeriodEvents;
   import alternativa.model.timeperiod.TimePeriodModel;
   import alternativa.osgi.OSGi;
   import alternativa.osgi.bundle.IBundleActivator;
   import platform.client.fp10.core.model.ObjectLoadListener;
   import platform.client.fp10.core.registry.ModelRegistry;
   import platform.client.models.commons.description.IDescriptionModelBase;
   import platform.client.models.commons.periodtime.ITimePeriodModelBase;
   
   public class Activator implements IBundleActivator
   {
      public static var osgi:OSGi;
      
      public function Activator()
      {
         super();
      }
      
      public function start(param1:OSGi) : void
      {
         osgi = param1;
         var _loc2_:ModelRegistry = osgi.getService(ModelRegistry) as ModelRegistry;
         _loc2_.registerAdapt(IDescription,IDescriptionAdapt);
         _loc2_.registerEvents(IDescription,IDescriptionEvents);
         var _loc3_:ModelRegistry = osgi.getService(ModelRegistry) as ModelRegistry;
         _loc3_.add(new DescriptionModel(),Vector.<Class>([IDescription,IDescriptionModelBase]));
         _loc2_.registerAdapt(TimePeriod,TimePeriodAdapt);
         _loc2_.registerEvents(TimePeriod,TimePeriodEvents);
         _loc3_.add(new TimePeriodModel(),Vector.<Class>([TimePeriod,ITimePeriodModelBase,ObjectLoadListener]));
      }
      
      public function stop(param1:OSGi) : void
      {
      }
   }
}

