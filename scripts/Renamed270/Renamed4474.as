package Renamed270
{
   import alternativa.osgi.OSGi;
   import alternativa.tanks.loader.Renamed2059;
   import Renamed324.Renamed4476;
   import Renamed324.Renamed7074;
   import platform.client.fp10.core.model.ObjectLoadListener;
   import platform.client.fp10.core.model.ObjectUnloadListener;
   import platform.client.fp10.core.type.IGameObject;
   
   public class Renamed4474 extends Renamed7074 implements Renamed4476, ObjectLoadListener, ObjectUnloadListener, Renamed2059
   {
      private var Renamed7075:IGameObject;
      
      public function Renamed4474()
      {
         super();
      }
      
      public function objectLoaded() : void
      {
         OSGi.getInstance().registerService(Renamed2059,this);
      }
      
      public function objectUnloaded() : void
      {
         OSGi.getInstance().unregisterService(Renamed2059);
      }
      
      public function Renamed2060() : void
      {
         server.Renamed7076();
      }
   }
}

