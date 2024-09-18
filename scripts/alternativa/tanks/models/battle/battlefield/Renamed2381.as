package alternativa.tanks.models.battle.battlefield
{
   import alternativa.engine3d.objects.SkyBox;
   import alternativa.object.ClientObject;
   import alternativa.physics.PhysicsScene;
   import alternativa.tanks.battle.scene3d.Renamed610;
   import flash.display.DisplayObjectContainer;
   import flash.media.Sound;
   import flash.media.SoundChannel;
   import flash.utils.Dictionary;
   import Renamed373.Renamed665;
   
   public class Renamed2367
   {
      public var Renamed2368:ClientObject;
      
      public var Renamed2369:ClientObject;
      
      public var Renamed2370:DisplayObjectContainer;
      
      public var Renamed2371:Renamed610;
      
      public var tanks:Dictionary;
      
      public var Renamed100:Dictionary;
      
      public var Renamed2372:Dictionary;
      
      public var bonuses:Dictionary;
      
      public var Renamed2373:Sound;
      
      public var Renamed2374:Sound;
      
      public var Renamed2375:Sound;
      
      public var Renamed2376:SoundChannel;
      
      public var Renamed2377:Sound;
      
      public var physicsScene:PhysicsScene;
      
      public var collisionDetector:Renamed665;
      
      public var Renamed2378:int;
      
      public var time:int;
      
      public var skybox:SkyBox;
      
      public var Renamed2379:int;
      
      public var Renamed2380:int;
      
      public function Renamed2367()
      {
         this.tanks = new Dictionary();
         this.Renamed100 = new Dictionary();
         this.Renamed2372 = new Dictionary();
         this.bonuses = new Dictionary();
         super();
      }
   }
}

