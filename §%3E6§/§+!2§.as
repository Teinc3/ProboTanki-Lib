package §>6§
{
   import §%@§.§+"&§;
   import §%@§.§`#`§;
   import §?"a§.§finally for do§;
   import platform.client.fp10.core.model.IObjectLoadListener;
   import platform.client.fp10.core.resource.types.ImageResource;
   import platform.client.fp10.core.type.IGameObject;
   import projects.tanks.client.battleservice.§final package import§;
   
   public class §+!2§ extends §+"&§ implements §`#`§, §null for do§, IObjectLoadListener
   {
      private var maps:Vector.<IGameObject>;
      
      public function §+!2§()
      {
         this.maps = new Vector.<IGameObject>();
         super();
      }
      
      public function §throw package try§() : Vector.<IGameObject>
      {
         return this.maps;
      }
      
      public function getName() : String
      {
         return getInitParam().mapName;
      }
      
      public function §try var dynamic§() : String
      {
         return getInitParam().mapId;
      }
      
      public function §get var case§() : int
      {
         return getInitParam().maxPeople;
      }
      
      public function getMaxRank() : int
      {
         return getInitParam().§for catch finally§.max;
      }
      
      public function getMinRank() : int
      {
         return getInitParam().§for catch finally§.min;
      }
      
      public function getThemeName() : String
      {
         return getInitParam().theme.toString();
      }
      
      public function §0"E§() : §finally for do§
      {
         return getInitParam().theme;
      }
      
      public function §=>§() : Vector.<§final package import§>
      {
         return getInitParam().supportedModes;
      }
      
      public function isEnabled() : Boolean
      {
         return getInitParam().enabled;
      }
      
      public function getAdditionalCrystalsPercent() : int
      {
         return getInitParam().additionalCrystalsPercent;
      }
      
      public function getPreviewResource() : ImageResource
      {
         return getInitParam().preview;
      }
      
      public function objectLoaded() : void
      {
         this.maps.push(object);
      }
      
      public function objectLoadedPost() : void
      {
      }
      
      public function objectUnloaded() : void
      {
         var _loc1_:int = int(this.maps.lastIndexOf(object));
         if(_loc1_ != -1)
         {
            this.maps.splice(_loc1_,1);
         }
      }
      
      public function objectUnloadedPost() : void
      {
      }
   }
}

