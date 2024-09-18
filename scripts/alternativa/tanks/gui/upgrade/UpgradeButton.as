package alternativa.tanks.gui.upgrade
{
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.gui.buttons.CrystalButton;
   import alternativa.tanks.gui.buttons.color.GoldBigButtonSkin;
   import alternativa.tanks.model.item.upgradable.UpgradableItemPropertyValue;
   import base.DiscreteSprite;
   import controls.buttons.h50px.GreyBigButtonSkin;
   import controls.timer.CountDownTimer;
   import flash.display.Sprite;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   
   public class UpgradeButton extends CrystalButton
   {
      [Inject]
      public static var localeService:ILocaleService;
      
      private var showOnlyCaption:Boolean;
      
      private var secondRow:Sprite;
      
      public function UpgradeButton()
      {
         this.secondRow = new DiscreteSprite();
         super();
         this.secondRow.addChild(crystalLabel);
         infoContainer.addChild(this.secondRow);
      }
      
      public function setUpgradeButton() : void
      {
         setText(localeService.getText(TanksLocale.TEXT_GARAGE_UPGRADE_TEXT));
         setSkin(GreyBigButtonSkin.GREY_SKIN);
         this.showOnlyCaption = true;
         this.show();
      }
      
      public function setUpgradedButton() : void
      {
         setText(localeService.getText(TanksLocale.TEXT_BATTLE_UPGRADES_TEXT));
         setSkin(GreyBigButtonSkin.GREY_SKIN);
         this.showOnlyCaption = true;
         this.show();
      }
      
      public function setUpgradingButton(param1:CountDownTimer, param2:UpgradableItemPropertyValue) : void
      {
         this.showOnlyCaption = false;
         setText(localeService.getText(TanksLocale.TEXT_GARAGE_SPEED_UP_TEXT));
         setCost(param2.getSpeedUpCost());
         setSkin(GoldBigButtonSkin.GOLD_SKIN);
         crystalLabel.x = 0;
         this.show();
      }
      
      override protected function show() : void
      {
         if(this.showOnlyCaption)
         {
            this.secondRow.visible = false;
            showInOneRow(captionLabel);
         }
         else
         {
            this.secondRow.visible = true;
            this.secondRow.x = 0;
            this.secondRow.x = (_width - this.secondRow.width) * 0.5;
            showInTwoRows(captionLabel,this.secondRow);
         }
      }
      
      override public function set visible(param1:Boolean) : void
      {
         super.visible = param1;
      }
   }
}

