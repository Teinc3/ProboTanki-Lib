package alternativa.tanks.service.money
{
   import alternativa.tanks.gui.buycrystals.BuyCrystalsAlert;
   import alternativa.tanks.service.panel.IPanelView;
   
   public class Renamed571 implements IMoneyService
   {
      [Inject]
      public static var panelView:IPanelView;
      
      private var mask:int = 0;
      
      private var listeners:Vector.<Renamed1919>;
      
      private var _crystals:int = 0;
      
      private var Renamed3714:int = 0;
      
      public function Renamed571()
      {
         super();
         this.listeners = new Vector.<Renamed1919>();
      }
      
      private static function Renamed3715(param1:int) : void
      {
         new BuyCrystalsAlert(param1);
      }
      
      public function addListener(param1:Renamed1919) : void
      {
         if(this.listeners.indexOf(param1) == -1)
         {
            this.listeners.push(param1);
         }
      }
      
      public function removeListener(param1:Renamed1919) : void
      {
         var _loc2_:Number = Number(this.listeners.indexOf(param1));
         if(_loc2_ >= 0)
         {
            this.listeners.splice(_loc2_,1);
         }
      }
      
      public function get crystal() : int
      {
         var _loc1_:* = this._crystals ^ this.mask;
         this.Renamed3716(_loc1_);
         return _loc1_;
      }
      
      public function init(param1:int) : void
      {
         this.Renamed3717(param1);
      }
      
      public function Renamed1617(param1:int) : Boolean
      {
         if(this.crystal < param1)
         {
            Renamed3715(param1 - this._crystals);
            return false;
         }
         return true;
      }
      
      public function Renamed2103(param1:int) : void
      {
         this.Renamed3717(this.crystal - param1);
         this.Renamed3714 += param1;
      }
      
      public function Renamed2097(param1:int) : void
      {
         if(param1 < 0)
         {
            this.Renamed3714 += param1;
            if(this.Renamed3714 < 0)
            {
               param1 = this.Renamed3714;
               this.Renamed3714 = 0;
            }
            else
            {
               param1 = 0;
            }
         }
         this.Renamed3717(param1);
      }
      
      private function Renamed3717(param1:int) : void
      {
         var _loc2_:Renamed1919 = null;
         panelView.Renamed2160().playerInfo.crystals = param1;
         this.Renamed3716(param1);
         var _loc3_:int = 0;
         while(_loc3_ < this.listeners.length)
         {
            _loc2_ = this.listeners[_loc3_];
            _loc2_.crystalsChanged(param1);
            _loc3_++;
         }
      }
      
      private function Renamed3716(param1:int) : void
      {
         this.mask = Math.random() * 4294967295;
         this._crystals = param1 ^ this.mask;
      }
   }
}

