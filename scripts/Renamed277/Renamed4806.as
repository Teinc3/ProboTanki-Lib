package Renamed4805
{
   import alternativa.osgi.service.locale.ILocaleService;
   import controls.base.LabelBase;
   import Renamed348.Renamed2218;
   import Renamed355.Renamed2270;
   import Renamed355.Renamed7137;
   import flash.display.Bitmap;
   import flash.events.MouseEvent;
   import flash.text.TextFieldAutoSize;
   import forms.ColorConstants;
   import platform.client.fp10.core.resource.types.ImageResource;
   import projects.tanks.clients.fp10.libraries.tanksservices.utils.Renamed3761;
   import utils.preview.IImageResource;
   import utils.preview.ImageResourceLoadingWrapper;
   
   public class Renamed4806 extends Renamed7137 implements IImageResource
   {
      [Inject]
      public static var localeService:ILocaleService;
      
      protected static const PADDING:int = 17;
      
      private var nameLabel:LabelBase;
      
      protected var preview:Bitmap;
      
      private var text:String;
      
      private var previewResource:ImageResource;
      
      private var Renamed7138:String;
      
      public function Renamed4806(param1:String, param2:String, param3:ImageResource = null)
      {
         this.Renamed7138 = param1;
         addEventListener(MouseEvent.CLICK,this.onMouseClick);
         this.text = param2;
         this.previewResource = param3;
         super(Renamed2270.Renamed2273);
      }
      
      override protected function init() : void
      {
         super.init();
         this.Renamed7139();
         this.Renamed7140();
         this.Renamed7141();
         this.align();
      }
      
      protected function Renamed7141() : void
      {
         if(this.preview != null)
         {
            this.setPreview();
         }
      }
      
      protected function setPreview() : void
      {
         addChildAt(this.preview,2);
      }
      
      private function Renamed7140() : void
      {
         this.nameLabel = new LabelBase();
         this.nameLabel.text = this.text;
         this.nameLabel.color = ColorConstants.SHOP_CRYSTALS_TEXT_LABEL_COLOR;
         this.nameLabel.size = localeService.language == Renamed3761.Renamed4529 ? Number(18) : Number(22);
         this.nameLabel.autoSize = TextFieldAutoSize.LEFT;
         this.nameLabel.bold = true;
         this.nameLabel.mouseEnabled = false;
         this.nameLabel.wordWrap = true;
         this.nameLabel.width = this.width / 2;
         addChild(this.nameLabel);
      }
      
      private function Renamed7139() : void
      {
         if(this.previewResource != null)
         {
            if(this.previewResource.isLazy && !this.previewResource.isLoaded)
            {
               this.previewResource.loadLazyResource(new ImageResourceLoadingWrapper(this));
            }
            else
            {
               this.preview = new Bitmap(this.previewResource.data);
            }
         }
      }
      
      protected function align() : void
      {
         this.nameLabel.y = this.height / 2 - this.nameLabel.height / 2;
         this.nameLabel.x = PADDING;
         if(this.preview != null)
         {
            this.preview.x = this.width - PADDING - 150;
            this.preview.y = 12;
         }
      }
      
      protected function onMouseClick(param1:MouseEvent) : void
      {
         dispatchEvent(new Renamed2218(this.Renamed7138));
      }
      
      public function setPreviewResource(param1:ImageResource) : void
      {
         this.preview = new Bitmap(param1.data);
         this.Renamed7142();
      }
      
      protected function Renamed7142() : void
      {
         this.setPreview();
         this.align();
      }
   }
}

