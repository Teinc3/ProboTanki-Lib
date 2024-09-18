package alternativa.init
{
   import alternativa.osgi.CommonBundleActivator;
   import alternativa.osgi.OSGi;
   import §if package do§.§for const include§;
   import §super var native§.§%!&§;
   
   public class TanksWarfareActivator extends CommonBundleActivator
   {
      public function TanksWarfareActivator()
      {
         super();
      }
      
      override public function start(param1:OSGi) : void
      {
         registerModel(new §for const include§(),param1);
         registerModel(new §%!&§(),param1);
      }
   }
}

