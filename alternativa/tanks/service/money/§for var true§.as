package alternativa.tanks.service.money
{
   import alternativa.tanks.gui.buycrystals.BuyCrystalsAlert;
   import alternativa.tanks.service.panel.IPanelView;
   
   public class §for var true§ implements IMoneyService
   {
      [Inject]
      public static var panelView:IPanelView;
      
      private var mask:int = 0;
      
      private var listeners:Vector.<§continue set switch§>;
      
      private var _crystals:int = 0;
      
      private var §import var package§:int = 0;
      
      public function §for var true§()
      {
         super();
         this.listeners = new Vector.<§continue set switch§>();
      }
      
      private static function §get const include§(param1:int) : void
      {
         new BuyCrystalsAlert(param1);
      }
      
      public function addListener(param1:§continue set switch§) : void
      {
         if(this.listeners.indexOf(param1) == -1)
         {
            this.listeners.push(param1);
         }
      }
      
      public function removeListener(param1:§continue set switch§) : void
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
         this.§import for catch§(_loc1_);
         return _loc1_;
      }
      
      public function init(param1:int) : void
      {
         this.§@Z§(param1);
      }
      
      public function §while package dynamic§(param1:int) : Boolean
      {
         if(this.crystal < param1)
         {
            §get const include§(param1 - this._crystals);
            return false;
         }
         return true;
      }
      
      public function §case package final§(param1:int) : void
      {
         this.§@Z§(this.crystal - param1);
         this.§import var package§ += param1;
      }
      
      public function §class catch§(param1:int) : void
      {
         if(param1 < 0)
         {
            this.§import var package§ += param1;
            if(this.§import var package§ < 0)
            {
               param1 = this.§import var package§;
               this.§import var package§ = 0;
            }
            else
            {
               param1 = 0;
            }
         }
         this.§@Z§(param1);
      }
      
      private function §@Z§(param1:int) : void
      {
         var _loc2_:§continue set switch§ = null;
         panelView.§+#,§().playerInfo.crystals = param1;
         this.§import for catch§(param1);
         var _loc3_:int = 0;
         while(_loc3_ < this.listeners.length)
         {
            _loc2_ = this.listeners[_loc3_];
            _loc2_.crystalsChanged(param1);
            _loc3_++;
         }
      }
      
      private function §import for catch§(param1:int) : void
      {
         this.mask = Math.random() * 4294967295;
         this._crystals = param1 ^ this.mask;
      }
   }
}

