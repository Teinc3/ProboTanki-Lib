package alternativa.init
{
   import alternativa.osgi.CommonBundleActivator;
   import alternativa.osgi.OSGi;
   import Renamed381.Renamed577;
   import Renamed85.Renamed578;
   
   public class TanksWarfareActivator extends CommonBundleActivator
   {
      public function TanksWarfareActivator()
      {
         super();
      }
      
      override public function start(param1:OSGi) : void
      {
         registerModel(new Renamed577(),param1);
         registerModel(new Renamed578(),param1);
      }
   }
}

