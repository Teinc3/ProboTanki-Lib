package alternativa.tanks.gui
{
   import alternativa.osgi.service.locale.ILocaleService;
   import controls.base.LabelBase;
   import flash.display.Sprite;
   import forms.ColorConstants;
   import forms.userlabel.UserLabel;
   import §native get§.§override for use§;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   
   public class §8!>§ extends Sprite
   {
      [Inject]
      public static var localeService:ILocaleService;
      
      private var §'#j§:LabelBase;
      
      private var §'"e§:UserLabel;
      
      private var dateLabel:LabelBase;
      
      private var messageLabel:LabelBase;
      
      public function §8!>§(param1:int)
      {
         var _loc2_:LabelBase = null;
         super();
         this.§'#j§ = new LabelBase();
         this.§'#j§.text = localeService.getText(TanksLocale.TEXT_PRESENT_INFO_FROM_LABEL);
         this.§'#j§.color = ColorConstants.GREEN_TEXT;
         addChild(this.§'#j§);
         this.dateLabel = new LabelBase();
         this.dateLabel.y = this.§'#j§.height;
         this.dateLabel.color = ColorConstants.GREEN_TEXT;
         addChild(this.dateLabel);
         _loc2_ = new LabelBase();
         _loc2_.y = this.dateLabel.y + this.dateLabel.height + 12;
         _loc2_.text = localeService.getText(TanksLocale.TEXT_PRESENT_INFO_MESSAGE_LABEL);
         _loc2_.color = ColorConstants.GREEN_TEXT;
         addChild(_loc2_);
         this.messageLabel = new LabelBase();
         this.messageLabel.multiline = true;
         this.messageLabel.wordWrap = true;
         this.messageLabel.width = param1;
         this.messageLabel.color = ColorConstants.GREEN_TEXT;
         this.messageLabel.y = _loc2_.y + this.dateLabel.height + 12;
         addChild(this.messageLabel);
      }
      
      public function update(param1:String, param2:Date, param3:String) : void
      {
         this.§true for class§();
         this.§'"e§ = new UserLabel(param1);
         this.§'"e§.x = this.§'#j§.textWidth + 2;
         addChild(this.§'"e§);
         this.dateLabel.text = localeService.getText(TanksLocale.TEXT_PRESENT_INFO_DATE_LABEL) + " " + §override for use§.§3!X§(param2) + " " + §override for use§.formatTime(param2);
         this.messageLabel.text = param3;
      }
      
      public function §import package switch§(param1:Number) : void
      {
         this.messageLabel.width = param1;
      }
      
      public function §true for class§() : void
      {
         if(this.§'"e§ != null)
         {
            if(contains(this.§'"e§))
            {
               removeChild(this.§'"e§);
            }
            this.§'"e§ = null;
         }
      }
      
      public function destroy() : void
      {
         this.§true for class§();
      }
   }
}

