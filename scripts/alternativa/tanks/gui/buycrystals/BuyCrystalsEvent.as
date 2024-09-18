package alternativa.tanks.gui.buycrystals
{
   import flash.events.Event;
   
   public class BuyCrystalsEvent extends Event
   {
      public static const BUY_CRYSTALS:String = "BuyCrystalsEvent.BuyCrystals";
      
      private var crystalsToBuy:int;
      
      public function BuyCrystalsEvent(param1:int)
      {
         super(BUY_CRYSTALS);
         this.crystalsToBuy = param1;
      }
      
      public function getCrystalsToBuy() : int
      {
         return this.crystalsToBuy;
      }
   }
}

