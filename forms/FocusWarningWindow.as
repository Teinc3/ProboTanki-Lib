package forms
{
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.locale.constants.TextConst;
   import assets.IconAlarm;
   import controls.base.LabelBase;
   import controls.statassets.BlackRoundRect;
   import flash.display.Sprite;
   import flash.text.TextFieldAutoSize;
   
   public class FocusWarningWindow extends Sprite
   {
      private var bg:BlackRoundRect;
      
      private var icon:IconAlarm;
      
      private var label:LabelBase;
      
      public var PADDING:int = 30;
      
      public function FocusWarningWindow()
      {
         this.bg = new BlackRoundRect();
         this.icon = new IconAlarm();
         this.label = new LabelBase();
         super();
         var _loc1_:ILocaleService = OSGi.getInstance().getService(ILocaleService) as ILocaleService;
         addChild(this.bg);
         addChild(this.icon);
         addChild(this.label);
         this.icon.x = -int(this.icon.width / 2);
         this.icon.y = -this.icon.height - 15;
         this.label.size = 16;
         this.label.text = _loc1_.getText(TextConst.FOCUS_WARNIG_TEXT);
         this.label.autoSize = TextFieldAutoSize.CENTER;
         this.label.x = -int(this.label.width / 2);
         this.bg.width = width + this.PADDING * 2;
         this.bg.height = height + this.PADDING * 2;
         this.bg.x = -int(this.bg.width / 2);
         this.bg.y = this.icon.y - this.PADDING * 1.1;
      }
   }
}

