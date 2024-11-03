package alternativa.tanks.models.battle.battlefield
{
   import alternativa.tanks.utils.EncryptedInt;
   import alternativa.tanks.utils.EncryptedIntImpl;
   import flash.media.Sound;
   
   public class Renamed2449
   {
      public var Renamed2374:Sound;
      
      public var Renamed2375:Sound;
      
      public var Renamed2490:Sound;
      
      private var Renamed2380:EncryptedInt;
      
      private var Renamed2551:EncryptedInt;
      
      public function Renamed2449()
      {
         this.Renamed2380 = new EncryptedIntImpl();
         this.Renamed2551 = new EncryptedIntImpl();
         super();
      }
      
      public function Renamed2488(param1:int) : void
      {
         this.Renamed2551.setInt(param1);
      }
      
      public function Renamed634() : int
      {
         return this.Renamed2551.getInt();
      }
      
      public function Renamed2489(param1:int) : void
      {
         this.Renamed2380.setInt(param1);
      }
      
      public function Renamed631() : int
      {
         return this.Renamed2380.getInt();
      }
   }
}

