package §dynamic catch class§
{
   import alternativa.tanks.engine3d.IndexedTextureConstructor;
   import alternativa.utils.TextureMaterialRegistry;
   import alternativa.utils.textureutils.ITextureConstructorListener;
   import alternativa.utils.textureutils.TextureConstructor;
   import flash.display.BitmapData;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   
   public class §include set return§ extends EventDispatcher implements ITextureConstructorListener
   {
      private var §@#R§:TextureMaterialRegistry;
      
      private var maxBatchSize:int;
      
      private var totalCounter:int;
      
      private var §9"c§:int;
      
      private var §catch package do§:Vector.<§#!5§>;
      
      private var constructors:Vector.<IndexedTextureConstructor>;
      
      private var §-!R§:Boolean;
      
      private var textures:Vector.<BitmapData>;
      
      public function §include set return§(param1:TextureMaterialRegistry, param2:int)
      {
         this.textures = new Vector.<BitmapData>();
         super();
         this.§@#R§ = param1;
         this.maxBatchSize = param2;
      }
      
      public function destroy() : void
      {
         var _loc1_:BitmapData = null;
         this.§-!R§ = true;
         this.§catch package do§ = null;
         this.constructors = null;
         for each(_loc1_ in this.textures)
         {
            _loc1_.dispose();
         }
         this.textures = null;
      }
      
      public function run(param1:Vector.<§#!5§>) : void
      {
         this.§catch package do§ = param1.concat();
         this.totalCounter = 0;
         this.§9"c§ = 0;
         this.§`]§();
         this.§set for const§();
      }
      
      private function §`]§() : void
      {
         this.constructors = new Vector.<IndexedTextureConstructor>(this.maxBatchSize);
         var _loc1_:int = 0;
         while(_loc1_ < this.maxBatchSize)
         {
            this.constructors[_loc1_] = new IndexedTextureConstructor();
            _loc1_++;
         }
      }
      
      private function §set for const§() : void
      {
         var _loc1_:IndexedTextureConstructor = null;
         for each(_loc1_ in this.constructors)
         {
            this.§^!e§(_loc1_);
         }
      }
      
      private function §^!e§(param1:IndexedTextureConstructor) : void
      {
         var _loc2_:§#!5§ = null;
         if(this.§9"c§ < this.§catch package do§.length)
         {
            param1.index = this.§9"c§;
            _loc2_ = this.§catch package do§[this.§9"c§++];
            param1.createTexture(_loc2_.§;"'§(),this);
         }
      }
      
      [Obfuscation(rename="false")]
      public function onTextureReady(param1:TextureConstructor) : void
      {
         var _loc2_:IndexedTextureConstructor = IndexedTextureConstructor(param1);
         if(this.§-!R§)
         {
            _loc2_.§%!c§();
         }
         else
         {
            this.textures.push(_loc2_.texture);
            this.§3!R§(_loc2_);
            ++this.totalCounter;
            if(this.totalCounter == this.§catch package do§.length)
            {
               this.complete();
            }
            else
            {
               this.§^!e§(_loc2_);
            }
         }
      }
      
      private function §3!R§(param1:IndexedTextureConstructor) : void
      {
         var _loc2_:§#!5§ = this.§catch package do§[param1.index];
         _loc2_.§28§(this.§@#R§.getMaterial(param1.texture));
      }
      
      private function complete() : void
      {
         this.§catch package do§ = null;
         this.constructors = null;
         dispatchEvent(new Event(Event.COMPLETE));
      }
      
      public function §9"T§() : Vector.<BitmapData>
      {
         return this.textures;
      }
   }
}

