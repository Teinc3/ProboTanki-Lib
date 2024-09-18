package
{
   import alternativa.init.BattlefieldModelActivator;
   import alternativa.init.TanksWarfareActivator;
   import alternativa.osgi.OSGi;
   import alternativa.osgi.bundle.IBundleActivator;
   import projects.tanks.clients.fp10.models.battlefieldmodelflash.Activator;
   
   public class §finally for include§ implements IBundleActivator
   {
      public function §finally for include§()
      {
         super();
      }
      
      public function start(param1:OSGi) : void
      {
         new BattlefieldModelActivator().start(param1);
         new Activator().start(param1);
         new TanksWarfareActivator().start(param1);
      }
      
      public function stop(param1:OSGi) : void
      {
      }
   }
}

