package §throw const package§
{
   import alternativa.tanks.service.IEntranceClientFacade;
   import §in var var§.§<!V§;
   import §in var var§.§for static§;
   import platform.client.fp10.core.model.IObjectLoadListener;
   
   public class §"!M§ extends §for static§ implements §<!V§, IObjectLoadListener
   {
      [Inject]
      public static var facade:IEntranceClientFacade;
      
      public function §"!M§()
      {
         super();
      }
      
      public function serverHalt() : void
      {
         facade.serverHalt();
      }
      
      public function objectLoaded() : void
      {
         if(getInitParam().serverHalt)
         {
            facade.serverHalt();
         }
      }
      
      public function objectLoadedPost() : void
      {
      }
      
      public function objectUnloaded() : void
      {
      }
      
      public function objectUnloadedPost() : void
      {
      }
   }
}

