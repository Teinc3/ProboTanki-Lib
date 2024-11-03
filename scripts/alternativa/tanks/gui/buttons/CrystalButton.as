package alternativa.tanks.gui.buttons
{
   import alternativa.tanks.gui.CrystalLabel;
   import alternativa.tanks.service.money.IMoneyService;
   import alternativa.tanks.service.money.Renamed1919;
   import controls.base.ThreeLineBigButton;
   import flash.events.Event;
   
   public class CrystalButton extends ThreeLineBigButton implements Renamed1919
   {
      [Inject]
      public static var moneyService:IMoneyService;
      
      protected var crystalLabel:CrystalLabel;
      
      protected var crystals:int;
      
      public function CrystalButton(param1:String = "", param2:int = 0, param3:int = 120)
      {
         this.crystalLabel = new CrystalLabel();
         super();
         this.width = param3;
         infoContainer.addChild(this.crystalLabel);
         setText(param1);
         this.setCost(param2);
         this.show();
         addEventListener(Event.ADDED_TO_STAGE,this.onAddToStage);
         addEventListener(Event.REMOVED_FROM_STAGE,this.onRemoveFromStage);
      }
      
      private function onRemoveFromStage(param1:Event) : void
      {
         moneyService.removeListener(this);
      }
      
      private function onAddToStage(param1:Event) : void
      {
         moneyService.addListener(this);
         this.updateCrystalColor();
      }
      
      public function setCost(param1:int) : void
      {
         this.crystals = param1;
         this.crystalLabel.setCost(param1);
         this.crystalLabel.x = (_width - this.crystalLabel.width) * 0.5;
         this.updateCrystalColor();
      }
      
      protected function show() : void
      {
         super.showInTwoRows(captionLabel,this.crystalLabel);
      }
      
      public function crystalsChanged(param1:int) : void
      {
         this.updateCrystalColor();
      }
      
      private function updateCrystalColor() : void
      {
         if(moneyService.crystal < this.crystals)
         {
            this.crystalLabel.setColor(16731648);
         }
         else if(this.crystals == 0)
         {
            this.crystalLabel.setColor(11206400);
         }
         else
         {
            this.crystalLabel.setColor(16777215);
         }
      }
   }
}

