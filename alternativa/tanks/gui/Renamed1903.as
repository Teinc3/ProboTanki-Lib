package alternativa.tanks.gui
{
   import alternativa.osgi.service.locale.ILocaleService;
   import controls.base.LabelBase;
   import flash.display.Sprite;
   import forms.ColorConstants;
   import forms.userlabel.UserLabel;
   import Renamed404.Renamed1899;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   
   public class Renamed1743 extends Sprite
   {
      [Inject]
      public static var localeService:ILocaleService;
      
      private var Renamed1900:LabelBase;
      
      private var Renamed1901:UserLabel;
      
      private var dateLabel:LabelBase;
      
      private var messageLabel:LabelBase;
      
      public function Renamed1743(param1:int)
      {
         var _loc2_:LabelBase = null;
         super();
         this.Renamed1900 = new LabelBase();
         this.Renamed1900.text = localeService.getText(TanksLocale.TEXT_PRESENT_INFO_FROM_LABEL);
         this.Renamed1900.color = ColorConstants.GREEN_TEXT;
         addChild(this.Renamed1900);
         this.dateLabel = new LabelBase();
         this.dateLabel.y = this.Renamed1900.height;
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
         this.Renamed1765();
         this.Renamed1901 = new UserLabel(param1);
         this.Renamed1901.x = this.Renamed1900.textWidth + 2;
         addChild(this.Renamed1901);
         this.dateLabel.text = localeService.getText(TanksLocale.TEXT_PRESENT_INFO_DATE_LABEL) + " " + Renamed1899.Renamed1902(param2) + " " + Renamed1899.formatTime(param2);
         this.messageLabel.text = param3;
      }
      
      public function Renamed1781(param1:Number) : void
      {
         this.messageLabel.width = param1;
      }
      
      public function Renamed1765() : void
      {
         if(this.Renamed1901 != null)
         {
            if(contains(this.Renamed1901))
            {
               removeChild(this.Renamed1901);
            }
            this.Renamed1901 = null;
         }
      }
      
      public function destroy() : void
      {
         this.Renamed1765();
      }
   }
}

