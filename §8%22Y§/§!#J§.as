package §8"Y§
{
   import alternativa.osgi.service.locale.ILocaleService;
   import controls.base.LabelBase;
   import §each set import§.§'4§;
   import §extends for catch§.§%!H§;
   import §extends for catch§.§]O§;
   import flash.display.Bitmap;
   import flash.events.MouseEvent;
   import flash.text.TextFieldAutoSize;
   import forms.ColorConstants;
   import platform.client.fp10.core.resource.types.ImageResource;
   import projects.tanks.clients.fp10.libraries.tanksservices.utils.§?O§;
   import utils.preview.IImageResource;
   import utils.preview.ImageResourceLoadingWrapper;
   
   public class §!#J§ extends §]O§ implements IImageResource
   {
      [Inject]
      public static var localeService:ILocaleService;
      
      protected static const PADDING:int = 17;
      
      private var nameLabel:LabelBase;
      
      protected var preview:Bitmap;
      
      private var text:String;
      
      private var previewResource:ImageResource;
      
      private var §;L§:String;
      
      public function §!#J§(param1:String, param2:String, param3:ImageResource = null)
      {
         this.§;L§ = param1;
         addEventListener(MouseEvent.CLICK,this.onMouseClick);
         this.text = param2;
         this.previewResource = param3;
         super(§%!H§.§"">§);
      }
      
      override protected function init() : void
      {
         super.init();
         this.§function catch package§();
         this.§dynamic set while§();
         this.§get package get§();
         this.align();
      }
      
      protected function §get package get§() : void
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
      
      private function §dynamic set while§() : void
      {
         this.nameLabel = new LabelBase();
         this.nameLabel.text = this.text;
         this.nameLabel.color = ColorConstants.SHOP_CRYSTALS_TEXT_LABEL_COLOR;
         this.nameLabel.size = localeService.language == §?O§.§<!4§ ? Number(18) : Number(22);
         this.nameLabel.autoSize = TextFieldAutoSize.LEFT;
         this.nameLabel.bold = true;
         this.nameLabel.mouseEnabled = false;
         this.nameLabel.wordWrap = true;
         this.nameLabel.width = this.width / 2;
         addChild(this.nameLabel);
      }
      
      private function §function catch package§() : void
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
         dispatchEvent(new §'4§(this.§;L§));
      }
      
      public function setPreviewResource(param1:ImageResource) : void
      {
         this.preview = new Bitmap(param1.data);
         this.§return for throw§();
      }
      
      protected function §return for throw§() : void
      {
         this.setPreview();
         this.align();
      }
   }
}

