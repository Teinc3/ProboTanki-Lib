package §7r§
{
   import alternativa.osgi.OSGi;
   import alternativa.tanks.loader.§each while§;
   import §catch package each§.§final const extends§;
   import §catch package each§.§switch const set§;
   import platform.client.fp10.core.model.ObjectLoadListener;
   import platform.client.fp10.core.model.ObjectUnloadListener;
   import platform.client.fp10.core.type.IGameObject;
   
   public class §4!-§ extends §switch const set§ implements §final const extends§, ObjectLoadListener, ObjectUnloadListener, §each while§
   {
      private var §]n§:IGameObject;
      
      public function §4!-§()
      {
         super();
      }
      
      public function objectLoaded() : void
      {
         OSGi.getInstance().registerService(§each while§,this);
      }
      
      public function objectUnloaded() : void
      {
         OSGi.getInstance().unregisterService(§each while§);
      }
      
      public function §[!F§() : void
      {
         server.§%%§();
      }
   }
}

