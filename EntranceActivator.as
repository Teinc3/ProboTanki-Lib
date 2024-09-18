package
{
   import alternativa.init.§<!Y§;
   import alternativa.init.BattleSelectModelActivator;
   import alternativa.init.GarageModelActivator;
   import alternativa.init.PanelModelActivator;
   import alternativa.init.TanksFontsActivator;
   import alternativa.init.UserModelActivator;
   import alternativa.osgi.OSGi;
   import alternativa.osgi.bundle.IBundleActivator;
   import alternativa.protocol.osgi.ProtocolActivator;
   import init.TanksFormsActivator;
   import platform.client.core.general.resource.osgi.Activator;
   import platform.client.core.general.resourcelocale.osgi.Activator;
   import platform.client.core.general.socialnetwork.osgi.Activator;
   import platform.client.core.general.spaces.osgi.Activator;
   import platform.client.fp10.core.osgi.ClientActivator;
   import platform.client.models.commons.osgi.Activator;
   import platform.clients.fp10.commonsflash.Activator;
   import platform.clients.fp10.libraries.alternativaclientflash.Activator;
   import platform.clients.fp10.libraries.alternativapartners.osgi.PartnersActivator;
   import platform.clients.fp10.libraries.alternativapartnersflash.Activator;
   import platform.clients.fp10.libraries.alternativaprotocolflash.Activator;
   import platform.clients.fp10.models.alternativaspacesmodelsflash.Activator;
   import projects.tanks.clients.flash.commons.osgi.Activator;
   import projects.tanks.clients.flash.commonsflash.Activator;
   import projects.tanks.clients.flash.resources.osgi.Activator;
   import projects.tanks.clients.flash.resourcesflash.Activator;
   import projects.tanks.clients.fp10.libraries.tanksservicesflash.Activator;
   import projects.tanks.clients.fp10.models.tanksbattleselectmodelflash.Activator;
   import projects.tanks.clients.fp10.models.tankschatmodelflash.Activator;
   import projects.tanks.clients.fp10.models.tanksgaragemodelflash.Activator;
   import projects.tanks.clients.fp10.models.tankspanelmodelflash.Activator;
   import projects.tanks.clients.fp10.models.tanksusermodel.Activator;
   import projects.tanks.clients.fp10.tanksformsflash.Activator;
   
   public class EntranceActivator implements IBundleActivator
   {
      public function EntranceActivator()
      {
         super();
      }
      
      public function start(param1:OSGi) : void
      {
         new §<!Y§().start(param1);
         new ProtocolActivator().start(param1);
         new ClientActivator().start(param1);
         new platform.clients.fp10.libraries.alternativaclientflash.Activator().start(param1);
         new platform.client.core.general.resource.osgi.Activator().start(param1);
         new platform.client.core.general.resourcelocale.osgi.Activator().start(param1);
         new platform.client.core.general.socialnetwork.osgi.Activator().start(param1);
         new platform.client.core.general.spaces.osgi.Activator().start(param1);
         new platform.client.models.commons.osgi.Activator().start(param1);
         new platform.clients.fp10.commonsflash.Activator().start(param1);
         new platform.clients.fp10.libraries.alternativapartnersflash.Activator().start(param1);
         new TanksFontsActivator().start(param1);
         new platform.clients.fp10.libraries.alternativaprotocolflash.Activator().start(param1);
         new platform.clients.fp10.models.alternativaspacesmodelsflash.Activator().start(param1);
         new PartnersActivator().start(param1);
         new projects.tanks.clients.flash.commonsflash.Activator().start(param1);
         new projects.tanks.clients.fp10.libraries.tanksservicesflash.Activator().start(param1);
         new projects.tanks.clients.fp10.models.tankspanelmodelflash.Activator().start(param1);
         new PanelModelActivator().start(param1);
         new projects.tanks.clients.fp10.models.tankschatmodelflash.Activator().start(param1);
         new projects.tanks.clients.fp10.models.tanksgaragemodelflash.Activator().start(param1);
         new projects.tanks.clients.fp10.tanksformsflash.Activator().start(param1);
         new projects.tanks.clients.flash.commons.osgi.Activator().start(param1);
         new UserModelActivator().start(param1);
         new projects.tanks.clients.fp10.models.tanksusermodel.Activator().start(param1);
         new projects.tanks.clients.fp10.models.tanksbattleselectmodelflash.Activator().start(param1);
         new projects.tanks.clients.flash.resources.osgi.Activator().start(param1);
         new projects.tanks.clients.flash.resourcesflash.Activator().start(param1);
         new BattleSelectModelActivator().start(param1);
         new TanksFormsActivator().start(param1);
         new GarageModelActivator().start(param1);
      }
      
      public function stop(param1:OSGi) : void
      {
      }
   }
}

