package Renamed403
{
   import Renamed602.3DPositionVector;
   import Renamed306.Renamed7540;
   import Renamed306.Renamed4629;
   import Renamed306.Renamed1344;
   import Renamed306.Renamed2521;
   import Renamed306.Renamed2405;
   import Renamed306.Renamed2406;
   import platform.client.fp10.core.resource.types.SoundResource;
   import projects.tanks.clients.flash.resources.resource.MapResource;
   
   public class Renamed4702 extends Renamed7540 implements Renamed4736, Renamed2414
   {
      public function Renamed4702()
      {
         super();
      }
      
      public function Renamed2495() : MapResource
      {
         return getInitParam().Renamed7552;
      }
      
      public function Renamed8561() : SoundResource
      {
         return null;
      }
      
      public function Renamed8562() : Renamed2521
      {
         return getInitParam().Renamed2498;
      }
      
      public function Renamed831() : Number
      {
         return getInitParam().gravity;
      }
      
      public function Renamed8563() : 3DPositionVector
      {
         return getInitParam().Renamed2499;
      }
      
      public function Renamed8564() : Number
      {
         return getInitParam().Renamed2500;
      }
      
      public function Renamed8565() : Renamed2406
      {
         return getInitParam().fogParams;
      }
      
      public function Renamed8566() : Renamed2405
      {
         return getInitParam().Renamed2474;
      }
      
      public function Renamed8567() : Renamed1344
      {
         return getInitParam().Renamed2491;
      }
      
      public function Renamed8568() : uint
      {
         return getInitParam().ssaoColor;
      }
   }
}

