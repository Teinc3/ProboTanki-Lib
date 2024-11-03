package alternativa.utils.textureutils
{
   import alternativa.utils.BitmapUtils;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.Loader;
   import flash.events.Event;
   import flash.utils.ByteArray;
   
   public class TextureConstructor
   {
      private var _texture:BitmapData;
      
      private var listener:ITextureConstructorListener;
      
      private var loader:Loader;
      
      private var textureData:TextureByteData;
      
      private var cancelled:Boolean;
      
      public function TextureConstructor()
      {
         super();
      }
      
      public function get texture() : BitmapData
      {
         return this._texture;
      }
      
      public function cancel() : void
      {
         this.cancelled = true;
      }
      
      public function createTexture(param1:TextureByteData, param2:ITextureConstructorListener) : void
      {
         if(this.loader != null)
         {
            throw new Error("Construction in progress");
         }
         if(param1 == null)
         {
            throw new ArgumentError("Parameter textureData is null");
         }
         if(param1.diffuseData == null)
         {
            throw new ArgumentError("Diffuse data is null");
         }
         this.cancelled = false;
         this.textureData = param1;
         this.listener = param2;
         this.loadBytes(param1.diffuseData,this.onDiffuseTextureLoadingComplete);
      }
      
      private function loadBytes(param1:ByteArray, param2:Function) : void
      {
         param1.position = 0;
         this.loader = new Loader();
         this.loader.contentLoaderInfo.addEventListener(Event.COMPLETE,param2);
         this.loader.loadBytes(param1);
      }
      
      private function onDiffuseTextureLoadingComplete(param1:Event) : void
      {
         if(this.cancelled)
         {
            Bitmap(this.loader.content).bitmapData.dispose();
            this.loader.unload();
            this.loader = null;
         }
         else
         {
            this._texture = Bitmap(this.loader.content).bitmapData;
            this.loader.contentLoaderInfo.removeEventListener(Event.COMPLETE,this.onDiffuseTextureLoadingComplete);
            this.loader.unload();
            if(this.textureData.opacityData != null)
            {
               this.loadBytes(this.textureData.opacityData,this.onAlphaTextureLoadingComplete);
            }
            else
            {
               this.complete();
            }
         }
      }
      
      private function onAlphaTextureLoadingComplete(param1:Event) : void
      {
         var _loc2_:BitmapData = null;
         if(this.cancelled)
         {
            Bitmap(this.loader.content).bitmapData.dispose();
            this.loader.unload();
            this.loader = null;
         }
         else
         {
            _loc2_ = Bitmap(this.loader.content).bitmapData;
            this.loader.contentLoaderInfo.removeEventListener(Event.COMPLETE,this.onAlphaTextureLoadingComplete);
            this.loader.unload();
            this._texture = BitmapUtils.mergeBitmapAlpha(this._texture,_loc2_,true);
            this.complete();
         }
      }
      
      private function complete() : void
      {
         this.loader = null;
         this.textureData = null;
         var _loc1_:ITextureConstructorListener = this.listener;
         this.listener = null;
         _loc1_.onTextureReady(this);
      }
   }
}

