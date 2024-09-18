package alternativa.tanks.engine3d
{
   import alternativa.utils.textureutils.TextureConstructor;
   
   public class IndexedTextureConstructor extends TextureConstructor
   {
      public var index:int;
      
      public function IndexedTextureConstructor()
      {
         super();
      }
      
      public function Renamed1634() : void
      {
         if(texture != null)
         {
            texture.dispose();
         }
      }
   }
}

