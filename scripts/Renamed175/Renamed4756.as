package Renamed1583
{
   import Renamed188.Renamed5628;
   import Renamed188.Renamed4738;
   import Renamed1614.Renamed1615;
   import platform.client.fp10.core.model.IObjectLoadListener;
   import platform.client.fp10.core.resource.types.ImageResource;
   import platform.client.fp10.core.type.IGameObject;
   import projects.tanks.client.battleservice.Renamed1587;
   
   public class Renamed4756 extends Renamed5628 implements Renamed4738, Renamed1584, IObjectLoadListener
   {
      private var maps:Vector.<IGameObject>;
      
      public function Renamed4756()
      {
         this.maps = new Vector.<IGameObject>();
         super();
      }
      
      public function Renamed2080() : Vector.<IGameObject>
      {
         return this.maps;
      }
      
      public function getName() : String
      {
         return getInitParam().mapName;
      }
      
      public function Renamed1594() : String
      {
         return getInitParam().mapId;
      }
      
      public function Renamed1595() : int
      {
         return getInitParam().maxPeople;
      }
      
      public function getMaxRank() : int
      {
         return getInitParam().Renamed5629.max;
      }
      
      public function getMinRank() : int
      {
         return getInitParam().Renamed5629.min;
      }
      
      public function getThemeName() : String
      {
         return getInitParam().theme.toString();
      }
      
      public function Renamed1596() : Renamed1615
      {
         return getInitParam().theme;
      }
      
      public function Renamed1597() : Vector.<Renamed1587>
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

